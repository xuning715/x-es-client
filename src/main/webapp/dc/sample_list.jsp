<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="/common/session.jsp"%>
<c:set var="estateId" value="${param.estateId}" />
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="initial-scale=1.0, minimum-scale=1.0, maximum-scale=2.0, user-scalable=no, width=device-width">
    <title>样点管理</title>
    <link rel="stylesheet" href="${ctx}/css/default.css"/>
    <link rel="stylesheet" href="${ctx}/css/xtable.css"/>
    <script type="text/javascript" src="${ctx}/js/xtable.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/engine.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/util.js"></script>
    <script type="text/javascript" src="${ctx}/js/loading.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/interface/SampleService.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/interface/UseService.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/interface/PartService.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/interface/TemplateService.js"></script>
</head>
<body>
<%--<%@include file="/home/logo.jsp"%>--%>
<form id="sampleForm" name="sampleForm" action="${ctx}/dc/sample_batch_manage.jsp" method="post">
        <p>
            <select id="partId" name="partId">
                <option value="">区片</option>
            </select>
            <select id="useId" name="useId">
                <option value="">用途</option>
            </select>
        </p>
        <p>
            <input type="hidden" id="estateId" name="estateId" value="${estateId}" />
            <input type="hidden" id="sampleIds" name="sampleIds" />
            <input type="hidden" id="sampleState" name="sampleState" value="1" />
            <input type="text" id="sampleName" name="sampleName" placeholder="样点标签" />
        </p>
        <p>
            <input type="text" id="sampleCode" name="sampleCode" placeholder="样点编号" />
        </p>
        <p>
            <img src="${ctx}/images/common/button_select.jpg" title="查询" style="cursor:pointer" onclick="sampleXTable.goPage(1)"/>
            <img src="${ctx}/images/common/button_insert.jpg" title="添加" style="cursor:pointer" onclick="insertSample()"/>
            <!--img src="${ctx}/images/common/button_value.jpg" title="赋值" style="cursor:pointer" onclick="updateSampleList()"/-->
            <img src="${ctx}/images/common/button_back.jpg" title="返回" style="cursor:pointer" onclick="callback()"/>
        </p>
        <SCRIPT LANGUAGE="JavaScript" type="">
            var sampleThead = new Array(
                    new XThead("", "checkbox"),
                    new XThead("样点标签"),
                    new XThead("样点编号"),
                    new XThead("样点面积", "number"),
                    new XThead("区片"),
                    new XThead("用途"),
                    new XThead("评估值", "number"),
                    new XThead("评估时间"),
                    new XThead("操作")
            );

            var sampleXTable = new XTable("sample", sampleThead, true);

            sampleXTable.XTbodyArray = function (model) {
                var array = new Array(
                        new XTbody("sample", model.sampleId, "checkbox"),
                        new XTbody("sample", model.sampleName),
                        new XTbody("sample", model.sampleCode, null, null, null, "center"),
                        new XTbody("sample", model.sampleArea, null, null, null, "center"),
                        new XTbody("sample", model.part.partName, null, null, null, "center"),
                        new XTbody("sample", model.use.useName, null, null, null, "center"),
                        new XTbody("sample", model.sampleValue, null, null, null, "center"),
                        new XTbody("sample", model.sampleDate == null ? "" : new Date(model.sampleDate).Format("yyyy/MM/dd"), null, null, null, "center"),
                        new XTbody("sample", "<a href='${ctx}/dc/sample_manage.jsp?estateId=${estateId}&sampleId=" + model.sampleId + "'>样点</a> | <a href='${ctx}/dc/sample_house_list.jsp?estateId=${estateId}&sampleId=" + model.sampleId + "'>房间</a> | <a href='#' onclick=\"getSamplePhoto('" + model.sampleId + "')\">户型图</a>", null, null, null, "center")
                );

                return array;
            }
            sampleXTable.getXList = function (page){
                var sample = dwr.util.getFormValues("sampleForm");
                SampleService.selectSampleList(sample, function(list){sampleXTable.addTable(list);});
            }
        </SCRIPT>
</form>
</body>
</html>
<script type="text/javascript">
    sampleXTable.goPage(1);
    selectUseList();
    selectPartList();
    function selectUseList(){
        var use = new Use();
        UseService.selectUseList(use, callbackSelectUseList);
    }
    function callbackSelectUseList(list){
        dwr.util.addOptions("useId", list, "useId", "useName");
    }
    function selectPartList(){
        var part = new Part();
        PartService.selectPartList(part, callbackSelectPartList);
    }
    function callbackSelectPartList(list){
        dwr.util.addOptions("partId", list, "partId", "partName");
    }
    function insertSample(){
        location = "${ctx}/dc/sample_manage.jsp?estateId=${estateId}";
    }
    function updateSampleList(){
        var sampleIds = sampleXTable.getCheckBoxValue();
        if(!sampleIds){
            alert("请选择要赋值的样点");
            return false;
        }
        dwr.util.setValue("sampleIds", sampleIds);
        $("sampleForm").submit();
        //location = "${ctx}/dc/sample_batch_manage.jsp?estateId=${estateId}&sampleIds=" + sampleIds;
    }
    function getSamplePhoto(sampleId){
        var templateValue = new TemplateValue();
        templateValue.templateId = 41;
        templateValue.columnId = 23;
        var templateValueFk = new TemplateValueFk();
        templateValueFk.fkId = sampleId;
        templateValueFk.fkType = "5";
        TemplateService.selectTemplateValue(templateValue, templateValueFk, setTemplateValue);
    }
    function setTemplateValue(list){
        var length = list.length;
        if(length == 0){
            alert("没有户型图");
        } else {
            var templateValue = list[0];
            var photoArray = templateValue.columnValueStr.split(",");
            for(var i = 0; i < photoArray.length; i++){
                if(photoArray[i]){
                    window.open("${ctx}/template/template_value_photo.jsp?templateId=41&columnId=23&rowId=" +  templateValue.rowId + "&fkId=" +  templateValue.templateValueFk.fkId + "&fkType=" +  templateValue.templateValueFk.fkType + "&imgs=" +  templateValue.columnValueStr + "&img=" + photoArray[i]);
                }
            }
        }
    }
    function callback() {
        location = "${ctx}/dc/estate_list.jsp?estateId=${estateId}";
    }
</script>