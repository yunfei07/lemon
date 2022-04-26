package request

import (
	"github.com/yunfei07/lemon/server/model/common/request"
	"github.com/yunfei07/lemon/server/model/testcase"
)

type TestCaseSearch struct{
	testcase.TestCase
	request.PageInfo
}