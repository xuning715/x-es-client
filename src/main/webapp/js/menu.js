function displayMenu(li) {
    li.style.color = "#FF3300";
    var subMenu = li.getElementsByTagName("ul")[0];

    if(testBrower()==6){
        if(subMenu != null){
            var top = li.style.top;
            var left = li.style.left;

            subMenu.style.top = top + 15;
            subMenu.style.left = left - 35;

            subMenu.style.display = "block";
        }
    }
    else{
        if(subMenu != null){
            var top = li.offsetTop;
            var left = li.offsetLeft;
            while(li = li.offsetParent){
                top += li.offsetTop;
                left += li.offsetLeft;
            }

//            if(testBrower()==7){
            subMenu.style.top = top + 15;
            subMenu.style.left = left;
//            }

            subMenu.style.display = "block";
        }
    }
}

function hideMenu(li) {
    li.style.color = "#15428B";
    hideLiUl(li);
}

function displaySubMenu(li) {
    li.style.backgroundColor = "#BBC9CD";
    li.style.color = "#FFFFFF";
    var subMenu = li.getElementsByTagName("ul")[0];
    if(subMenu != null){
        subMenu.style.top = li.offsetTop + 15;
        subMenu.style.left = li.offsetLeft;
        subMenu.style.display = "block";
    }
}

function hideSubMenu(li) {
    li.style.backgroundColor = "#f4f7fe";
    li.style.color = "#15428B";
    hideLiUl(li);
}

function hideLiUl(li){
    var subMenu = li.getElementsByTagName("ul")[0];
    if(subMenu != null){
        subMenu.style.display = "none";
    }
}

function hide(obj){
    obj.style.display = "none";
}

function testBrower() {
    var version;
    if (navigator.appName.toUpperCase() == 'MICROSOFT INTERNET EXPLORER') {
        if (navigator.appVersion.indexOf('MSIE 8.0') >= 0) {
            return version = 8;
        }
        else if (navigator.appVersion.indexOf('MSIE 7.0') >= 0) {
            return version = 7;
        }
        else if (navigator.appVersion.indexOf('MSIE 6.0') >= 0) {
            return version = 6;
        }
        else if (navigator.appVersion.indexOf('MSIE 9.0') >= 0) {
            return version = 9;
        }
    }
    //alert(version);
    return version;
}
