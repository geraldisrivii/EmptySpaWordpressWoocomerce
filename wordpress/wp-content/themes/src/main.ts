import { createApp } from 'vue'
import App from './App.vue'
import router from './router/router'
import store from './store'

import VueCookies from 'vue-cookies'

let app = createApp(App)

app.use(VueCookies)

app.use(router).use(store).mount('#app')
