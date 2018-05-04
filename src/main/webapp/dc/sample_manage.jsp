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
        <li id="li41">
            <a href="#">样点属性</a>
        </li>
        <!--li>
            <a href="#">样点户型</a>
        </li-->
        <li id="li42">
            <a href="#">特殊描述</a>
        </li>
        <li id="li43">
            <a href="#">历史评估</a>
        </li>
        <li id="li44">
            <a href="#">历史租金</a>
        </li>
        <li id="li45">
            <a href="#">商业样点</a>
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
                        <img src="${ctx}/images/common/button_save.jpg" title="保存样点" style="cursor:pointer" onclick="submitSample()"/>
                        <img src="${ctx}/images/common/button_delete.jpg" title="删除样点" style="cursor:pointer" onclick="deleteSample()"/>
                        <img src="${ctx}/images/common/button_copy.jpg" title="复制" style="cursor:pointer" onclick="location='${ctx}/dc/sample_paste.jsp?estateId=${estateId}&sampleId=${sampleId}'"/>
                        <img src="${ctx}/images/common/button_value.jpg" title="赋值" style="cursor:pointer" onclick="location='${ctx}/dc/sample_value_manage.jsp?estateId=${estateId}&sampleId=${sampleId}'"/>
                        <img src="${ctx}/images/common/button_back.jpg" title="返回" style="cursor:pointer" onclick="callback()"/>
                    </p>
            </form>
        </div>
        <div style="height:500px">
            <iframe id="sampleFrame41" src="" width="100%" height="520" frameborder="0" scrolling="yes">
            </iframe>
        </div>
        <!--div style="height:500px">
            <iframe src="${ctx}/template/template_value_list.jsp?fkId=${sampleId}&fkType=5&templateId=46" width="100%" height="520" frameborder="0">
            </iframe>
        </div-->
        <div style="height:500px">
            <iframe id="sampleFrame42" src="" width="100%" height="520" frameborder="0" scrolling="yes">
            </iframe>
        </div>
        <div style="height:500px">
            <iframe id="sampleFrame43" src="" width="100%" height="520" frameborder="0" scrolling="yes">
            </iframe>
        </div>
        <div style="height:500px">
            <iframe id="sampleFrame44" src="" width="100%" height="520" frameborder="0" scrolling="yes">
            </iframe>
        </div>
        <div style="height:500px">
            <iframe id="sampleFrame45" src="" width="100%" height="520" frameborder="0" scrolling="yes">
            </iframe>
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
        $("li41").onclick = function () {
            $("sampleFrame41").src = "${ctx}/template/template_value_map.jsp?fkId=${sampleId}&fkType=5&templateId=41";
        }
        $("li42").onclick = function () {
            $("sampleFrame42").src = "${ctx}/template/template_value_list.jsp?fkId=${sampleId}&fkType=5&templateId=42";
        }
        $("li43").onclick = function () {
            $("sampleFrame43").src = "${ctx}/template/template_value_list.jsp?fkId=${sampleId}&fkType=5&templateId=43";
        }
        $("li44").onclick = function () {
            $("sampleFrame44").src = "${ctx}/template/template_value_list.jsp?fkId=${sampleId}&fkType=5&templateId=44";
        }
        $("li45").onclick = function () {
            $("sampleFrame45").src = "${ctx}/template/template_value_map.jsp?fkId=${sampleId}&fkType=5&templateId=45";
        }
    }
    function submitSample(){
        var sampleId = "${sampleId}";
        if(sampleId) {
            updateSample();
        } else {
            insertSample();
        }
    }
    function insertSample(){
        if(validate($("sampleForm"))){
            var sample = dwr.util.getFormValues("sampleForm");
            SampleService.insertSample(sample, callbackInsertSample);
        }
    }

    function updateSample(){
        if(validate($("sampleForm"))){
            var sample = dwr.util.getFormValues("sampleForm");
            SampleService.updateSample(sample, callbackUpdateSample);
        }
    }
    function deleteSample(){
        if(confirm("确定删除样点以及相关全部属性（有房间的样点不能删除）")){
            var sampleId = "${sampleId}";
            if(!sampleId){
                alert("请选择要删除的样点");
                return false;
            }
            var sample = new Sample();
            sample.sampleId = sampleId;
            SampleService.deleteSample(sample, callback);
        }
    }
    function callbackInsertSample(sample) {
        alert("保存成功");
        location = "${ctx}/dc/sample_manage.jsp?estateId=${estateId}&sampleId=" + sample.sampleId;
    }
    function callbackUpdateSample(flag) {
        alert("保存成功");
        callback();
    }
    function callback() {
        location = "${ctx}/dc/sample_list.jsp?estateId=${estateId}";
    }
</script>