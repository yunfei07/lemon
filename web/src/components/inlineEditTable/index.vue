<template>
  <vxe-table border show-overflow keep-source :data="data" :column-config="{ resizable: true }"
    :edit-config="{ trigger: 'click', mode: 'cell', showIcon: false }" size="mini" @edit-closed="$emit('add')"
    ref="Table">
    <vxe-column width="50">
      <template #default="{ row }">
        <span class="drag-btn" v-if="row.name.length > 0">
          <el-icon>
            <Operation />
          </el-icon>
        </span>
      </template>
    </vxe-column>
    <vxe-column v-for="(item, index) in columns" :field="item.field" :title="item.name"
      :edit-render="{ autofocus: '.vxe-input--inner', placeholder: item.placeholder }" :width="item.width">
      <template #default="{ row }" v-if="item.field === 'value'">
        <span v-if="item.type === 'input'">{{ row[item.field] }}</span>
        <span v-if="item.type === 'select'">{{formType(row[item.field])}}</span>
        <div style="float:right" v-if="row[item.field].length > 0" @click="$emit('del', row)">
          <el-icon>
            <Close />
          </el-icon>
        </div>
      </template>
      <template #edit="{ row }">
        <vxe-input v-model="row[item.field]" type="text" :placeholder="item.placeholder" v-if="item.type === 'input'">
        </vxe-input>
        <el-select v-model="row[item.field]" placeholder="选择变量类型" v-if="item.type === 'select'" @change="$emit('changeType',row)">
          <el-option v-for="t in types" :key="t.value" :label="t.label" :value="t.value" />
        </el-select>
      </template>
    </vxe-column>
  </vxe-table>
</template>
<script>
export default {
  name: 'InlineEditTable'
}
</script>
<script setup>
import { ref } from 'vue'
const Table = ref({})
const props = defineProps({
  data: {
    type: Array,
    default(rawProps) {
      return [{ name: "", value: "" }]
    }
  },
  columns: {
    type: Array,
    default(rawProps) {
      return []
    }
  },
  types:{
    type:Array,
    default(){
      return [
        {"label":"整型","value":"int"},
        {"label":"浮点型","value":"float"},
        {"label":"字符串","value":"string"},
      ]
    }
  }
})

const getTableIns = () => {
  return Table.value
}

const formType = (value) => {
  console.log(value)
  const item = types.find(item => item.value === value)
  return item ? item.label : value
}

defineExpose({ getTableIns })
</script>
<style>
.sortable-row .drag-btn {
  cursor: move;
  font-size: 12px;
}

.sortable-row .vxe-body--row.sortable-ghost,
.sortable-row .vxe-body--row.sortable-chosen {
  background-color: #dfecfb;
}
</style>
