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
    <title>单元管理</title>
    <link rel="stylesheet" href="${ctx}/css/default.css"/>
    <link rel="stylesheet" href="${ctx}/css/xtable.css"/>
    <link rel="stylesheet" href="${ctx}/css/tabs-vertical.css"/>
    <script type="text/javascript" src="${ctx}/js/tabs-vertical.js"></script>
    <script type="text/javascript" src="${ctx}/js/validator.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/engine.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/util.js"></script>
    <script type="text/javascript" src="${ctx}/js/loading.js"></script>
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
        <li id="li31">
            <a href="#">住宅单元</a>
        </li>
        <li id="li32">
            <a href="#">商业单元</a>
        </li>
    </ul>
    <div class="tabs-content-placeholder" style="height:500px">
        <div class="tab-content-active">
            <form id="unitForm" name="unitForm" method="post">
                    <p>
                        <select id="houseMatrixGroupId" name="houseMatrixGroupId" placeholder="房间号规则" required="true">
                            <option value="">选择房间号规则</option>
                        </select>
                    </p>
                    <p>
                        <input type="hidden" id="buildingId" name="buildingId" value="${buildingId}" />
                        <input type="hidden" id="unitId" name="unitId" value="${unitId}" />
                        <input type="text" id="unitName" name="unitName" placeholder="单元名称" required="true" />
                    </p>
                    <p>
                        <input type="text" id="unitY" name="unitY" placeholder="单元楼层" required="true" />
                    </p>
                    <p>
                        <input type="text" id="unitX" name="unitX" placeholder="单元户数" required="true" />
                    </p>
                    <p>
                        <img src="${ctx}/images/common/button_save.jpg" title="保存单元" style="cursor:pointer" onclick="submitUnitHouse()"/>
                        <img src="${ctx}/images/common/button_delete.jpg" title="删除单元" style="cursor:pointer" onclick="deleteUnit()"/>
                        <img src="${ctx}/images/common/button_copy.jpg" title="复制单元" style="cursor:pointer" onclick="location='${ctx}/dc/unit_paste.jsp?estateId=${estateId}&buildingId=${buildingId}&unitId=${unitId}'"/>
                        <img src="${ctx}/images/common/button_back.jpg" title="返回" style="cursor:pointer" onclick="callback()"/>
                    </p>
            </form>
        </div>
        <div style="height:500px">
            <iframe id="unitFrame31" width="100%" height="520" frameborder="0">
            </iframe>
        </div>
        <div style="height:500px">
            <iframe id="unitFrame32" width="100%" height="520" frameborder="0">
            </iframe>
        </div>
    </div>
</div>
</body>
</html>
<script type="text/javascript">
    if("${unitId}".length > 0){
        initTab();
        selectUnitList();
    }
    function selectUnitList(){
        var unit = new Unit();
        unit.unitId = "${unitId}";
        UnitService.selectUnitList(unit, callbackSelectUnitList);
    }
    function callbackSelectUnitList(list){
        var unit = list[0];
        setModelToForm(unit);
        $("li31").onclick = function () {
            $("unitFrame31").src = "${ctx}/template/template_value_map.jsp?fkId=${unitId}&fkType=3&templateId=31";
        }
        $("li32").onclick = function () {
            $("unitFrame32").src = "${ctx}/template/template_value_map.jsp?fkId=${unitId}&fkType=3&templateId=32";
        }
    }
    selectHouseMatrixGroupList();
    function selectHouseMatrixGroupList() {
        var houseMatrixGroup = new HouseMatrixGroup();
        HouseService.selectHouseMatrixGroupList(houseMatrixGroup, callbackSelectHouseMatrixGroupList);
    }
    function callbackSelectHouseMatrixGroupList(list) {
        dwr.util.addOptions("houseMatrixGroupId", list, "houseMatrixGroupId", "houseMatrixGroupName");
        //getUnit(dwr.util.getValue("unitId"));
    }
    //function getUnit(unitId){
        //if(unitId){
            //var unit = new Unit();
            //unit.buildingId = dwr.util.getValue("buildingId");
            //unit.unitId = unitId;
            //UnitService.selectUnitList(unit, callbackSelectUnitList);
        //}
    //}
    //function callbackSelectUnitList(list){
        //if(list.length > 0){
            //var unit = list[0];
            //setModelToForm(unit);
        //}
    //}
    function submitUnitHouse(){
        var unitId = "${unitId}";
        if(unitId) {
            updateUnit();
        } else {
            insertUnitHouse();
        }
    }
    function insertUnitHouse(){
        if(validate($("unitForm"))){
            var unit = dwr.util.getFormValues("unitForm");
            var houseMatrix = new HouseMatrix();
            houseMatrix.houseMatrixGroupId = dwr.util.getValue("houseMatrixGroupId");
            houseMatrix.houseMatrixCodeX = dwr.util.getValue("unitX");
            houseMatrix.houseMatrixCodeY = dwr.util.getValue("unitY");
            HouseService.insertUnitHouse(unit, houseMatrix, callback);
        }
    }
    function updateUnit(){
        if(confirm("确定修改单元")){
            if(dwr.util.getValue("unitName")){
                var unit = dwr.util.getFormValues("unitForm");
                UnitService.updateUnit(unit, callback);
            }
        }
    }
    function deleteUnit(){
        if(confirm("确定删除单元以及相关全部属性（有房间的单元不能删除）")){
            var unitId = "${unitId}";
            if(!unitId){
                alert("请选择要删除的单元");
                return false;
            }
            var unit = new Unit();
            unit.unitId = unitId;
            UnitService.deleteUnit(unit, callback);
        }
    }
    function callback(){
        location = "${ctx}/dc/unit_list.jsp?estateId=${estateId}&buildingId=${buildingId}&unitId=${unitId}";
    }
</script>