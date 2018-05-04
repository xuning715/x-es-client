<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="/common/session.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
    <HEAD>
        <TITLE></TITLE>
        <link rel="stylesheet" type="text/css" href="${ctx}/css/xtree.css"/>
        <script type="text/javascript" src="${ctx}/js/xtree.js"></script>
        <script type="text/javascript" src="${ctx}/dwr/engine.js"></script>
        <script type="text/javascript" src="${ctx}/dwr/util.js"></script>
        <script type="text/javascript" src="${ctx}/dwr/interface/AreaService.js"></script>
        <script type="text/javascript" src="${ctx}/js/loading.js"></script>
    </HEAD>
    <body>
    <SCRIPT language="javascript" type="">
    var tree = new WebFXTree("1", "全国", "javascript:getNodeList(1)", "0001", 1, 0);
    </SCRIPT>
    </body>
</HTML>
<script type="text/javascript">
getNodeList(1);

function getNodeList(nodeId) {
    removeChildNodes(tree);
    var area = new Area();
    area.areaParentId = nodeId;
    AreaService.selectAreaList(area, callbackSelectAreaList);
    var node = getCurrentNode();
    parent.setArea(node);
}

//解析返回的结果
function callbackSelectAreaList(list){
    if(list.length > 0){
        var node;
        for(var i = 0; i < list.length; i++){
            node = list[i];
            addNode(node);
        }
    }
}

function addNode(node){
    var treeNode = new WebFXTreeItem(node.areaId, node.areaName, "javascript:getNodeList(" + node.areaId + ")", tree.getSelected(), tree, false, false, node.areaLeaf, node.areaCode, node.areaLevel, node.areaState);
}

//更新机构树节点
function updateNode(node, parentNode){
    new WebFXTreeItem(node.areaId, node.areaName, "javascript:getNodeList(" + node.areaId + ")", parentNode, tree, false, false, node.areaLeaf, node.areaCode, node.level, node.areaState);
    removeNode();
}

function removeNode(){
    var node = tree.getSelected();
    if(node != null){
        node.remove();
    }
}

function getCurrentNode(){
    var node = tree.getSelected();
    if(node != null){
        return node;
    }
    else{
        return tree;
    }
}
</script>
