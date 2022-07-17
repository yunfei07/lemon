<template>
  <vxe-toolbar>
    <template #buttons>
      <el-form :inline="true" class="demo-form-inline" size="default">
        <el-form-item label="参数化策略">
          <el-select placeholder="请选择参数化取值策略" style="height:32px !important" v-model="pickValue">
           <el-option
            v-for="item in pickOrder"
            :key="item.value"
            :value="item.value"
            :label="item.label"
          ></el-option>
          </el-select>
        </el-form-item>
         <el-form-item label="迭代次数">
          <el-input v-model="limitValue" placeholder="有效的迭代次数为 limit > 0，如果 limit = 0 表示默认，如果 limit < 0，则表示无限制迭代次数。" />
        </el-form-item>
      </el-form>
    </template>
  </vxe-toolbar>
  <vxe-table
    border
    show-overflow
    keep-source
    :column-config="{ resizable: false }"
    :data="data"
    :edit-config="{ trigger: 'click', mode: 'cell', showIcon: false }"
     @edit-closed="handleAddParams"
     ref="Table"
  >
    <vxe-column type="seq" width="5%"></vxe-column>
    <vxe-column
      field="name"
      title="参数名"
      :edit-render="{ autofocus: '.vxe-input--inner' }"
    >
      <template #edit="{ row }">
        <vxe-input v-model="row.name" type="text"  placeholder="参数名"></vxe-input>
      </template>
    </vxe-column>
    <vxe-column field="value" title="参数值" :edit-render="{}">
      <template #edit="{ row }">
        <vxe-input
          v-model="row.value"
          type="text"
          placeholder="请输入参数值或参数表达式"
        ></vxe-input>
      </template>
    </vxe-column>
    <vxe-column width="68" title="操作" align="center">
      <template #default="{ row }">
        <el-button
          type="primary"
          link
          icon="Delete"
          size="small"
          class="table-button"
          @click="handleDelParams(row)"
        >
          删除
        </el-button>
      </template>
    </vxe-column>
  </vxe-table>
</template>
<script>
export default {
  name: "Parameterize",
};
</script>
<script setup>
import { ref } from "vue";
const props = defineProps({
  data: {
    type: Array,
  },
  limit:{
    type:Number,
    default:0
  },
  pick:{
    type:String,
    default:"sequential"
  }
});
const Table = ref(null)
const pickValue = ref(props.pick)
const limitValue = ref(props.limit)
const pickOrder = ref([
  { value: "sequential", label: "顺序" },
  { value: "random", label: "随机" },
  { value: "unique", label: "唯一" },
]);
const handleAddParams = async () => {
  const $table = Table.value
  const tableData = await $table.getTableData().tableData

  if(tableData[tableData.length - 1].name.length !== 0){
    const record = {name:"",type:"sequential",value:""}
    const newRow = await $table.insertAt(record,-1)
    await $table.setActiveCell(newRow,'name')
  }
}
const handleDelParams = async (row) => {
  const $table = Table.value
  await $table.remove(row)
}

defineExpose({
  Table,
  pickValue,
  limitValue
})
</script>
<style scoped></style>
