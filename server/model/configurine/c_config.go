package configurine

import (
	"gorm.io/datatypes"
	"gorm.io/gorm"
	"time"
)

type Config struct {
	ID        uint           `json:"id" gorm:"column:id;"`
	Name      string         `json:"name" gorm:"column:name;comment:配置名称;type:varchar(50)"`
	BaseURL   string         `json:"base_url" gorm:"column:base_url;comment:全局URL;type:varchar(200)"`
	Variables datatypes.JSON `json:"variables" gorm:"column:variables;comment:全局变量;type:json;"`
	CreatedAt time.Time      // 创建时间
	UpdatedAt time.Time      // 更新时间
	DeletedAt gorm.DeletedAt `gorm:"index" json:"-"` // 删除时间
}
