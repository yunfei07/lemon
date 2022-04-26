package router

import (
	"github.com/yunfei07/lemon/server/router/configurine"
	"github.com/yunfei07/lemon/server/router/system"
	"github.com/yunfei07/lemon/server/router/testcase"
)

type RouterGroup struct {
	System   system.RouterGroup

	TestCase    testcase.RouterGroup
	Config       configurine.ConfigRouter
}

var RouterGroupApp = new(RouterGroup)
