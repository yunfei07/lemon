package testcase

import "gorm.io/datatypes"

type TestStep struct {
	StepId    uint           `json:"stepId" gorm:"not null;unique;primary_key;comment:测试步骤ID"`
	Index     uint           `json:"index" gorm:"column:index;comment:步骤索引;comment:步骤索引"`
	Name      string         `json:"name" gorm:"column:name;comment:名称;type:varchar(120);"`
	Request   datatypes.JSON `json:"request" gorm:"column:request;comment:请求结构;type:json;"`
	Variables datatypes.JSON `json:"variables" gorm:"column:variables;comment:局部变量;type:json;"`
	Extract   datatypes.JSON `json:"extract" gorm:"column:extract;comment:响应解析;type:json;"`
	Validate  datatypes.JSON `json:"validate" gorm:"column:validate;comment:结果断言;type:json;"`
	Response  datatypes.JSON `json:"response" gorm:"column:response;comment:接口响应结果;type:json"`
	//Response  string `json:"response" gorm:"column:response;comment:接口响应结果;type:longtext"`
	Result    bool         `json:"result" gorm:"column:result;comment:接口测试结果;type:bool"`
}
