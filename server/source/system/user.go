package system

import (
	"github.com/pkg/errors"
	uuid "github.com/satori/go.uuid"
	"github.com/yunfei07/lemon/server/global"
	"github.com/yunfei07/lemon/server/model/system"
	"gorm.io/gorm"
)

var User = new(user)

type user struct{}

func (u *user) TableName() string {
	return "sys_users"
}

func (u *user) Initialize() error {
	entities := []system.SysUser{
		{UUID: uuid.NewV4(), Username: "admin", Password: "e10adc3949ba59abbe56e057f20f883e", NickName: "超级管理员", HeaderImg: "", AuthorityId: "888", Phone: "", Email: ""},
		{UUID: uuid.NewV4(), Username: "lemon", Password: "3f24e567591e9cbab2a7d2f1f748a1d4", NickName: "测试账号", HeaderImg: "", AuthorityId: "9528", Phone: "", Email: ""},
	}
	if err := global.GVA_DB.Create(&entities).Error; err != nil {
		return errors.Wrap(err, u.TableName()+"表数据初始化失败!")
	}
	return nil
}

func (u *user) CheckDataExist() bool {
	if errors.Is(global.GVA_DB.Where("username = ?", "lemon").First(&system.SysUser{}).Error, gorm.ErrRecordNotFound) { // 判断是否存在数据
		return false
	}
	return true
}
