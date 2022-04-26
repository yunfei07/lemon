package response

import (
	"github.com/yunfei07/lemon/server/model/system/request"
)

type PolicyPathResponse struct {
	Paths []request.CasbinInfo `json:"paths"`
}
