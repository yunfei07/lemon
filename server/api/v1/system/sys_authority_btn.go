package system

import (
	"github.com/gin-gonic/gin"
	"github.com/yunfei07/lemon/server/global"
	"github.com/yunfei07/lemon/server/model/common/response"
	"github.com/yunfei07/lemon/server/model/system/request"
	"go.uber.org/zap"
)

type AuthorityBtnApi struct{}


func (a *AuthorityBtnApi) GetAuthorityBtn(c *gin.Context) {
	var req request.SysAuthorityBtnReq
	_ = c.ShouldBindJSON(&req)
	if err, res := authorityBtnService.GetAuthorityBtn(req); err != nil {
		global.GVA_LOG.Error("查询失败!", zap.Error(err))
		response.FailWithMessage("查询失败", c)
	} else {
		response.OkWithDetailed(res, "查询成功", c)
	}
}


func (a *AuthorityBtnApi) SetAuthorityBtn(c *gin.Context) {
	var req request.SysAuthorityBtnReq
	_ = c.ShouldBindJSON(&req)
	if err := authorityBtnService.SetAuthorityBtn(req); err != nil {
		global.GVA_LOG.Error("分配失败!", zap.Error(err))
		response.FailWithMessage("分配失败", c)
	} else {
		response.OkWithMessage("分配成功", c)
	}
}


func (a *AuthorityBtnApi) CanRemoveAuthorityBtn(c *gin.Context) {
	id := c.Query("id")
	if err := authorityBtnService.CanRemoveAuthorityBtn(id); err != nil {
		global.GVA_LOG.Error("删除失败!", zap.Error(err))
		response.FailWithMessage(err.Error(), c)
	} else {
		response.OkWithMessage("删除成功", c)
	}
}
