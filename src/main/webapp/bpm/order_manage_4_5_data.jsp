<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@include file="/common/session.jsp" %>
<c:set var="userId" value="${param.userId}" />
<c:set var="orderId" value="${param.orderId}" />
<c:set var="estateId" value="${param.estateId}" />
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
    <title>资料/照片</title>
    <link rel="stylesheet" href="${ctx}/css/default.css"/>
    <script type="text/javascript" src="${ctx}/js/xtable.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/engine.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/util.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/interface/OrderService.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/interface/EstateService.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/interface/TemplateService.js"></script>
    <script type="text/javascript" src="${ctx}/js/loading.js"></script>
</head>
<body>
<fieldset>
    <legend>
        样点平面图
    </legend>
    <div id="template41Column23Div" style="text-align: center"></div>
</fieldset>
<br>
<fieldset>
    <legend>
        查勘照片
    </legend>
    <form id="orderSurveyorPhotoForm" name="orderSurveyorPhotoForm" method="post" onsubmit="return insertOrderImage()">
        <table>
            <tr align="center">
                <td>
                    <select id="imageTypeId" name="imageTypeId" required>
                        <option value="">请选择照片类型</option>
                    </select>
                </td>
                <td>
                    <input type="file" id="orderImages" name="orderImages" accept="image/jpeg,image/png,image/jpg" onchange="preview(this, 'orderImagesPreviewDiv')" multiple>
                </td>
                <td>
                    <button type="submit">保存查勘照片</button>
                </td>
            </tr>
        </table>
    </form>
    <div id="orderImagesPreviewDiv" style="text-align: center"></div>
    <hr>
    <div id="orderImagesDiv" style="text-align: center"></div>
</fieldset>
<br>
<fieldset>
    <legend>
        基本信息
    </legend>
    <form id="orderEstateForm" name="orderEstateForm" method="post" onsubmit="return insertOrderData()">
        <table width="100%" cellpadding="5" cellspacing="5" border="0">
            <tr>
                <td width="10%">
                    楼盘名称
                </td>
                <td width="20%">
                    <input type="text" id="dataEstateName" name="dataEstateName" placeholder="楼盘名称" required/>
                </td>
                <td width="10%">
                    楼盘别名
                </td>
                <td width="10%">
                    <input type="text" id="dataEstateAlias" name="dataEstateAlias" placeholder="楼盘别名" />
                </td>
                <td width="10%">
                    物业地址
                </td>
                <td>
                    <input type="text" id="dataHouseAddress" name="dataHouseAddress" placeholder="物业地址" required/>
                </td>
                <td>
                    <button type="submit">保存</button>
                </td>
            </tr>
        </table>
    </form>
</fieldset>
<br>
<form id="orderFullForm" name="orderFullForm" method="post" onsubmit="return insertOrderFull()">
    <input type="hidden" id="orderId" name="orderId" value="${orderId}" />
    <fieldset>
        <legend>
            资料照片
        </legend>
        <input type="file" id="orderImages35" name="orderImages35" accept="image/jpeg,image/png,image/jpg" onchange="preview(this, 'orderImages35PreviewDiv')" multiple>
        <div id="orderImages35PreviewDiv" style="text-align: center"></div>
        <hr>
        <div id="orderImages35Div" style="text-align: center"></div>
    </fieldset>
    <br>
    <fieldset>
        <legend>
            缺失情况
        </legend>
        <table cellpadding="5" cellspacing="5" border="1">
            <tr>
                <td>资料清单缺失情况</td>
                <td colspan="3">
                    <input type="radio" id="fullState1" name="fullState" value="1">
                    <label for="fullState1">不缺</label>
                    <input type="radio" id="fullState0" name="fullState" value="0">
                    <label for="fullState0">缺</label>
                </td>
            </tr>
            <tr align="left">
                <td>
                    <input type="checkbox" id="fullMfsfzzm" name="fullMfsfzzm">
                    <label for="fullMfsfzzm">买方/委托方身份证正面</label>
                </td>
                <td>
                    <input type="checkbox" id="fullMfsfzfm" name="fullMfsfzfm">
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
    <table width="100%" cellpadding="5" cellspacing="5" border="0">
        <tr>
            <td>
                <button type="submit">保存资料</button>
            </td>
        </tr>
    </table>
</form>

</body>
</html>
<script type="text/javascript">
    if("${orderId}".length > 0) {
        var orderData = new OrderData();
        orderData.orderId = "${orderId}";
        OrderService.selectOrderDataList(orderData, function (list) {
            if (list.length > 0) {
                orderData = list[0];
                dwr.util.setValue("dataEstateName", orderData.dataEstateName);
                dwr.util.setValue("dataEstateAlias", orderData.dataEstateAlias);
                dwr.util.setValue("dataHouseAddress", orderData.dataHouseAddress);
            } else {
                var order = new Order();
                order.orderId = "${orderId}";
                OrderService.selectOrderList(order, function (list) {
                    if(list.length > 0) {
                        order = list[0];
                        dwr.util.setValue("dataEstateName", order.orderEstateName);
                        dwr.util.setValue("dataHouseAddress", order.orderHouseAddress);
                    }
                    if("${estateId}".length > 0) {
                        var estate = new DcEstate();
                        estate.estateId = "${estateId}";
                        estate.pageIndex = 0;
                        estate.pageSize = 1;
                        EstateService.queryDcEstate(estate, function (list) {
                            if(list.length > 0) {
                                estate = list[0];
                                dwr.util.setValue("dataEstateAlias", estate.estateAlias);
                            }
                        });
                    }
                });
            }
            if("${sampleId}".length > 0) {
                var templateValue = new TemplateValue();
                templateValue.templateId = 41;
                templateValue.columnId = 23;
                var templateValueFk = new TemplateValueFk();
                templateValueFk.fkId = "${sampleId}";
                TemplateService.selectTemplateValue(templateValue, templateValueFk, function (list) {
                    if (list.length > 0) {
                        templateValue = list[0];
                        var photoArray = templateValue.columnValueStr.split(",");
                        var photoArrayLength = photoArray.length;
                        if (photoArrayLength > 0) {
                            var html = "";
                            for (var i = 0; i < photoArrayLength; i++) {
                                if (photoArray[i].length > 0) {
                                    html += "<a target='_blank' href='${ctx}/template/template_value_photo.jsp?templateId=41&columnId=23&rowId=" +  templateValue.rowId + "&fkId=${sampleId}&fkType" +  templateValue.templateValueFk.fkType + "&imgs=" + templateValue.columnValueStr + "&img=" + photoArray[i] + "'><img width='100' height='100' style='vertical-align:bottom;border:1px solid #cfd5da' src='${ctx}/upload/photo/template/" + templateValue.templateId + "-" + templateValue.rowId + "/" + photoArray[i] + "' /></a>&nbsp;"
                                }
                            }
                            $("template41Column23Div").innerHTML = html;
                        }
                    }
                    var orderFull = new OrderFull();
                    orderFull.orderId = "${orderId}";
                    OrderService.selectOrderFullList(orderFull, function (list) {
                        if(list.length > 0) {
                            orderFull = list[0];
                            dwr.util.setValues(orderFull);
                        }

                        var orderImage = new OrderImage();
                        orderImage.orderId = "${orderId}";
//                                orderImage.imageTypeId = "35";
                        OrderService.selectOrderImageList(orderImage, function (list) {
                            if (list.length > 0) {
                                var html = "";
                                for (var i = 0; i < list.length; i++) {
                                    orderImage = list[i];
                                    if (orderImage.imageTypeId == "00") {

                                    } else if (orderImage.imageTypeId == "35") {
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
                                                    location.reload();
                                                });
//                                                this.parentNode.removeChild(this);
                                            }
                                        }
                                        $("orderImages" + orderImage.imageTypeId + "Div").appendChild(img);
                                    } else if (orderImage.imageTypeId >= "01" && orderImage.imageTypeId <= "34") {
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
                                                    location.reload();
                                                });
//                                                this.parentNode.removeChild(this);
                                            }
                                        }
                                        var label = document.createElement("label");
                                        label.innerText = orderImage.imageType.imageTypeName + orderImage.imageSeq;
                                        $("orderImagesDiv").appendChild(img);
                                        $("orderImagesDiv").appendChild(label);
                                    }
                                }
                            }
                            var deptImage = new DeptImage();
                            deptImage.imageDept = "${orderValuatorDept}";
                            OrderService.selectOrderDeptImageTypeList(deptImage, function (list) {
                                dwr.util.addOptions("imageTypeId", list, "imageTypeId", "imageTypeName");
                            });
                        });
                    });
                });
            }
        });
    }

    var base64Codes = "";
    function preview(input, imgDivId) {
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
                $(imgDivId).appendChild(img);
                base64Codes += img.src.split(",")[1] + ",";
            };
        }
    }

    function insertOrderImage() {
        var orderImage = new OrderImage();
        orderImage.orderId = "${orderId}";
        orderImage.imageTypeId = dwr.util.getValue("imageTypeId");
        orderImage.imageUrl = base64Codes;
        OrderService.insertOrderImage(orderImage, function () {
            alert("保存成功");
            location.reload();
        });
        return false;
    }

    function insertOrderData() {
        var orderData = new OrderData();
        orderData.orderId = "${orderId}";
        orderData.dataEstateName = dwr.util.getValue("dataEstateName");
        orderData.dataEstateAlias = dwr.util.getValue("dataEstateAlias");
        orderData.dataHouseAddress = dwr.util.getValue("dataHouseAddress");
        OrderService.insertOrderData(orderData, function () {
            alert("保存成功");
            location.reload();
        });
        return false;
    }

    function insertOrderFull() {
        if("${orderId}".length > 0) {
            if(base64Codes.length > 0) {
                base64Codes = base64Codes.substring(0, base64Codes.length - 1);
            }
            var order = new Order();
            order.orderId = "${orderId}";
            var orderFull = dwr.util.getFormValues("orderFullForm");
            OrderService.insertOrderFull(order, orderFull, "35", base64Codes, function (o) {
                alert("保存成功");
                location.reload();
            });
        }
        return false;
    }

</script>