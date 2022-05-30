module github.com/yunfei07/lemon/server

go 1.16

require (
	github.com/alecthomas/template v0.0.0-20190718012654-fb15b899a751
	github.com/casbin/casbin/v2 v2.11.0
	github.com/casbin/gorm-adapter/v3 v3.0.2
	github.com/flipped-aurora/gva-plugins v0.0.0-20210828060501-fc8b729b9a4a
	github.com/flipped-aurora/ws v1.0.2
	github.com/fsnotify/fsnotify v1.4.9
	github.com/fvbock/endless v0.0.0-20170109170031-447134032cb6
	github.com/gin-gonic/gin v1.7.7
	github.com/go-redis/redis/v8 v8.11.0
	github.com/go-sql-driver/mysql v1.6.0
	github.com/golang-jwt/jwt/v4 v4.3.0
	github.com/gookit/color v1.3.1
	github.com/hashicorp/go-hclog v1.2.0 // indirect
	github.com/hashicorp/yamux v0.0.0-20211028200310-0bc27b27de87 // indirect
	github.com/httprunner/httprunner/v4 v4.1.0
	github.com/jackc/pgx/v4 v4.15.0 // indirect
	github.com/jinzhu/copier v0.3.5 // indirect
	github.com/jordan-wright/email v0.0.0-20200824153738-3f5bafa1cd84
	github.com/mattn/go-colorable v0.1.12 // indirect
	github.com/mitchellh/go-testing-interface v1.14.1 // indirect
	github.com/mojocn/base64Captcha v1.3.1
	github.com/natefinch/lumberjack v2.0.0+incompatible
	github.com/oklog/run v1.1.0 // indirect
	github.com/pkg/errors v0.9.1
	github.com/prometheus/client_golang v1.12.1 // indirect
	github.com/robfig/cron/v3 v3.0.1
	github.com/satori/go.uuid v1.2.0
	github.com/shirou/gopsutil v3.21.9+incompatible
	github.com/songzhibin97/gkit v1.1.1
	github.com/spf13/viper v1.8.1
	github.com/stretchr/testify v1.7.1
	github.com/swaggo/gin-swagger v1.3.0
	github.com/swaggo/swag v1.7.0
	github.com/tklauser/go-sysconf v0.3.9 // indirect
	github.com/unrolled/secure v1.0.7
	go.uber.org/zap v1.17.0
	golang.org/x/crypto v0.0.0-20220213190939-1e6e3497d506 // indirect
	golang.org/x/sync v0.0.0-20210220032951-036812b2e83c
	golang.org/x/sys v0.0.0-20220318055525-2edf467146b5 // indirect
	google.golang.org/genproto v0.0.0-20220317150908-0efb43f6373e // indirect
	gopkg.in/natefinch/lumberjack.v2 v2.0.0 // indirect
	gorm.io/datatypes v1.0.5
	gorm.io/driver/mysql v1.2.2
	gorm.io/driver/postgres v1.2.3
	gorm.io/driver/sqlite v1.2.6 // indirect
	gorm.io/gorm v1.22.5
	nhooyr.io/websocket v1.8.6
)

replace github.com/httprunner/httprunner/v4 => github.com/yunfei07/httprunner/v4 v4.0.0-yf-beta.1
