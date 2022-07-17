package configurine

import (
	"gorm.io/datatypes"
	"gorm.io/gorm"
	"time"
)

type Config struct {
	ID                uint           `json:"id" gorm:"column:id;"`
	Name              string         `json:"name" gorm:"column:name;comment:配置名称;type:varchar(50)"`
	BaseURL           string         `json:"base_url" gorm:"column:base_url;comment:全局URL;type:varchar(200)"`
	Headers           datatypes.JSON `json:"variables" gorm:"column:variables;comment:公共headers;type:json;"`
	Environs          datatypes.JSON `json:"environs" gorm:"column:environs;comment:环境变量;type:json;"`
	Variables         datatypes.JSON `json:"headers" gorm:"column:headers;comment:全局变量;type:json;"`
	Parameters        datatypes.JSON `json:"parameters" gorm:"column:parameters;comment:参数化;type:json;"`
	ParametersSetting datatypes.JSON `json:"parameters_setting" gorm:"column:parameters_setting;comment:参数化设置;type:json;"`
	ThinkTimeSetting  datatypes.JSON `json:"think_time" gorm:"column:think_time;comment:思考时间;type:json;"`
	WebSocketSetting  datatypes.JSON `json:"websocket" gorm:"column:websocket;comment:websocket设置;type:json;"`
	Export            datatypes.JSON `json:"export" gorm:"column:export;comment:export;type:json;"`
	Verify            bool           `json:"verify" gorm:"column:verify;comment:verify;"`
	CreatedAt         time.Time      // 创建时间
	UpdatedAt         time.Time      // 更新时间
	DeletedAt         gorm.DeletedAt `gorm:"index" json:"-"` // 删除时间
}
