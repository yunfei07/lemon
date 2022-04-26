import service from '@/utils/request'

// @Router /casbin/UpdateCasbin [post]
export const UpdateCasbin = (data) => {
  return service({
    url: '/casbin/updateCasbin',
    method: 'post',
    data
  })
}

// @Router /casbin/getPolicyPathByAuthorityId [post]
export const getPolicyPathByAuthorityId = (data) => {
  return service({
    url: '/casbin/getPolicyPathByAuthorityId',
    method: 'post',
    data
  })
}
