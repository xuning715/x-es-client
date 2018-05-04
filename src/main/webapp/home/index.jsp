<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="/common/session.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
    <HEAD>
        <TITLE>红魔方</TITLE>
        <link rel="stylesheet" type="text/css" href="${ctx}/css/menu.css">
        <link rel="stylesheet" type="text/css" href="${ctx}/css/style.css"/>
        <link rel="stylesheet" type="text/css" href="${ctx}/css/ext-all.css"/>
        <script type="text/javascript" src="${ctx}/js/menu.js"></script>
        <script type="text/javascript" src="${ctx}/js/ext-base.js"></script>
        <script type="text/javascript" src="${ctx}/js/ext-all.js"></script>
        <script type="text/javascript">
        var tabPanelCenter = new Ext.TabPanel({
            region:'center',
            deferredRender:false,
            enableTabScroll:true,
            activeTab:0,
            margins:'0 5 0 0',
            iconCls: 'tabs',
            items:[{
                id:'home',
                contentEl:'centerDiv',
                title: '首页',
                closable:false,
                autoScroll:true
            }]
        });

        Ext.onReady(function(){
            var viewport = new Ext.Viewport({
                layout:'border',
                maximizable: true,
                items:[
                {
                    region:'north',
                    title:' ',
                    contentEl: 'northDiv',
                    height: 90,
                    collapsible: true,
                    split:true,
                    margins:'5 5 0 5'
                },
                {
                    region:'west',
                    title:' ',
                    width: 200,
                    collapsible: true,
                    split:true,
                    margins:'0 0 0 5',
                    layout:'accordion',
                    iconCls:'nav1',
                    contentEl:'westDiv'
                },
                {
                    region:'south',
                    contentEl: 'southDiv',
                    height: 0,
                    collapsible: false,
                    split:true,
                    margins:'0 5 0 5'
                },
                tabPanelCenter]
            });
        });

        function addTab(uuid, tabTitle, targetUrl){
            tabPanelCenter.add({
                id:uuid,
                title: tabTitle,
                iconCls: 'tabs',
                autoLoad: {url: "${ctx}/home/forward.jsp?url=" + targetUrl, callback: this.initSearch, scope: this},
                closable:true
            }).show();
        }

        function showMenuItem(uuid, tabTitle, targetUrl) {
            var tab = tabPanelCenter.getItem(uuid);
            if(tab){
                tabPanelCenter.setActiveTab(tab);
            }
            else{
                tab = addTab(uuid, tabTitle, targetUrl);
            }
        }

        function closeTab(uuid){
            var tab = tabPanelCenter.getItem(uuid);
            tabPanelCenter.remove(tab);
        }

        function closeAllTab(){
            if(confirm("确定关闭所有页签")){
                //循环遍历
                tabPanelCenter.items.each(
	                function(item){
	                    if(item.closable){
	                        //可以关闭的其他所有标签页全部关掉
	                        tabPanelCenter.remove(item);
	                    }
	                }
                );
            }
        }
        </script>
    </HEAD>
    <body style="background-color:#f0f7ff;">
        <div id="northDiv" align="center">
            <%@include file="logo.jsp"%>
        </div>
        <div id="westDiv" style="height:100%">
            <iframe id="westFrame" name="westFrame" src="${ctx}/home/accordion.jsp" width="100%" height="100%" frameborder="0">
            </iframe>
        </div>
        <div id="centerDiv" style="height:100%">
            <iframe id="centerFrame" name="centerFrame" src="${ctx}/home/welcome.jsp" width="100%" height="100%" frameborder="0">
            </iframe>
        </div>
        <div id="southDiv" align="center">
            <br/>
            <span style="color:#4682B4;">  </span>
        </div>
    </body>
</html>