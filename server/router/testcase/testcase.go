package testcase

import (
	"github.com/gin-gonic/gin"
	v1 "github.com/yunfei07/lemon/server/api/v1"
	"github.com/yunfei07/lemon/server/middleware"
)

type TestCaseRouter struct {}

func (tc *TestCaseRouter) InitTestCaseRouter(Router *gin.RouterGroup){
	testcaseRouter := Router.Group("testcase").Use(middleware.OperationRecord())
	testcaseRouterWithoutRecord := Router.Group("testcase")
	var testcaseApi = v1.ApiGroupApp.TestCaseApiGroup.TestcaseApi
	{
		testcaseRouter.POST("createTestCase",testcaseApi.CreateTestCase) // 新建
		testcaseRouter.PUT("updateTestCase",testcaseApi.UpdateTestCase) // 更新
		testcaseRouter.DELETE("deleteTestCaseByIds",testcaseApi.DeleteTestCaseByIds) // 通过ID删除
		testcaseRouter.DELETE("deleteTestCase",testcaseApi.DeleteTestCase)
		testcaseRouter.DELETE("deleteTestStepByIds",testcaseApi.DeleteTestStepByIds) // 通过ID删除步骤
		testcaseRouter.DELETE("deleteTestStep",testcaseApi.DeleteTestStep) // 删除步骤
	}
	{
		testcaseRouterWithoutRecord.GET("getTestCase",testcaseApi.FindTestCase) // 通过ID获取
		testcaseRouterWithoutRecord.GET("runTestCase",testcaseApi.RunTestCase) // 运行case
		testcaseRouterWithoutRecord.GET("getTestCaseList",testcaseApi.GetTestCaseList) // 获取caseList
	}
}