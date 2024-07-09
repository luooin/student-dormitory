import store from '@/store'
// Vue.js 的自定义指令，它的作用是检查某些权限是否存在于全局的权限列表中。如果不存在，它将从 DOM 中移除该元素。
export default {
    // 生命周期钩子，当被绑定的元素被插入到父节点时，这个钩子会被调用。
    // el 是指令所绑定的元素，而 binding 是一个对象，包含了一些关于绑定的信息，如 value（指令的值）。
    inserted(el, binding) {
        // 从 Vuex 的 store 中获取一个名为 permission 的状态，这个状态很可能是一个数组，包含了应用中所有的权限。
        let all_permission = store.state.permission
        // 解构赋值从 binding 对象中获取 value。
        let {value} = binding
        // 这是一个双层循环。外层循环遍历指令的值（即用户期望的权限），内层循环遍历所有的权限。
        // 如果在全局权限列表中找到一个与用户期望的权限相匹配的权限，则函数立即返回，不再继续检查其他权限。
        for (let v of value) {
            for (let p of all_permission) {
                if (p === v) {
                    return
                }
            }
        }
        // 如果上述的权限检查没有返回（即用户期望的权限不在全局权限列表中），则执行这行代码。
        // 它检查 el（即被绑定的元素）是否有父节点，如果有，则使用 removeChild 方法从 DOM 中移除该元素。
        el.parentNode && el.parentNode.removeChild(el)
    },
}
