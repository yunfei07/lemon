package testcase

import "time"

// Summary stores tests summary for current task execution, maybe include one or multiple testcases
type Summary struct {
	Success  bool               `json:"success" yaml:"success"`
	Stat     *stat              `json:"stat" yaml:"stat"`
	Time     *testCaseTime      `json:"time" yaml:"time"`
	Platform *platform          `json:"platform" yaml:"platform"`
	Details  []*testCaseSummary `json:"details" yaml:"details"`
}

type stat struct {
	TestCases testCaseStat `json:"testcases" yaml:"test_cases"`
	TestSteps testStepStat `json:"teststeps" yaml:"test_steps"`
}

type testCaseTime struct {
	StartAt  time.Time `json:"start_at,omitempty" yaml:"start_at,omitempty"`
	Duration float64   `json:"duration,omitempty" yaml:"duration,omitempty"`
}

type platform struct {
	HttprunnerVersion string `json:"httprunner_version" yaml:"httprunner_version"`
	GoVersion         string `json:"go_version" yaml:"go_version"`
	Platform          string `json:"platform" yaml:"platform"`
}

// testCaseSummary stores tests summary for one testcase
type testCaseSummary struct {
	Name    string         `json:"name" yaml:"name"`
	Success bool           `json:"success" yaml:"success"`
	CaseId  string         `json:"case_id,omitempty" yaml:"case_id,omitempty"` // TODO
	Stat    *testStepStat  `json:"stat" yaml:"stat"`
	Time    *testCaseTime  `json:"time" yaml:"time"`
	InOut   *testCaseInOut `json:"in_out" yaml:"in_out"`
	Log     string         `json:"log,omitempty" yaml:"log,omitempty"` // TODO
	Records []*stepData    `json:"records" yaml:"records"`
}

type testCaseStat struct {
	Total   int `json:"total" yaml:"total"`
	Success int `json:"success" yaml:"success"`
	Fail    int `json:"fail" yaml:"fail"`
}

type testStepStat struct {
	Total     int `json:"total" yaml:"total"`
	Successes int `json:"successes" yaml:"successes"`
	Failures  int `json:"failures" yaml:"failures"`
}

type testCaseInOut struct {
	ConfigVars map[string]interface{} `json:"config_vars" yaml:"config_vars"`
	ExportVars map[string]interface{} `json:"export_vars" yaml:"export_vars"`
}

type stepData struct {
	Name        string                 `json:"name" yaml:"name"`                                   // step name
	StepId      int                    `json:"stepId"`                                             // step ID
	StepType    string                 `json:"step_type" yaml:"step_type"`                         // step type, testcase/request/transaction/rendezvous
	Success     bool                   `json:"success" yaml:"success"`                             // step execution result
	Elapsed     int64                  `json:"elapsed_ms" yaml:"elapsed_ms"`                       // step execution time in millisecond(ms)
	Data        interface{}            `json:"data,omitempty" yaml:"data,omitempty"`               // session data or slice of step data
	ContentSize int64                  `json:"content_size" yaml:"content_size"`                   // response body length
	ExportVars  map[string]interface{} `json:"export_vars,omitempty" yaml:"export_vars,omitempty"` // extract variables
	Attachment  string                 `json:"attachment,omitempty" yaml:"attachment,omitempty"`   // step error information
}