package system

import (
	"github.com/yunfei07/lemon/server/config"
)

// 配置文件结构体
type System struct {
	Config config.Server `json:"config"`
}
