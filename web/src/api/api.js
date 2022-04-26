import service from '@/utils/request'

export const getApiList = (data) => {
  return service({
    url: '/api/getApiList',
    method: 'post',
    data
  })
}

export const createApi = (data) => {
  return service({
    url: '/api/createApi',
    method: 'post',
    data
  })
}

export const getApiById = (data) => {
  return service({
    url: '/api/getApiById',
    method: 'post',
    data
  })
}

export const updateApi = (data) => {
  return service({
    url: '/api/updateApi',
    method: 'post',
    data
  })
}

export const setAuthApi = (data) => {
  return service({
    url: '/api/setAuthApi',
    method: 'post',
    data
  })
}

export const getAllApis = (data) => {
  return service({
    url: '/api/getAllApis',
    method: 'post',
    data
  })
}

export const deleteApi = (data) => {
  return service({
    url: '/api/deleteApi',
    method: 'post',
    data
  })
}

export const deleteApisByIds = (data) => {
  return service({
    url: '/api/deleteApisByIds',
    method: 'delete',
    data
  })
}
