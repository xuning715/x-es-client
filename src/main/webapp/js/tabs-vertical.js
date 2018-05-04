function initTab(){
    var div = $("tabs-vertical");
    var lis = div.children[0].children;
    var divs = div.children[1].children;
    for(var i = 0; i < lis.length; i++) {
        var a = lis[i].children[0];
        a.title = i;
        a.onclick = function() {
            lis[div.title].children[0].className = "";
            divs[div.title].className = "";
            this.className = "tab-active";
            divs[this.title].className = "tab-content-active";
            div.title = this.title;
        }
    }
}
