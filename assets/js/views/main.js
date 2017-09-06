export default class MainView {
    mount() {
        let menuList = document.getElementById("menuList")
        if (menuList) {
            let selectTabString = menuList.dataset.selectedTab

            for (let i = 0; i < menuList.children.length; i++) {
                let child = menuList.children[i];
                if (child.dataset.tabValue === selectTabString) {
                    child.className += " is-active"
                }
            }
        }

    }

    unmount() {
        console.log("Main Unmount");
    }
}
