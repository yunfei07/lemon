<template>
  <vxe-table
    border
    show-overflow
    keep-source
    auto-resize
    :data="data"
    :column-config="{ resizable: false}"
    :edit-config="{ trigger: 'click', mode: 'cell', showIcon: false }"
    @edit-closed="handleAddVar"
    ref="Table"
  >
    <vxe-column type="seq" width="5%"></vxe-column>
    <vxe-column
      field="name"
      title="变量名"
      width="30%"
      :edit-render="{ autofocus: '.vxe-input--inner' }"
    >
      <template #edit="{ row }">
        <vxe-input v-model="row.name" type="text" placeholder="变量名"></vxe-input>
      </template>
    </vxe-column>
    <vxe-column field="type" title="变量类型" :edit-render="{}" width="15%">
      <template #default="{ row }">
        <span>{{ formatVarType(row.type) }}</span>
      </template>
      <template #edit="{ row }">
        <el-select
          v-model="row.type"
          size="small"
          placeholder="选择变量类型"
          @change="handleSelectVarType(row)"
        >
          <el-option
            v-for="item in initType"
            :key="item.value"
            :label="item.label"
            :value="item.value"
          />
        </el-select>
      </template>
    </vxe-column>
    <vxe-column
      field="value"
      title="变量值"
      min-width="40%"
      :edit-render="{ autofocus: '.vxe-input--inner' }"
    >
      <template #default="{ row }">
        <span>{{ row.value }}</span>
      </template>
      <template #edit="{ row }">
        <vxe-input v-model="row.value" type="text" placeholder="变量值"></vxe-input>
      </template>
    </vxe-column>
    <vxe-column width="10%" title="操作" align="center">
      <template #default="{ row }">
        <el-button type="primary" link icon="Delete" size="small" class="table-button" @click="handleDeleteVar(row)">
          删除
       </el-button>
      </template>
    </vxe-column>
  </vxe-table>
</template>
<script>
export default {
  name: "Variable",
};
</script>
<script setup>
import { ref } from "vue";
import { types }from "./types"
defineProps({
  data: Array,
});

const initType = ref(types)
const Table = ref(null)

const handleAddVar = async () => {
  const $table = Table.value
  const tableData = await $table.getTableData().tableData

  if(tableData[tableData.length - 1].name.length !== 0){
    const record = {name:"",type:"string",value:""}
    const newRow = await $table.insertAt(record,-1)
    await $table.setActiveCell(newRow,'name')
  }
}
const handleDeleteVar = async (row) => {
  const $table = Table.value
  await $table.remove(row)
}
const handleSelectVarType =  (row) => {
  const $table = Table.value
  const tData =  $table.getTableData().tableData
  const index = tData.findIndex(item => item === row)
  switch (tData[index].type) {
    case 'int':
      tData[index].value = parseInt(tData[index].value)
      break
    case 'float':
      tData[index].value = parseFloat(tData[index].value)
      break
    case 'string':
      tData[index].value = String(tData[index].value)
      break
    default:
      tData[index].value = String(tData[index].value)
      break
  }

}
const formatVarType = (value) => {
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

defineExpose({
  Table
})
</script>
<style scoped></style>
