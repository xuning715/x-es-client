<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="/common/taglibs.jsp"%>
<c:set var="templateId" value="${param.templateId}" />
<c:set var="fkId" value="${param.fkId}" />
<c:set var="fkType" value="${param.fkType}" />
<html>
<head>
    <link rel="stylesheet" href="${ctx}/css/default.css"/>
    <script type="text/javascript" src="${ctx}/js/xtable.js"></script>
    <script type="text/javascript" src="${ctx}/js/validator.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/engine.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/util.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/interface/TemplateService.js"></script>
    <script type="text/javascript" src="${ctx}/js/loading.js"></script>
    <title>属性管理</title>
</head>
<body onload="selectTemplateColumn()">
<form id="templateColumnForm" name="templateColumnForm" action="">
    <input type="hidden" id="templateId" name="templateId" value="${templateId}" />
    <table id="templateColumnTable" name="templateColumnTable" border="0" cellSpacing="5" cellPadding="5">
    </table>
    <img src="${ctx}/images/common/button_select.jpg" title="查询" style="cursor:pointer" onclick="templateValueXTable.goPage(1)"/>
    <img src="${ctx}/images/common/button_insert.jpg" title="添加" style="cursor:pointer" onclick="insertTemplateValue()"/>
    <img src="${ctx}/images/common/button_update.jpg" title="修改" style="cursor:pointer" onclick="updateTemplateValue()"/>
    <img src="${ctx}/images/common/button_delete.jpg" title="删除" style="cursor:pointer" onclick="deleteTemplateValue()"/>
    <img src="${ctx}/images/common/button_reset.jpg" title="清空" style="cursor:pointer" onclick="$('templateColumnForm').reset()"/>
</form>
<SCRIPT LANGUAGE="JavaScript" type="">
    var columnNum;
    var templateValueXThead = new Array(
            new XThead("选择", "radio")
    );

    var templateValueXTable = new XTable("templateValue", templateValueXThead, true);

    templateValueXTable.XTbodyArray = function (model) {
        var array = new Array(model.length);
        array[0] = new XTbody("templateValue", model[0].rowId, "radio", "onclick='setTemplateValue(this)'");
        for(var i = 0; i < model.length; i++){
            var value = "";
            if(model[i].columnValueStr) {
                if(model[i].templateColumn.columnType == "file") {
                    var photoArray = model[i].columnValueStr.split(",");
                    for(var j = 0; j < photoArray.length - 1; j++) {
                        value += "<a target='_blank' href='${ctx}/upload/photo/template/" + model[i].templateId + "-" + model[i].rowId + "/" + photoArray[j] + "'><img width='20' height='20' src='${ctx}/upload/photo/template/" + model[i].templateId + "-" + model[i].rowId + "/" + photoArray[j] + "' /></a>&nbsp;";
                    }
                } else {
                    value = model[i].columnValueStr;
                }
            } else {
                value = model[i].columnValueNum;
            }
            array[i + 1] = new XTbody("templateValue", value);
        }
        return array;
    }

    function getTemplateValue(){
        return templateValue;
    }

    templateValueXTable.getXList = function (page){
        var templateValue = new TemplateValue();
        templateValue.templateId = "${templateId}";
        var templateValueFk = new TemplateValueFk();
        templateValueFk.fkId = "${fkId}";
        templateValueFk.fkType = "${fkType}";
        TemplateService.selectTemplateValueList(templateValue, templateValueFk, columnNum, function(list){templateValueXTable.addTable(list);});
    }
</SCRIPT>
</body>
</html>
<script type="text/javascript">
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

    var templateValueXTheadArray = new Array();
    templateValueXTheadArray[0] = new XThead("选择", "radio");
    for(var i = 0; i < list.length; i++){
        templateValueXTheadArray[i + 1] = new XThead(list[i].columnName);
    }
    templateValueXTable.setThead(templateValueXTheadArray);
    templateValueXTable.goPage(1);
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
            html += "placeholder='" + templateColumn.columnName + "' ";
            html += "pattern='string' ";
            html += templateColumn.columnNotNull == 1 ? "required='true' " : ""; 
            html += "value='" + templateColumnEnum.enumValue + "' ";
            html += "ondblclick='this.checked = false'/>";
            html += "<LABEL for='" + templateColumnEnum.templateId + "-" + templateColumnEnum.columnId + "-" + templateColumnEnum.enumId + "'>" + templateColumnEnum.enumValue + "</LABEL>";
        }
    }
    return html;
}

function setTemplateValue(obj){
    var tr = obj.parentElement.parentElement;
    var value;
    for(var i = 1; i < tr.cells.length; i++){
        value = tr.cells[i].innerText;
        if(value != null && value.length > 0){
            dwr.util.setValue(i + "", tr.cells[i].innerText.split(","));
        }
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
            if(columnType != "file" && columnValue.length > 0 && columnValue != false) {
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

function insertTemplateValueFile(rowId) {
    var elements = $("templateColumnForm").elements;
    var element;
    var type;
    var columnId;
    for(var i = 0; i < elements.length; i++){
        element = elements[i];
        type = element.type;
        columnId = element.id;
        if (type == "file") {
            var length = element.files.length;
            if(length > 0) {
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
    callbackTemplateValue();
}

function updateTemplateValue(){
    if(validate($("templateColumnForm"))){
        var rowId = templateValueXTable.getRadioValue();
        if(rowId == null){
            alert("请选择要修改的记录");
            return false;
        }
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
        templateValue.rowId = rowId;
        TemplateService.updateTemplateValue(templateValue, templateValuesStr, insertTemplateValueFile);
    }
}

function deleteTemplateValue(){
    if(confirm("确定删除选择数据")){
        var rowId = templateValueXTable.getRadioValue();
        if(rowId == null){
            alert("请选择要删除的记录");
            return false;
        }
        var templateValue = new TemplateValue();
        templateValue.templateId = "${templateId}";
        templateValue.rowId = rowId;
        TemplateService.deleteTemplateValue(templateValue, callbackTemplateValue);
    }
}

function callbackTemplateValue(){
	$("templateColumnForm").reset();
	templateValueXTable.goPage(1);
}
</script>
