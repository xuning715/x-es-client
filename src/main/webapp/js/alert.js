var loadClock = "";

function loading(message) {
    var disabledImageZone = document.getElementById("disabledImageZone");
    if (!disabledImageZone) {
        disabledImageZone = document.createElement("div");
        disabledImageZone.setAttribute("id", "disabledImageZone");
        disabledImageZone.style.position = "absolute";
        disabledImageZone.style.zIndex = "10000";
        disabledImageZone.style.left = "0px";
        disabledImageZone.style.top = "0px";
        disabledImageZone.style.width = "100%";
        disabledImageZone.style.height = "70px";
        disabledImageZone.style.textAlign = "center";
        disabledImageZone.style.color = "#C81B0A";
        disabledImageZone.style.fontWeight = "bold";
        disabledImageZone.style.backgroundColor = "white";
        disabledImageZone.innerHTML = "<br/>" + message + "<br/><br/>";
        disabledImageZone.style.opacity = "0.7";
        document.body.appendChild(disabledImageZone);
    } else {
        disabledImageZone.style.opacity = "0.7";
    }
    loadClock = setInterval(loaded, 200);
}

function loaded() {
    document.getElementById("disabledImageZone").style.opacity = document.getElementById("disabledImageZone").style.opacity - 0.1;
    if(document.getElementById("disabledImageZone").style.opacity < 0.2){
        document.getElementById("disabledImageZone").style.opacity = 0;
        clearInterval(loadClock);
    }
}

Date.prototype.Format = function(fmt){ //author: meizz
    var o = {
        "M+" : this.getMonth()+1,                 //月份
        "d+" : this.getDate(),                    //日
        "h+" : this.getHours(),                   //小时
        "m+" : this.getMinutes(),                 //分
        "s+" : this.getSeconds(),                 //秒
        "q+" : Math.floor((this.getMonth()+3)/3), //季度
        "S"  : this.getMilliseconds()             //毫秒
    };
    if(/(y+)/.test(fmt))
        fmt=fmt.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length));
    for(var k in o)
        if(new RegExp("("+ k +")").test(fmt))
            fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));
    return fmt;
}

function setModelToForm(model){
    for(var field in model){
        if(typeof (model[field]) == "string" || typeof (model[field]) == "number" || typeof (model[field]) == "boolean"){
            if($(field) != null) {
                dwr.util.setValue(field, model[field]);
            }
        } else {
            setModelToForm(model[field]);
        }
    }
}
