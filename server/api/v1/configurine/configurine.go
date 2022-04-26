package configurine

import (
	"github.com/gin-gonic/gin"
	"github.com/yunfei07/lemon/server/global"
	"github.com/yunfei07/lemon/server/model/common/request"
	"github.com/yunfei07/lemon/server/model/common/response"
	"github.com/yunfei07/lemon/server/model/configurine"
	configReq "github.com/yunfei07/lemon/server/model/configurine/request"
	"github.com/yunfei07/lemon/server/service"
	"go.uber.org/zap"
)

type ConfigApi struct {}

var configService = service.ServiceGroupApp.ConfigServiceGroup.ConfigService

func (configApi *ConfigApi) CreateConfig(c *gin.Context){
	var config configurine.Config
	_ = c.ShouldBindJSON(&config)

	if err := configService.CreateConfig(config);err != nil {
		global.GVA_LOG.Error("创建失败!", zap.Any("err", err))
		response.FailWithMessage("创建失败", c)
	}else {
		response.OkWithMessage("创建成功", c)
	}
}

func (configApi *ConfigApi) DeleteConfig(c *gin.Context){
	var config configurine.Config
	_ = c.ShouldBindJSON(&config)

	if err := configService.DeleteConfig(config);err != nil {
		global.GVA_LOG.Error("删除失败!", zap.Any("err", err))
		response.FailWithMessage("删除失败", c)
	}else{
		response.OkWithMessage("删除成功", c)
	}
}

func (configApi *ConfigApi) DeleteConfigByIds(c *gin.Context){
	var IDS request.IdsReq
	_ = c.ShouldBindJSON(&IDS)

	if err := configService.DeleteConfigByIds(IDS);err != nil {
		global.GVA_LOG.Error("批量删除失败!", zap.Any("err", err))
		response.FailWithMessage("批量删除失败", c)
	}else{
		response.OkWithMessage("批量删除成功", c)
	}
}

func (configApi *ConfigApi) UpdateConfig(c *gin.Context){
	var config configurine.Config
	_ = c.ShouldBindJSON(&config)

	if err := configService.UpdateConfig(config);err != nil {
		global.GVA_LOG.Error("修改失败!", zap.Error(err))
		response.FailWithMessage("修改失败", c)
	}else{
		response.OkWithMessage("修改成功", c)
	}
}

func (configApi *ConfigApi) GetConfigById(c *gin.Context){
	var req request.GetById
	_ = c.ShouldBindQuery(&req)
	if err,conf := configService.GetConfigById(req.Uint());err != nil {
		global.GVA_LOG.Error("查询失败!", zap.Any("err", err))
		response.FailWithMessage("查询失败", c)
	}else{
		response.OkWithData(gin.H{"config": conf}, c)
	}
}

func (configApi *ConfigApi) GetConfigByName(c *gin.Context){}

func (ConfigApi *ConfigApi) GetAllConfig(c *gin.Context){
	if err,list := configService.GetAllConfig();err != nil {
		global.GVA_LOG.Error("查询失败!", zap.Any("err", err))
		response.FailWithMessage("查询失败", c)
	}else{
		response.OkWithDetailed(response.PageResult{
			List:     list,
		}, "获取成功", c)
	}
}

func (configApi *ConfigApi) GetConfigList(c *gin.Context){
	var pageInfo configReq.ConfigSearch
	_ = c.ShouldBindQuery(&pageInfo)
	if err, list, total := configService.GetConfigList(pageInfo); err != nil {
		global.GVA_LOG.Error("获取失败!", zap.Any("err", err))
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
