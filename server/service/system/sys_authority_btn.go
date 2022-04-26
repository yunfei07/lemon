package system

import (
	"errors"
	"github.com/yunfei07/lemon/server/global"
	"github.com/yunfei07/lemon/server/model/system"
	"github.com/yunfei07/lemon/server/model/system/request"
	"github.com/yunfei07/lemon/server/model/system/response"
	"gorm.io/gorm"
)

type AuthorityBtnService struct{}

func (a *AuthorityBtnService) GetAuthorityBtn(req request.SysAuthorityBtnReq) (err error, res response.SysAuthorityBtnRes) {
	var authorityBtn []system.SysAuthorityBtn
	err = global.GVA_DB.Find(&authorityBtn, "authority_id = ? and sys_menu_id = ?", req.AuthorityId, req.MenuID).Error
	if err != nil {
		return
	}
	var selected []uint
	for _, v := range authorityBtn {
		selected = append(selected, v.SysBaseMenuBtnID)
	}
	res.Selected = selected
	return err, res
}

func (a *AuthorityBtnService) SetAuthorityBtn(req request.SysAuthorityBtnReq) (err error) {
	return global.GVA_DB.Transaction(func(tx *gorm.DB) error {
		var authorityBtn []system.SysAuthorityBtn
		err = tx.Delete(&[]system.SysAuthorityBtn{}, "authority_id = ? and sys_menu_id = ?", req.AuthorityId, req.MenuID).Error
		if err != nil {
			return err
		}
		for _, v := range req.Selected {
			authorityBtn = append(authorityBtn, system.SysAuthorityBtn{
				AuthorityId:      req.AuthorityId,
				SysMenuID:        req.MenuID,
				SysBaseMenuBtnID: v,
			})
		}
		if len(authorityBtn) > 0 {
			err = tx.Create(&authorityBtn).Error
		}
		if err != nil {
			return err
		}
		return err
	})
}

func (a *AuthorityBtnService) CanRemoveAuthorityBtn(ID string) (err error) {
	fErr := global.GVA_DB.First(&system.SysAuthorityBtn{}, "sys_base_menu_btn_id = ?", ID).Error
	if errors.Is(fErr, gorm.ErrRecordNotFound) {
		return nil
	}
	return errors.New("此按钮正在被使用无法删除")
}