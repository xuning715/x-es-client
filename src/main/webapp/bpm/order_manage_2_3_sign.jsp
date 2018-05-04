<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@include file="/common/session.jsp" %>
<c:set var="userId" value="${param.userId}" />
<c:set var="orderId" value="${param.orderId}" />
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
<form id="orderSignForm" name="orderSignForm" style="text-align: left; border: 0px;">
    <input type="hidden" id="orderId" name="orderId" value="${orderId}" />
    <input type="hidden" id="imageTypeId" name="imageTypeId" value="33" />
    <input type="hidden" id="orderSignState" name="orderSignState" value="0" />
    <fieldset>
        <legend>
            上传签名字照片
        </legend>
        <input type="file"  id="orderImages" name="orderImages" accept="image/jpeg,image/png,image/jpg" onchange="preview(this)">
        <div id="orderImagesPreviewDiv" style="text-align: center"></div>
        <hr>
        <button type="button" style="width: 100%" onclick="insertOrderImage()">保存图片</button>
        <br><br>
        <div id="orderImagesDiv" style="text-align: center"></div>
    </fieldset>
</form>
</body>
</html>
<script type="text/javascript">
    var base64Codes = "";
    var orderImage = new OrderImage();
    orderImage.orderId = "${orderId}";
    orderImage.imageTypeId = dwr.util.getValue("imageTypeId");
    OrderService.selectOrderImageList(orderImage, function (list) {
        for (var i = 0; i < list.length; i++) {
            dwr.util.setValue("orderSignState", 1);
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
    function preview(input) {
        var files = input.files;
        for(var i = 0; i < files.length; i++) {
            var tmpFile = files[i];
            var reader = new FileReader();//每循环一次都要重新new一个FileReader实例
            reader.readAsDataURL(tmpFile);
            reader.onload = function(e){
                var img = document.createElement("img");
                img.src = e.target.result;
                img.width = 100;
                img.height = 100;
                img.style.cursor = "pointer";
                img.onclick = function () {
                    if(confirm("确认删除该图片")) {
                        this.parentNode.removeChild(this);
                        base64Codes = base64Codes.replace(this.src.split(",")[1] + ",", "");
                    }
                }
                $("orderImagesPreviewDiv").appendChild(img);
                base64Codes += img.src.split(",")[1] + ",";
            };
        }
    }
    function insertOrderImage() {
        if(base64Codes.length > 0) {
            var orderImage = new OrderImage();
            orderImage.orderId = dwr.util.getValue("orderId");
            orderImage.imageTypeId = dwr.util.getValue("imageTypeId");
            orderImage.imageUrl = base64Codes;
            OrderService.insertOrderImage(orderImage, function () {
                var orderSignState = dwr.util.getValue("orderSignState");
                if(orderSignState == 0) {
                    var order = new Order();
                    order.orderId = dwr.util.getValue("orderId");
                    order.orderSignState = 1;
                    OrderService.updateOrder(order, "", "", function () {
                        location.reload();
                    });
                } else {
                    location.reload();
                }
            });
        }
    }
</script>