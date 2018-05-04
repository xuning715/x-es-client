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
    <script type="text/javascript" src="${ctx}/js/xtable.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/engine.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/util.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/interface/OrderService.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/interface/UserService.js"></script>
    <script type="text/javascript" src="${ctx}/js/loading.js"></script>
</head>
<body>
<form id="orderForm" name="orderForm" method="post" onsubmit="return insertOrderFull()">
    <input type="hidden" id="orderId" name="orderId" value="${orderId}" />
    <input type="hidden" id="fullCreateUserId" name="fullCreateUserId" value="${userId}" />
    <fieldset>
        <legend>
            分单
        </legend>
        <table cellpadding="5" cellspacing="5" border="1">
            <tr>
                <td>请您确认分单的估计师</td>
                <td>
                    <select id="valuatorUserId" name="valuatorUserId" required>
                    </select>
                </td>
                <td>资料清单缺失情况</td>
                <td>
                    <input type="radio" id="fullState1" name="fullState" value="1">
                    <label for="fullState1">不缺</label>
                    <input type="radio" id="fullState0" name="fullState" value="0">
                    <label for="fullState0">缺</label>
                </td>
            </tr>
            <tr align="left">
                <td>
                    <input type="checkbox" id="fullMfsfzzm" name="fullMfsfzzm" value="1">
                    <label for="fullMfsfzzm">买方/委托方身份证正面</label>
                </td>
                <td>
                    <input type="checkbox" id="fullMfsfzfm" name="fullMfsfzfm" value="0">
                    <label for="fullMfsfzfm">买方/委托方身份证反面</label>
                </td>
                <td>
                    <input type="checkbox" id="fullFzsfzzm" name="fullFzsfzzm" >
                    <label for="fullFzsfzzm">房主身份证正面</label>
                </td>
                <td>
                    <input type="checkbox" id="fullFzsfzfm" name="fullFzsfzfm" >
                    <label for="fullFzsfzfm">房主身份证反面</label>
                </td>
            </tr>
            <tr align="left">
                <td>
                    <input type="checkbox" id="fullFbfmy" name="fullFbfmy" >
                    <label for="fullFbfmy">房本封面页/二维码页</label>
                </td>
                <td>
                    <input type="checkbox" id="fullFbzy" name="fullFbzy" >
                    <label for="fullFbzy">房本主页</label>
                </td>
                <td>
                    <input type="checkbox" id="fullFbfjy" name="fullFbfjy" >
                    <label for="fullFbfjy">房本附记页</label>
                </td>
                <td>
                    <input type="checkbox" id="fullFbpmty" name="fullFbpmty" >
                    <label for="fullFbpmty">房本平面图页</label>
                </td>
            </tr>
            <tr align="left">
                <td>
                    <input type="checkbox" id="fullFbdjby" name="fullFbdjby" >
                    <label for="fullFbdjby">房本登记表页</label>
                </td>
                <td>
                    <input type="checkbox" id="fullFbfdy" name="fullFbfdy" >
                    <label for="fullFbfdy">房本封底页</label>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr align="left">
                <td colspan="4">&nbsp;</td>
            </tr>
            <tr align="left">
                <td>
                    <input type="checkbox" id="fullTdzzy" name="fullTdzzy" >
                    <label for="fullTdzzy">土地证主页</label>
                </td>
                <td>
                    <input type="checkbox" id="fullTdzfmy" name="fullTdzfmy" >
                    <label for="fullTdzfmy">土地证封面页</label>
                </td>
                <td>
                    <input type="checkbox" id="fullTdzjsy" name="fullTdzjsy" >
                    <label for="fullTdzjsy">土地证记事页</label>
                </td>
                <td>
                    <input type="checkbox" id="fullTdzpmty" name="fullTdzpmty" >
                    <label for="fullTdzpmty">土地证平面图页</label>
                </td>
            </tr>
            <tr align="left">
                <td>
                    <input type="checkbox" id="fullZddjby" name="fullZddjby" >
                    <label for="fullZddjby">宗地登记表页</label>
                </td>
                <td>
                    <input type="checkbox" id="fullTdzfdy" name="fullTdzfdy" >
                    <label for="fullTdzfdy">土地证封底页</label>
                </td>
                <td>
                    <input type="checkbox" id="fullQsp" name="fullQsp" >
                    <label for="fullQsp">契税票</label>
                </td>
                <td>
                    <input type="checkbox" id="fullGfht" name="fullGfht" >
                    <label for="fullGfht">购房合同</label>
                </td>
            </tr>
            <tr align="left">
                <td>
                    <input type="checkbox" id="fullLphzm" name="fullLphzm" >
                    <label for="fullLphzm">楼牌号证明</label>
                </td>
                <td>
                    <input type="checkbox" id="fullMphzm" name="fullMphzm" >
                    <label for="fullMphzm">门牌号证明</label>
                </td>
                <td>
                    <input type="checkbox" id="fullByzzm" name="fullByzzm" >
                    <label for="fullByzzm">不一致证明</label>
                </td>
                <td>
                    <input type="checkbox" id="fullNdzm" name="fullNdzm" >
                    <label for="fullNdzm">年代证明</label>
                </td>
            </tr>
            <tr align="left">
                <td>
                    <input type="checkbox" id="fullZyzm" name="fullZyzm" >
                    <label for="fullZyzm">自用证明</label>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr align="left">
                <td colspan="4">&nbsp;</td>
            </tr>
            <tr align="left">
                <td>
                    <input type="checkbox" id="fullMfhz" name="fullMfhz" >
                    <label for="fullMfhz">买方/委托方护照</label>
                </td>
                <td>
                    <input type="checkbox" id="fullMfyb" name="fullMfyb" >
                    <label for="fullMfyb">买方/委托方译本</label>
                </td>
                <td>
                    <input type="checkbox" id="fullMfgzs" name="fullMfgzs" >
                    <label for="fullMfgzs">买方/委托方公证书</label>
                </td>
                <td>
                    <input type="checkbox" id="fullMzhz" name="fullMzhz" >
                    <label for="fullMzhz">房主护照</label>
                </td>
            </tr>
            <tr align="left">
                <td>
                    <input type="checkbox" id="fullMzyb" name="fullMzyb" >
                    <label for="fullMzyb">房主译本</label>
                </td>
                <td>
                    <input type="checkbox" id="fullMzgzs" name="fullMzgzs" >
                    <label for="fullMzgzs">房主公证书</label>
                </td>
                <td>
                    <input type="checkbox" id="fullHkb" name="fullHkb" >
                    <label for="fullHkb">户口本</label>
                </td>
                <td>
                    <input type="checkbox" id="fullJhrsfz" name="fullJhrsfz" >
                    <label for="fullJhrsfz">监护人身份证</label>
                </td>
            </tr>
            <tr align="left">
                <td>
                    <input type="checkbox" id="fullJhzm" name="fullJhzm" >
                    <label for="fullJhzm">监护证明</label>
                </td>
            </tr>
            <tr>
                <td align="left" colspan="4">
                    其他
                    <textarea id="fullElse" name="fullElse" style="width: 100%; height: 50px;"></textarea>
                </td>
            </tr>
        </table>
    </fieldset>
    <br>
    <fieldset>
        <legend>
            资料图片
        </legend>
        <input type="file" id="orderImages" name="orderImages" accept="image/jpeg,image/png,image/jpg" onchange="preview(this)" multiple>
        <div id="orderImagesPreviewDiv" style="text-align: center"></div>
        <hr>
        <div id="orderImagesDiv" style="text-align: center"></div>
    </fieldset>
    <br>
    <table width="100%" cellpadding="5" cellspacing="5" border="0">
        <tr>
            <td>
                <button type="submit">分单</button>
                <button onclick="location='${ctx}/bpm/order_list_3_4.jsp'">返回</button>
            </td>
        </tr>
    </table>
</form>

</body>
</html>
<script type="text/javascript">
    var userPost = new UserPost();
    userPost.postId = 7;
    UserService.selectPostUserList(userPost, function (list) {
        dwr.util.addOptions("valuatorUserId", list, "userId", "userName");
        if("${orderId}".length > 0) {
            var order = new Order();
            order.orderId = "${orderId}";
            OrderService.selectOrderList(order, function (list) {
                if(list.length > 0) {
                    order = list[0];
                    dwr.util.setValue("valuatorUserId", order.valuatorUserId);
                }
            });
            var orderFull = new OrderFull();
            orderFull.orderId = "${orderId}";
            OrderService.selectOrderFullList(orderFull, function (list) {
                if(list.length > 0) {
                    orderFull = list[0];
                    dwr.util.setValues(orderFull);
                }
            });
            var orderImage = new OrderImage();
            orderImage.orderId = "${orderId}";
            orderImage.imageTypeId = "35";
            OrderService.selectOrderImageList(orderImage, function (list) {
                for (var i = 0; i < list.length; i++) {
                    orderImage = list[i];
                    var img = document.createElement("img");
                    img.src = "${ctx}/upload/photo/order/" + orderImage.imageTypeId + "/" + orderImage.orderId + "/" + orderImage.imageUrl;
                    img.width = 100;
                    img.height = 100;
                    img.title = "点击删除";
                    img.style.cursor = "pointer";
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
        }
    });

    var base64Codes = "";
    function preview(input) {
        var files = input.files;
        for(var i = 0; i < files.length; i++){
            var tmpFile = files[i];
            var reader = new FileReader();//每循环一次都要重新new一个FileReader实例
            reader.readAsDataURL(tmpFile);
            reader.onload = function(e){
                var img = document.createElement("img");
                img.src = e.target.result;
                img.width = 100;
                img.height = 100;
                img.title = "点击删除";
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

    function insertOrderFull() {
        if("${orderId}".length > 0) {
            if(base64Codes.length > 0) {
                base64Codes = base64Codes.substring(0, base64Codes.length - 1);
            }
            var order = new Order();
            order.orderId = "${orderId}";
            order.valuatorUserId = dwr.util.getValue("valuatorUserId");
            order.orderState = 4;
            var orderFull = dwr.util.getFormValues("orderForm");
            OrderService.insertOrderFull(order, orderFull, "35", base64Codes, function (o) {
                location = "${ctx}/bpm/order_list_3_4.jsp";
            });
        }
        return false;
    }

</script>