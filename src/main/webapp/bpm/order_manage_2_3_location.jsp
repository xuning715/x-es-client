<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@include file="/common/session.jsp" %>
<c:set var="userId" value="${param.userId}" />
<c:set var="orderId" value="${param.orderId}" />
<c:set var="orderState" value="${param.orderState}" />
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
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no, width=device-width">
    <title>定位</title>
    <link rel="stylesheet" href="http://cache.amap.com/lbs/static/main1119.css"/>
    <style type="text/css">
        .amap-marker .marker-route {
            position: absolute;
            width: 40px;
            height: 44px;
            /*color: #e90000;*/
            background: url(http://webapi.amap.com/theme/v1.3/images/newpc/poi-1.png) no-repeat;
            cursor: pointer;
        }
        .amap-marker .marker-marker-bus-from {
            background-position: -334px -180px;
        }
    </style>
    <script src="http://cache.amap.com/lbs/static/es5.min.js"></script>
    <script type="text/javascript" src="http://webapi.amap.com/maps?v=1.4.3&key=3f843589b518113a112e29d59665a8a2"></script>
    <%--<script type="text/javascript" src="http://cache.amap.com/lbs/static/addToolbar.js"></script>--%>
    <script type="text/javascript" src="${ctx}/dwr/engine.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/util.js"></script>
    <script type="text/javascript" src="${ctx}/js/loading.js"></script>
</head>
<body>
<div id="container"></div>
<div id="tip">
    <label id="currentDate" onclick="location='${ctx}/bpm/order_manage_2_3.jsp?userId=${userId}&orderId=${orderId}&orderState=${orderState}&estateId=${estateId}&buildingId=${buildingId}&unitId=${unitId}&houseId=${houseId}&sampleId=${sampleId}&orderValuatorDept=${orderValuatorDept}'"></label>
</div>
</body>
</html>
<script type="text/javascript">
    var map = new AMap.Map("container", {
        resizeEnable: true,
//        center: [116.397428, 39.90923],//地图中心点
        zoom: 13 //地图显示的缩放级别
    });
    map.plugin('AMap.Geolocation', function() {
        var geolocation = new AMap.Geolocation({
            enableHighAccuracy: true,//是否使用高精度定位，默认:true
            timeout: 10000,          //超过10秒后停止定位，默认：无穷大
            buttonOffset: new AMap.Pixel(10, 120),//定位按钮与设置的停靠位置的偏移量，默认：Pixel(10, 20)
            zoomToAccuracy: true,      //定位成功后调整地图视野范围使定位位置及精度范围视野内可见，默认：false
            buttonPosition:'RB'
        });
        map.addControl(geolocation);
        geolocation.getCurrentPosition();
        AMap.event.addListener(geolocation, 'complete', onComplete);//返回定位信息
        AMap.event.addListener(geolocation, 'error', onError);      //返回定位出错信息
    });
    //解析定位结果
    function onComplete(data) {
//        var str=['定位成功'];
//        str.push('经度：' + data.position.getLng());
//        str.push('纬度：' + data.position.getLat());
//        if(data.accuracy){
//            str.push('精度：' + data.accuracy + ' 米');
//        }
    //如为IP精确定位结果则没有精度信息
//        str.push('是否经过偏移：' + (data.isConverted ? '是' : '否'));
//        document.getElementById('tip').innerHTML = str.join('<br>');
        var date= new Date();
        document.getElementById("currentDate").innerText = date.Format("yyyy-MM-dd hh:mm:ss");
        map.setZoomAndCenter(13, [data.position.getLng(), data.position.getLat() - 0.125]);
        var marker = new AMap.Marker({ //添加自定义点标记
            map: map,
            position: [data.position.getLng(), data.position.getLat()], //基点位置
            offset: new AMap.Pixel(-17, -42), //相对于基点的偏移位置
            draggable: true,  //是否可拖动
            content: '<div class="marker-route marker-marker-bus-from"></div>'   //自定义点标记覆盖物内容
        });
        marker.setMap(map);
    }
    //解析定位错误信息
    function onError(data) {
        document.getElementById('tip').innerHTML = '定位失败';
    }
</script>