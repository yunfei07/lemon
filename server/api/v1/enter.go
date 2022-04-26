package v1

import (
	"github.com/yunfei07/lemon/server/api/v1/configurine"
	"github.com/yunfei07/lemon/server/api/v1/system"
	"github.com/yunfei07/lemon/server/api/v1/testcase"
)

type ApiGroup struct {
	SystemApiGroup   system.ApiGroup

	TestCaseApiGroup testcase.ApiGroup
	ConfigApiGroup   configurine.ApiGroup
}

var ApiGroupApp = new(ApiGroup)
