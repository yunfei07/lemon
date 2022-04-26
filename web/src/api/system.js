import service from '@/utils/request'

// @Router /system/getSystemConfig [post]
export const getSystemConfig = () => {
  return service({
    url: '/system/getSystemConfig',
    method: 'post'
  })
}

// @Router /system/setSystemConfig [post]
export const setSystemConfig = (data) => {
  return service({
    url: '/system/setSystemConfig',
    method: 'post',
    data
  })
}

// @Router /system/getServerInfo [post]
export const getSystemState = () => {
  return service({
    url: '/system/getServerInfo',
    method: 'post',
    donNotShowLoading: true
  })
}
