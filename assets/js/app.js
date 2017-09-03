import 'phoenix_html'
import loadView from './views/loader'

function handleDomContentLoaded() {
    const viewName = document.getElementsByTagName('body')[0].dataset.jsViewName

    const View = loadView(viewName)
    const view = new View()
    view.mount()

    window.currentView = view
}

function handleDocumentUnload() {
    window.currentView.unmount()
}

window.addEventListener('DOMContentLoaded', handleDomContentLoaded, false)
window.addEventListener('unload', handleDocumentUnload, false)
