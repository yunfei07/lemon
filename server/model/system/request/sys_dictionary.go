package request

import (
	"github.com/yunfei07/lemon/server/model/common/request"
	"github.com/yunfei07/lemon/server/model/system"
)

type SysDictionarySearch struct {
	system.SysDictionary
	request.PageInfo
}
