package service

import (
	"github.com/yunfei07/lemon/server/service/configurine"
	"github.com/yunfei07/lemon/server/service/system"
	"github.com/yunfei07/lemon/server/service/testcase"
)

type ServiceGroup struct {
	SystemServiceGroup   system.ServiceGroup

	TestCaseServiceGroup    testcase.ServiceGroup
	ConfigServiceGroup      configurine.ServiceGroup
}

var ServiceGroupApp = new(ServiceGroup)
