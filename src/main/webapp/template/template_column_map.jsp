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
    <script type="text/javascript" src="${ctx}/dwr/interface/TemplateService.js"></script>
    <script type="text/javascript" src="${ctx}/js/loading.js"></script>
</head>
<body onload="selectTemplateColumn()">
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
            html += "value='" + templateColumnEnum.enumValue + "' ";
            html += "ondblclick='this.checked = false'/>";
            html += "<LABEL for='" + templateColumnEnum.templateId + "-" + templateColumnEnum.columnId + "-" + templateColumnEnum.enumId + "'>" + templateColumnEnum.enumValue + "</LABEL>";
        }
    }
    return html;
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
        dwr.util.setValue("rowId", model[0].rowId);
        for(var i = 0; i < model.length; i++){
            var value = "";
            if(model[i].columnValueStr) {
                if(model[i].templateColumn.columnType == "file") {
                    var photoArray = model[i].columnValueStr.split(",");
                    for(var j = 0; j < photoArray.length - 1; j++) {
                        value = "<a target='_blank' href='${ctx}/upload/photo/template/" + model[i].templateId + "-" + model[i].rowId + "/" + photoArray[j] + "'><img width='20' height='20' style='vertical-align:bottom;border:1px solid #cfd5da' src='${ctx}/upload/photo/template/" + model[i].templateId + "-" + model[i].rowId + "/" + photoArray[j] + "' /></a>&nbsp;";
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

</script>
