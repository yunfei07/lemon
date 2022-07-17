import { formatTimeToStr } from '@/utils/date'
import { getDict } from '@/utils/dictionary'

export const formatBoolean = (bool) => {
  if (bool !== null) {
    return bool ? '是' : '否'
  } else {
    return ''
  }
}

export const formatDate = (time) => {
  if (time !== null && time !== '') {
    var date = new Date(time)
    return formatTimeToStr(date, 'yyyy-MM-dd hh:mm:ss')
  } else {
    return ''
  }
}

export const formatPickOrder = (value) => {
  if (value === "random") {
    return "随机";
  }
  if (value === "sequential") {
    return "顺序";
  }
  if (value === "unique") {
    return "唯一";
  }
  return "";
}

export const formatType = (value) => {
   if(value === 'string'){
    return '字符串'
  }

  if(value === "int"){
    return "整数"
  }

  if(value === 'float'){
    return '浮点数'
  }
}

export const filterDict = (value, options) => {
  const rowLabel = options && options.filter(item => item.value === value)
  return rowLabel && rowLabel[0] && rowLabel[0].label
}

export const getDictFunc = async(type) => {
  const dicts = await getDict(type)
  return dicts
}

// arr -> obj
export const Arr2Obj = (arr) => {
  var object = arr.reduce(
    (obj, item) => Object.assign(obj, { [item.name]: item.value }), {})
  return object
}

// obj => arr
export const Obj2Arr = (obj) => {
  var keys = Object.keys(obj)
  var arr = []
  for (var i = 0; i < keys.length; i++) {
    arr.push({ 'name': keys[i], 'value': obj[keys[i]], 'index': i + 1 })
  }
  return arr
}

// obj => arrType
export const Obj2ArrType = (obj) => {
  var keys = Object.keys(obj)
  var arr = []
  for (var i = 0; i < keys.length; i++) {
    if (typeof (obj[keys[i]]) === 'string') {
      arr.push({ 'name': keys[i], 'value': obj[keys[i]], 'type': 'string' })
    }
    if (typeof (obj[keys[i]]) === 'number') {
      if (obj[keys[i]] !== parseInt(obj[keys[i]])) {
        arr.push({
          name: keys[i],
          value: obj[keys[i]],
          type: 'float',
        })
      } else {
        arr.push({
          name: keys[i],
          value: obj[keys[i]],
          type: 'int',
        })
      }
    }
  }
  return arr
}

