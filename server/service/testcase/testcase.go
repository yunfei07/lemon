package testcase

import (
	"github.com/yunfei07/lemon/server/global"
	"github.com/yunfei07/lemon/server/model/common/request"
	"github.com/yunfei07/lemon/server/model/configurine"
	"github.com/yunfei07/lemon/server/model/testcase"
	searchReq "github.com/yunfei07/lemon/server/model/testcase/request"
	"gorm.io/gorm"
	"gorm.io/gorm/clause"
)

type TestcaseService struct {
}

func (testcaseService *TestcaseService) CreateTestCase(testcase testcase.TestCase) (err error){
	err = global.GVA_DB.Omit("Config").Create(&testcase).Error
	return err
}

func (testcaseService *TestcaseService) DeleteTestCase(testcase testcase.TestCase) (err error){
	err = global.GVA_DB.Where("id = ?",testcase.ID).Preload("TestSteps",func(db *gorm.DB) *gorm.DB {return db.Order("test_steps.index")}).Find(&testcase).Error
	for _,v := range testcase.TestSteps {
		err = global.GVA_DB.Where("step_id = ?",v.StepId).Delete(&testcase.TestSteps).Error
	}
	// 删除时，删除关联记录
	err = global.GVA_DB.Select(clause.Associations).Delete(&testcase).Error
	return err
}

func (testcaseService *TestcaseService) DeleteTestCaseByIds(ids request.IdsReq) (err error){
	err = global.GVA_DB.Delete(&[]testcase.TestCase{},"id in ?",ids.Ids).Error
	return err
}

func (testcaseService *TestcaseService) DeleteTestStep(teststep testcase.TestStep) (err error){
	err = global.GVA_DB.Delete(&teststep).Error
	return err
}

func (testcaseService *TestcaseService) DeleteTestStepByIds(ids request.IdsReq) (err error) {
	err = global.GVA_DB.Delete(&[]testcase.TestStep{},"id in ?",ids.Ids).Error
	return err
}

func (testcaseService *TestcaseService) UpdateTestCase(testcase testcase.TestCase) (err error){
	//err = global.GVA_DB.Save(&testcase).Error
	//err = global.GVA_DB.Model(&testcase).Updates(map[string]interface{}{"name":testcase.Name,
	//	"project":testcase.Project,"server":testcase.Server}).Error

	//err = global.GVA_DB.Model(&testcase).Omit("TestSteps").Updates(map[string]interface{}{"name":testcase.Name,
	//	"project":testcase.Project,"server":testcase.Server}).Error

	//for _,v := range testcase.TestSteps {
	//	err = global.GVA_DB.Model(&testcase.TestSteps).Where("id = ?",v.StepId).Save(&testcase.TestSteps).Error
	//}



	err = global.GVA_DB.Session(&gorm.Session{FullSaveAssociations: true}).Updates(&testcase).Error
	err = global.GVA_DB.Model(&testcase).Association("TestSteps").Replace(&testcase.TestSteps)
	return err
}

func (testcaseService *TestcaseService) UpdateTestStep(teststep testcase.TestStep) (err error){
	err = global.GVA_DB.Save(&teststep).Error
	return err
}

func (testcaseService *TestcaseService) GetTestCase(id uint) (err error,testcase testcase.TestCase){
	err = global.GVA_DB.Where("id = ?",id).Preload("TestSteps",func(db *gorm.DB) *gorm.DB {return db.Order("test_steps.index")}).Find(&testcase).Error
	return
}

func (testcaseService *TestcaseService) GetTestCaseByName(name string) (err error,testcase testcase.TestCase){
	err =  global.GVA_DB.Where("name = ?",name).First(&testcase).Error
	return
}

func (testcaseService *TestcaseService) GetTestCaseInfoList(info searchReq.TestCaseSearch)(err error,list interface{},total int64){
	limit := info.PageSize
	offset := info.PageSize * (info.Page - 1)
	// 创建db
	db := global.GVA_DB.Model(&testcase.TestCase{})
	var testcases []testcase.TestCase
	// 如果有条件搜索 下方会自动创建搜索语句
	if info.Name != "" {
		db = db.Where("`name` = ?",info.Name)
	}
	err = db.Count(&total).Error
	if err!=nil {
		return
	}
	err = db.Limit(limit).Offset(offset).Find(&testcases).Error
	return err, testcases, total
}

func (testcaseService *TestcaseService) RunTestCase(testcase testcase.TestCase)(err error,result interface{}){
	var config configurine.Config
	tc := make(map[string]interface{})
	steps := testcase.TestSteps
	configId := testcase.ConfigId
	err = global.GVA_DB.Where("id = ?",configId).First(&config).Error
	tc["config"] = config
	tc["teststeps"] = steps
	return err,tc
}

func(testcaseService *TestcaseService) UpdateTestResult(testcase testcase.TestCase,result bool){
	status := 2
	if result {
		status = 1
	}
	global.GVA_DB.Model(&testcase).Where("id = ?",testcase.ID).Update("result",status)
}