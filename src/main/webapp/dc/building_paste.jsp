<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="/common/session.jsp"%>
<c:set var="estateId" value="${param.estateId}" />
<c:set var="buildingId" value="${param.buildingId}" />
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="initial-scale=1.0, minimum-scale=1.0, maximum-scale=2.0, user-scalable=no, width=device-width">
    <title>楼栋管理</title>
    <link rel="stylesheet" href="${ctx}/css/default.css"/>
    <link rel="stylesheet" href="${ctx}/css/xtable.css"/>
    <link rel="stylesheet" href="${ctx}/css/tabs-vertical.css"/>
    <script type="text/javascript" src="${ctx}/js/tabs-vertical.js"></script>
    <script type="text/javascript" src="${ctx}/js/validator.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/engine.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/util.js"></script>
    <script type="text/javascript" src="${ctx}/js/loading.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/interface/BuildingService.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/interface/HouseService.js"></script>
</head>
<body>
<%--<%@include file="/home/logo.jsp"%>--%>
<div id="tabs-vertical" class="tabs-vertical" title="0">
    <ul>
        <li>
            <a class="tab-active" href="#">楼栋</a>
        </li>
    </ul>
    <div class="tabs-content-placeholder" style="height:500px">
        <div class="tab-content-active" style="height:415px">
            <form id="buildingForm" name="buildingForm" method="post">
                    <p>
                        <input type="hidden" id="estateId" name="estateId" value="${estateId}" />
                        <input type="hidden" id="buildingId" name="buildingId" value="${buildingId}" />
                        <input type="text" id="buildingName" name="buildingName" placeholder="楼栋名称" required="true"/>
                    </p>
                    <p>
                        <input type="text" id="buildingPeriod" name="buildingPeriod" placeholder="建成年代" pattern="integer" required="true"/>
                    </p>
                    <p>
                        <img src="${ctx}/images/common/button_paste.jpg" title="粘贴楼栋" style="cursor:pointer" onclick="insertDuplicateBuildingUnitHouse()"/>
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
    selectBuildingList();
    function selectBuildingList(){
        var building = new Building();
        building.buildingId = "${buildingId}";
        BuildingService.selectBuildingList(building, callbackSelectBuildingList);
    }
    function callbackSelectBuildingList(list){
        var building = list[0];
        setModelToForm(building);
    }
    function insertDuplicateBuildingUnitHouse(){
        if(confirm("确定复制并粘贴该楼栋、单元以及相关房间")){
            if(validate($("buildingForm"))){
                var building = dwr.util.getFormValues("buildingForm");
                HouseService.insertDuplicateBuildingUnitHouse(building, callback);
            }
        }
    }
    function callback() {
        location = "${ctx}/dc/building_list.jsp?estateId=${estateId}";
    }
</script>