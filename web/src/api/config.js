import service from '@/utils/request'

export const createConfig = (data) => {
  return service({
    url: '/config/createConfig',
    method: 'post',
    data,
  })
}

export const updateConfig = (data) => {
  return service({
    url: '/config/updateConfig',
    method: 'put',
    data,
  })
}

export const getConfigList = (data) => {
  return service({
    url: '/config/getConfigList',
    method: 'post',
    data,
  })
}

export const getAllConfig = () => {
  return service({
    url: '/config/getAllConfig',
    method: 'get',
  })
}

export const getConfigById = (params) => {
  return service({
    url: '/config/getConfigById',
    method: 'get',
    params,
  })
}

export const deleteConfig = (data) => {
  return service({
    url: '/config/deleteConfig',
    method: 'delete',
    data,
  })
}

export const deleteConfigByIds = (data) => {
  return service({
    url: '/config/deleteConfigByIds',
    method: 'delete',
    data,
  })
}
