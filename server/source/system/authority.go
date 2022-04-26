package system

import (
	"github.com/pkg/errors"
	"github.com/yunfei07/lemon/server/global"
	"github.com/yunfei07/lemon/server/model/system"
	"gorm.io/gorm"
)

var Authority = new(authority)

type authority struct{}

func (a *authority) TableName() string {
	return "sys_authorities"
}

func (a *authority) Initialize() error {
	entities := []system.SysAuthority{
		{AuthorityId: "888", AuthorityName: "普通用户", ParentId: "0", DefaultRouter: "testcase"},
		{AuthorityId: "9528", AuthorityName: "测试角色", ParentId: "0", DefaultRouter: "testcase"},
		{AuthorityId: "8881", AuthorityName: "普通用户子角色", ParentId: "888", DefaultRouter: "testcase"},
	}
	if err := global.GVA_DB.Create(&entities).Error; err != nil {
		return errors.Wrapf(err, "%s表数据初始化失败!", a.TableName())
	}
	return nil
}

func (a *authority) CheckDataExist() bool {
	if errors.Is(global.GVA_DB.Where("authority_id = ?", "8881").First(&system.SysAuthority{}).Error, gorm.ErrRecordNotFound) { // 判断是否存在数据
		return false
	}
	return true
}
