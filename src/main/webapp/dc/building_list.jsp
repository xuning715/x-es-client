<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="/common/session.jsp"%>
<c:set var="estateId" value="${param.estateId}" />
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="initial-scale=1.0, minimum-scale=1.0, maximum-scale=2.0, user-scalable=no, width=device-width">
    <title>楼栋管理</title>
    <link rel="stylesheet" href="${ctx}/css/default.css"/>
    <link rel="stylesheet" href="${ctx}/css/xtable.css"/>
    <script type="text/javascript" src="${ctx}/js/xtable.js"></script>
    <script type="text/javascript" src="${ctx}/js/validator.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/engine.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/util.js"></script>
    <script type="text/javascript" src="${ctx}/js/loading.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/interface/BuildingService.js"></script>
</head>
<body>
<%--<%@include file="/home/logo.jsp"%>--%>
<form id="buildingForm" name="buildingForm" method="post">
        <p>
            <input type="hidden" id="estateId" name="estateId" value="${estateId}" />
            <input type="hidden" id="buildingId" name="buildingId" />
            <input type="text" id="buildingName" name="buildingName" placeholder="楼栋名称" required="true" />
        </p>
        <p>
            <input type="text" id="buildingPeriod" name="buildingPeriod" placeholder="建成年代" required="true" />
        </p>
        <p>
            <img src="${ctx}/images/common/button_insert.jpg" title="添加楼栋" style="cursor:pointer" onclick="insertBuilding()"/>
            <img src="${ctx}/images/common/button_back.jpg" title="返回" style="cursor:pointer" onclick="callback()"/>
        </p>
    <SCRIPT LANGUAGE="JavaScript" type="">
        var buildingThead = new Array(
                new XThead("选择", "radio"),
                new XThead("楼栋名称"),
                new XThead("建成年代"),
                new XThead("操作")
        );

        var buildingXTable = new XTable("building", buildingThead, true);

        buildingXTable.XTbodyArray = function (model) {
            var array = new Array(
                    new XTbody("building", model.buildingId, "radio", "onclick='setBuilding(this)'", model),
                    new XTbody("building", model.buildingName, null, null, null, "center"),
                    new XTbody("building", model.buildingPeriod, null, null, null, "center"),
                    new XTbody("building", "<a href='${ctx}/dc/building_manage.jsp?estateId=${estateId}&buildingId=" + model.buildingId + "'>楼栋</a> | <a href='${ctx}/dc/unit_list.jsp?estateId=${estateId}&buildingId=" + model.buildingId + "'>单元</a>", null, null, null, "center")
            );

            return array;
        }
        buildingXTable.getXList = function (page){
            var building = new Building();
            building.estateId = "${estateId}";
            BuildingService.selectBuildingList(building, function(list){buildingXTable.addTable(list);});
        }
    </SCRIPT>
</form>
</body>
</html>
<script type="text/javascript">
    buildingXTable.goPage(1);
    function setBuilding(obj){
        var building = obj.parentElement.parentElement.model;
        setModelToForm(building);
    }
    function insertBuilding(){
        if(validate($("buildingForm"))){
            var building = dwr.util.getFormValues("buildingForm");
            building.buildingId = "";
            BuildingService.insertBuilding(building, callbackInsertBuilding);
        }
    }
    function callbackInsertBuilding() {
        buildingXTable.goPage(1);
    }
    function callback() {
        location = "${ctx}/dc/estate_list.jsp?estateId=${estateId}";
    }
</script>