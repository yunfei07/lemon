/**
 * 网站配置文件
 */

const config = {
  appName: "Lemon 测试平台",
  appLogo: "src/assets/logo.png",
  appBrand: "src/assets/login_right.png",
  appDesc: "LEMON 一站式测试方案解决平台",
  showViteLogo: true,
};

export const viteLogo = (env) => {
  if (config.showViteLogo) {
    const chalk = require('chalk')
    console.log(
      chalk.green(
        `> 默认前端文件运行地址:http://127.0.0.1:${env.VITE_CLI_PORT}`
      )
    )
  }
}

export default config
