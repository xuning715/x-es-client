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
    <link rel="stylesheet" href="${ctx}/css/xtable.css"/>
    <link rel="stylesheet" href="${ctx}/css/tabs-vertical.css"/>
    <script type="text/javascript" src="${ctx}/js/tabs-vertical.js"></script>
    <script type="text/javascript" src="${ctx}/js/validator.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/engine.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/util.js"></script>
    <script type="text/javascript" src="${ctx}/js/loading.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/interface/UseService.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/interface/PartService.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/interface/SampleService.js"></script>
</head>
<body>
<%--<%@include file="/home/logo.jsp"%>--%>
<div id="tabs-vertical" class="tabs-vertical" title="0">
    <ul>
        <li>
            <a class="tab-active" href="#">样点</a>
        </li>
    </ul>
    <div class="tabs-content-placeholder" style="height:500px">
        <div class="tab-content-active">
            <form id="sampleForm" name="sampleForm" method="post">
                    <p>
                        <select id="partId" name="partId">
                        </select>
                        <select id="useId" name="useId">
                        </select>
                    </p>
                    <p>
                        <input type="hidden" id="estateId" name="estateId" value="${estateId}" placeholder="楼盘" required="true" />
                        <input type="hidden" id="sampleId" name="sampleId" value="${sampleId}" />
                        <input type="hidden" id="sampleState" name="sampleState" value="1" />
                        <input type="text" id="sampleName" name="sampleName" placeholder="样点标签" required="true" />
                    </p>
                    <p>
                        <input type="text" id="sampleCode" name="sampleCode" placeholder="样点编号" required="true" />
                    </p>
                    <p>
                        <input type="text" id="sampleArea" name="sampleArea" placeholder="样点面积" pattern="integer" required="true" />
                    </p>
                    <p>
                        <img src="${ctx}/images/common/button_paste.jpg" title="粘贴" style="cursor:pointer" onclick="insertDuplicateSample()"/>
                        <img src="${ctx}/images/common/button_back.jpg" title="返回" style="cursor:pointer" onclick="callback()"/>
                    </p>
            </form>
        </div>
    </div>
</div>
</body>
</html>
<script type="text/javascript">
    selectUseList();
    if("${sampleId}".length > 0){
        initTab();
    }
    function selectUseList(){
        var use = new Use();
        UseService.selectUseList(use, callbackSelectUseList);
    }
    function callbackSelectUseList(list){
        dwr.util.addOptions("useId", list, "useId", "useName");
        selectPartList();
    }
    function selectPartList(){
        var part = new Part();
        PartService.selectPartList(part, callbackSelectPartList);
    }
    function callbackSelectPartList(list){
        dwr.util.addOptions("partId", list, "partId", "partName");
        if("${sampleId}".length > 0){
            selectSampleList();
        }
    }
    function selectSampleList(){
        var sample = new Sample();
        sample.sampleId = "${sampleId}";
        SampleService.selectSampleList(sample, callbackSelectSampleList);
    }
    function callbackSelectSampleList(list){
        var sample = list[0];
        setModelToForm(sample);
    }
    function insertDuplicateSample(){
        if(validate($("sampleForm"))){
            var sample = dwr.util.getFormValues("sampleForm");
            SampleService.insertDuplicateSample(sample, callback);
        }
    }

    function callback() {
        location = "${ctx}/dc/sample_list.jsp?estateId=${estateId}";
    }
</script>