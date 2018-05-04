<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="/common/session.jsp"%>
<c:set var="estateId" value="${param.estateId}" />
<c:set var="buildingId" value="${param.buildingId}" />
<c:set var="unitId" value="${param.unitId}" />
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="initial-scale=1.0, minimum-scale=1.0, maximum-scale=2.0, user-scalable=no, width=device-width">
    <title>单元复制</title>
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
</head>
<body>
<%--<%@include file="/home/logo.jsp"%>--%>
<div id="tabs-vertical" class="tabs-vertical" title="0">
    <ul>
        <li>
            <a class="tab-active" href="#">单元</a>
        </li>
    </ul>
    <div class="tabs-content-placeholder" style="height:400px">
        <div class="tab-content-active">
            <form id="unitForm" name="unitForm" method="post">
                    <p>
                        <select id="buildingId" name="buildingId">
                        </select>
                    </p>
                    <p>
                        <input type="hidden" id="buildingId" name="buildingId" value="${buildingId}" />
                        <input type="hidden" id="unitId" name="unitId" value="${unitId}" />
                        <input type="text" id="unitName" name="unitName" placeholder="单元名称" required="true" />
                    </p>
                    <p>
                        <input type="text" id="unitY" name="unitY" placeholder="单元楼层" pattern="integer" required="true" readonly/>
                    </p>
                    <p>
                        <input type="text" id="unitX" name="unitX" placeholder="单元户数" pattern="integer" required="true" readonly/>
                    </p>
                    <p>
                        <img src="${ctx}/images/common/button_paste.jpg" title="粘贴" style="cursor:pointer" onclick="insertUnitHouse()"/>
                        <img src="${ctx}/images/common/button_back.jpg" title="返回" style="cursor:pointer" onclick="callback()"/>
                    </p>
            </form>
        </div>
    </div>
</div>
</body>
</html>
<script type="text/javascript">
    if("${unitId}".length > 0){
        initTab();
    }
    selectBuildingList();
    function selectBuildingList() {
        var building = new Building();
        building.estateId = "${estateId}";
        BuildingService.selectBuildingList(building, callbackSelectBuildingList);
    }
    function callbackSelectBuildingList(list) {
        dwr.util.addOptions("buildingId", list, "buildingId", "buildingName");
        dwr.util.setValue("buildingId", "${buildingId}");
    }
    selectUnitList();
    function selectUnitList(){
        var unit = new Unit();
        unit.unitId = "${unitId}";
        UnitService.selectUnitList(unit, callbackSelectUnitList);
    }
    function callbackSelectUnitList(list){
        var unit = list[0];
        setModelToForm(unit);
    }
    function insertUnitHouse(){
        if(confirm("确定粘贴该单元以及相关房间")){
            if(validate($("unitForm"))){
                var unit = dwr.util.getFormValues("unitForm");
                HouseService.insertDuplicateUnitHouse(unit, callback);
            }
        }
    }

    function callback(unitId) {
        location = "${ctx}/dc/unit_list.jsp?estateId=${estateId}&buildingId=${buildingId}&unitId=" + unitId;
    }
</script>