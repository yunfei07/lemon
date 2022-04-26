import service from '@/utils/request'

// @Router /sysOperationRecord/deleteSysOperationRecord [delete]
export const deleteSysOperationRecord = (data) => {
  return service({
    url: '/sysOperationRecord/deleteSysOperationRecord',
    method: 'delete',
    data
  })
}

// @Router /sysOperationRecord/deleteSysOperationRecord [delete]
export const deleteSysOperationRecordByIds = (data) => {
  return service({
    url: '/sysOperationRecord/deleteSysOperationRecordByIds',
    method: 'delete',
    data
  })
}

// @Router /sysOperationRecord/getSysOperationRecordList [get]
export const getSysOperationRecordList = (params) => {
  return service({
    url: '/sysOperationRecord/getSysOperationRecordList',
    method: 'get',
    params
  })
}
