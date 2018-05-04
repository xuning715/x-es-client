/**载入loading动画,loadingImage:动画图片地址*/
/**载入loading动画,loadingImage:动画图片地址*/
var loadingImage = "../images/common/loading.gif";
dwr.engine.setPreHook(function() {
    loading();
});

function loading() {
    var disabledImageZone = document.getElementById("disabledImageZone");
    if (!disabledImageZone) {
        disabledImageZone = document.createElement("div");
        disabledImageZone.setAttribute("id", "disabledImageZone");
        disabledImageZone.style.position = "absolute";
        disabledImageZone.style.zIndex = "10000";
        disabledImageZone.style.left = "0px";
        disabledImageZone.style.top = "0px";
        disabledImageZone.style.width = "101%";
        disabledImageZone.style.height = "100%";
        disabledImageZone.style.textAlign = "center";
        disabledImageZone.style.backgroundColor = "white";
        disabledImageZone.innerHTML = "<table width='100%' height='100%' border=0><tr><td style='font-size:13px;text-align:center;vertical-align:middle'><img src='" + loadingImage +
            "'><br>\u8bf7\u7a0d\u5019. . .</td></tr></table>";
        disabledImageZone.style.filter = "alpha(opacity=80)";
        document.body.appendChild(disabledImageZone);
        dwr.util._disableZoneUseCount = 1;
    } else {
        disabledImageZone.style.height = document.body.scrollHeight;
        disabledImageZone.style.visibility = "visible";
        dwr.util._disableZoneUseCount=dwr.util._disableZoneUseCount + 1 ;
    }
}

dwr.engine.setPostHook(function() {
    loaded();
});

function loaded() {
    dwr.util._disableZoneUseCount = dwr.util._disableZoneUseCount - 1 ;
    if(dwr.util._disableZoneUseCount==0){
        document.getElementById("disabledImageZone").style.visibility = "hidden";
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

function validate(form) {
    var elements = form.elements;
    var element;
    var name;
    var value;
    var message;
    for (var i = 0; i < elements.length; i++) {
        element = elements[i];
        if (element.required) {
            name = element.name;
            value = dwr.util.getValue(name);
            if (value == null || value.length == 0 || !value) {
                element.focus();
                message = "请填写" + element.placeholder;
                alert(message);
                return false;
            }
        }
    }
    return true;
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
