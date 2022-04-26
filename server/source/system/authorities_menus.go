package system

import (
	"reflect"

	"github.com/pkg/errors"
	"github.com/yunfei07/lemon/server/global"
	"github.com/yunfei07/lemon/server/model/system"
	"gorm.io/gorm"
	"gorm.io/gorm/schema"
)

var AuthoritiesMenus = new(authoritiesMenus)

type authoritiesMenus struct{}

func (a *authoritiesMenus) TableName() string {
	var entity AuthorityMenus
	return entity.TableName()
}

func (a *authoritiesMenus) Initialize() error {
	entities := []AuthorityMenus{
		{BaseMenuId: 1, AuthorityId: "888"},
		{BaseMenuId: 2, AuthorityId: "888"},
		{BaseMenuId: 3, AuthorityId: "888"},
		{BaseMenuId: 4, AuthorityId: "888"},
		{BaseMenuId: 5, AuthorityId: "888"},
		{BaseMenuId: 6, AuthorityId: "888"},
		{BaseMenuId: 7, AuthorityId: "888"},
		{BaseMenuId: 8, AuthorityId: "888"},
		{BaseMenuId: 20, AuthorityId: "888"},
		{BaseMenuId: 21, AuthorityId: "888"},

		{BaseMenuId: 1, AuthorityId: "8881"},
		{BaseMenuId: 2, AuthorityId: "8881"},
		{BaseMenuId: 3, AuthorityId: "8881"},
		{BaseMenuId: 4, AuthorityId: "8881"},
		{BaseMenuId: 5, AuthorityId: "8881"},
		{BaseMenuId: 6, AuthorityId: "8881"},
		{BaseMenuId: 7, AuthorityId: "8881"},
		{BaseMenuId: 8, AuthorityId: "8881"},
		{BaseMenuId: 20, AuthorityId: "8881"},
		{BaseMenuId: 21, AuthorityId: "8881"},

		{BaseMenuId: 1, AuthorityId: "9528"},
		{BaseMenuId: 2, AuthorityId: "9528"},
		{BaseMenuId: 3, AuthorityId: "9528"},
		{BaseMenuId: 4, AuthorityId: "9528"},
		{BaseMenuId: 5, AuthorityId: "9528"},
		{BaseMenuId: 6, AuthorityId: "9528"},
		{BaseMenuId: 7, AuthorityId: "9528"},
		{BaseMenuId: 8, AuthorityId: "9528"},
		{BaseMenuId: 20, AuthorityId: "9528"},
		{BaseMenuId: 21, AuthorityId: "9528"},
	}
	if err := global.GVA_DB.Create(&entities).Error; err != nil {
		return errors.Wrap(err, a.TableName()+"表数据初始化失败!")
	}
	return nil
}

func (a *authoritiesMenus) CheckDataExist() bool {
	if errors.Is(global.GVA_DB.Where("sys_base_menu_id = ? AND sys_authority_authority_id = ?", 7, "9528").First(&AuthorityMenus{}).Error, gorm.ErrRecordNotFound) { // 判断是否存在数据
		return false
	}
	return true
}

type AuthorityMenus struct {
	AuthorityId string `gorm:"column:sys_authority_authority_id"`
	BaseMenuId  uint   `gorm:"column:sys_base_menu_id"`
}

func (a *AuthorityMenus) TableName() string {
	var entity system.SysAuthority
	types := reflect.TypeOf(entity)
	if s, o := types.FieldByName("SysBaseMenus"); o {
		m1 := schema.ParseTagSetting(s.Tag.Get("gorm"), ";")
		return m1["MANY2MANY"]
	}
	return ""
}
