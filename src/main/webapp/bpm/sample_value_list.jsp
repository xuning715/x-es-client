<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="/common/session.jsp"%>
<c:set var="estateId" value="${param.estateId}" />
<c:set var="sampleId" value="${param.sampleId}" />
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="initial-scale=1.0, minimum-scale=1.0, maximum-scale=2.0, user-scalable=no, width=device-width">
    <title>样点管理</title>
    <link rel="stylesheet" href="${ctx}/css/default.css"/>
    <script type="text/javascript" src="${ctx}/js/calendar/WdatePicker.js"></script>
    <script type="text/javascript" src="${ctx}/js/xtable.js"></script>
    <script type="text/javascript" src="${ctx}/js/validator.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/engine.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/util.js"></script>
    <script type="text/javascript" src="${ctx}/js/loading.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/interface/SampleValueService.js"></script>
</head>
<body>
<%--<%@include file="/home/logo.jsp"%>--%>
<form id="sampleForm" name="sampleForm" method="post">
    <input id="sampleId" name="sampleId" type="hidden" value="${sampleId}">
    <table>
        <tr>
            <td>
                成本法估值：
            </td>
            <td>
                <input type="number" id="costValue" name="costValue" value="${costValue}" placeholder="成本法估值" onchange="setSampleValue()" required="true" />
            </td>
            <td>
                成本法权重：
            </td>
            <td>
                <input id="costRate" name="costRate" type="range" min="0" max="1" step="0.01" value="0.2" placeholder="成本法权重" required="true" oninput="setValue(this)" />
                <output for="costRate">0.2</output>
            </td>
        </tr>
        <tr>
            <td>
                市场法估值：
            </td>
            <td>
                <input type="number" id="marketValue" name="marketValue" value="0" placeholder="市场法估值" onchange="setSampleValue()" required="true" />
            </td>
            <td>
                市场法权重：
            </td>
            <td>
                <input id="marketRate" name="marketRate" type="range" min="0" max="1" step="0.01" value="0.8" placeholder="市场法估值" required="true" oninput="setValue(this)" readonly />
                <output for="marketRate">0.8</output>
            </td>
        </tr>
        <tr>
            <td>
                收益法估值：
            </td>
            <td>
                <input type="number" id="profitValue" name="profitValue" value="0" placeholder="收益法估值" onchange="setSampleValue()" required="true" readonly />
            </td>
            <td>
                收益法权重：
            </td>
            <td>
                <input id="profitRate" name="profitRate" type="range" min="0" max="1" step="0.01" value="0" placeholder="收益法权重" required="true" oninput="setValue(this)" readonly/>
                <output for="profitRate">0</output>
            </td>
        </tr>
        <tr>
            <td>
                评估值：
            </td>
            <td>
                <input type="number" id="sampleValue" name="sampleValue" value="0" placeholder="评估值" pattern="integer" required="true" readonly />
            </td>
            <td>
                评估日期：
            </td>
            <td>
                <input type="text" id="valueCreateTime" name="valueCreateTime" placeholder="评估日期" onfocus="WdatePicker()" required="true" />
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <img src="${ctx}/images/common/button_value.jpg" title="赋值" style="cursor:pointer" onclick="insertSampleValueLog()"/>
                <img src="${ctx}/images/common/button_back.jpg" title="返回" style="cursor:pointer" onclick="callback()"/>
            </td>
        </tr>
    </table>
</form>
<SCRIPT LANGUAGE="JavaScript" type="">
    var sampleThead = new Array(
            new XThead("成本法估值"),
            new XThead("成本法权重"),
            new XThead("市场法估值"),
            new XThead("市场法权重"),
            new XThead("收益法估值"),
            new XThead("收益法权重"),
            new XThead("评估值", "number"),
            new XThead("评估日期"),
            new XThead("操作")
    );

    var sampleXTable = new XTable("sample", sampleThead, true);

    sampleXTable.XTbodyArray = function (model) {
        var array = new Array(
                new XTbody("sample", model.costValue, null, null, null, "center"),
                new XTbody("sample", model.costRate, null, null, null, "center"),
                new XTbody("sample", model.marketValue, null, null, null, "center"),
                new XTbody("sample", model.marketRate, null, null, null, "center"),
                new XTbody("sample", model.profitValue, null, null, null, "center"),
                new XTbody("sample", model.profitRate, null, null, null, "center"),
                new XTbody("sample", model.sampleValue, null, null, null, "center"),
                new XTbody("sample", new Date(model.valueCreateTime).Format("yyyy/MM/dd"), null, null, null, "center"),
                new XTbody("sample", "<a href='#' onclick=deleteSampleValueLog('" + model.sampleLogId + "')>删除</a>", null, null, null, "center")
        );

        return array;
    }
    sampleXTable.getXList = function (page){
        var sampleValueLog = new SampleValueLog();
        sampleValueLog.sampleId = dwr.util.getValue("sampleId");
        SampleValueService.selectSampleValueLogList(sampleValueLog, function(list){sampleXTable.addTable(list);});
    }
</SCRIPT>
</body>
</html>
<script type="text/javascript">
    sampleXTable.goPage(1);
    dwr.util.setValue("valueCreateTime", new Date().Format("yyyy/MM/dd"));
    setSampleValue();
    function setValue(obj) {
        obj.nextElementSibling.innerHTML = obj.value;
        dwr.util.setValue("marketRate", 1 - obj.value);
        $("marketRate").nextElementSibling.innerHTML = (1 - obj.value).toFixed(2);
        setSampleValue();
    }
    function setSampleValue() {
        var sampleValue = dwr.util.getValue("costValue") * dwr.util.getValue("costRate") + dwr.util.getValue("marketValue") * dwr.util.getValue("marketRate") + dwr.util.getValue("profitValue") * dwr.util.getValue("profitRate");
        sampleValue = parseInt(sampleValue);
        dwr.util.setValue("sampleValue", sampleValue);
    }
    function insertSampleValueLog(){
        if(validate($("sampleForm"))){
            var sampleValueLog = dwr.util.getFormValues("sampleForm");
            sampleValueLog.valueCreateTime = new Date(dwr.util.getValue("valueCreateTime"));
            SampleValueService.insertSampleValueLog(sampleValueLog, callbackInsertSampleValueLog);
        }
    }
    function deleteSampleValueLog(sampleValueLogId) {
        var sampleValueLog = new SampleValueLog();
        sampleValueLog.sampleLogId = sampleValueLogId;
        SampleValueService.deleteSampleValueLog(sampleValueLog, callbackInsertSampleValueLog);
    }
    function callbackInsertSampleValueLog() {
        sampleXTable.goPage(1);
    }
    function callback() {
        location = "${ctx}/dc/house_manage.jsp?estateId=${estateId}&buildingId=${buildingId}&unitId=${unitId}&houseId=${houseId}";
    }
</script>