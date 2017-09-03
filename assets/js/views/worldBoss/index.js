import MainView from './../main'

class WorldbossIndexView extends MainView {
    mount() {
        super.mount()
        this.setupTableRedirects()
        console.log('world boss index mount')
    }

    setupTableRedirects() {
        let linkTableRows = document.getElementsByClassName('link-table-row')

        Array.prototype.map.call(linkTableRows, (linkTableRow) => {
            linkTableRow.addEventListener('click', () => {
                window.location = linkTableRow.dataset.href
            }, false)
        })
    }

    unmount() {
        super.unmount()

        console.log('world boss index unmount')
    }
}

export default WorldbossIndexView
