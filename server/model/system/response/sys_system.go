package response

import "github.com/yunfei07/lemon/server/config"

type SysConfigResponse struct {
	Config config.Server `json:"config"`
}
