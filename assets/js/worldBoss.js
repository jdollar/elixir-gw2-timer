(function() {
    let linkTableRows = document.getElementsByClassName('link-table-row')

    for(let i = 0; i < linkTableRows.length; i++) {
        let linkTableRow = linkTableRows[i]
        linkTableRow.onclick = function() {
            window.location = this.getAttribute('data-href')
        }.bind(linkTableRow)
    }
})()
