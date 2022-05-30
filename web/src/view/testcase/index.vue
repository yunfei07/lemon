<template>
  <div>
    <div class="gva-search-box">
      <el-form :inline="true" :model="searchInfo" class="demo-form-inline">
        <el-form-item label="接口名称">
          <el-input v-model="searchInfo.name" placeholder="" />
        </el-form-item>
        <el-form-item label="接口协议">
          <el-input v-model="searchInfo.protocol" placeholder="" />
        </el-form-item>
        <el-form-item>
          <el-button type="primary" icon="Search" @click="onSubmit">查询</el-button>
          <el-button icon="Refresh" @click="onReset">重置</el-button>
        </el-form-item>
      </el-form>
    </div>
    <div class="gva-table-box">
      <div class="gva-btn-list">
        <el-button type="primary" icon="Plus" @click="openCaseDialog('create')">新增</el-button>
        <el-popover v-model:visible="deleteVisible" placement="top" width="160">
          <p>确定要删除吗？</p>
          <div style="text-align: right; margin-top: 8px">
            <el-button type="text" @click="deleteVisible = false">取消</el-button>
            <el-button type="primary" @click="onDelCase">确定</el-button>
          </div>
          <template #reference>
            <el-button icon="Delete" style="margin-left: 10px">删除</el-button>
          </template>
        </el-popover>
      </div>
      <el-table
        ref="multipleTable"
        style="width: 100%"
        tooltip-effect="dark"
        :data="tableData"
        row-key="ID"
        fit
        @selection-change="handleSelectionChange"
      >
        <el-table-column type="selection" width="55" />
        <el-table-column label="用例名称" prop="name" />
        <el-table-column label="所属项目" prop="project" />
        <!-- <el-table-column label="所属服务" prop="server" width="120" /> -->
        <el-table-column label="测试结果" prop="result">
          <template #default="scope">
            <span v-if="scope.row.result === 0">{{ formatResult(scope.row.result) }}</span>
            <span v-if="scope.row.result === 1">
              <el-tag size="small" type="success">{{ formatResult(scope.row.result) }}</el-tag>
            </span>
            <span v-if="scope.row.result === 2">
              <el-tag size="small" type="danger">{{ formatResult(scope.row.result) }}</el-tag>
            </span>
          </template>
        </el-table-column>
        <el-table-column label="创建人" prop="creator" />
        <el-table-column label="更新日期" width="180">
          <template #default="scope">{{ formatDate(scope.row.UpdatedAt) }}</template>
        </el-table-column>
        <el-table-column align="center" label="操作" width="180">
          <template #default="scope">
            <el-button
              v-if="scope.row.protocol !== 'rpc'"
              type="text"
              size="small"
              icon="CaretRight"
              @click="runCase(scope.row)"
            >测试</el-button>
            <el-button
              type="text"
              icon="Edit"
              class="table-button"
              size="small"
              @click="editCase(scope.row)"
            >编辑</el-button>
            <el-button type="text" size="small" icon="Delete" @click="onDelCase(scope.row)">删除</el-button>
          </template>
        </el-table-column>
      </el-table>
      <div class="gva-pagination">
        <el-pagination
          layout="total, sizes, prev, pager, next, jumper"
          :current-page="page"
          :page-size="pageSize"
          :page-sizes="[10, 30, 50, 100]"
          :total="total"
          @current-change="handleCurrentChange"
          @size-change="handleSizeChange"
        />
      </div>
    </div>
    <el-dialog
      v-model="dialogCaseFormVisible"
      :before-close="closeCaseDialog"
      :title="caseTitle"
      fullscreen
      center
    >
      <el-form
        :model="caseFormData"
        :rules="caseFormRules"
        label-position="right"
        label-width="120px"
        style="width: 80%; margin-left: 10%; margin-right: 10%"
      >
        <el-form-item label="用例名称:" prop="name">
          <el-input v-model="caseFormData.name" clearable placeholder="请输入用例名称" />
        </el-form-item>
        <el-form-item label="所属项目:" prop="project">
          <el-input v-model="caseFormData.project" clearable placeholder="请输入接口所属项目" />
        </el-form-item>
        <el-form-item label="所属服务:" prop="server">
          <el-input v-model="caseFormData.server" clearable placeholder="请输入接口所属服务" />
        </el-form-item>
        <el-form-item label="全局配置:" prop="config">
          <el-select
            v-model="caseFormData.configId"
            placeholder="请选择全局配置文件"
            style="width: 100%"
          >
            <el-option
              v-for="item in configOption"
              :key="item.id"
              :label="item.name"
              :value="item.id"
            />
          </el-select>
        </el-form-item>

        <el-form-item label="测试步骤:">
          <el-table border style="width: 100%" :data="stepTableData" size="small" fit>
            <el-table-column prop="index" label="步骤" width="55" align="center" />
            <el-table-column prop="name" label="接口名称" width="180" />
            <el-table-column prop="url" label="请求地址">
              <template #default="scope">{{ scope.row.request.url }}</template>
            </el-table-column>
            <el-table-column align="center" label="操作" width="180">
              <template #default="scope">
                <el-button size="small" @click="editStep(scope.$index, scope.row)">编辑</el-button>
                <el-button type="danger" size="small" @click="onDelStep(scope.$index, scope.row)">删除</el-button>
              </template>
            </el-table-column>
          </el-table>
        </el-form-item>
      </el-form>
      <template #footer>
        <span class="dialog-footer">
          <el-button type="primary" icon="Plus" @click="openStepDialog">新增测试步骤</el-button>
          <el-button type="primary" @click="saveCase('caseFormData')">保 存</el-button>
          <el-button type="default" @click="closeCaseDialog">取 消</el-button>
        </span>
      </template>
    </el-dialog>
    <el-dialog
      v-model="dialogStepFormVisible"
      :before-close="closeStepDialog"
      :title="stepTitle"
      width="60%"
    >
      <el-form ref="stepForm" :model="stepFormData" :rules="stepFormRules">
        <el-form-item label="接口名称:">
          <el-input v-model="stepFormData.name" clearable placeholder="请输入接口名称" />
        </el-form-item>
        <el-form-item label="接口协议:">
          <el-select
            v-model="stepFormData.protocol"
            placeholder="请选择接口请求协议"
            style="width: 100%"
            @change="handleSelectProtocol"
          >
            <el-option
              v-for="item in initStepData.protocol"
              :key="item.value"
              :label="item.label"
              :value="item.value"
            />
          </el-select>
        </el-form-item>
        <el-form-item v-if="isShow" label="请求地址:">
          <el-input v-model="stepFormData.url" placeholder="请输入请求URL" class="input-with-select">
            <template v-if="isHttp" #prepend>
              <el-select
                v-model="stepFormData.method"
                placeholder="请选择接口请求方法"
                style="width: 110px"
                @change="handleMethod"
              >
                <el-option
                  v-for="item in initStepData.method"
                  :key="item.value"
                  :label="item.label"
                  :value="item.value"
                />
              </el-select>
            </template>
            <template #append>
              <el-button-group>
                <el-button type="primary" @click="debug">发送请求</el-button>
              </el-button-group>
            </template>
          </el-input>
        </el-form-item>
        <el-form-item v-if="isHttp" label="请求参数:">
          <el-tabs v-model="activeStepName" style="width: 100%;">
            <el-tab-pane label="Params" name="params">
              <div v-for="(item, index) in dynamicForm.params" :key="index">
                <el-row :gutter="10">
                  <el-col :span="8">
                    <el-input v-model="item.key" placeholder="请输入请求参数名称" />
                  </el-col>
                  <el-col :span="4">
                    <el-select v-model="item.type" placeholder="类型" style="width: 100%" @change="handleSelectParamsType($event,index)">
                      <el-option
                        v-for="items in initStepData.type"
                        :key="items.value"
                        :label="items.label"
                        :value="items.value"
                      />
                    </el-select>
                  </el-col>
                  <el-col :span="8">
                    <el-input v-model="item.value" placeholder="请输入请求参数值" />
                  </el-col>
                  <el-col :span="4">
                    <el-button @click.prevent="removeItem('params', item)">删除</el-button>
                  </el-col>
                </el-row>
              </div>
              <el-button @click="addItem('params')">添加参数</el-button>
            </el-tab-pane>
            <el-tab-pane label="Headers" name="headers">
              <div v-for="(item, index) in dynamicForm.header" :key="index">
                <el-row :gutter="20">
                  <el-col :span="10">
                    <el-input v-model="item.key" placeholder="请输入请求Header名称" />
                  </el-col>
                  <el-col :span="10">
                    <el-input v-model="item.value" placeholder="请输入请求Header值" />
                  </el-col>
                  <el-col :span="4">
                    <el-button @click.prevent="removeItem('header', item)">删除</el-button>
                  </el-col>
                </el-row>
              </div>
              <el-button @click="addItem('header')">添加Header</el-button>
            </el-tab-pane>
            <el-tab-pane label="Body" name="body">
              <vue3-json-editor
                v-model="dynamicForm.body"
                mode="text"
                lang="zh"
                :show-btns="false"
                :expanded-on-start="false"
                @json-change="getBodyValue"
              />
            </el-tab-pane>
            <el-tab-pane label="Variables" name="variables">
              <div v-for="(item, index) in dynamicForm.variables" :key="index">
                <el-row :gutter="10">
                  <el-col :span="8">
                    <el-input v-model="item.key" placeholder="请输入Variables名称" />
                  </el-col>
                  <el-col :span="4">
                    <el-select v-model="item.type" placeholder="类型" style="width: 100%" @change="handleSelectVarType($event,index)">
                      <el-option
                        v-for="items in initStepData.type"
                        :key="items.value"
                        :label="items.label"
                        :value="items.value"
                      />
                    </el-select>
                  </el-col>
                  <el-col :span="8">
                    <el-input v-model="item.value" placeholder="请输入Variables值" />
                  </el-col>
                  <el-col :span="4">
                    <el-button @click.prevent="removeItem('variable', item)">删除</el-button>
                  </el-col>
                </el-row>
              </div>
              <el-button @click="addItem('variable')">添加Variable</el-button>
            </el-tab-pane>
            <el-tab-pane label="Extract" name="extract">
              <div v-for="(item, index) in dynamicForm.extract" :key="index">
                <el-row :gutter="20">
                  <el-col :span="10">
                    <el-input v-model="item.key" placeholder="请输入Extract名称" />
                  </el-col>
                  <el-col :span="10">
                    <el-input v-model="item.value" placeholder="请输入Extract值" />
                  </el-col>
                  <el-col :span="4">
                    <el-button @click.prevent="removeItem('extract', item)">删除</el-button>
                  </el-col>
                </el-row>
              </div>
              <el-button @click="addItem('extract')">添加Extract</el-button>
            </el-tab-pane>
            <el-tab-pane label="Validate" name="validate">
              <div v-for="(item, index) in dynamicForm.validate" :key="index">
                <el-row :gutter="10">
                  <el-col :span="6">
                    <el-input v-model="item.check" placeholder="请输入check" />
                  </el-col>
                  <el-col :span="4">
                    <el-select v-model="item.assert" placeholder="断言类型" style="width: 100%">
                      <el-option
                        v-for="rule in rules"
                        :key="rule.value"
                        :label="rule.label"
                        :value="rule.value"
                      />
                    </el-select>
                  </el-col>
                  <el-col :span="4">
                    <el-select v-model="item.type" placeholder="类型" style="width: 100%" @change="handleSelectType($event,index)">
                      <el-option
                        v-for="items in initStepData.type"
                        :key="items.value"
                        :label="items.label"
                        :value="items.value"
                      />
                    </el-select>
                  </el-col>
                  <el-col :span="6">
                    <el-input v-model="item.expect" placeholder="expect" />
                  </el-col>
                  <el-col :span="4">
                    <el-button @click.prevent="removeItem('validate', item)">删除</el-button>
                  </el-col>
                </el-row>
              </div>
              <el-button @click="addItem('validate')">添加Validate</el-button>
            </el-tab-pane>
          </el-tabs>
        </el-form-item>
        <el-form-item v-if="isTcp" label="请求数据:">
          <el-input v-model="stepFormData.content" clearable placeholder="请输入请求数据" />
        </el-form-item>
        <el-form-item v-if="isRpc" label="RPC文件:">
          <el-upload
            :action="`${path}/fileUploadAndDownload/upload`"
            :headers="{ 'x-token': token }"
            :show-file-list="false"
            :on-success="uploadSuccess"
            :on-error="onloadError"
            class="upload-btn"
          >
            <el-button type="primary">上传protoset文件</el-button>
          </el-upload>
        </el-form-item>
        <el-form-item v-if="isRpc" label="RPC服务:">
          <el-select
            v-model="stepFormData.rpcService"
            placeholder="请选择接口服务名,比如:zeus.UserGroupV1"
            style="width: 100%"
            @change="handleSelectRpcService"
          >
            <el-option
              v-for="item in initData.grpcService"
              :key="item"
              :label="item"
              :value="item"
            />
          </el-select>
        </el-form-item>
        <el-form-item v-if="isRpc" label="RPC方法:">
          <el-select
            v-model="stepFormData.rpcMethod"
            placeholder="请选择方法名,比如:CountUserGroupsWithFilterFilter"
            style="width: 100%"
            @change="handleSelectRpcMethod"
          >
            <el-option v-for="item in initData.grpcMethod" :key="item" :label="item" :value="item" />
          </el-select>
        </el-form-item>
        <el-form-item v-if="isRpc" label="请求参数:">
          <el-tabs v-model="activeNameRpc" style="width: 100%;" @tab-click="handleClick">
            <el-tab-pane label="Metadata" name="second">
              <div v-for="(metadata, index) in dynamicForm.metadata" :key="index">
                <el-row :gutter="20">
                  <el-col :span="10">
                    <el-input v-model="metadata.key" placeholder="请输入请求Metadata名称" />
                  </el-col>
                  <el-col :span="10">
                    <el-input v-model="metadata.value" placeholder="请输入请求Metadata值" />
                  </el-col>
                  <el-col :span="4">
                    <el-button @click.prevent="removeMetadata(metadata)">删除</el-button>
                  </el-col>
                </el-row>
              </div>
              <el-button @click="addMetadata">添加Metadata</el-button>
            </el-tab-pane>
            <el-tab-pane label="Data" name="first">
              <vue3-json-editor
                v-model="stepFormData.body"
                mode="text"
                lang="zh"
                :show-btns="false"
                :expanded-on-start="false"
                @json-change="getBodyValue"
              />
            </el-tab-pane>
          </el-tabs>
        </el-form-item>
        <!-- <el-form-item v-if="isHttp" label="结果验证:">
          <div v-for="(result, index) in dynamicForm.result" :key="index">
            <el-row :gutter="20">
              <el-col :span="8">
                <el-input v-model="result.key" placeholder="请输入response" />
              </el-col>
              <el-col :span="4">
                <el-select
                  v-model="result.rule"
                  placeholder="请选择"
                  style="width: 100%"
                >
                  <el-option
                    v-for="item in rules"
                    :key="item.value"
                    :label="item.label"
                    :value="item.value"
                  />
                </el-select>
              </el-col>
              <el-col :span="8">
                <el-input
                  v-model="result.value"
                  placeholder="请输入请求response值"
                />
              </el-col>
              <el-col :span="4">
                <el-button size="small" @click.prevent="removeResult(result)">
                  删除
                </el-button>
              </el-col>
            </el-row>
          </div>
          <el-button size="small" @click="addResult"> 添加rule </el-button>
        </el-form-item>-->
        <!-- <el-form-item v-if="hasResponse" label="Response:">
          <json-viewer :value="response" boxed sort />
        </el-form-item>-->
      </el-form>
      <template #footer>
        <div class="dialog-footer">
          <el-button @click="closeStepDialog">取 消</el-button>
          <el-button type="primary" @click="saveStep">确 定</el-button>
        </div>
      </template>
    </el-dialog>
  </div>
</template>
<script setup>
import { ref } from 'vue'
import { Vue3JsonEditor } from 'vue3-json-editor'
import { createTestcase, updateTestcase, deleteTestCase, getTestCaseList, getTestCase, runTestCase, debugTestCase } from '@/api/testcase'
import { getAllConfig } from '@/api/config'
import { formatDate, Arr2Obj, Obj2Arr, Obj2ArrType } from '@/utils/format'
import assertion from './assertions'
import { ElMessage, ElMessageBox } from 'element-plus'
// 查询
const page = ref(1)
const total = ref(0)
const pageSize = ref(10)
const tableData = ref([])
const searchInfo = ref({})

function onSubmit() {
  page.value = 1
  pageSize.value = 10
  getTableData()
}

async function getTableData() {
  const table = await getTestCaseList({ page: page.value, pageSize: pageSize.value, ...searchInfo.value })
  if (table.code === 0) {
    tableData.value = table.data.list
    total.value = table.data.total
    page.value = table.data.page
    pageSize.value = table.data.pageSize
  }
}
getTableData()

// 重置
function onReset(params) {
  searchInfo.value = {}
}

// 批量操作
const multipleSelection = ref([])
function handleSelectionChange(val) {
  multipleSelection.value = val
}

// 分页
function handleCurrentChange(val) {
  page.value = val
  getTableData()
}

function handleSizeChange(val) {
  pageSize.value = val
  getTableData()
}

// case
const caseType = ref('create')
const caseFormRules = ref({})
const deleteVisible = ref(false)
const dialogCaseFormVisible = ref(false)
const caseTitle = ref('新增测试用例')
const caseFormData = ref({
  name: '',
  project: '',
  server: '',
  configId: '',
  teststeps: [],
  result: '',
})
const stepTableData = ref([])

function initCaseForm() {
  caseFormData.value = {
    name: '',
    project: '',
    server: '',
    configId: '',
    teststeps: [],
    result: '',
  }
  stepTableData.value = []
}

function openCaseDialog(key) {
  switch (key) {
    case 'create':
      caseTitle.value = '新增测试用例'
      initCaseForm()
      break
    case 'update':
      caseTitle.value = '编辑测试用例'
      break
    default:
      break
  }
  caseType.value = key
  dialogCaseFormVisible.value = true
}

function closeCaseDialog() {
  initCaseForm()
  dialogCaseFormVisible.value = false
}

function formatResult(result) {
  if (result === 1) {
    return '成功'
  } else if (result === 2) {
    return '失败'
  } else {
    return ''
  }
}

const configOption = ref([])
async function getConfig() {
  const res = await getAllConfig()
  if (res.code === 0) {
    configOption.value = res.data.list
  }
}
getConfig()

async function saveCase() {
  caseFormData.value.teststeps = stepTableData.value
  switch (caseType.value) {
    case 'create':
    {
      const res = await createTestcase(caseFormData.value)
      if (res.code === 0) {
        ElMessage({
          type: 'success',
          message: '创建成功'
        })
      }
      break
    }
    case 'update':
    {
      const res = await updateTestcase(caseFormData.value)
      if (res.code === 0) {
        ElMessage({
          type: 'success',
          message: '更新成功'
        })
      }
      break
    }
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
  closeCaseDialog()
  getTableData()
}

function onDelCase(row) {
  ElMessageBox.confirm('确定要删除吗?', '提示', {
    confirmButtonText: '确定',
    cancelButtonText: '取消',
    type: 'warning'
  }).then(async() => {
    const res = await deleteTestCase({ ID: row.ID })
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
async function editCase(row) {
  const res = await getTestCase({ ID: row.ID })
  if (res.code === 0) {
    caseFormData.value = res.data.testcase
    stepTableData.value = res.data.testcase.teststeps
  }
  openCaseDialog('update')
}

async function runCase(row) {
  const res = await runTestCase({ ID: row.ID })
  if (res.code === 0) {
    ElMessage({
      type: 'success',
      message: '测试成功'
    })
  }
}

// step
const stepForm = ref(null)
const stepType = ref('create')
const stepFormRules = ref({})
const activeStepName = ref('params')
const dialogStepFormVisible = ref(false)
const stepTitle = ref('新增测试步骤')
const rules = assertion
const stepFormData = ref({
  name: '',
  url: '',
  method: 'GET',
  protocol: 'http',
})

const isShow = ref(true)
const isHttp = ref(true)
const isTcp = ref(false)
const isRpc = ref(false)
const initStepData = ref({
  protocol: [
    { value: 'http', label: 'HTTP(S)' },
    { value: 'tcp', label: 'TCP' },
    { value: 'udp', label: 'UDP' },
    { value: 'grpc', label: 'GRPC' }
  ],
  method: [
    { value: 'GET', label: 'GET' },
    { value: 'POST', label: 'POST' },
    { value: 'PUT', label: 'PUT' },
    { value: 'DELETE', label: 'DELETE' },
  ],
  type: [
    { value: 'string', label: '字符串' },
    { value: 'int', label: '整型' },
    { value: 'float', label: '浮点数' },
  ]
})
const dynamicForm = ref({
  params: [],
  header: [],
  body: {},
  variables: [],
  extract: [],
  validate: []
})
const paramsIndex = ref(1)
const headerIndex = ref(1)
const variableIndex = ref(1)
const extractIndex = ref(1)
const validateIndex = ref(1)
const stepIndex = ref(1)
const editStepIndex = ref(0)

function addItem(key) {
  switch (key) {
    case 'params':
      dynamicForm.value.params.push({ index: paramsIndex.value + 1, key: '', value: '' })
      paramsIndex.value++
      break
    case 'header':
      dynamicForm.value.header.push({ index: headerIndex.value + 1, key: '', value: '' })
      headerIndex.value++
      break
    case 'variable':
      dynamicForm.value.variables.push({ index: variableIndex.value + 1, key: '', value: '' })
      variableIndex.value++
      break
    case 'extract':
      dynamicForm.value.extract.push({ index: extractIndex.value + 1, key: '', value: '' })
      extractIndex.value++
      break
    case 'validate':
      dynamicForm.value.validate.push({ index: validateIndex.value + 1, check: '', assert: 'eq', expect: '', type: 'string' })
      validateIndex.value++
      break
    default:
      break
  }
}

function removeItem(key, item) {
  switch (key) {
    case 'params':
      dynamicForm.value.params.splice(dynamicForm.value.params.indexOf(item), 1)
      break
    case 'header':
      dynamicForm.value.header.splice(dynamicForm.value.header.indexOf(item), 1)
      break
    case 'variable':
      dynamicForm.value.variables.splice(dynamicForm.value.variables.indexOf(item), 1)
      break
    case 'extract':
      dynamicForm.value.extract.splice(dynamicForm.value.extract.indexOf(item), 1)
      break
    case 'validate':
      dynamicForm.value.validate.splice(dynamicForm.value.validate.indexOf(item), 1)
      break
    default:
      break
  }
}

function initStepForm() {
  stepFormData.value = {
    name: '',
    url: '',
    method: 'GET',
    protocol: 'http',
  }
  dynamicForm.value = {
    params: [],
    header: [],
    body: {},
    variables: [],
    extract: [],
    validate: []
  }
  activeStepName.value = 'params'
}

function openStepDialog() {
  dialogStepFormVisible.value = true
  initStepForm()
}

function closeStepDialog() {
  dialogStepFormVisible.value = false
  initStepForm()
}

const request = ref({
  protocol: '',
  method: '',
  url: '',
  headers: '',
  params: '',
})

function saveStep() {
  const step = ref({
    name: '',
    request: {},
    variables: {},
    extract: {},
  })
  step.value.name = stepFormData.value.name
  request.value.protocol = stepFormData.value.protocol
  request.value.method = stepFormData.value.method
  request.value.url = stepFormData.value.url
  request.value.headers = Arr2Obj(dynamicForm.value.header)
  request.value.params = Arr2Obj(dynamicForm.value.params)
  step.value.request = request.value
  step.value.variables = Arr2Obj(dynamicForm.value.variables)
  step.value.extract = Arr2Obj(dynamicForm.value.extract)
  step.value.validate = dynamicForm.value.validate

  if (stepType.value === 'create') {
    stepIndex.value = stepTableData.value.length + 1
    step.value.index = stepIndex.value
    stepTableData.value.push(step.value)
    stepIndex.value++
  }

  if (stepType.value === 'edit') {
    step.value.index = stepIndex.value
    stepTableData.value[editStepIndex.value] = step.value
  }

  dialogStepFormVisible.value = false
}

function editStep(index, row) {
  dialogStepFormVisible.value = true
  stepType.value = 'edit'
  stepTitle.value = '编辑测试步骤'
  editStepIndex.value = index
  stepIndex.value = row.index
  stepFormData.value.name = row.name
  stepFormData.value.url = row.request.url
  stepFormData.value.protocol = row.request.protocol
  stepFormData.value.method = row.request.method

  if ('headers' in row.request && row.request.headers !== null) {
    dynamicForm.value.header = Obj2Arr(row.request.headers)
  }

  if ('params' in row.request && row.request.params !== null) {
    dynamicForm.value.params = Obj2ArrType(row.request.params)
  }

  if ('body' in row.request && row.request.body !== null) {
    dynamicForm.value.body = row.request.body
  }

  if ('variables' in row && row.variables !== null) {
    dynamicForm.value.variables = Obj2ArrType(row.variables)
  }

  if ('extract' in row && row.extract !== null) {
    dynamicForm.value.extract = Obj2Arr(row.extract)
  }

  if ('validate' in row && row.validate !== null) {
    dynamicForm.value.validate = row.validate
  }
}

function onDelStep(index, row) {
  stepTableData.value.splice(index, 1)
}

// variables、validate、key的value的类型
function handleSelectType(key, index) {
  switch (key) {
    case 'int':
      dynamicForm.value.validate[index].expect = parseInt(dynamicForm.value.validate[index].expect)
      break
    case 'float':
      dynamicForm.value.validate[index].expect = parseFloat(dynamicForm.value.validate[index].expect)
      break
    case 'string':
      dynamicForm.value.validate[index].expect = String(dynamicForm.value.validate[index].expect)
      break
    default:
      dynamicForm.value.validate[index].expect = String(dynamicForm.value.validate[index].expect)
      break
  }
}

function handleSelectVarType(key, index) {
  switch (key) {
    case 'int':
      dynamicForm.value.variables[index].value = parseInt(dynamicForm.value.variables[index].value)
      break
    case 'float':
      dynamicForm.value.variables[index].value = parseFloat(dynamicForm.value.variables[index].value)
      break
    case 'string':
      dynamicForm.value.variables[index].value = String(dynamicForm.value.variables[index].value)
      break
    default:
      dynamicForm.value.variables[index].value = String(dynamicForm.value.variables[index].value)
      break
  }
}

function handleSelectParamsType(key, index) {
  switch (key) {
    case 'int':
      dynamicForm.value.params[index].value = parseInt(dynamicForm.value.params[index].value)
      break
    case 'float':
      dynamicForm.value.params[index].value = parseFloat(dynamicForm.value.params[index].value)
      break
    case 'string':
      dynamicForm.value.params[index].value = String(dynamicForm.value.params[index].value)
      break
    default:
      dynamicForm.value.params[index].value = String(dynamicForm.value.params[index].value)
      break
  }
}

function handleSelectProtocol(key) {
  switch (key) {
    case 'http':
      isHttp.value = true
      isRpc.value = false
      isTcp.value = false
      break
    case 'udp':
      isHttp.value = false
      isRpc.value = false
      isTcp.value = true
      isShow.value = true
      break
    case 'tcp':
      isHttp.value = false
      isRpc.value = false
      isTcp.value = true
      isShow.value = true
      break
    case 'grpc':
      isHttp.value = false
      isRpc.value = true
      isTcp.value = false
      isShow.value = true
      break
    default:
      break
  }
}

function handleMethod(val) { }

// todo debug
async function debug(row) {
  const res = await debugTestCase({ ID: row.ID })
  if (res.code === 0) {
    ElMessage({
      type: 'success',
      message: '测试成功'
    })
  }
}

function getBodyValue(val) {
  stepFormData.value.body = val
}

</script>
<style scoped>
/* .dialog-footer {
  padding: 12px 20px 12px 20px;
  border-top: 1px solid #E4E4E4;
} */
</style>
