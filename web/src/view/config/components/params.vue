<template>
  <vxe-toolbar>
    <template #buttons>
      <el-button size="small" type="primary" style="float:right">设置全局策略</el-button>
    </template>
  </vxe-toolbar>
  <vxe-table
    border
    show-overflow
    :column-config="{ resizable: false }"
    :data="demo1.tableData"
    :edit-config="{ trigger: 'click', mode: 'cell', showIcon: false }"
    size="mini"
  >
    <vxe-column type="seq" width="60"></vxe-column>
    <vxe-column
      field="name"
      title="参数名"
      :edit-render="{ autofocus: '.vxe-input--inner' }"
    >
      <template #edit="{ row }">
        <vxe-input v-model="row.name" type="text"></vxe-input>
      </template>
    </vxe-column>
    <vxe-column field="sex" title="驱动类型" :edit-render="{}">
      <template #default="{ row }">
        <span>{{ formatSex(row.sex) }}</span>
      </template>
      <template #edit="{ row }">
        <el-select v-model="row.sex" size="small">
          <el-option
            v-for="item in sexList1"
            :key="item.value"
            :value="item.value"
            :label="item.label"
          ></el-option>
        </el-select>
      </template>
    </vxe-column>
    <vxe-column field="role" title="参数值" :edit-render="{}">
      <template #edit="{ row }">
        <vxe-input
          v-model="row.role"
          type="text"
          placeholder="请输入昵称"
        ></vxe-input>
      </template>
    </vxe-column>
     <vxe-column field="sex" title="驱动策略" :edit-render="{}">
      <template #default="{ row }">
        <span>{{ formatSex(row.sex) }}</span>
      </template>
      <template #edit="{ row }">
        <el-select v-model="row.sex" size="small">
          <el-option
            v-for="item in sexList1"
            :key="item.value"
            :value="item.value"
            :label="item.label"
          ></el-option>
        </el-select>
      </template>
    </vxe-column>
    <vxe-column width="68" title="操作" align="center">
      <template #default="{ row }">
       <!-- <el-button type="primary" link icon="Setting" size="small" class="table-button" >
             策略
       </el-button> -->
       <el-button type="primary" link icon="Delete" size="small" class="table-button" >
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
// const props = defineProps({
//   data: {
//     type: Object,
//     default() {
//       return {};
//     },
//   },
// });

// const initType = ref(
//   [
//     { value: 'list', label: '数组' },
//     { value: 'file', label: '文件' },
//     { value: 'func', label: '函数' },
//   ]
// )

const demo1 = ref({
  tableData: [
    {
      id: 10001,
      name: "Test1",
      nickname: "T1",
      role: "Develop",
      sex: "0",
      sex2: ["0"],
      num1: 40,
      age: 28,
      address: "Shenzhen",
      date12: "",
      date13: "",
    },
    {
      id: 10002,
      name: "Test2",
      nickname: "T2",
      role: "Designer",
      sex: "1",
      sex2: ["0", "1"],
      num1: 20,
      age: 22,
      address: "Guangzhou",
      date12: "",
      date13: "2020-08-20",
    },
    {
      id: 10003,
      name: "Test3",
      nickname: "T3",
      role: "Test",
      sex: "0",
      sex2: ["1"],
      num1: 200,
      age: 32,
      address: "Shanghai",
      date12: "2020-09-10",
      date13: "",
    },
    {
      id: 10004,
      name: "Test4",
      nickname: "T4",
      role: "Designer",
      sex: "1",
      sex2: ["1"],
      num1: 30,
      age: 23,
      address: "Shenzhen",
      date12: "",
      date13: "2020-12-04",
    },
  ],
});

const sexList1 = ref([
  { label: "", value: "" },
  { label: "男", value: "1" },
  { label: "女", value: "0" },
]);

const formatSex = (value) => {
  if (value === "1") {
    return "男";
  }
  if (value === "0") {
    return "女";
  }
  return "";
};
// const editClose = () => {}
</script>
<style scoped></style>
