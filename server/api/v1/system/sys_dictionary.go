package system

import (
	"github.com/gin-gonic/gin"
	"github.com/yunfei07/lemon/server/global"
	"github.com/yunfei07/lemon/server/model/common/response"
	"github.com/yunfei07/lemon/server/model/system"
	"github.com/yunfei07/lemon/server/model/system/request"
	"github.com/yunfei07/lemon/server/utils"
	"go.uber.org/zap"
)

type DictionaryApi struct{}


func (s *DictionaryApi) CreateSysDictionary(c *gin.Context) {
	var dictionary system.SysDictionary
	_ = c.ShouldBindJSON(&dictionary)
	if err := dictionaryService.CreateSysDictionary(dictionary); err != nil {
		global.GVA_LOG.Error("创建失败!", zap.Error(err))
		response.FailWithMessage("创建失败", c)
	} else {
		response.OkWithMessage("创建成功", c)
	}
}


func (s *DictionaryApi) DeleteSysDictionary(c *gin.Context) {
	var dictionary system.SysDictionary
	_ = c.ShouldBindJSON(&dictionary)
	if err := dictionaryService.DeleteSysDictionary(dictionary); err != nil {
		global.GVA_LOG.Error("删除失败!", zap.Error(err))
		response.FailWithMessage("删除失败", c)
	} else {
		response.OkWithMessage("删除成功", c)
	}
}


func (s *DictionaryApi) UpdateSysDictionary(c *gin.Context) {
	var dictionary system.SysDictionary
	_ = c.ShouldBindJSON(&dictionary)
	if err := dictionaryService.UpdateSysDictionary(&dictionary); err != nil {
		global.GVA_LOG.Error("更新失败!", zap.Error(err))
		response.FailWithMessage("更新失败", c)
	} else {
		response.OkWithMessage("更新成功", c)
	}
}


func (s *DictionaryApi) FindSysDictionary(c *gin.Context) {
	var dictionary system.SysDictionary
	_ = c.ShouldBindQuery(&dictionary)
	if err, sysDictionary := dictionaryService.GetSysDictionary(dictionary.Type, dictionary.ID); err != nil {
		global.GVA_LOG.Error("查询失败!", zap.Error(err))
		response.FailWithMessage("查询失败", c)
	} else {
		response.OkWithDetailed(gin.H{"resysDictionary": sysDictionary}, "查询成功", c)
	}
}


func (s *DictionaryApi) GetSysDictionaryList(c *gin.Context) {
	var pageInfo request.SysDictionarySearch
	_ = c.ShouldBindQuery(&pageInfo)
	if err := utils.Verify(pageInfo.PageInfo, utils.PageInfoVerify); err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	if err, list, total := dictionaryService.GetSysDictionaryInfoList(pageInfo); err != nil {
		global.GVA_LOG.Error("获取失败!", zap.Error(err))
		response.FailWithMessage("获取失败", c)
	} else {
		response.OkWithDetailed(response.PageResult{
			List:     list,
			Total:    total,
			Page:     pageInfo.Page,
			PageSize: pageInfo.PageSize,
		}, "获取成功", c)
	}
}
