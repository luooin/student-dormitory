import Vue from 'vue'
import VueRouter from 'vue-router'
import Home from '../views/Home.vue'
// 使用 VueRouter 作为路由管理器。
Vue.use(VueRouter)
// 包含多个路由对象
//  `path`: 路由的路径。
//  `name`: 路由的名称。
//  `component`: 与该路由关联的组件。对于懒加载的组件，使用了动态导入 `() => import('...')`。
//  `redirect`: 重定向的路径（可选）。
//  `children`: 子路由的数组（可选）。
//  `meta`: 一个对象，可以包含关于路由的元数据，如 `title`。
const constantRoutes = [
    {
        path: '/',
        name: 'Home',
        component: Home,
        redirect: '/index',
        children: [
            {
                path: 'index',
                name: 'index',
                component: Home,
                meta: {title: '首 页'}
            }
        ]
    },
    {
        path: '/404',
        component: () => import('../views/error-page/404'),
        meta: {title: '404'}
    },
    {
        path: '/personal/info',
        component: () => import('../views/personal/info'),
        meta: {title: '个人信息'}
    },
    {
        path: '/personal/change_password',
        component: () => import('../views/personal/changePassword'),
        meta: {title: '修改密码'}
    }
]
// 定义了当导航发生时滚动行为。在这里，它总是滚动到页面顶部。
const createRouter = () => new VueRouter({
    scrollBehavior: () => ({y: 0}),
    routes: constantRoutes
})
const router = createRouter()

export function resetRouter() {
    const newRouter = createRouter()
    router.matcher = newRouter.matcher // reset router
}

export default router
