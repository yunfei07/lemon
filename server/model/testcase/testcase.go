package testcase

import (
	"github.com/yunfei07/lemon/server/global"
)

// TestCase implements ITestCase interface.
type TestCase struct {
	global.GVA_MODEL
	Name      string     `json:"name" form:"name" gorm:"column:name;comment:接口名称;type:varchar(120);"`
	Project   string     `json:"project" form:"project" gorm:"column:project;comment:接口所属项目;type:varchar(120);"`
	Server    string     `json:"server" form:"server" gorm:"column:server;comment:接口所属服务;type:varchar(220);"`
	ConfigId  int64      `json:"configId" form:"configId" gorm:"column:config_id;comment:配置ID;type:int"`
	TestSteps []TestStep `json:"teststeps" gorm:"many2many:test_case_step"`
	Result    bool     `json:"result" form:"result" gorm:"column:result;comment:接口测试结果;type:bool;"`
	Creator   string     `json:"creator" form:"creator" gorm:"column:creator;comment:接口创建人;type:varchar(60);"`
}
