<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@include file="/common/session.jsp" %>
<c:set var="userId" value="${param.userId}" />
<c:set var="orderId" value="${param.orderId}" />
<c:set var="imageTypeId" value="${param.imageTypeId}" />
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
    <fieldset>
        <legend>
            图片
        </legend>
        <div id="orderImagesDiv" style="text-align: center"></div>
    </fieldset>
</form>
</body>
</html>
<script type="text/javascript">
    var base64Codes = "";
    var orderImage = new OrderImage();
    orderImage.orderId = "${orderId}";
    orderImage.imageTypeId = "${imageTypeId}";
    OrderService.selectOrderImageList(orderImage, function (list) {
        for (var i = 0; i < list.length; i++) {
            orderImage = list[i];
            var img = document.createElement("img");
            img.src = "${ctx}/upload/photo/order/" + orderImage.imageTypeId + "/" + orderImage.orderId + "/" + orderImage.imageUrl;
            img.width = 100;
            img.height = 100;
            img.onclick = function () {
                if(confirm("确认删除该图片")) {
                    var array = this.src.split("/");
                    var image = new OrderImage();
                    image.imageTypeId = array[7];
                    image.orderId = array[8];
                    image.imageUrl = array[9];
                    image.imageId = array[9].split(".")[0];
                    OrderService.deleteOrderImage(image, function (result) {
                    });
                    this.parentNode.removeChild(this);
                }
            }
            $("orderImagesDiv").appendChild(img);
        }
    });
    function insertOrderImage() {
        if(base64Codes.length > 0) {
            var orderImage = new OrderImage();
            orderImage.imageTypeId = "${imageTypeId}";
            orderImage.orderId = "${orderId}";
            orderImage.imageUrl = base64Codes;
            OrderService.insertOrderImage(orderImage, function () {
                var order = new Order();
                order.orderId = dwr.util.getValue("orderId");
                order.orderImageState = 1;
                OrderService.updateOrder(order, "", "", function () {
                    location.reload();
                });
            });
        }
    }
</script>