import service from '@/utils/request'
// @Router /authority/getAuthorityList [post]
export const getAuthorityList = (data) => {
  return service({
    url: '/authority/getAuthorityList',
    method: 'post',
    data
  })
}

// @Router /authority/deleteAuthority [post]
export const deleteAuthority = (data) => {
  return service({
    url: '/authority/deleteAuthority',
    method: 'post',
    data
  })
}

// @Router /authority/createAuthority [post]
export const createAuthority = (data) => {
  return service({
    url: '/authority/createAuthority',
    method: 'post',
    data
  })
}

// @Router /authority/copyAuthority [post]
export const copyAuthority = (data) => {
  return service({
    url: '/authority/copyAuthority',
    method: 'post',
    data
  })
}

// @Router /authority/setDataAuthority [post]
export const setDataAuthority = (data) => {
  return service({
    url: '/authority/setDataAuthority',
    method: 'post',
    data
  })
}

// @Router /authority/setDataAuthority [post]
export const updateAuthority = (data) => {
  return service({
    url: '/authority/updateAuthority',
    method: 'put',
    data
  })
}
