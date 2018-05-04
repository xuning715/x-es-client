<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@include file="/common/session.jsp" %>
<c:set var="userId" value="${param.userId}" />
<c:set var="orderId" value="${param.orderId}" />
<c:set var="buildingId" value="${param.buildingId}" />
<c:set var="unitId" value="${param.unitId}" />
<c:set var="houseId" value="${param.houseId}" />
<c:set var="sampleId" value="${param.sampleId}" />
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="initial-scale=1.0, minimum-scale=1.0, maximum-scale=2.0, user-scalable=no, width=device-width">
    <title>报单</title>
    <link rel="stylesheet" href="${ctx}/css/default.css"/>
    <link rel="stylesheet" href="${ctx}/css/xtable.css"/>
    <script type="text/javascript" src="${ctx}/dwr/engine.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/util.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/interface/OrderService.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/interface/TemplateService.js"></script>
    <script type="text/javascript" src="${ctx}/js/loading.js"></script>
</head>
<body>
<form id="orderForm" name="orderForm" style="text-align: left; border: 0px;" onsubmit="return insertOrderHouse()">
    <input type="hidden" id="orderId" name="orderId" value="${orderId}" />
    <input type="hidden" id="buildingId" name="buildingId" value="${buildingId}" />
    <input type="hidden" id="unitId" name="unitId" value="${unitId}" />
    <input type="hidden" id="houseId" name="houseId" value="${houseId}" />
    <input type="hidden" id="sampleId" name="houseId" value="${sampleId}" />
    <table border="1" cellspacing="0" cellpadding="5" style="font-size: 15px;">
        <tr>
            <td width="80">入户门号</td>
            <td>
                <input type="text" id="houseCode" name="houseCode" maxlength="10" required>
            </td>
        </tr>
        <tr>
            <td>户型结构</td>
            <td>
                <select id="template41Column20" name="template41Column20" required>
                    <option value="">请选择</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>朝向</td>
            <td>
                <select id="template41Column3" name="template41Column3" required>
                    <option value="">请选择</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>层高</td>
            <td>
                <select id="template41Column21" name="template41Column21" required>
                    <option value="">请选择</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>户型</td>
            <td>
                <textarea id="template41Column418" name="template41Column418" maxlength="100" style="width: 98%; height: 100px;" required></textarea>
            </td>
        </tr>
        <tr>
            <td>装修档次</td>
            <td>
                <select id="houseZxdc" name="houseZxdc" required>
                    <option value="">请选择</option>
                    <option value="豪华装修">豪华装修</option>
                    <option value="中高档装修">中高档装修</option>
                    <option value="中等装修">中等装修</option>
                    <option value="普通装修">普通装修</option>
                    <option value="装修中">装修中</option>
                    <option value="毛坯">毛坯</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>维护状况</td>
            <td>
                <select id="houseWhzk" name="houseWhzk" required>
                    <option value="">请选择</option>
                    <option value="良好">良好</option>
                    <option value="一般">一般</option>
                    <option value="较差">较差</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>客厅地面</td>
            <td>
                <input type="checkbox" id="houseKtdm1" name="houseKtdm" value="水泥地">
                <label for="houseKtdm1">水泥地</label>
                <input type="checkbox" id="houseKtdm2" name="houseKtdm" value="实木地板">
                <label for="houseKtdm2">实木地板</label>
                <input type="checkbox" id="houseKtdm3" name="houseKtdm" value="复合地板">
                <label for="houseKtdm3">复合地板</label>
                <input type="checkbox" id="houseKtdm4" name="houseKtdm" value="地砖">
                <label for="houseKtdm4">地砖</label>
                <input type="checkbox" id="houseKtdm5" name="houseKtdm" value="地板革">
                <label for="houseKtdm5">地板革</label>
                <input type="checkbox" id="houseKtdm6" name="houseKtdm" value="地毯">
                <label for="houseKtdm6">地毯</label>
                <input type="checkbox" id="houseKtdm7" name="houseKtdm" value="其他">
                <label for="houseKtdm7">其他</label>
                <input type="checkbox" id="houseKtdm8" name="houseKtdm" value="无">
                <label for="houseKtdm8">无</label>
            </td>
        </tr>
        <tr>
            <td>客厅墙面</td>
            <td>
                <input type="checkbox" id="houseKtqm1" name="houseKtqm" value="乳胶漆">
                <label for="houseKtqm1">乳胶漆</label>
                <input type="checkbox" id="houseKtqm2" name="houseKtqm" value="墙纸">
                <label for="houseKtqm2">墙纸</label>
                <input type="checkbox" id="houseKtqm3" name="houseKtqm" value="水泥">
                <label for="houseKtqm3">水泥</label>
                <input type="checkbox" id="houseKtqm4" name="houseKtqm" value="包木墙裙">
                <label for="houseKtqm4">包木墙裙</label>
                <input type="checkbox" id="houseKtqm5" name="houseKtqm" value="软包">
                <label for="houseKtqm5">软包</label>
                <input type="checkbox" id="houseKtqm6" name="houseKtqm" value="其他">
                <label for="houseKtqm6">其他</label>
                <input type="checkbox" id="houseKtqm7" name="houseKtqm" value="无">
                <label for="houseKtqm7">无</label>
            </td>
        </tr>
        <tr>
            <td>客厅天花</td>
            <td>
                <input type="checkbox" id="houseKtth1" name="houseKtth" value="乳胶漆">
                <label for="houseKtth1">乳胶漆</label>
                <input type="checkbox" id="houseKtth2" name="houseKtth" value="水泥">
                <label for="houseKtth2">水泥</label>
                <input type="checkbox" id="houseKtth3" name="houseKtth" value="造型吊顶">
                <label for="houseKtth3">造型吊顶</label>
                <input type="checkbox" id="houseKtth4" name="houseKtth" value="石膏吊角线">
                <label for="houseKtth4">石膏吊角线</label>
                <input type="checkbox" id="houseKtth5" name="houseKtth" value="墙纸">
                <label for="houseKtth5">墙纸</label>
                <input type="checkbox" id="houseKtth6" name="houseKtth" value="木吊角线">
                <label for="houseKtth6">木吊角线</label>
                <input type="checkbox" id="houseKtth7" name="houseKtth" value="其他">
                <label for="houseKtth7">其他</label>
                <input type="checkbox" id="houseKtth8" name="houseKtth" value="无">
                <label for="houseKtth8">无</label>
            </td>
        </tr>
        <tr>
            <td>卧室地面</td>
            <td>
                <input type="checkbox" id="houseWsdm1" name="houseWsdm" value="水泥地">
                <label for="houseWsdm1">水泥地</label>
                <input type="checkbox" id="houseWsdm2" name="houseWsdm" value="实木地板">
                <label for="houseWsdm2">实木地板</label>
                <input type="checkbox" id="houseWsdm3" name="houseWsdm" value="复合地板">
                <label for="houseWsdm3">复合地板</label>
                <input type="checkbox" id="houseWsdm4" name="houseWsdm" value="地砖">
                <label for="houseWsdm4">地砖</label>
                <input type="checkbox" id="houseWsdm5" name="houseWsdm" value="地板革">
                <label for="houseWsdm5">地板革</label>
                <input type="checkbox" id="houseWsdm6" name="houseWsdm" value="地毯">
                <label for="houseWsdm6">地毯</label>
                <input type="checkbox" id="houseWsdm7" name="houseWsdm" value="其他">
                <label for="houseWsdm7">其他</label>
                <input type="checkbox" id="houseWsdm8" name="houseWsdm" value="无">
                <label for="houseWsdm8">无</label>
            </td>
        </tr>
        <tr>
            <td>卧室墙面</td>
            <td>
                <input type="checkbox" id="houseWsqm1" name="houseWsqm" value="乳胶漆">
                <label for="houseWsqm1">乳胶漆</label>
                <input type="checkbox" id="houseWsqm2" name="houseWsqm" value="墙纸">
                <label for="houseWsqm2">墙纸</label>
                <input type="checkbox" id="houseWsqm3" name="houseWsqm" value="水泥">
                <label for="houseWsqm3">水泥</label>
                <input type="checkbox" id="houseWsqm4" name="houseWsqm" value="包木墙裙">
                <label for="houseWsqm4">包木墙裙</label>
                <input type="checkbox" id="houseWsqm5" name="houseWsqm" value="软包">
                <label for="houseWsqm5">软包</label>
                <input type="checkbox" id="houseWsqm6" name="houseWsqm" value="其他">
                <label for="houseWsqm6">其他</label>
                <input type="checkbox" id="houseWsqm7" name="houseWsqm" value="无">
                <label for="houseWsqm7">无</label>
            </td>
        </tr>
        <tr>
            <td>卧室天花</td>
            <td>
                <input type="checkbox" id="houseWsth1" name="houseWsth" value="乳胶漆">
                <label for="houseWsth1">乳胶漆</label>
                <input type="checkbox" id="houseWsth2" name="houseWsth" value="水泥">
                <label for="houseWsth2">水泥</label>
                <input type="checkbox" id="houseWsth3" name="houseWsth" value="造型吊顶">
                <label for="houseWsth3">造型吊顶</label>
                <input type="checkbox" id="houseWsth4" name="houseWsth" value="石膏吊角线">
                <label for="houseWsth4">石膏吊角线</label>
                <input type="checkbox" id="houseWsth5" name="houseWsth" value="墙纸">
                <label for="houseWsth5">墙纸</label>
                <input type="checkbox" id="houseWsth6" name="houseWsth" value="木吊角线">
                <label for="houseWsth6">木吊角线</label>
                <input type="checkbox" id="houseWsth7" name="houseWsth" value="其他">
                <label for="houseWsth7">其他</label>
                <input type="checkbox" id="houseWsth8" name="houseWsth" value="无">
                <label for="houseWsth8">无</label>
            </td>
        </tr>
        <tr>
            <td>厨房地面</td>
            <td>
                <input type="checkbox" id="houseCfdm1" name="houseCfdm" value="水泥地">
                <label for="houseCfdm1">水泥地</label>
                <input type="checkbox" id="houseCfdm2" name="houseCfdm" value="地砖">
                <label for="houseCfdm2">地砖</label>
                <input type="checkbox" id="houseCfdm3" name="houseCfdm" value="包木墙裙">
                <label for="houseCfdm3">包木墙裙</label>
                <input type="checkbox" id="houseCfdm4" name="houseCfdm" value="软包">
                <label for="houseCfdm4">软包</label>
                <input type="checkbox" id="houseCfdm5" name="houseCfdm" value="其他">
                <label for="houseCfdm5">其他</label>
                <input type="checkbox" id="houseCfdm6" name="houseCfdm" value="无">
                <label for="houseCfdm6">无</label>
            </td>
        </tr>
        <tr>
            <td>厨房墙面</td>
            <td>
                <input type="checkbox" id="houseCfqm1" name="houseCfqm" value="瓷片到顶">
                <label for="houseCfqm1">瓷片到顶</label>
                <input type="checkbox" id="houseCfqm2" name="houseCfqm" value="乳胶漆">
                <label for="houseCfqm2">乳胶漆</label>
                <input type="checkbox" id="houseCfqm3" name="houseCfqm" value="水泥">
                <label for="houseCfqm3">水泥</label>
                <input type="checkbox" id="houseCfqm4" name="houseCfqm" value="1.5米瓷片墙裙">
                <label for="houseCfqm4">1.5米瓷片墙裙</label>
                <input type="checkbox" id="houseCfqm5" name="houseCfqm" value="1.8米瓷片墙裙">
                <label for="houseCfqm5">1.8米瓷片墙裙</label>
                <input type="checkbox" id="houseCfqm6" name="houseCfqm" value="其他">
                <label for="houseCfqm6">其他</label>
                <input type="checkbox" id="houseCfqm7" name="houseCfqm" value="无">
                <label for="houseCfqm7">无</label>
            </td>
        </tr>
        <tr>
            <td>厨房天花</td>
            <td>
                <input type="checkbox" id="houseCfth1" name="houseCfth" value="铝扣板">
                <label for="houseCfth1">铝扣板</label>
                <input type="checkbox" id="houseCfth2" name="houseCfth" value="塑料扣板">
                <label for="houseCfth2">塑料扣板</label>
                <input type="checkbox" id="houseCfth3" name="houseCfth" value="乳胶漆">
                <label for="houseCfth3">乳胶漆</label>
                <input type="checkbox" id="houseCfth4" name="houseCfth" value="石膏板">
                <label for="houseCfth4">石膏板</label>
                <input type="checkbox" id="houseCfth5" name="houseCfth" value="水泥">
                <label for="houseCfth5">水泥</label>
                <input type="checkbox" id="houseCfth6" name="houseCfth" value="其他">
                <label for="houseCfth6">其他</label>
                <input type="checkbox" id="houseCfth7" name="houseCfth" value="无">
                <label for="houseCfth7">无</label>
            </td>
        </tr>
        <tr>
            <td>厨房设备</td>
            <td>
                <input type="checkbox" id="houseCfsb1" name="houseCfsb" value="人造石灶台">
                <label for="houseCfsb1">人造石灶台</label>
                <input type="checkbox" id="houseCfsb2" name="houseCfsb" value="吊柜">
                <label for="houseCfsb2">吊柜</label>
                <input type="checkbox" id="houseCfsb3" name="houseCfsb" value="防火板镶面灶台">
                <label for="houseCfsb3">防火板镶面灶台</label>
                <input type="checkbox" id="houseCfsb4" name="houseCfsb" value="简易灶台">
                <label for="houseCfsb4">简易灶台</label>
                <input type="checkbox" id="houseCfsb5" name="houseCfsb" value="大理石灶台">
                <label for="houseCfsb5">大理石灶台</label>
                <input type="checkbox" id="houseCfsb6" name="houseCfsb" value="其他">
                <label for="houseCfsb6">其他</label>
                <input type="checkbox" id="houseCfsb7" name="houseCfsb" value="无">
                <label for="houseCfsb7">无</label>
            </td>
        </tr>
        <tr>
            <td>是否有燃气表</td>
            <td>
                <select id="houseRqb" name="houseRqb" required>
                    <option value="">请选择</option>
                    <option value="是">是</option>
                    <option value="否">否</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>卫生间地面</td>
            <td>
                <input type="checkbox" id="houseWsjdm1" name="houseWsjdm" value="水泥地">
                <label for="houseWsjdm1">水泥地</label>
                <input type="checkbox" id="houseWsjdm2" name="houseWsjdm" value="地砖">
                <label for="houseWsjdm2">地砖</label>
                <input type="checkbox" id="houseWsjdm3" name="houseWsjdm" value="包木墙裙">
                <label for="houseWsjdm3">包木墙裙</label>
                <input type="checkbox" id="houseWsjdm4" name="houseWsjdm" value="软包">
                <label for="houseWsjdm4">软包</label>
                <input type="checkbox" id="houseWsjdm5" name="houseWsjdm" value="其他">
                <label for="houseWsjdm5">其他</label>
                <input type="checkbox" id="houseWsjdm6" name="houseWsjdm" value="无">
                <label for="houseWsjdm6">无</label>
            </td>
        </tr>
        <tr>
            <td>卫生间墙面</td>
            <td>
                <input type="checkbox" id="houseWsjqm1" name="houseWsjqm" value="瓷片到顶">
                <label for="houseWsjqm1">瓷片到顶</label>
                <input type="checkbox" id="houseWsjqm2" name="houseWsjqm" value="乳胶漆">
                <label for="houseWsjqm2">乳胶漆</label>
                <input type="checkbox" id="houseWsjqm3" name="houseWsjqm" value="水泥">
                <label for="houseWsjqm3">水泥</label>
                <input type="checkbox" id="houseWsjqm4" name="houseWsjqm" value="1.5米瓷片墙裙">
                <label for="houseWsjqm4">1.5米瓷片墙裙</label>
                <input type="checkbox" id="houseWsjqm5" name="houseWsjqm" value="1.8米瓷片墙裙">
                <label for="houseWsjqm5">1.8米瓷片墙裙</label>
                <input type="checkbox" id="houseWsjqm6" name="houseWsjqm" value="其他">
                <label for="houseWsjqm6">其他</label>
                <input type="checkbox" id="houseWsjqm7" name="houseWsjqm" value="无">
                <label for="houseWsjqm7">无</label>
            </td>
        </tr>
        <tr>
            <td>卫生间天花</td>
            <td>
                <input type="checkbox" id="houseWsjth1" name="houseWsjth" value="铝扣板">
                <label for="houseWsjth1">铝扣板</label>
                <input type="checkbox" id="houseWsjth2" name="houseWsjth" value="塑料扣板">
                <label for="houseWsjth2">塑料扣板</label>
                <input type="checkbox" id="houseWsjth3" name="houseWsjth" value="乳胶漆">
                <label for="houseWsjth3">乳胶漆</label>
                <input type="checkbox" id="houseWsjth4" name="houseWsjth" value="石膏板">
                <label for="houseWsjth4">石膏板</label>
                <input type="checkbox" id="houseWsjth5" name="houseWsjth" value="水泥">
                <label for="houseWsjth5">水泥</label>
                <input type="checkbox" id="houseWsjth6" name="houseWsjth" value="其他">
                <label for="houseWsjth6">其他</label>
                <input type="checkbox" id="houseWsjth7" name="houseWsjth" value="无">
                <label for="houseWsjth7">无</label>
            </td>
        </tr>
        <tr>
            <td>卫生间设备</td>
            <td>
                <input type="checkbox" id="houseWsjsb1" name="houseWsjsb" value="嵌入式洗面盆">
                <label for="houseWsjsb1">嵌入式洗面盆</label>
                <input type="checkbox" id="houseWsjsb2" name="houseWsjsb" value="普通洗面盆">
                <label for="houseWsjsb2">普通洗面盆</label>
                <input type="checkbox" id="houseWsjsb3" name="houseWsjsb" value="坐厕">
                <label for="houseWsjsb3">坐厕</label>
                <input type="checkbox" id="houseWsjsb4" name="houseWsjsb" value="普通浴缸">
                <label for="houseWsjsb4">普通浴缸</label>
                <input type="checkbox" id="houseWsjsb5" name="houseWsjsb" value="普通沐浴房">
                <label for="houseWsjsb5">普通沐浴房</label>
                <input type="checkbox" id="houseWsjsb6" name="houseWsjsb" value="蹲厕">
                <label for="houseWsjsb6">蹲厕</label>
                <input type="checkbox" id="houseWsjsb7" name="houseWsjsb" value="按摩式浴缸">
                <label for="houseWsjsb7">按摩式浴缸</label>
                <input type="checkbox" id="houseWsjsb8" name="houseWsjsb" value="其他">
                <label for="houseWsjsb8">其他</label>
                <input type="checkbox" id="houseWsjsb9" name="houseWsjsb" value="无">
                <label for="houseWsjsb9">无</label>
            </td>
        </tr>
        <tr>
            <td>入户门</td>
            <td>
                <input type="checkbox" id="houseRhm1" name="houseRhm" value="防盗门">
                <label for="houseRhm1">防盗门</label>
                <input type="checkbox" id="houseRhm2" name="houseRhm" value="实木门">
                <label for="houseRhm2">实木门</label>
                <input type="checkbox" id="houseRhm3" name="houseRhm" value="木夹板门">
                <label for="houseRhm3">木夹板门</label>
                <input type="checkbox" id="houseRhm4" name="houseRhm" value="玻璃门">
                <label for="houseRhm4">玻璃门</label>
                <input type="checkbox" id="houseRhm5" name="houseRhm" value="其他">
                <label for="houseRhm5">其他</label>
                <input type="checkbox" id="houseRhm6" name="houseRhm" value="无">
                <label for="houseRhm6">无</label>
            </td>
        </tr>
        <tr>
            <td>内门</td>
            <td>
                <input type="checkbox" id="houseNm1" name="houseNm" value="实木门">
                <label for="houseNm1">实木门</label>
                <input type="checkbox" id="houseNm2" name="houseNm" value="木夹板门">
                <label for="houseNm2">木夹板门</label>
                <input type="checkbox" id="houseNm3" name="houseNm" value="装饰木门">
                <label for="houseNm3">装饰木门</label>
                <input type="checkbox" id="houseNm4" name="houseNm" value="镶玻璃木门">
                <label for="houseNm4">镶玻璃木门</label>
                <input type="checkbox" id="houseNm5" name="houseNm" value="铝合金玻璃门">
                <label for="houseNm5">铝合金玻璃门</label>
                <input type="checkbox" id="houseNm6" name="houseNm" value="其他">
                <label for="houseNm6">其他</label>
                <input type="checkbox" id="houseNm7" name="houseNm" value="无">
                <label for="houseNm7">无</label>
            </td>
        </tr>
        <tr>
            <td>窗</td>
            <td>
                <input type="checkbox" id="houseC1" name="houseC" value="断桥铝合金窗">
                <label for="houseC1">断桥铝合金窗</label>
                <input type="checkbox" id="houseC2" name="houseC" value="塑钢窗">
                <label for="houseC2">塑钢窗</label>
                <input type="checkbox" id="houseC3" name="houseC" value="铝合金窗">
                <label for="houseC3">铝合金窗</label>
                <input type="checkbox" id="houseC4" name="houseC" value="塑铝窗">
                <label for="houseC4">塑铝窗</label>
                <input type="checkbox" id="houseC5" name="houseC" value="钢窗">
                <label for="houseC5">钢窗</label>
                <input type="checkbox" id="houseC6" name="houseC" value="木窗">
                <label for="houseC6">木窗</label>
                <input type="checkbox" id="houseC7" name="houseC" value="其他">
                <label for="houseC7">其他</label>
                <input type="checkbox" id="houseC8" name="houseC" value="无">
                <label for="houseC8">无</label>
            </td>
        </tr>
        <tr>
            <td>办公地面</td>
            <td>
                <input type="checkbox" id="houseBgdm1" name="houseBgdm" value="水泥地">
                <label for="houseBgdm1">水泥地</label>
                <input type="checkbox" id="houseBgdm2" name="houseBgdm" value="实木地板">
                <label for="houseBgdm2">实木地板</label>
                <input type="checkbox" id="houseBgdm3" name="houseBgdm" value="复合地板">
                <label for="houseBgdm3">复合地板</label>
                <input type="checkbox" id="houseBgdm4" name="houseBgdm" value="地砖">
                <label for="houseBgdm4">地砖</label>
                <input type="checkbox" id="houseBgdm5" name="houseBgdm" value="地板革">
                <label for="houseBgdm5">地板革</label>
                <input type="checkbox" id="houseBgdm6" name="houseBgdm" value="地毯">
                <label for="houseBgdm6">地毯</label>
                <input type="checkbox" id="houseBgdm7" name="houseBgdm" value="其他">
                <label for="houseBgdm7">其他</label>
                <input type="checkbox" id="houseBgdm8" name="houseBgdm" value="无">
                <label for="houseBgdm8">无</label>
            </td>
        </tr>
        <tr>
            <td>办公墙面</td>
            <td>
                <input type="checkbox" id="houseBgqm1" name="houseBgqm" value="乳胶漆">
                <label for="houseBgqm1">乳胶漆</label>
                <input type="checkbox" id="houseBgqm2" name="houseBgqm" value="墙纸">
                <label for="houseBgqm2">墙纸</label>
                <input type="checkbox" id="houseBgqm3" name="houseBgqm" value="水泥">
                <label for="houseBgqm3">水泥</label>
                <input type="checkbox" id="houseBgqm4" name="houseBgqm" value="包木墙裙">
                <label for="houseBgqm4">包木墙裙</label>
                <input type="checkbox" id="houseBgqm5" name="houseBgqm" value="软包">
                <label for="houseBgqm5">软包</label>
                <input type="checkbox" id="houseBgqm6" name="houseBgqm" value="其他">
                <label for="houseBgqm6">其他</label>
                <input type="checkbox" id="houseBgqm7" name="houseBgqm" value="无">
                <label for="houseBgqm7">无</label>
            </td>
        </tr>
        <tr>
            <td>办公天花</td>
            <td>
                <input type="checkbox" id="houseBgth1" name="houseBgth" value="乳胶漆">
                <label for="houseBgth1">乳胶漆</label>
                <input type="checkbox" id="houseBgth2" name="houseBgth" value="水泥">
                <label for="houseBgth2">水泥</label>
                <input type="checkbox" id="houseBgth3" name="houseBgth" value="造型吊顶">
                <label for="houseBgth3">造型吊顶</label>
                <input type="checkbox" id="houseBgth4" name="houseBgth" value="石膏吊角线">
                <label for="houseBgth4">石膏吊角线</label>
                <input type="checkbox" id="houseBgth5" name="houseBgth" value="墙纸">
                <label for="houseBgth5">墙纸</label>
                <input type="checkbox" id="houseBgth6" name="houseBgth" value="木吊角线">
                <label for="houseBgth6">木吊角线</label>
                <input type="checkbox" id="houseBgth7" name="houseBgth" value="其他">
                <label for="houseBgth7">其他</label>
                <input type="checkbox" id="houseBgth8" name="houseBgth" value="无">
                <label for="houseBgth8">无</label>
            </td>
        </tr>
        <tr>
            <td>商业经营区域地面</td>
            <td>
                <input type="checkbox" id="houseSydm1" name="houseSydm" value="水泥地">
                <label for="houseSydm1">水泥地</label>
                <input type="checkbox" id="houseSydm2" name="houseSydm" value="实木地板">
                <label for="houseSydm2">实木地板</label>
                <input type="checkbox" id="houseSydm3" name="houseSydm" value="复合地板">
                <label for="houseSydm3">复合地板</label>
                <input type="checkbox" id="houseSydm4" name="houseSydm" value="地砖">
                <label for="houseSydm4">地砖</label>
                <input type="checkbox" id="houseSydm5" name="houseSydm" value="地板革">
                <label for="houseSydm5">地板革</label>
                <input type="checkbox" id="houseSydm6" name="houseSydm" value="地毯">
                <label for="houseSydm6">地毯</label>
                <input type="checkbox" id="houseSydm7" name="houseSydm" value="其他">
                <label for="houseSydm7">其他</label>
                <input type="checkbox" id="houseSydm8" name="houseSydm" value="无">
                <label for="houseSydm8">无</label>
            </td>
        </tr>
        <tr>
            <td>商业经营区域墙面</td>
            <td>
                <input type="checkbox" id="houseSyqm1" name="houseSyqm" value="乳胶漆">
                <label for="houseSyqm1">乳胶漆</label>
                <input type="checkbox" id="houseSyqm2" name="houseSyqm" value="墙纸">
                <label for="houseSyqm2">墙纸</label>
                <input type="checkbox" id="houseSyqm3" name="houseSyqm" value="水泥">
                <label for="houseSyqm3">水泥</label>
                <input type="checkbox" id="houseSyqm4" name="houseSyqm" value="包木墙裙">
                <label for="houseSyqm4">包木墙裙</label>
                <input type="checkbox" id="houseSyqm5" name="houseSyqm" value="软包">
                <label for="houseSyqm5">软包</label>
                <input type="checkbox" id="houseSyqm6" name="houseSyqm" value="其他">
                <label for="houseSyqm6">其他</label>
                <input type="checkbox" id="houseSyqm7" name="houseSyqm" value="无">
                <label for="houseSyqm7">无</label>
            </td>
        </tr>
        <tr>
            <td>商业经营区域天花</td>
            <td>
                <input type="checkbox" id="houseSyth1" name="houseSyth" value="乳胶漆">
                <label for="houseSyth1">乳胶漆</label>
                <input type="checkbox" id="houseSyth2" name="houseSyth" value="水泥">
                <label for="houseSyth2">水泥</label>
                <input type="checkbox" id="houseSyth3" name="houseSyth" value="造型吊顶">
                <label for="houseSyth3">造型吊顶</label>
                <input type="checkbox" id="houseSyth4" name="houseSyth" value="石膏吊角线">
                <label for="houseSyth4">石膏吊角线</label>
                <input type="checkbox" id="houseSyth5" name="houseSyth" value="墙纸">
                <label for="houseSyth5">墙纸</label>
                <input type="checkbox" id="houseSyth6" name="houseSyth" value="木吊角线">
                <label for="houseSyth6">木吊角线</label>
                <input type="checkbox" id="houseSyth7" name="houseSyth" value="其他">
                <label for="houseSyth7">其他</label>
                <input type="checkbox" id="houseSyth8" name="houseSyth" value="无">
                <label for="houseSyth8">无</label>
            </td>
        </tr>
        <tr>
            <td align="center" colspan="2">
                <button type="submit" style="width: 100%">保存</button>
            </td>
        </tr>
    </table>
</form>
</body>
</html>
<script type="text/javascript">
    var templateColumnEnum = new TemplateColumnEnum();
    TemplateService.selectTemplateColumnEnum(templateColumnEnum, function (templateColumnEnumList) {
        for (var i = 0; i < templateColumnEnumList.length; i++) {
            templateColumnEnum = templateColumnEnumList[i];
            var element = document.getElementById("template" + templateColumnEnum.templateId + "Column" + templateColumnEnum.columnId);
            if (element != null) {
                if (element.options != null) {
                    document.getElementById("template" + templateColumnEnum.templateId + "Column" + templateColumnEnum.columnId).options.add(new Option(templateColumnEnum.enumValue, templateColumnEnum.enumValue));
                }
            }
        }

        var orderHouse = new OrderHouse();
        orderHouse.orderId = "${orderId}";
        OrderService.selectOrderHouseList(orderHouse, function (list) {
            if(list.length > 0) {
                orderHouse = list[0];
                dwr.util.setValues(orderHouse);
                dwr.util.setValue("houseKtdm", orderHouse.houseKtdm.split(","));
                dwr.util.setValue("houseKtqm", orderHouse.houseKtqm.split(","));
                dwr.util.setValue("houseKtth", orderHouse.houseKtth.split(","));
                dwr.util.setValue("houseWsdm", orderHouse.houseWsdm.split(","));
                dwr.util.setValue("houseWsqm", orderHouse.houseWsqm.split(","));
                dwr.util.setValue("houseWsth", orderHouse.houseWsth.split(","));
                dwr.util.setValue("houseCfdm", orderHouse.houseCfdm.split(","));
                dwr.util.setValue("houseCfqm", orderHouse.houseCfqm.split(","));
                dwr.util.setValue("houseCfth", orderHouse.houseCfth.split(","));
                dwr.util.setValue("houseCfsb", orderHouse.houseCfsb.split(","));
                dwr.util.setValue("houseWsjdm", orderHouse.houseWsjdm.split(","));
                dwr.util.setValue("houseWsjqm", orderHouse.houseWsjqm.split(","));
                dwr.util.setValue("houseWsjth", orderHouse.houseWsjth.split(","));
                dwr.util.setValue("houseWsjsb", orderHouse.houseWsjsb.split(","));
                dwr.util.setValue("houseRhm", orderHouse.houseRhm.split(","));
                dwr.util.setValue("houseNm", orderHouse.houseNm.split(","));
                dwr.util.setValue("houseC", orderHouse.houseC.split(","));
                dwr.util.setValue("houseBgdm", orderHouse.houseBgdm.split(","));
                dwr.util.setValue("houseBgqm", orderHouse.houseBgqm.split(","));
                dwr.util.setValue("houseBgth", orderHouse.houseBgth.split(","));
                dwr.util.setValue("houseSydm", orderHouse.houseSydm.split(","));
                dwr.util.setValue("houseSyqm", orderHouse.houseSyqm.split(","));
                dwr.util.setValue("houseSyth", orderHouse.houseSyth.split(","));
            } else {
                var templateValue = new TemplateValue();
                var templateValueFk = new TemplateValueFk();

                templateValueFk.fkId = "${houseId}";
                TemplateService.selectTemplateValue(templateValue, templateValueFk, function (list) {
                    setForm(list);
                    templateValueFk.fkId = "${sampleId}";
                    TemplateService.selectTemplateValue(templateValue, templateValueFk, function (list) {
                        setForm(list);
                    });
                });
            }
        });
    });

    function setForm(list) {
        var value;
        var template41Column418 = "";
        for (var i = 0; i < list.length; i++) {
            templateValue = list[i];
            value = templateValue.columnValueStr != null && templateValue.columnValueStr.length > 0 ? templateValue.columnValueStr : templateValue.columnValueNum;
            if ((templateValue.templateId == 41 && templateValue.columnId == 4) ||
                    (templateValue.templateId == 41 && templateValue.columnId == 5) ||
                    (templateValue.templateId == 41 && templateValue.columnId == 6) ||
                    (templateValue.templateId == 41 && templateValue.columnId == 7) ||
                    (templateValue.templateId == 41 && templateValue.columnId == 8) ||
                    (templateValue.templateId == 41 && templateValue.columnId == 9) ||
                    (templateValue.templateId == 41 && templateValue.columnId == 10) ||
                    (templateValue.templateId == 41 && templateValue.columnId == 11) ||
                    (templateValue.templateId == 41 && templateValue.columnId == 12) ||
                    (templateValue.templateId == 41 && templateValue.columnId == 13) ||
                    (templateValue.templateId == 41 && templateValue.columnId == 14) ||
                    (templateValue.templateId == 41 && templateValue.columnId == 15) ||
                    (templateValue.templateId == 41 && templateValue.columnId == 16) ||
                    (templateValue.templateId == 41 && templateValue.columnId == 17) ||
                    (templateValue.templateId == 41 && templateValue.columnId == 18)) {
                template41Column418 += value + templateValue.templateColumn.columnName;
            } else if (document.getElementById("template" + templateColumnEnum.templateId + "Column" + templateColumnEnum.columnId + "Td") != null) {
                element = document.getElementById("template" + templateColumnEnum.templateId + "Column" + templateColumnEnum.columnId + "Td");
                var checkbox = document.createElement("input");
                checkbox.type = "checkbox";
                checkbox.id = "template" + templateColumnEnum.templateId + "Column" + templateColumnEnum.columnId + "Enum" + templateColumnEnum.enumId;
                checkbox.name = "template" + templateColumnEnum.templateId + "Column" + templateColumnEnum.columnId;
                checkbox.value = templateColumnEnum.enumValue;
                var label = document.createElement("label");
                label.htmlFor = "template" + templateColumnEnum.templateId + "Column" + templateColumnEnum.columnId + "Enum" + templateColumnEnum.enumId;
                label.innerText = templateColumnEnum.enumValue;
                element.appendChild(checkbox);
                element.appendChild(label);
            } else {
                if (document.getElementById("template" + templateValue.templateId + "Column" + templateValue.columnId) != null) {
                    dwr.util.setValue("template" + templateValue.templateId + "Column" + templateValue.columnId, value);
                }
            }
        }
        if(template41Column418.length > 0) {
            dwr.util.setValue("template41Column418", template41Column418);
        }
    }
    function insertOrderHouse() {
        var orderHouse = dwr.util.getFormValues("orderForm");
        orderHouse.houseKtdm = orderHouse.houseKtdm.join(",");
        orderHouse.houseKtqm = orderHouse.houseKtqm.join(",");
        orderHouse.houseKtth = orderHouse.houseKtth.join(",");
        orderHouse.houseWsdm = orderHouse.houseWsdm.join(",");
        orderHouse.houseWsqm = orderHouse.houseWsqm.join(",");
        orderHouse.houseWsth = orderHouse.houseWsth.join(",");
        orderHouse.houseCfdm = orderHouse.houseCfdm.join(",");
        orderHouse.houseCfqm = orderHouse.houseCfqm.join(",");
        orderHouse.houseCfth = orderHouse.houseCfth.join(",");
        orderHouse.houseCfsb = orderHouse.houseCfsb.join(",");
        orderHouse.houseWsjdm = orderHouse.houseWsjdm.join(",");
        orderHouse.houseWsjqm = orderHouse.houseWsjqm.join(",");
        orderHouse.houseWsjth = orderHouse.houseWsjth.join(",");
        orderHouse.houseWsjsb = orderHouse.houseWsjsb.join(",");
        orderHouse.houseRhm = orderHouse.houseRhm.join(",");
        orderHouse.houseNm = orderHouse.houseNm.join(",");
        orderHouse.houseC = orderHouse.houseC.join(",");
        orderHouse.houseBgdm = orderHouse.houseBgdm.join(",");
        orderHouse.houseBgqm = orderHouse.houseBgqm.join(",");
        orderHouse.houseBgth = orderHouse.houseBgth.join(",");
        orderHouse.houseSydm = orderHouse.houseSydm.join(",");
        orderHouse.houseSyqm = orderHouse.houseSyqm.join(",");
        orderHouse.houseSyth = orderHouse.houseSyth.join(",");
        OrderService.insertOrderHouse(orderHouse, function () {
            alert("保存成功");
        });
        return false;
    }
</script>