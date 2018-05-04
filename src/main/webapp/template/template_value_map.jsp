<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="/common/taglibs.jsp"%>
<c:set var="templateId" value="${param.templateId}" />
<c:set var="fkId" value="${param.fkId}" />
<c:set var="fkType" value="${param.fkType}" />
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="initial-scale=1.0, minimum-scale=1.0, maximum-scale=2.0, user-scalable=no, width=device-width">
    <title>属性管理</title>
    <link rel="stylesheet" href="${ctx}/css/default.css"/>
    <link rel="stylesheet" href="${ctx}/css/xtable.css"/>
    <script type="text/javascript" src="${ctx}/js/validator.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/engine.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/util.js"></script>
    <script type="text/javascript" src="${ctx}/js/loading.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/interface/TemplateService.js"></script>
</head>
<body onload="selectTemplateColumn()">
<header style="position:fixed;">
    <img src="${ctx}/images/common/button_save.jpg" title="保存" style="cursor:pointer;text-align:right" onclick="submitTemplateValue()"/>
</header>
<br/>
<br/>
<form id="templateColumnForm" name="templateColumnForm" action="">
    <input type="hidden" id="templateId" name="templateId" value="${templateId}" />
    <input type="hidden" id="fkId" name="fkId" value="${fkId}" />
    <input type="hidden" id="rowId" name="rowId" value="" />
    <table id="templateColumnTable" name="templateColumnTable" class="xTbody" border="1" cellSpacing="5" cellPadding="5">
    </table>
</form>
</body>
</html>
<script type="text/javascript">
var columnNum;

function selectTemplateColumn(){
    var templateId = "${templateId}";
    if(templateId.length > 0){
        var templateColumn = new TemplateColumn();
        templateColumn.templateId = templateId;
        TemplateService.selectTemplateColumn(templateColumn, callbackSelectTemplateColumn);
    }
}

function callbackSelectTemplateColumn(list){
    columnNum = list.length;
    dwr.util.removeAllRows("templateColumnTable");
    for(var i = 0; i < list.length; i++){
        addTemplateColumnTable(list[i]);
    }
    selectTemplateValueList();

    //selectTemplateValueFk();
}

function addTemplateColumnTable(templateColumn){
    var table = $("templateColumnTable");
    var tr = table.insertRow();

    var td = tr.insertCell();
    td.innerText = templateColumn.columnName + "：";
    td.style.width = "200px";
    td = tr.insertCell();

    var tdHtml =
    templateColumn.columnType == "enum"
    ?
    createInput("radio", templateColumn)
    :
    templateColumn.columnType == "enums"
    ?
    createInput("checkbox", templateColumn)
    :
    templateColumn.columnType == "file"
    ?
    "<INPUT " +
    "id='" + templateColumn.columnId + "' " +
    "name='" + templateColumn.columnId + "' " +
    "title='" + templateColumn.columnType + "' " +
    "accept='image/jpeg,image/png,image/jpg' " + 
    "type='file' " +
    "multiple='multiple' " +
    "/ >"
    :
    "<INPUT " +
    "id='" + templateColumn.columnId + "' " +
    "name='" + templateColumn.columnId + "' " +
    "type='" + (templateColumn.columnType == "date" ? "date" : "text") + "' " +
    "title='" + templateColumn.columnType + "' " +
    "placeholder='" + (templateColumn.columnNotNull == 1 ? "必填 " : "") + templateColumn.columnName + "' " +
    (templateColumn.columnNotNull == 1 ? "required='true' " : "") + 
    "pattern='" + (templateColumn.columnType == "string" || templateColumn.columnType == "date" || templateColumn.columnType == "enum" || templateColumn.columnType == "enums" ? "string" : templateColumn.columnType) + "' " + 
    (templateColumn.columnType == "date" ? "onkeypress='return false' " : "") +
    "/>";
    td.innerHTML = tdHtml;
}

function createInput(type, templateColumn){
    var html = "";
    var templateColumnEnumList = templateColumn.templateColumnEnumList;
    if(templateColumnEnumList.length > 0){
        var templateColumnEnum;
        for(var i = 0; i < templateColumnEnumList.length; i++){
            templateColumnEnum = templateColumnEnumList[i];
            html += "<INPUT id='" + templateColumnEnum.templateId + "-" + templateColumnEnum.columnId + "-" + templateColumnEnum.enumId + "' ";
            html += "name='" + templateColumnEnum.columnId + "' ";
            html += "type='" + type + "' ";
            html += "title='" + templateColumn.columnType + "' ";
            html += "pattern='string' ";
            html += templateColumn.columnNotNull == 1 ? "required='true' " : ""; 
            html += "value='" + templateColumnEnum.enumValue + "' ";
            html += "ondblclick='this.checked = false'/>";
            html += "<LABEL for='" + templateColumnEnum.templateId + "-" + templateColumnEnum.columnId + "-" + templateColumnEnum.enumId + "'>" + templateColumnEnum.enumValue + "</LABEL>";
        }
    }
    return html;
}

function selectTemplateValueFk(){
    var templateValueFk = new TemplateValueFk();
    templateValueFk.fkId = "${fkId}";
    templateValueFk.fkType = "${fkType}";
    TemplateService.selectTemplateValueFk(templateValueFk, setTemplateValueFk);
}

function setTemplateValueFk(list){
    if(list.length > 0) {
        var model = list[0];
        dwr.util.setValue("rowId", model.rowId);
        selectTemplateValueList();
    }
}

function selectTemplateValueList(){
    var templateValue = new TemplateValue();
    templateValue.templateId = "${templateId}";
    var templateValueFk = new TemplateValueFk();
    templateValueFk.fkId = "${fkId}";
    templateValueFk.fkType = "${fkType}";
    TemplateService.selectTemplateValueList(templateValue, templateValueFk, columnNum, setTemplateValue);
}

function setTemplateValue(list) {
    if(list.length > 0) {
        var model = list[0];
        for(var i = 0; i < model.length; i++){
            var value = "";
            dwr.util.setValue("rowId", model[i].rowId);
            if(model[i].columnValueStr) {
                if(model[i].templateColumn.columnType == "file") {
                    var photoArray = model[i].columnValueStr.split(",");
                    for(var j = 0; j < photoArray.length - 1; j++) {
                        value = "<a target='_blank' href='${ctx}/template/template_value_photo.jsp?templateId=${templateId}&columnId=" + model[i].columnId + "&rowId=" +  model[i].rowId + "&fkId=${fkId}&fkType=${fkType}&imgs=" + model[i].columnValueStr + "&img=" + photoArray[j] + "'><img width='20' height='20' style='vertical-align:bottom;border:1px solid #cfd5da' src='${ctx}/upload/photo/template/" + model[i].templateId + "-" + model[i].rowId + "/" + photoArray[j] + "' /></a>&nbsp;";
                        $("templateColumnTable").rows[i].cells[1].insertAdjacentHTML("beforeEnd", value);
                    }
                } else {
                    value = model[i].columnValueStr;
                    if(value){
                        dwr.util.setValue(model[i].columnId + "", value.split(","));
                    }
                }
            } else {
                value = model[i].columnValueNum;
                if(value){
                    dwr.util.setValue(model[i].columnId + "", value);
                }
            }
        }
    }
}

function submitTemplateValue() {
    var rowId = dwr.util.getValue("rowId");
    if(rowId){
        updateTemplateValue();
    } else {
        insertTemplateValue();
    }
}

function insertTemplateValue(){
    if(validate($("templateColumnForm"))){
        var templateValuesStr = "";
        var columnId;
        var columnType;
        var columnValue;
        var element;
        var table = $("templateColumnTable");
        for(var i = 0; i < table.rows.length; i++){
            element = table.rows[i].cells[1].children[0];
            columnId = element.name;
            columnType = element.title;
            columnValue = dwr.util.getValue(element.name);
            if(columnType != "file") {
                if(columnType == "enum" && !columnValue){
                    columnValue = "";
                }
                templateValuesStr += columnId + "=" + columnType + "=" + columnValue + "|";
            }
        }
        if(templateValuesStr.length > 0){
            templateValuesStr = templateValuesStr.substring(0, templateValuesStr.length - 1);
        }
        else{
            return false;
        }
        var templateValue = new TemplateValue();
        templateValue.templateId = "${templateId}";
        TemplateService.insertTemplateValue(templateValue, "${fkId}", ${fkType}, templateValuesStr, insertTemplateValueFile);
    }
}

function updateTemplateValue(){
    if(validate($("templateColumnForm"))){
        var templateValuesStr = "";
        var columnId;
        var columnType;
        var columnValue;
        var element;
        var table = $("templateColumnTable");
        for(var i = 0; i < table.rows.length; i++){
            element = table.rows[i].cells[1].children[0];
            columnId = element.name;
            columnType = element.title;
            columnValue = dwr.util.getValue(element.name);
            if(columnType != "file") {
                if(columnType == "enum" && !columnValue){
                    columnValue = "";
                }
                templateValuesStr += columnId + "=" + columnType + "=" + columnValue + "|";
            }
        }
        if(templateValuesStr.length > 0){
            templateValuesStr = templateValuesStr.substring(0, templateValuesStr.length - 1);
        }
        else{
            return false;
        }
        var templateValue = new TemplateValue();
        templateValue.templateId = "${templateId}";
        templateValue.rowId = dwr.util.getValue("rowId");
        TemplateService.updateTemplateValue(templateValue, templateValuesStr, insertTemplateValueFile);
    }
}

var fileNum = 0;
function insertTemplateValueFile(rowId) {
    dwr.util.setValue("rowId", rowId);
    var elements = $("templateColumnForm").elements;
    var element;
    var columnId;
    for(var i = 0; i < elements.length; i++){
        element = elements[i];
        if (element.type != null && element.type == "file") {
            columnId = element.name;
            var length = element.files.length;
            if(length > 0){
                fileNum += length;
            }
        }
    }
    for(var i = 0; i < elements.length; i++){
        element = elements[i];
        if (element.type != null && element.type == "file") {
            columnId = element.name;
            var length = element.files.length;
            if(length > 0){
                for(var j = 0; j < length; j++) {
                    var oFReader = new FileReader();
                    oFReader.readAsDataURL(element.files[j]);
                    oFReader.onload = function (oFREvent) {
                        var base64 = oFREvent.target.result.split(",")[1];
                        var templateValue = new TemplateValue();
                        templateValue.templateId = "${templateId}";
                        templateValue.columnId = columnId;
                        templateValue.rowId = rowId;
                        templateValue.columnValueStr = base64;
                        TemplateService.insertTemplateValueFile(templateValue, callbackTemplateValue);
                    }
                }
            }
        }
    }
}

function callbackTemplateValue(fileName){
    fileNum -= 1;
    if(fileNum == 0){
        alert("上传图片成功");
        location = "${ctx}/template/template_value_map.jsp?fkId=${fkId}&fkType=${fkType}&templateId=${templateId}";
    }
    //var value = "<a href='${ctx}/template/template_value_photo.jsp?templateId=${templateId}&rowId=" + dwr.util.getValue("rowId") + "&fkId=${fkId}&fkType=${fkType}&img=" + fileName + "'><img width='20' height='20' style='vertical-align:bottom' src='${ctx}/upload/photo/template/${templateId}-" + dwr.util.getValue("rowId") + "/" + fileName + "' /></a>&nbsp;";
    //$("templateColumnTable").rows[$("templateColumnTable").rows.length - 1].cells[1].insertAdjacentHTML("beforeEnd", value);
}
</script>
