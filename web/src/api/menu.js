import service from '@/utils/request'

// @Router /menu/getMenu [post]
export const asyncMenu = () => {
  return service({
    url: '/menu/getMenu',
    method: 'post'
  })
}

// @Router /menu/getMenuList [post]
export const getMenuList = (data) => {
  return service({
    url: '/menu/getMenuList',
    method: 'post',
    data
  })
}

// @Router /menu/getMenuList [post]
export const addBaseMenu = (data) => {
  return service({
    url: '/menu/addBaseMenu',
    method: 'post',
    data
  })
}

// @Router /menu/getBaseMenuTree [post]
export const getBaseMenuTree = () => {
  return service({
    url: '/menu/getBaseMenuTree',
    method: 'post'
  })
}

// @Router /menu/getMenuList [post]
export const addMenuAuthority = (data) => {
  return service({
    url: '/menu/addMenuAuthority',
    method: 'post',
    data
  })
}

// @Router /menu/getMenuAuthority [post]
export const getMenuAuthority = (data) => {
  return service({
    url: '/menu/getMenuAuthority',
    method: 'post',
    data
  })
}

// @Router /menu/deleteBaseMenu [post]
export const deleteBaseMenu = (data) => {
  return service({
    url: '/menu/deleteBaseMenu',
    method: 'post',
    data
  })
}

// @Router /menu/updateBaseMenu [post]
export const updateBaseMenu = (data) => {
  return service({
    url: '/menu/updateBaseMenu',
    method: 'post',
    data
  })
}

// @Router /menu/getBaseMenuById [post]
export const getBaseMenuById = (data) => {
  return service({
    url: '/menu/getBaseMenuById',
    method: 'post',
    data
  })
}
