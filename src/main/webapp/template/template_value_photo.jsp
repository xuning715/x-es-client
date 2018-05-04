<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="/common/session.jsp"%>
<c:set var="templateId" value="${param.templateId}" />
<c:set var="rowId" value="${param.rowId}" />
<c:set var="columnId" value="${param.columnId}" />
<c:set var="fkId" value="${param.fkId}" />
<c:set var="fkType" value="${param.fkType}" />
<c:set var="imgs" value="${param.imgs}" />
<c:set var="img" value="${param.img}" />
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="initial-scale=1.0, minimum-scale=1.0, maximum-scale=2.0, user-scalable=no, width=device-width">
    <title>图片管理</title>
    <script type="text/javascript" src="${ctx}/dwr/engine.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/util.js"></script>
    <script type="text/javascript" src="${ctx}/js/loading.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/interface/TemplateService.js"></script>
</head>
<body>
<header style="position:fixed;">
    <img src="${ctx}/images/common/button_delete.jpg" title="删除图片" style="cursor:pointer;text-align:right" onclick="deletePhoto()"/>
    <input type="range" id="scale" name="scale" value="" min="0" step="1" oninput="resizeImg(this)" style="width:1400px"/>

    <!--img src="${ctx}/images/common/button_back.jpg" title="返回" style="cursor:pointer;text-align:right" onclick="callback()"/-->
</header>
<br/>
<br/>
<form id="templateValueForm" name="templateValueForm" action="" style="text-align:center">
    <input type="hidden" id="templateId" name="templateId" value="${templateId}" />
    <input type="hidden" id="rowId" name="rowId" value="${rowId}" />
    <input type="hidden" id="columnId" name="columnId" value="${columnId}" />
    <img id="templateValuePhoto" style="vertical-align:top;border:1px solid #cfd5da" src="${ctx}/upload/photo/template/${templateId}-${rowId}/${img}" onload="initImg(this)" />
</form>
</body>
</html>
<script type="text/javascript">
var imgWidth;
var imgHeight;
var imgRate;
function initImg(img){
    imgWidth = img.width;
    imgHeight = img.height;
    imgRate = imgWidth / imgHeight;
    var width = imgWidth >= document.body.offsetWidth ? document.body.offsetWidth : imgWidth;
    var height = width / imgRate;
    img.width = width;
    img.height = height;
    $("scale").max = imgWidth * 2;
    dwr.util.setValue("scale", width);
}
function resizeImg(inut){
    var width = inut.value;
    $("templateValuePhoto").width = width;
    $("templateValuePhoto").height = width / imgRate;
}
function deletePhoto(){
    if(confirm("确认删除图片")){
        var templateValue = dwr.util.getFormValues("templateValueForm");
        var columnValueStr = "${imgs}".replace("${img},", "");
        if(columnValueStr.length > 0){
            templateValue.columnValueStr = columnValueStr ;
        }
        TemplateService.deleteTemplateValueFile(templateValue, "${fkId}", "${img}", callback);
    }
}
function callback(){
    alert("删除成功");
    window.close();
    //location = "${ctx}/template/template_value_map.jsp?fkId=${fkId}&fkType=${fkType}&templateId=${templateId}";
}
</script>
