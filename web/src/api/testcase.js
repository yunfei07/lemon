import service from '@/utils/request'

export const createTestcase = (data) => {
  return service({
    url: '/testcase/createTestCase',
    method: 'post',
    data,
  })
}

export const updateTestcase = (data) => {
  return service({
    url: '/testcase/updateTestCase',
    method: 'put',
    data: data,
  })
}

export const getTestCaseList = (params) => {
  return service({
    url: '/testcase/getTestCaseList',
    method: 'get',
    params,
  })
}

export const getTestCase = (params) => {
  return service({
    url: '/testcase/getTestCase',
    method: 'get',
    params,
  })
}

export const runTestCase = (params) => {
  return service({
    url: '/testcase/runTestCase',
    method: 'get',
    params,
  })
}

export const debugTestCase = (params) => {
  return service({
    url: '/testcase/debug',
    method: 'get',
    params,
  })
}

export const deleteTestCase = (data) => {
  return service({
    url: '/testcase/deleteTestCase',
    method: 'delete',
    data,
  })
}

export const deleteTestCaseByIds = (data) => {
  return service({
    url: '/testcase/deleteTestCaseByIds',
    method: 'delete',
    data,
  })
}

export const deleteTestStep = (data) => {
  return service({
    url: '/testcase/deleteTestStep',
    method: 'delete',
    data,
  })
}

export const deleteTestStepByIds = (data) => {
  return service({
    url: '/testcase/deleteTestStepByIds',
    method: 'delete',
    data,
  })
}
