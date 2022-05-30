package testcase

import (
	"encoding/json"
	"github.com/gin-gonic/gin"
	"github.com/httprunner/httprunner/v4/hrp"
	"github.com/yunfei07/lemon/server/global"
	"github.com/yunfei07/lemon/server/model/common/request"
	"github.com/yunfei07/lemon/server/model/common/response"
	tc "github.com/yunfei07/lemon/server/model/testcase"
	testcaseReq "github.com/yunfei07/lemon/server/model/testcase/request"
	"github.com/yunfei07/lemon/server/service"
	"github.com/yunfei07/lemon/server/utils"
	"go.uber.org/zap"
)

type TestcaseApi struct {}

var (
	continueOnFailure bool
	silentFlag        bool
	pluginLogOn       bool
)

var testcaseService = service.ServiceGroupApp.TestCaseServiceGroup.TestcaseService

func (testcaseApi *TestcaseApi) CreateTestCase(c *gin.Context){
	var testcase tc.TestCase
	_ = c.ShouldBindJSON(&testcase)
	testcase.Creator = utils.GetUserName(c)
	if err := testcaseService.CreateTestCase(testcase);err != nil {
		global.GVA_LOG.Error("创建失败!", zap.Any("err", err))
		response.FailWithMessage("创建失败", c)
	}else{
		response.OkWithMessage("创建成功", c)
	}
}

func (testcaseApi *TestcaseApi) DeleteTestCase(c *gin.Context){
	var testcase tc.TestCase
	_ = c.ShouldBindJSON(&testcase)

	if err := testcaseService.DeleteTestCase(testcase);err != nil {
		global.GVA_LOG.Error("删除失败!", zap.Any("err", err))
		response.FailWithMessage("删除失败", c)
	}else{
		response.OkWithMessage("删除成功", c)
	}
}

func (testcaseApi *TestcaseApi) DeleteTestStep(c *gin.Context){
	var teststep tc.TestStep
	_ = c.ShouldBindJSON(&teststep)

	if err := testcaseService.DeleteTestStep(teststep);err != nil {
		global.GVA_LOG.Error("删除失败!", zap.Any("err", err))
		response.FailWithMessage("删除失败", c)
	}else{
		response.OkWithMessage("删除成功", c)
	}
}

func (testcaseApi *TestcaseApi) DeleteTestCaseByIds(c *gin.Context){
	var IDS request.IdsReq
	_ = c.ShouldBindJSON(&IDS)

	if err := testcaseService.DeleteTestCaseByIds(IDS);err != nil {
		global.GVA_LOG.Error("批量删除失败!", zap.Any("err", err))
		response.FailWithMessage("批量删除失败", c)
	}else {
		response.OkWithMessage("批量删除成功", c)
	}
}

func (testcaseApi *TestcaseApi) DeleteTestStepByIds(c *gin.Context){
	var IDS request.IdsReq
	_ = c.ShouldBindJSON(&IDS)

	if err := testcaseService.DeleteTestStepByIds(IDS);err != nil {
		global.GVA_LOG.Error("批量删除失败!", zap.Any("err", err))
		response.FailWithMessage("批量删除失败", c)
	}else {
		response.OkWithMessage("批量删除成功", c)
	}
}

func (testcaseApi *TestcaseApi) UpdateTestCase(c *gin.Context){
	var testcase tc.TestCase
	_ = c.ShouldBindJSON(&testcase)
	testcase.Creator = utils.GetUserName(c)
	if err := testcaseService.UpdateTestCase(testcase);err != nil {
		global.GVA_LOG.Error("更新失败!", zap.Any("err", err))
		response.FailWithMessage("更新失败", c)
	}else{
		response.OkWithMessage("更新成功", c)
	}
}

func (testcaseApi *TestcaseApi) FindTestCase(c *gin.Context){
	var testcase tc.TestCase
	_ = c.ShouldBindQuery(&testcase)
	if err,testcases := testcaseService.GetTestCase(testcase.ID);err != nil {
		global.GVA_LOG.Error("查询失败!", zap.Any("err", err))
		response.FailWithMessage("查询失败", c)
	}else{
		response.OkWithData(gin.H{"testcase": testcases}, c)
	}
}

func (testcaseApi *TestcaseApi) GetTestCaseByName(c *gin.Context){}

func (testcaseApi *TestcaseApi) GetTestCaseList(c *gin.Context){
	var pageInfo testcaseReq.TestCaseSearch
	_ = c.ShouldBindQuery(&pageInfo)

	if err := utils.Verify(pageInfo,utils.PageInfoVerify);err != nil {
		response.FailWithMessage(err.Error(),c)
		return
	}

	if err,list,total := testcaseService.GetTestCaseInfoList(pageInfo);err != nil {
		global.GVA_LOG.Error("获取失败!", zap.Error(err))
		response.FailWithMessage("获取失败", c)
	}else{
		response.OkWithDetailed(response.PageResult{
			List:     list,
			Total:    total,
			Page:     pageInfo.Page,
			PageSize: pageInfo.PageSize,
		}, "获取成功", c)
	}

}

func (TestcaseApi *TestcaseApi) RunTestCase(c *gin.Context){
	var testcase tc.TestCase
	var teststep tc.TestStep
	_ = c.ShouldBindQuery(&testcase)

	if err,caseInfo := testcaseService.GetTestCase(testcase.ID);err != nil {
		global.GVA_LOG.Error("查询失败!", zap.Any("err", err))
		response.FailWithMessage("查询失败", c)
	}else{
		if er,result := testcaseService.RunTestCase(caseInfo);er != nil {
			global.GVA_LOG.Error("执行失败!", zap.Any("err", er))
			response.FailWithMessage("执行失败", c)
		}else{
			runner := hrp.NewRunner(nil).
				SetFailfast(!continueOnFailure)
			txt,_ := json.Marshal(result)
			if pluginLogOn {
				runner.SetPluginLogOn()
			}

			err,results := runner.Run2(string(txt))
			if err != nil {
				response.FailWithMessage("测试失败", c)
			}
			// 解析返回结果
			var summary tc.Summary
			err = json.Unmarshal([]byte(results),&summary)
			stepResults := summary.Details[0].Records

			if err != nil {
				testcaseService.UpdateTestResult(testcase,false)
				response.FailWithMessage("测试失败", c)
			}else{
				for i:=0;i<len(stepResults);i++ {
					resp,_ := json.Marshal(stepResults[i].Data)
					global.GVA_DB.Model(&teststep).Where("step_id = ?",stepResults[i].StepId).Updates(tc.TestStep{Response: resp,Result:stepResults[i].Success })
				}
				testcaseService.UpdateTestResult(testcase,summary.Success)
				response.OkWithData(gin.H{"result": result}, c)
			}
		}
	}

}
