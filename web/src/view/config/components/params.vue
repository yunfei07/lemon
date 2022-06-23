<template>
  <vxe-toolbar>
    <template #buttons>
      <el-form :inline="true" class="demo-form-inline" size="default">
        <el-form-item label="全局策略">
          <el-select placeholder="请选择参数化取值策略" style="height:32px !important">
           <el-option
            v-for="item in initType"
            :key="item.value"
            :value="item.value"
            :label="item.label"
          ></el-option>
          </el-select>
        </el-form-item>
         <el-form-item label="迭代次数">
          <el-input placeholder="有效的迭代次数为 limit > 0，如果 limit = 0 表示默认，如果 limit < 0，则表示无限制迭代次数。" />
        </el-form-item>
      </el-form>
    </template>
  </vxe-toolbar>
  <vxe-table
    border
    show-overflow
    keep-source
    :column-config="{ resizable: false }"
    :data="demo1.tableData"
    :edit-config="{ trigger: 'click', mode: 'cell', showIcon: false }"
     ref="Table"
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
    <vxe-column field="value" title="取值表达式" :edit-render="{}">
      <template #edit="{ row }">
        <vxe-input
          v-model="row.value"
          type="text"
          placeholder="请输入昵称"
        ></vxe-input>
      </template>
    </vxe-column>
    <vxe-column
      field="strategies"
      title="取值策略"
      :edit-render="{}"
      width="120"
      align="center"
    >
      <template #default="{ row }">
        <span>{{ formatOrder(row.type) }}</span>
      </template>
      <template #edit="{ row }">
        <el-select v-model="row.type" size="small">
          <el-option
            v-for="item in initType"
            :key="item.value"
            :value="item.value"
            :label="item.label"
          ></el-option>
        </el-select>
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
});

const initType = ref([
  { value: "sequential", label: "顺序" },
  { value: "random", label: "随机" },
  { value: "unique", label: "唯一" },
]);

const demo1 = ref({
  tableData: [
    {
      name: "Test1",
      value: "Develop1",
      type: "unique",
    },
    {
      name: "Test2",
      value: "Develop2",
      type: "random",
    },
    {
      name: "Test3",
      value: "Develop3",
      type: "sequential",
    },
  ],
});

const formatOrder = (value) => {
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
};
// const editClose = () => {}
</script>
<style scoped></style>
