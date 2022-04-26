package configurine

import (
	"github.com/gin-gonic/gin"
	v1 "github.com/yunfei07/lemon/server/api/v1"
	"github.com/yunfei07/lemon/server/middleware"
)

type ConfigRouter struct {}

func (config *ConfigRouter) InitConfigRouter(Router *gin.RouterGroup){
	configRouter := Router.Group("config").Use(middleware.OperationRecord())
	configRouterWithoutRecord := Router.Group("config")
	var configApi = v1.ApiGroupApp.ConfigApiGroup.ConfigApi
	{
		configRouter.POST("createConfig",configApi.CreateConfig) // 新建
		configRouter.DELETE("deleteConfig",configApi.DeleteConfig) // 删除
		configRouter.DELETE("deleteConfigByIds",configApi.DeleteConfigByIds) // 删除
		configRouter.PUT("updateConfig",configApi.UpdateConfig) //  更新
	}
	{
		configRouterWithoutRecord.GET("getConfigByName",configApi.GetConfigByName)
		configRouterWithoutRecord.GET("getConfigById",configApi.GetConfigById)
		configRouterWithoutRecord.GET("getConfigList",configApi.GetConfigList)
		configRouterWithoutRecord.GET("getAllConfig",configApi.GetAllConfig)
	}
}