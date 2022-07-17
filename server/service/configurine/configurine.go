package configurine

import (
	"github.com/yunfei07/lemon/server/global"
	"github.com/yunfei07/lemon/server/model/common/request"
	"github.com/yunfei07/lemon/server/model/configurine"
	searchReq "github.com/yunfei07/lemon/server/model/configurine/request"
)

type ConfigService struct {}

func (configService *ConfigService) CreateConfig(config configurine.Config)(err error){
	err = global.GVA_DB.Create(&config).Error
	return err
}

func (configService *ConfigService) DeleteConfig(config configurine.Config)(err error){
	err = global.GVA_DB.Unscoped().Delete(&config).Error
	return err
}

func (configService *ConfigService) DeleteConfigByIds(ids request.IdsReq)(err error){
	err = global.GVA_DB.Unscoped().Delete(&[]configurine.Config{},"id in ?",ids.Ids).Error
	return err
}

func (configService *ConfigService) UpdateConfig(config configurine.Config)(err error){
	err = global.GVA_DB.Save(&config).Error
	return err
}

func (configService *ConfigService) GetConfigById(id uint)(err error,config configurine.Config){
	err = global.GVA_DB.Where("id = ?",id).First(&config).Error
	return
}

func (ConfigService *ConfigService) GetAllConfig()(err error,list interface{}){
	db := global.GVA_DB.Model(&configurine.Config{})
	var config []configurine.Config

	err = db.Find(&config).Error
	return err,config
}

func (configService *ConfigService) GetConfigByName(name string)(err error,config configurine.Config){
	err =  global.GVA_DB.Where("name = ?",name).First(&config).Error
	return
}

func (configService *ConfigService) GetConfigList(info searchReq.ConfigSearch)(err error,list interface{},total int64){
	limit := info.PageSize
	offset := info.PageSize * (info.Page - 1)

	db := global.GVA_DB.Model(&configurine.Config{})
	var config []configurine.Config

	if info.Name != "" {
		db = db.Where("`name` LIKE ?","%" + info.Name+ "%")
	}

	err = db.Count(&total).Error

	if err != nil {
		return
	}

	err = db.Limit(limit).Offset(offset).Find(&config).Error
	return err, config, total


}
