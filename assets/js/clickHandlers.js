let linkTableRows = document.getElementsByClassName('link-table-row');

for(let i = 0; i < linkTableRows.length; i++) {
    linkTableRows.onclick = function() {
        alert(this.data-href);
    }
}
