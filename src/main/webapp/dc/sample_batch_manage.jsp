<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="/common/session.jsp"%>
<c:set var="estateId" value="${param.estateId}" />
<c:set var="sampleIds" value="${param.sampleIds}" />
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="initial-scale=1.0, minimum-scale=1.0, maximum-scale=2.0, user-scalable=no, width=device-width">
    <title>样点管理</title>
    <link rel="stylesheet" href="${ctx}/css/default.css"/>
    <link rel="stylesheet" href="${ctx}/css/xtable.css"/>
    <link rel="stylesheet" href="${ctx}/css/tabs-vertical.css"/>
    <script type="text/javascript" src="${ctx}/js/calendar/WdatePicker.js"></script>
    <script type="text/javascript" src="${ctx}/js/tabs-vertical.js"></script>
    <script type="text/javascript" src="${ctx}/js/validator.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/engine.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/util.js"></script>
    <script type="text/javascript" src="${ctx}/js/loading.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/interface/SampleService.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/interface/TemplateService.js"></script>
</head>
<body>
<%--<%@include file="/home/logo.jsp"%>--%>
<div id="tabs-vertical" class="tabs-vertical" title="0">
    <ul>
        <li>
            <a class="tab-active" href="#">批量赋值</a>
        </li>
    </ul>
    <div class="tabs-content-placeholder" style="height:500px">
        <div class="tab-content-active">
            <form id="sampleForm" name="sampleForm" method="post">
                    <p>
                        <input type="text" id="sampleValue" name="sampleValue" placeholder="评估值" pattern="integer" required="true" />
                    </p>
                    <p>
                        <input type="text" id="sampleDate" name="sampleDate" placeholder="评估日期" onfocus="WdatePicker()" required="true" />
                    </p>
                    <p>
                        <img src="${ctx}/images/common/button_value.jpg" title="赋值" style="cursor:pointer" onclick="updateSampleList()"/>
                        <img src="${ctx}/images/common/button_back.jpg" title="返回" style="cursor:pointer" onclick="callback()"/>
                    </p>
            </form>
        </div>
    </div>
</div>
</body>
</html>
<script type="text/javascript">
    initTab();
    /**
    selectTemplateColumn();

    function selectTemplateColumn(){
        var templateId = 43;
        var templateColumn = new TemplateColumn();
        templateColumn.templateId = templateId;
        templateColumn.columnId = 1;
        TemplateService.selectTemplateColumn(templateColumn, callbackSelectTemplateColumn1);
        templateColumn.columnId = 2;
        TemplateService.selectTemplateColumn(templateColumn, callbackSelectTemplateColumn2);
    }

    function callbackSelectTemplateColumn1(list){
        for(var i = 0; i < list.length; i++){
            addTemplateColumnTable(list[i], 1);
        }
    }

    function callbackSelectTemplateColumn2(list){
        for(var i = 0; i < list.length; i++){
            addTemplateColumnTable(list[i], 2);
        }
    }

    function addTemplateColumnTable(templateColumn, index){
        var span = $("houseTemplateColumnSpan" + index);
        var spanHtml =
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
        span.innerHTML = spanHtml;
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
                html += "required='true' "; 
                html += "placeholder=" + (i == 0 ? "'设计用途' " : "'' "); 
                html += "value='" + templateColumnEnum.enumValue + "' ";
                html += "ondblclick='this.checked = false'/>";
                html += "<LABEL for='" + templateColumnEnum.templateId + "-" + templateColumnEnum.columnId + "-" + templateColumnEnum.enumId + "'>" + templateColumnEnum.enumValue + "</LABEL>";
            }
        }
        return html;
    }
    **/
    function updateSampleList(){
        if(validate($("sampleForm"))){
            var sampleIds = "${sampleIds}";
            var sample = new Sample();
            sample.sampleValue = dwr.util.getValue("sampleValue");
            sample.sampleDate = Date.parse(dwr.util.getValue("sampleDate"));
            SampleService.updateSampleList(sample, sampleIds, callback);
        }
    }

    function callback() {
        location = "${ctx}/dc/sample_list.jsp?estateId=${estateId}";
    }
</script>