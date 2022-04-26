package system

import (
	uuid "github.com/satori/go.uuid"
	"github.com/yunfei07/lemon/server/config"
	"github.com/yunfei07/lemon/server/global"
	model "github.com/yunfei07/lemon/server/model/system"
	"github.com/yunfei07/lemon/server/model/system/request"
	"github.com/yunfei07/lemon/server/source/system"
	"github.com/yunfei07/lemon/server/utils"
	"gorm.io/driver/postgres"
	"gorm.io/gorm"
)

// writePgsqlConfig pgsql 回写配置
func (initDBService *InitDBService) writePgsqlConfig(pgsql config.Pgsql) error {
	global.GVA_CONFIG.System.DbType = "pgsql"
	global.GVA_CONFIG.Pgsql = pgsql
	cs := utils.StructToMap(global.GVA_CONFIG)
	for k, v := range cs {
		global.GVA_VP.Set(k, v)
	}
	global.GVA_VP.Set("jwt.signing-key", uuid.NewV4().String())
	return global.GVA_VP.WriteConfig()
}

func (initDBService *InitDBService) initPgsqlDB(conf request.InitDB) error {
	dsn := conf.PgsqlEmptyDsn()
	createSql := "CREATE DATABASE " + conf.DBName
	if err := initDBService.createDatabase(dsn, "pgx", createSql); err != nil {
		return err
	} // 创建数据库

	pgsqlConfig := conf.ToPgsqlConfig()
	if pgsqlConfig.Dbname == "" {
		return nil
	} // 如果没有数据库名, 则跳出初始化数据

	if db, err := gorm.Open(postgres.New(postgres.Config{
		DSN:                  pgsqlConfig.Dsn(), // DSN data source name
		PreferSimpleProtocol: false,
	}), &gorm.Config{DisableForeignKeyConstraintWhenMigrating: true}); err != nil {
		return nil
	} else {
		global.GVA_DB = db
	}

	if err := initDBService.initTables(); err != nil {
		global.GVA_DB = nil
		return err
	}

	if err := initDBService.initPgsqlData(); err != nil {
		global.GVA_DB = nil
		return err
	}

	if err := initDBService.writePgsqlConfig(pgsqlConfig); err != nil {
		return err
	}

	return nil
}

// initPgsqlData pgsql 初始化数据
func (initDBService *InitDBService) initPgsqlData() error {
	return model.PgsqlDataInitialize(
		system.Api,
		system.User,
		system.Casbin,
		system.BaseMenu,
		system.Authority,
		system.Dictionary,
		system.UserAuthority,
		system.DataAuthorities,
		system.AuthoritiesMenus,
		system.DictionaryDetail,
		system.ViewAuthorityMenuPostgres,
	)
}
