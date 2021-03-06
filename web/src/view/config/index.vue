<template>
  <div>
    <div class="gva-search-box">
      <el-form :inline="true" :model="searchInfo" class="demo-form-inline">
        <el-form-item label="环境名称" style="width: 30%">
          <el-input v-model="searchInfo.name" placeholder="输入环境名称" clearable />
        </el-form-item>
        <el-form-item>
          <el-button type="primary" icon="Search" @click="onSubmit">
            查询
          </el-button>
          <el-button icon="Refresh" @click="onReset">
            重置
          </el-button>
        </el-form-item>
      </el-form>
    </div>
    <div class="gva-table-box">
      <div class="gva-btn-list">
        <el-button type="primary" icon="Plus" @click="openDialog('create')">
          新增
        </el-button>
        <el-popover v-model:visible="deleteVisible" placement="top" width="160">
          <p>确定要删除吗？</p>
          <div style="text-align: right; margin-top: 8px">
            <el-button type="primary" link @click="deleteVisible = false">
              取消
            </el-button>
            <el-button type="primary" @click="onDelete">
              确定
            </el-button>
          </div>
          <template #reference>
            <el-button icon="Delete" :disabled="!multipleSelection.length" style="margin-left: 10px">
              删除
            </el-button>
          </template>
        </el-popover>
      </div>
      <el-table ref="multipleTable" style="width: 100%" tooltip-effect="dark" :data="tableData" row-key="ID"
        @selection-change="handleSelectionChange">
        <el-table-column type="selection" width="55" />
        <el-table-column align="center" label="环境名称" prop="name" />
        <el-table-column align="center" label="全局URL" prop="base_url" width="420" />
        <el-table-column align="center" label="更新日期" width="180">
          <template #default="scope">
            {{ formatDate(scope.row.UpdatedAt) }}
          </template>
        </el-table-column>
        <el-table-column align="center" label="操作">
          <template #default="scope">
            <el-button type="primary" link icon="Edit" size="small" class="table-button" @click="editConfig(scope.row)">
              编辑
            </el-button>
            <el-button type="primary" link icon="Delete" size="small" @click="deleteConf(scope.row)">
              删除
            </el-button>
          </template>
        </el-table-column>
      </el-table>
      <div class="gva-pagination">
        <el-pagination layout="total, sizes, prev, pager, next, jumper" :current-page="page" :page-size="pageSize"
          :page-sizes="[10, 30, 50, 100]" :total="total" @current-change="handleCurrentChange"
          @size-change="handleSizeChange" />
      </div>
    </div>
    <el-dialog v-model="dialogFormVisible" :before-close="closeDialog" :destroy-on-close="true" :title="title" width="65%">
      <el-form ref="configForm" :model="formData" label-position="right" label-width="100px">
        <el-form-item label="环境名称:" prop="name">
          <el-input v-model="formData.name" clearable placeholder="请输入环境名称" />
        </el-form-item>
        <el-form-item label="全局URL:" prop="base_url">
          <el-input v-model="formData.base_url" clearable placeholder="请输入全局服务URL" />
        </el-form-item>
        <el-form-item>
          <el-tabs v-model="activeName" class="demo-tabs" style="width: 100%;" @tab-click="handleClick">
            <el-tab-pane label="全局变量" name="variables">
              <Variable :data="dynamicForm.variable" ref="variables"/>
            </el-tab-pane>
            <el-tab-pane label="参数化设置" name="params">
              <Parameterize :data="dynamicForm.parameters" :limit="limit" :pick="pick" ref="parameters"/>
            </el-tab-pane>
          </el-tabs>
        </el-form-item>
      </el-form>
      <template #footer>
        <div class="dialog-footer" style="margin-top: 20px">
          <el-button @click="closeDialog"> 取 消 </el-button>
          <el-button type="primary" @click="enterDialog">
            确 定
          </el-button>
        </div>
      </template>
    </el-dialog>
  </div>
</template>
<script>
export default {
  name: 'Config',
}
</script>
<script setup>
import { createConfig, updateConfig, getConfigList, getConfigById, deleteConfig, deleteConfigByIds } from '@/api/config.js'
import { formatDate, Arr2Obj, Obj2ArrType } from '@/utils/format'
import { ref } from 'vue'
import { ElMessage, ElMessageBox } from 'element-plus'
import Parameterize from './components/params.vue'
import Variable from './components/variable.vue'

const type = ref("")
const formData = ref({
  name: '',
  base_url: '',
  variables: {},
  parameters:{},
  parameters_setting:{},
  headers:{},
  environs:{},
  think_time:{},
  websocket:{},
  export:{}
})
const dynamicForm = ref({
  variable: [{name:"",type:"string",value:""}] ,
  parameters:[{name:"",type:"sequential",value:""}],
  config:[]
})
const variables = ref(null)
const parameters = ref(null)

// 搜索
const page = ref(1)
const total = ref(0)
const pageSize = ref(10)
const tableData = ref([])
const searchInfo = ref({})

function onReset() {
  searchInfo.value = {}
}

function onSubmit() {
  page.value = 1
  pageSize.value = 10
  getTableData()
}

// 分页
function handleSizeChange(val) {
  pageSize.value = val
  getTableData()
}

function handleCurrentChange(val) {
  page.value = val
  getTableData()
}

getTableData()

// 批量操作
const multipleSelection = ref([])
function handleSelectionChange(val) {
  multipleSelection.value = val
}

// 弹窗相关
const configForm = ref(null)
const title = ref('新增环境')
const dialogFormVisible = ref(false)
const deleteVisible = ref(false)
const limit = ref(0)
const pick = ref("sequential")

// 初始化弹窗表单
function initForm() {
  configForm.value.resetFields()
  formData.value = {
    name: '',
    base_url: '',
    variables: {}
  }
  dynamicForm.value.variable = [{name:"",type:"string",value:""}]
  dynamicForm.value.parameters = [{name:"",type:"sequential",value:""}]
}

function openDialog(key) {
  switch (key) {
    case 'create':
      title.value = '新增环境'
      limit.value = 0
      pick.value = "sequential"
      break
    case 'update':
      title.value = '编辑环境'
      break
    default:
      break
  }
  type.value = key
  dialogFormVisible.value = true
}

function closeDialog() {
  initForm()
  dialogFormVisible.value = false
}

// 获取列表数据
async function getTableData() {
  const table = await getConfigList({ page: page.value, pageSize: pageSize.value, ...searchInfo.value })
  if (table.code === 0) {
    tableData.value = table.data.list
    total.value = table.data.total
    page.value = table.data.page
    pageSize.value = table.data.pageSize
  }
}

async function onDelete() {
  const ids = multipleSelection.value.map(item => item.ID)
  const res = await deleteConfigByIds({ ids })
  if (res.code === 0) {
    ElMessage({
      type: 'success',
      message: res.msg
    })
    if (tableData.value.length === ids.length && page.value > 1) {
      page.value--
    }
    deleteVisible.value = false
    getTableData()
  }
}

async function editConfig(row) {
  const res = await getConfigById({ id: row.id })
  if (res.code === 0) {
    formData.value = res.data.config

    if(res.data.config.variables !== null){
      dynamicForm.value.variable = Obj2ArrType(res.data.config.variables)
      dynamicForm.value.variable.push({name:"",type:"string",value:""})
    }

    if (res.data.config.parameters !== null){
       dynamicForm.value.parameters = Obj2ArrType(res.data.config.parameters)
       dynamicForm.value.parameters.push({name:"",type:"sequential",value:""})
       limit.value = res.data.config.parameters_setting.limit
       pick.value = res.data.config.parameters_setting.pick_order
    }
  }
  openDialog('update')
}

async function enterDialog() {
  configForm.value.validate(async valid => {
    if (valid) {
      const variableTable = variables.value.Table
      const paramsTable = parameters.value.Table
      const varData = await variableTable.getTableData().tableData
      const paramsData = await paramsTable.getTableData().tableData
      await varData.map((item,index) => {
        delete item["_X_ROW_KEY"]
        if (item.name.length === 0){
          varData.splice(index,1)
        }
      })

      await paramsData.map((item,index) => {
        delete item["_X_ROW_KEY"]
        if (item.name.length === 0){
          paramsData.splice(index,1)
        }
      })

      formData.value.parameters_setting['limit'] = parseInt(parameters.value.limitValue)
      formData.value.parameters_setting['pick_order'] = parameters.value.pickValue
      formData.value.variables = Arr2Obj(varData)
      formData.value.parameters = Arr2Obj(paramsData)
      switch (type.value) {
        case 'create':
          {
            const res = await createConfig(formData.value)
            if (res.code === 0) {
              ElMessage({
                type: 'success',
                message: '创建成功'
              })
            }
            getTableData()
            closeDialog()
          }
          break
        case 'update':
          {
            const res = await updateConfig(formData.value)
            if (res.code === 0) {
              ElMessage({
                type: 'success',
                message: '更新成功'
              })
            }
            getTableData()
            closeDialog()
          }
          break
        default:
          // eslint-disable-next-line no-lone-blocks
          {
            ElMessage({
              type: 'error',
              message: '未知操作'
            })
          }
          break
      }
    }
  })
}

async function deleteConf(row) {
  ElMessageBox.confirm('确定要删除吗?', '提示', {
    confirmButtonText: '确定',
    cancelButtonText: '取消',
    type: 'warning'
  }).then(async () => {
    const res = await deleteConfig(row)
    if (res.code === 0) {
      ElMessage({
        type: 'success',
        message: '删除成功'
      })
      if (tableData.value.length === 1 && page.value > 1) {
        page.value--
      }
      getTableData()
    }
  })
}

// tabs相关操作
const activeName = ref('variables')
const handleClick = (tab, event) => {
  // console.log(tab, event)
}

</script>
<style>
.config-form {
  margin-bottom: 5px;
}
</style>

