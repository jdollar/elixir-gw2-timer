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

    setupTable() {
        let worldBossTable = document.getElementById('')
        let rows = worldBossTable.getElementsByTagName('tr')
        let firstRow = rows[0]
        let lastRow = rows[rows.length]
        firstRow.parentNode.insertAfter
    }

    unmount() {
        super.unmount()

        console.log('world boss index unmount')
    }
}

export default WorldbossIndexView
