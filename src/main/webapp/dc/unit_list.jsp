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
    <link rel="stylesheet" href="${ctx}/css/xtable.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/css/cbpFWTabs.css">
    <script type="text/javascript" src="${ctx}/js/cbpFWTabs.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/engine.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/util.js"></script>
    <script type="text/javascript" src="${ctx}/js/loading.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/interface/BuildingService.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/interface/UnitService.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/interface/HouseService.js"></script>
</head>
<body style="overflow-x: hidden">
<%--<%@include file="/home/logo.jsp"%>--%>
<img src="${ctx}/images/common/button_insert.jpg" title="添加单元" style="cursor:pointer" onclick="location='${ctx}/dc/unit_manage.jsp?estateId=${estateId}&buildingId=${buildingId}'"/>
<img src="${ctx}/images/common/button_back.jpg" title="返回" style="cursor:pointer" onclick="callback()"/>
<br/><br/>
<form id="houseForm" name="houseForm" action="${ctx}/dc/house_batch_manage.jsp" method="post">
<input type="hidden" id="estateId" name="estateId" value="${estateId}" />
<input type="hidden" id="buildingId" name="buildingId" value="${buildingId}" />
<input type="hidden" id="unitId" name="unitId" value="${unitId}" />
<input type="hidden" id="houseIds" name="houseIds" />
<section style="width:99%">
	<div class="tabs tabs-style-circlefill">
		<div id="buildingName" align="center">
		</div>
		<nav>
			<ul id="liUl">
			</ul>
		</nav>
		<div id="sectionDiv" class="content-wrap">
		</div>
	</div>
</section>
</form>
</body>
</html>
<script>
selectBuilding();
function selectBuilding(){
    var building = new Building();
    building.estateId = "${estateId}";
    building.buildingId = "${buildingId}";
    BuildingService.selectBuildingList(building, callbackSelectBuildingList);
}
function callbackSelectBuildingList(list) {
    building = list[0];
    dwr.util.setValue("buildingName", building.buildingName);
}

selectUnitList();
function selectUnitList(){
    var unit = new Unit();
    unit.buildingId = "${buildingId}";
    UnitService.selectUnitList(unit, callbackSelectUnitList);
}

function callbackSelectUnitList(list){
    var unit;
    var idx = 0;
    for(var i = 0; i < list.length; i++){
        unit = list[i];
        //单元名
        var li = document.createElement("li");
        if("${unitId}" == unit.unitId){
            idx = i;
        }
        li.innerHTML = "<a href='#'><span onclick=location='${ctx}/dc/unit_manage.jsp?estateId=${estateId}&buildingId=${buildingId}&unitId=" + unit.unitId + "'>" + unit.unitName + "</span></a>";
        $("liUl").appendChild(li);
        //单元房间
        var section = document.createElement("section");
        section.id = "section" + unit.unitId;
        section.style.overflow = "auto";
        $("sectionDiv").appendChild(section);
        var house = new House();
        house.unitId = unit.unitId;
        HouseService.selectUnitHouseList(house, callbackSelectUnitHouseList);
    }
    [].slice.call(document.querySelectorAll('.tabs')).forEach( function( el ) {
        var cbpFWTabs = new CBPFWTabs( el );
        cbpFWTabs._show(idx);
    });
}

function callbackSelectUnitHouseList(list){
    if(list.length > 0){
        var unitId = list[0][0].unitId;
        var section = $("section" + unitId);
        var table = document.createElement("table");
        section.appendChild(table);
        var tr = document.createElement("tr");
        table.appendChild(tr);
        var td = document.createElement("td");
        td.style.textAlign = "left";
        var html = "";
        html += "<input type=checkbox onclick='setAll(this)'>";
        td.innerHTML = html;
        tr.appendChild(td);
        td = document.createElement("td");
        td.style.textAlign = "right";
        td.colSpan = list.length - 1;
        html = "";
        html += "<img src='${ctx}/images/common/button_batch.jpg' title='批量处理' onclick=\"batchHouse('" + unitId + "', this)\" /> ";
        html += "<img src='${ctx}/images/common/button_insert_house.jpg' title='添加房间' onclick=location='${ctx}/dc/house_manage.jsp?estateId=${estateId}&buildingId=${buildingId}&unitId=" + unitId + "' />";
        td.innerHTML = html;
        tr.appendChild(td);
        tr = document.createElement("TR");
        table.appendChild(tr);
        var houseList;
        for(var i = 0; i < list.length; i++) {
            td = document.createElement("TD");
            td.style.verticalAlign = "bottom";
            tr.appendChild(td);

            var houseTable = document.createElement("TABLE");
            td.appendChild(houseTable);

            var houseThead = document.createElement("THEAD");
            houseThead.className = "xThead";
            houseTable.appendChild(houseThead);

            var houseTheadTr = document.createElement("TR");
            houseThead.appendChild(houseTheadTr);

            var houseTheadTd = document.createElement("TD");
            houseTheadTd.innerHTML = "<input type='checkbox' onchange='selectAll(this)'>";
            houseTheadTr.appendChild(houseTheadTd);
            houseTheadTd = document.createElement("TD");
            houseTheadTd.innerText = "房号";
            houseTheadTr.appendChild(houseTheadTd);
            //houseTheadTd = document.createElement("TD");
            //houseTheadTd.innerText = "楼层";
            //houseTheadTr.appendChild(houseTheadTd);
            //houseTheadTd = document.createElement("TD");
            //houseTheadTd.innerText = "状态";
            //houseTheadTr.appendChild(houseTheadTd);
            //houseTheadTd = document.createElement("TD");
            //houseTheadTd.innerText = "操作";
            //houseTheadTr.appendChild(houseTheadTd);

            var houseTbody = document.createElement("TBODY");
            houseTbody.className = "xTbody";
            houseTable.appendChild(houseTbody);

            houseList = list[i];
            var house;
            for(var j = 0; j < houseList.length; j++){
                house = houseList[j];
                var houseTr = document.createElement("TR");
                if(j % 2 == 0){
                    houseTr.style.backgroundColor = "#FFFFFF";
                }
                else{
                    houseTr.style.backgroundColor = "#DFECFD";
                }
                houseTbody.appendChild(houseTr);

                var houseTd = document.createElement("TD");
                houseTd.style.textAlign = "center";
                houseTd.innerHTML = "<input type='checkbox' value='" + house.houseId + "'>";
                houseTr.appendChild(houseTd);
                houseTd = document.createElement("TD");
                houseTd.style.textAlign = "center";
                var color = house.houseState == 1 ? "#2CC185" : house.houseState == 0 ? "#FF171A" : "";
                houseTd.innerHTML = "<a href='${ctx}/dc/house_manage.jsp?estateId=${estateId}&buildingId=${buildingId}&unitId=" + unitId + "&houseId=" + house.houseId + "' style='color:" + color + "'>" + house.houseCode + "</a>";
                houseTr.appendChild(houseTd);
                //houseTd = document.createElement("TD");
                //houseTd.style.textAlign = "center";
                //houseTd.innerText = house.houseY;
                //houseTr.appendChild(houseTd);
                //houseTd = document.createElement("TD");
                //houseTd.style.textAlign = "center";
                //houseTd.style.color = house.houseState == 1 ? "#2CC185" : house.houseState == 0 ? "#FF171A" : "";
                //houseTd.innerText = house.houseState == 1 ? "有效" : house.houseState == 0 ? "无效" : "";
                //houseTr.appendChild(houseTd);
                //houseTd = document.createElement("TD");
                //houseTd.style.textAlign = "center";
                //houseTd.innerHTML = "<a onclick=deleteHouse('" + house.houseId + "')>【删除】</a>";
                houseTr.appendChild(houseTd);
            }
            var houseTfoot = document.createElement("TFOOT");
            houseTfoot.className = "xThead";
            houseTable.appendChild(houseTfoot);

            var houseTfootTr = document.createElement("TR");
            houseTfoot.appendChild(houseTfootTr);

            var houseTfootTd = document.createElement("TD");
            houseTfootTd.colSpan = 4;
            houseTfootTd.innerText = i + 1;
            houseTfootTr.appendChild(houseTfootTd);
        }
    }
}

function selectAll(input){
    var tbody = input.parentElement.parentElement.parentElement.parentElement.children[1];
    for(var i = 0; i < tbody.children.length; i++){
        tbody.children[i].children[0].children[0].checked = input.checked;
    }
}

function setAll(obj){
    var tr = obj.parentElement.parentElement.parentElement.children[1];
    var tds = tr.children;
    var tbody;
    var trs;
    for(var i = 0; i < tds.length; i++){
        tbody = tds[i].children[0].children[1];
        trs = tbody.children;
        for(var j = 0; j < trs.length; j++){
            trs[j].children[0].children[0].checked = obj.checked;
        }
    }
}

function getAll(obj){
    var tr = obj.parentElement.parentElement.parentElement.children[1];
    var tds = tr.children;
    var tbody;
    var trs;
    var houseIds = "";
    for(var i = 0; i < tds.length; i++){
        tbody = tds[i].children[0].children[1];
        trs = tbody.children;
        for(var j = 0; j < trs.length; j++){
            if(trs[j].children[0].children[0].checked){
                houseIds += trs[j].children[0].children[0].value + ",";
            }
        }
    }
    if(houseIds.length > 0){
        houseIds = houseIds.substring(0, houseIds.length - 1);
    }
    return houseIds;
}

function batchHouse(unitId, obj){
    var houseIds = getAll(obj);
    if(houseIds.length > 0){
        dwr.util.setValue("unitId", unitId);
        dwr.util.setValue("houseIds", houseIds);
        $("houseForm").submit();
        //location = "${ctx}/dc/house_batch_manage.jsp?estateId=${estateId}&buildingId=${buildingId}&unitId=" + unitId + "&houseIds=" + houseIds;
    }
}

function callback(){
    location = "${ctx}/dc/building_list.jsp?estateId=${estateId}";
}
</script>


