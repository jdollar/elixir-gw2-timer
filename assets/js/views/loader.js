import MainView from './main'
import WorldbossIndexView from './worldBoss/index'

const views = {
    WorldbossIndexView
}

export default function loadView(viewName) {
    return views[viewName] || MainView
}
