<template>
  <div class="login">
    <div class="login-item">
      <div class="login-item-img">
        <img src="../../assets/login_background.svg" />
      </div>
    </div>
    <div class="login-item login-right-item">
      <div class="login-form">
        <div class="login-form-top">
          <div class="login-top-logo">
            <img
              class="login_panle_form_title_logo"
              :src="$LEMON.appBrand"
              alt
            />
          </div>
          <div class="login-top-desc">{{ $LEMON.appDesc }}</div>
        </div>
        <div class="login-form-body">
          <el-form
            ref="loginForm"
            :model="loginFormData"
            :rules="rules"
            @keyup.enter="submitForm"
          >
            <el-form-item prop="username">
              <el-input
                v-model="loginFormData.username"
                placeholder="请输入用户名"
              >
                <template #suffix>
                  <span class="input-icon">
                    <el-icon>
                      <user />
                    </el-icon>
                  </span>
                </template>
              </el-input>
            </el-form-item>
            <el-form-item prop="password">
              <el-input
                v-model="loginFormData.password"
                :type="lock === 'lock' ? 'password' : 'text'"
                placeholder="请输入密码"
              >
                <template #suffix>
                  <span class="input-icon">
                    <el-icon>
                      <component :is="lock" @click="changeLock" />
                    </el-icon>
                  </span>
                </template>
              </el-input>
            </el-form-item>
            <el-form-item prop="captcha">
              <div class="vPicBox">
                <el-input
                  v-model="loginFormData.captcha"
                  placeholder="请输入验证码"
                  style="width: 65%"
                />
                <div class="vPic">
                  <img
                    v-if="picPath"
                    :src="picPath"
                    alt="请输入验证码"
                    @click="loginVerify()"
                  />
                </div>
              </div>
            </el-form-item>
            <el-form-item>
              <el-button
                type="primary"
                size="large"
                style="width: 100%"
                @click="submitForm"
                >登 录</el-button
              >
            </el-form-item>
          </el-form>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "Login",
};
</script>

<script setup>
import { captcha } from "@/api/user";
import bottomInfo from "@/view/layout/bottomInfo/bottomInfo.vue";
import { reactive, ref } from "vue";
import { ElMessage } from "element-plus";
import { useRouter } from "vue-router";
import { useUserStore } from "@/pinia/modules/user";
const router = useRouter();
// 验证函数
const checkUsername = (rule, value, callback) => {
  if (value.length < 5) {
    return callback(new Error("请输入正确的用户名"));
  } else {
    callback();
  }
};
const checkPassword = (rule, value, callback) => {
  if (value.length < 6) {
    return callback(new Error("请输入正确的密码"));
  } else {
    callback();
  }
};

// 获取验证码
const loginVerify = () => {
  captcha({}).then((ele) => {
    rules.captcha[1].max = ele.data.captchaLength;
    rules.captcha[1].min = ele.data.captchaLength;
    picPath.value = ele.data.picPath;
    loginFormData.captchaId = ele.data.captchaId;
  });
};
loginVerify();

// 登录相关操作
const lock = ref("lock");
const changeLock = () => {
  lock.value = lock.value === "lock" ? "unlock" : "lock";
};

const loginForm = ref(null);
const picPath = ref("");
const loginFormData = reactive({
  username: "admin",
  password: "123456",
  captcha: "",
  captchaId: "",
});
const rules = reactive({
  username: [{ validator: checkUsername, trigger: "blur" }],
  password: [{ validator: checkPassword, trigger: "blur" }],
  captcha: [
    { required: true, message: "请输入验证码", trigger: "blur" },
    {
      message: "验证码格式不正确",
      trigger: "blur",
    },
  ],
});

const userStore = useUserStore();
const login = async () => {
  return await userStore.LoginIn(loginFormData);
};
const submitForm = () => {
  loginForm.value.validate(async (v) => {
    if (v) {
      const flag = await login();
      if (!flag) {
        loginVerify();
      }
    } else {
      ElMessage({
        type: "error",
        message: "请正确填写登录信息",
        showClose: true,
      });
      loginVerify();
      return false;
    }
  });
};
</script>

<style lang="scss">
.login {
  box-sizing: border-box;
  display: flex;
  flex-flow: row wrap;
  width: 100%;
  height: 100vh;
  justify-content: center;
}

.login-item {
  flex-basis: 50%;
  flex-grow: 0;
  max-width: 50%;
  background: #2d8cf0;
}

.login-right-item {
  background: #fff;
  box-sizing: border-box;
  flex-flow: row wrap;
  width: 100%;
  display: flex;
  justify-content: center;
  align-items: center;
}

.login-form {
  flex-basis: 45%;
  flex-grow: 0;
  max-width: 45%;
}

.login-form-top {
  text-align: center;
  margin: 40px 0;
}

.login-top-logo {
  text-align: center;
}

.login-top-desc {
  font-size: 14px;
  color: #808695;
}
.login-item-img {
  display: flex;
  align-items: center;
  justify-content: center;
  height: 100%;
}
.login-item-img img {
  width: 70%;
  display: inline-block;
  margin: 0 auto;
}
.vPicBox {
  display: flex;
  justify-content: space-between;
  width: 100%;
}
.vPic {
  width: 33%;
  //   height: 38px;
  height: 41px;
  border-radius: 3px;
  background: #ccc;
  img {
    width: 100%;
    height: 100%;
    vertical-align: middle;
  }
}
.login-top-logo {
  display: flex;
  align-items: center;
  margin: 30px 0 10px 0;

  .login_panle_form_title_logo {
    width: 100%;
    margin: 0 auto;
  }
}
</style>
