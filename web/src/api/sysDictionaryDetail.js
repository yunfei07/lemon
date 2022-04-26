import service from '@/utils/request'

// @Router /sysDictionaryDetail/createSysDictionaryDetail [post]
export const createSysDictionaryDetail = (data) => {
  return service({
    url: '/sysDictionaryDetail/createSysDictionaryDetail',
    method: 'post',
    data
  })
}

// @Router /sysDictionaryDetail/deleteSysDictionaryDetail [delete]
export const deleteSysDictionaryDetail = (data) => {
  return service({
    url: '/sysDictionaryDetail/deleteSysDictionaryDetail',
    method: 'delete',
    data
  })
}

// @Router /sysDictionaryDetail/updateSysDictionaryDetail [put]
export const updateSysDictionaryDetail = (data) => {
  return service({
    url: '/sysDictionaryDetail/updateSysDictionaryDetail',
    method: 'put',
    data
  })
}

// @Router /sysDictionaryDetail/findSysDictionaryDetail [get]
export const findSysDictionaryDetail = (params) => {
  return service({
    url: '/sysDictionaryDetail/findSysDictionaryDetail',
    method: 'get',
    params
  })
}

// @Router /sysDictionaryDetail/getSysDictionaryDetailList [get]
export const getSysDictionaryDetailList = (params) => {
  return service({
    url: '/sysDictionaryDetail/getSysDictionaryDetailList',
    method: 'get',
    params
  })
}
