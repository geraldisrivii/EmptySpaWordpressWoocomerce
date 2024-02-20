import { RouteRecordRaw, createRouter, createWebHistory } from 'vue-router'


const routes: Array<RouteRecordRaw> = [
    {
        path: '/',
        component: async () => import('@/views/main.vue'),
        name: 'main',
    },
]

const router = createRouter({
    routes: routes,
    history: createWebHistory(),
    scrollBehavior(to, from, savedPosition) {
        if (to.hash) {
            return {
                el: to.hash,
                behavior: 'smooth',
            }
        }
    }
})

declare var preloaderOpen: () => void;

import deepEqual from 'deep-equal';
import store from '@/store';

router.afterEach((to, from) => {
    if (to.fullPath == from.fullPath && deepEqual(to.params, from.params)) {
        console.log(to.fullPath)
        return
    }
    preloaderOpen();
    window.scrollTo(0, 0)
})

export default router