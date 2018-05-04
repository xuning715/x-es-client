<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="/common/session.jsp"%>
<c:set var="templateId" value="${param.templateId}" />
<c:set var="fkId" value="${param.fkId}" />
<c:set var="fkType" value="${param.fkType}" />
<c:set var="columnIds" value="${param.columnIds}" />
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
    <script type="text/javascript" src="${ctx}/dwr/interface/TemplateService.js"></script>
    <script type="text/javascript" src="${ctx}/js/loading.js"></script>
</head>
<body onload="selectTemplateColumn()">
<%@include file="/home/logo.jsp"%>
<header style="position:fixed;">
    <img src="${ctx}/images/common/button_save.jpg" title="保存" style="cursor:pointer;text-align:right" onclick="submitTemplateValue()"/>
</header>
<br/>
<br/>
<form id="templateColumnForm" name="templateColumnForm" action="">
    <input type="hidden" id="templateId" name="templateId" value="${templateId}" />
    <input type="hidden" id="fkId" name="fkId" value="${fkId}" />
    <input type="hidden" id="rowId" name="rowId" value="" />
    <input type="hidden" id="columnId" name="columnId" value="${columnId}" />
    <table id="templateColumnTable" name="templateColumnTable" class="xTbody" border="1" cellSpacing="5" cellPadding="5">
    </table>
</form>
</body>
</html>
<script type="text/javascript">
var columnNum;

function selectTemplateColumn(){
    var templateId = dwr.util.getValue("templateId");
    var columnIdArray = "${columnIds}".split(",");
    var columnId;
    var templateColumn = new TemplateColumn();
    templateColumn.templateId = templateId;
    for(var i = 0; i < columnIdArray.length; i++){
        columnId = columnIdArray[i];
        templateColumn.columnId = columnId;
        TemplateService.selectTemplateColumn(templateColumn, callbackSelectTemplateColumn);
    }
}

function callbackSelectTemplateColumn(list){
    columnNum = list.length;
    //dwr.util.removeAllRows("templateColumnTable");
    for(var i = 0; i < list.length; i++){
        addTemplateColumnTable(list[i];
    }

    selectTemplateValueList();
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
    "type='file' " +
    "accept='image/jpeg,image/png,image/jpg' " + 
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
            html += "value='" + templateColumnEnum.enumValue + "' ";
            html += "ondblclick='this.checked = false'/>";
            html += "<LABEL for='" + templateColumnEnum.templateId + "-" + templateColumnEnum.columnId + "-" + templateColumnEnum.enumId + "'>" + templateColumnEnum.enumValue + "</LABEL>";
        }
    }
    return html;
}

function selectTemplateValueList(){
    var columnIdArray = "${columnIds}".split(",");
    var columnId;
    var templateValue = new TemplateValue();
    templateValue.templateId = dwr.util.getValue("templateId");
    templateValue.pageIndex = 0;
    templateValue.pageSize = 1;
    var templateValueFk = new TemplateValueFk();
    templateValueFk.fkId = "${fkId}";
    templateValueFk.fkType = "${fkType}";
    for(var i = 0; i < columnIdArray.length; i++){
        columnId = columnIdArray[i];
        templateValue.columnId = columnId;
        TemplateService.selectTemplateValue(templateValue, templateValueFk, setTemplateValue);
    }
}

function setTemplateValue(list) {
    if(list.length > 0) {
        var model = list[0];
        dwr.util.setValue("rowId", model.rowId);
        for(var i = 0; i < list.length; i++){
            model = list[i];
            var value = "";
            if(model.columnValueStr) {
                if(model.templateColumn.columnType == "file") {
                    var photoArray = model.columnValueStr.split(",");
                    for(var j = 0; j < photoArray.length - 1; j++) {
                        value = "<a target='_blank' href='${ctx}/upload/photo/template/" + model.templateId + "-" + model.rowId + "/" + photoArray[j] + "'><img width='20' height='20' style='vertical-align:bottom' src='${ctx}/upload/photo/template/" + model.templateId + "-" + model.rowId + "/" + photoArray[j] + "' /></a>&nbsp;";
                        $("templateColumnTable").rows[i].cells[1].insertAdjacentHTML("beforeEnd", value);
                    }
                } else {
                    value = model.columnValueStr;
                    if(value != null && value.length > 0){
                        dwr.util.setValue(model.columnId + "", value.split(","));
                    }
                }
            } else {
                value = model.columnValueNum;
                if(value != null){
                    dwr.util.setValue(model.columnId + "", value);
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
        templateValue.templateId = dwr.util.getValue("templateId");
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
        templateValue.templateId = dwr.util.getValue("templateId");
        templateValue.rowId = dwr.util.getValue("rowId");
        TemplateService.updateTemplateValue(templateValue, templateValuesStr, insertTemplateValueFile);
    }
}

function insertTemplateValueFile(rowId) {
    dwr.util.setValue("rowId", rowId);
    var elements = $("templateColumnForm").elements;
    var element;
    var type;
    var columnId;
    for(var i = 0; i < elements.length; i++){
        element = elements[i];
        if (element.type != null && element.type == "file") {
            columnId = element.name;
            var length = element.files.length;
            for(var j = 0; j < length; j++) {
                var oFReader = new FileReader();
                oFReader.readAsDataURL(element.files[j]);
                oFReader.onload = function (oFREvent) {
                    var base64 = oFREvent.target.result.split(",")[1];
                    var templateValue = new TemplateValue();
                    templateValue.templateId = dwr.util.getValue("templateId");
                    templateValue.columnId = columnId;
                    templateValue.rowId = rowId;
                    templateValue.columnValueStr = base64;
                    TemplateService.insertTemplateValueFile(templateValue, callbackTemplateValue);
                }
            }
        }
    }
}

function callbackTemplateValue(fileName){
    var value = "<a target='_blank' href='${ctx}/upload/photo/template/${templateId}-" + dwr.util.getValue("rowId") + "/" + fileName + "'><img width='20' height='20' style='vertical-align:bottom' src='${ctx}/upload/photo/template/${templateId}-" + dwr.util.getValue("rowId") + "/" + fileName + "' /></a>&nbsp;";
    $("templateColumnTable").rows[$("templateColumnTable").rows.length - 1].cells[1].insertAdjacentHTML("beforeEnd", value);
}
</script>
