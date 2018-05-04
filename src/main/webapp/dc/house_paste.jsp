<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="/common/session.jsp"%>
<c:set var="estateId" value="${param.estateId}" />
<c:set var="buildingId" value="${param.buildingId}" />
<c:set var="unitId" value="${param.unitId}" />
<c:set var="houseId" value="${param.houseId}" />
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="initial-scale=1.0, minimum-scale=1.0, maximum-scale=2.0, user-scalable=no, width=device-width">
    <title>房间复制</title>
    <link rel="stylesheet" href="${ctx}/css/default.css"/>
    <link rel="stylesheet" href="${ctx}/css/xtable.css"/>
    <link rel="stylesheet" href="${ctx}/css/tabs-vertical.css"/>
    <script type="text/javascript" src="${ctx}/js/tabs-vertical.js"></script>
    <script type="text/javascript" src="${ctx}/js/validator.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/engine.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/util.js"></script>
    <script type="text/javascript" src="${ctx}/js/loading.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/interface/BuildingService.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/interface/UnitService.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/interface/HouseService.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/interface/SampleService.js"></script>
</head>
<body>
<%--<%@include file="/home/logo.jsp"%>--%>
<div id="tabs-vertical" class="tabs-vertical" title="0">
    <ul>
        <li>
            <a class="tab-active" href="#">复制到</a>
        </li>
    </ul>
    <div class="tabs-content-placeholder" style="height:600px">
        <div class="tab-content-active">
            <form id="houseForm" name="houseForm" method="post">
                    <p>
                        <select id="buildingId" name="buildingId" placeholder="楼栋" required="true" onchange="selectUnitList()">
                            <option value="">楼栋</option>
                        </select>
                        <select id="unitId" name="unitId" placeholder="单元" required="true">
                            <option value="">单元</option>
                        </select>
                        <select id="sampleId" name="sampleId" placeholder="样点" required="true">
                            <option value="">挂接样点</option>
                        </select>
                        <select id="houseState" name="houseState">
                            <option value="0">无效</option>
                            <option value="1">有效</option>
                        </select>
                    </p>
                    <p>
                        <input type="text" id="houseCode" name="houseCode" placeholder="房间号" required="true" />
                    </p>
                     <p>
                        <input type="text" id="houseY" name="houseY" placeholder="楼层" pattern="integer" required="true" />
                    </p>
                    <p>
                        <input type="text" id="houseX" name="houseX" placeholder="第几户" pattern="integer" required="true" />
                    </p>
                    <p>
                        <input type="hidden" id="houseId" name="houseId" value="${houseId}" />
                        <img src="${ctx}/images/common/button_paste.jpg" title="粘贴" style="cursor:pointer" onclick="insertDuplicateHouse()"/>
                        <img src="${ctx}/images/common/button_back.jpg" title="返回" style="cursor:pointer" onclick="callback()"/>
                    </p>
            </form>
        </div>
    </div>
</div>
</body>
</html>
<script type="text/javascript">
    if("${houseId}".length > 0){
        initTab();
    }
    selectBuildingList();

    function selectBuildingList(){
        var building = new Building();
        building.estateId = "${estateId}";
        BuildingService.selectBuildingList(building, callbackSelectBuildingList);
    }
    function callbackSelectBuildingList(list){
        dwr.util.addOptions("buildingId", list, "buildingId", "buildingName");
        selectUnitList();
    }
    function selectUnitList(){
        var unit = new Unit();
        unit.buildingId = "${buildingId}";
        UnitService.selectUnitList(unit, callbackSelectUnitList);
    }
    function callbackSelectUnitList(list){
        dwr.util.removeAllOptions("unitId");
        var option = new Option("单元", "");
        $("unitId").add(option);
        dwr.util.addOptions("unitId", list, "unitId", "unitName");
        selectSampleList();
    }
    function selectSampleList(){
        var sample = new Sample();
        sample.estateId = "${estateId}";
        SampleService.selectSampleList(sample, callbackSelectSampleList);
    }
    function callbackSelectSampleList(list){
        dwr.util.addOptions("sampleId", list, "sampleId", "sampleName");
        selectHouseList();
    }
    function selectHouseList(){
        var house = new House();
        house.houseId = "${houseId}";
        HouseService.selectHouseList(house, callbackSelectHouseList);
    }
    function callbackSelectHouseList(list){
        var house = list[0];
        setModelToForm(house);
    }
    function insertDuplicateHouse(){
        if(validate($("houseForm"))){
            var house = dwr.util.getFormValues("houseForm");
            HouseService.insertDuplicateHouse(house, callback);
        }
    }

    function callback() {
        location = "${ctx}/dc/unit_list.jsp?estateId=${estateId}&buildingId=${buildingId}&unitId=${unitId}";
    }
</script>