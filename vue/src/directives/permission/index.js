import hasPermi from "./hasPermi";
// Vue 插件，该插件用于注册一个名为 hasPermi 的自定义指令。
// 这个自定义指令可能在之前的代码段中被定义，它用于处理权限相关的 DOM 操作，例如根据用户权限来决定是否显示某个元素。
const install = function (Vue) {
    Vue.directive('hasPermi', hasPermi)
}

if (window.Vue) {
    window['hasPermi'] = hasPermi
    Vue.use(install); // eslint-disable-line
}

export default install
