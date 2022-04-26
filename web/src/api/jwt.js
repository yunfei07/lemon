import service from '@/utils/request'

// @Router /jwt/jsonInBlacklist [post]
export const jsonInBlacklist = () => {
  return service({
    url: '/jwt/jsonInBlacklist',
    method: 'post'
  })
}
