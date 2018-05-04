<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="/common/session.jsp"%>
<c:set var="orgId" value="${param.orgId}" />
<c:set var="orgCode" value="${param.orgCode}" />
<c:set var="orgType" value="${param.orgType}" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
    <HEAD>
        <TITLE></TITLE>
        <link rel="stylesheet" type="text/css" href="${ctx}/css/xtree.css"/>
        <script type="text/javascript" src="${ctx}/js/xtree.js"></script>
        <script type="text/javascript" src="${ctx}/dwr/engine.js"></script>
        <script type="text/javascript" src="${ctx}/dwr/util.js"></script>
        <script type="text/javascript" src="${ctx}/dwr/interface/OrgService.js"></script>
        <script type="text/javascript" src="${ctx}/js/loading.js"></script>
    </HEAD>
    <body onload="init();">
    <SCRIPT language="javascript" type="">
    var orgTree = new WebFXTree("${orgId}", "请选择", "javascript:getOrgList('${orgId}')", "${orgCode}", "${orgType}");
    </SCRIPT>
    </body>
</HTML>
<script type="text/javascript">

function init() {
    getOrgList("${orgId}");
}

function getOrgList(orgId) {
    var org = new Org();
    org.orgParentId = orgId;
    OrgService.selectOrgList(org, callbackSelectOrgList);
}

//解析返回的结果
function callbackSelectOrgList(list){
    removeChildNodes(orgTree);
    if(list.length > 0){
        var org;
        for(var i = 0; i < list.length; i++){
            org = list[i];
            addOrgNode(org);
        }
    }
}

function addOrgNode(org){
    var node = new WebFXTreeItem(org.orgId, org.orgFullName, "javascript:getOrgList('" + org.orgId + "')", getCurrentOrg(), orgTree, false, false, 0, org.orgCode, org.orgType);
}

//更新机构树节点
function updateOrgNode(org, parentNode){
    new WebFXTreeItem(org.orgId, org.orgFullName, "javascript:getOrgList('" + org.orgId + "')", parentNode, orgTree, false, false, 0, org.orgCode, org.orgType);
    removeOrgNode();
}

function removeOrgNode(){
    var node = orgTree.getSelected();
    if(node != null){
        node.remove();
    }
}

function getCurrentOrg(){
    var node = orgTree.getSelected();
    if(node != null){
        return node;
    }
    else{
        return orgTree;
    }
}
</script>
