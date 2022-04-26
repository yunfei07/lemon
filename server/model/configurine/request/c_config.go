package request

import (
	"github.com/yunfei07/lemon/server/model/common/request"
	"github.com/yunfei07/lemon/server/model/configurine"
)

type ConfigSearch struct{
	configurine.Config
	request.PageInfo
}