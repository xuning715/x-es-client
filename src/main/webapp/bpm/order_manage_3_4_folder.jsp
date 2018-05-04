<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@include file="/common/session.jsp" %>
<c:set var="userId" value="${param.userId}" />
<c:set var="orderId" value="${param.orderId}" />
<c:set var="buildingId" value="${param.buildingId}" />
<c:set var="unitId" value="${param.unitId}" />
<c:set var="houseId" value="${param.houseId}" />
<c:set var="sampleId" value="${param.sampleId}" />
<c:set var="orderValuatorDept" value="${param.orderValuatorDept}" />
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="initial-scale=1.0, minimum-scale=1.0, maximum-scale=2.0, user-scalable=no, width=device-width">
    <title>报单</title>
    <link rel="stylesheet" href="${ctx}/css/default.css"/>
    <script type="text/javascript" src="${ctx}/dwr/engine.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/util.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/interface/OrderService.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/interface/EstateService.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/interface/BuildingService.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/interface/UnitService.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/interface/HouseService.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/interface/TemplateService.js"></script>
    <script type="text/javascript" src="${ctx}/js/loading.js"></script>
</head>
<body>
<form style="text-align: left; border: 0px;">
    <input type="hidden" id="orderId" name="orderId" value="${orderId}" />
    <input type="hidden" id="buildingId" name="buildingId" value="${buildingId}" />
    <input type="hidden" id="unitId" name="unitId" value="${unitId}" />
    <input type="hidden" id="houseId" name="houseId" value="${houseId}" />
    <input type="hidden" id="sampleId" name="houseId" value="${sampleId}" />
    <table id="imageTable" border="0" cellspacing="5" cellpadding="5" style="width:100%; font-size: 15px;">
    </table>
</form>
</body>
</html>
<script type="text/javascript">
    var deptImage = new DeptImage();
    deptImage.imageDept = "${orderValuatorDept}";
    OrderService.selectOrderDeptImageTypeList(deptImage, function (list) {
        var html = "";
        for(var i = 0; i < list.length; i++) {
            deptImage = list[i];
            if (i % 5 == 0) {
                html += "<tr>"
            }
            html += "<td align='center' onclick=\"orderImage('" + deptImage.imageTypeId + "')\">"
            html += "<p style='width:60px;height:60px;background-image: url(${ctx}/images/folder.png);'><br><br><br>" + deptImage.imageTypeName + "</p>&nbsp;&nbsp;";
            html += "</td>"
            if (i % 5 == 4) {
                html += "</tr>"
            }
        }
        document.getElementById("imageTable").innerHTML = html;
    });

    function orderImage(imageTypeId) {
        location = "${ctx}/bpm/order_manage_3_4_folder_image.jsp?orderId=${orderId}&orderValuatorDept=${orderValuatorDept}&imageTypeId=" + imageTypeId;
    }
</script>