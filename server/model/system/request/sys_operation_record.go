package request

import (
	"github.com/yunfei07/lemon/server/model/common/request"
	"github.com/yunfei07/lemon/server/model/system"
)

type SysOperationRecordSearch struct {
	system.SysOperationRecord
	request.PageInfo
}
