import service from '@/utils/request'

// @Router /sysDictionary/createSysDictionary [post]
export const createSysDictionary = (data) => {
  return service({
    url: '/sysDictionary/createSysDictionary',
    method: 'post',
    data
  })
}

// @Router /sysDictionary/deleteSysDictionary [delete]
export const deleteSysDictionary = (data) => {
  return service({
    url: '/sysDictionary/deleteSysDictionary',
    method: 'delete',
    data
  })
}

// @Router /sysDictionary/updateSysDictionary [put]
export const updateSysDictionary = (data) => {
  return service({
    url: '/sysDictionary/updateSysDictionary',
    method: 'put',
    data
  })
}

// @Router /sysDictionary/findSysDictionary [get]
export const findSysDictionary = (params) => {
  return service({
    url: '/sysDictionary/findSysDictionary',
    method: 'get',
    params
  })
}

// @Router /sysDictionary/getSysDictionaryList [get]
export const getSysDictionaryList = (params) => {
  return service({
    url: '/sysDictionary/getSysDictionaryList',
    method: 'get',
    params
  })
}
