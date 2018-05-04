<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="/common/session.jsp"%>
<c:set var="estateId" value="${param.estateId}" />
<c:set var="sampleId" value="${param.sampleId}" />
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
    <script type="text/javascript" src="${ctx}/dwr/interface/HouseService.js"></script>
</head>
<body>
<%--<%@include file="/home/logo.jsp"%>--%>
<form id="houseForm" name="houseForm" action="${ctx}/dc/house_batch_manage.jsp" method="post">
        <p>
            <input type="hidden" id="estateId" name="estateId" value="${estateId}" />
            <input type="hidden" id="sampleId" name="sampleId" value="${sampleId}" />
            <input type="hidden" id="houseIds" name="houseIds" />
            <input type="text" id="houseCode" name="houseCode" placeholder="房间号" required="true" />
        </p>
        <p>
            <img src="${ctx}/images/common/button_join.jpg" title="挂接" style="cursor:pointer" onclick="batchHouse()"/>
            <img src="${ctx}/images/common/button_back.jpg" title="返回" style="cursor:pointer" onclick="callback()"/>
        </p>
        <SCRIPT LANGUAGE="JavaScript" type="">
            var houseThead = new Array(
                    new XThead("", "checkbox"),
                    new XThead("楼栋名称"),
                    new XThead("单元名称"),
                    new XThead("房间号"),
                    new XThead("房间状态")
            );

            var houseXTable = new XTable("house", houseThead, true);

            houseXTable.XTbodyArray = function (model) {
                var array = new Array(
                        new XTbody("house", model.houseId, "checkbox", "onclick='setHouse(this)'", model),
                        new XTbody("house", "<a href='${ctx}/dc/building_manage.jsp?estateId=${estateId}&buildingId=" + model.unit.building.buildingId + "'>" + model.unit.building.buildingName + "</a>", null, null, null, "center"),
                        new XTbody("house", "<a href='${ctx}/dc/unit_manage.jsp?estateId=${estateId}&buildingId=" + model.unit.building.buildingId + "&unitId=" + model.unit.unitId + "'>" + model.unit.unitName + "</a>", null, null, null, "center"),
                        new XTbody("house", "<a href='${ctx}/dc/house_manage.jsp?estateId=${estateId}&buildingId=" + model.unit.building.buildingId + "&unitId=" + model.unit.unitId + "&houseId=" + model.houseId + "'>" + model.houseCode + "</a>", null, null, null, "center"),
                        new XTbody("house", model.houseState == 1 ? "<font color='#2CC185'>有效</font>" : model.houseState == 0 ? "<font color='#FF171A'>无效</font>" : "", null, null, null, "center")
                );

                return array;
            }
            houseXTable.getXList = function (page){
                var house = new House();
                house.sampleId = "${sampleId}";
                HouseService.selectHouseList(house, function(list){houseXTable.addTable(list);});
            }
        </SCRIPT>
</form>
</body>
</html>
<script type="text/javascript">
    houseXTable.goPage(1);
    function batchHouse(){
        var houseIds = houseXTable.getCheckBoxValue();
        if(houseIds){
            dwr.util.setValue("houseIds", houseIds);
            $("houseForm").submit();
            //location = "${ctx}/dc/house_batch_manage.jsp?estateId=${estateId}&sampleId=${sampleId}&houseIds=" + houseIds;
        }
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
        location = "${ctx}/dc/sample_list.jsp?estateId=${estateId}&sampleId=${sampleId}";
    }
</script>