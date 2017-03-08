<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>搜索结果</title>
<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
<link href="${pageContext.request.contextPath}/css/mui.min.css" rel="stylesheet" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/base.css">
<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" />
</head>
<body>
	<header class="mui-bar mui-bar-nav">
		<button type="button"
			class="mui-left mui-action-back mui-btn  mui-btn-link mui-btn-nav mui-pull-left">
			<span class="mui-icon mui-icon-left-nav"></span>
		</button>
		<h1 class="mui-title">搜索结果</h1>
	</header>
	<div class="mui-content">
		<div id="segmentedControl" class="mui-segmented-control">
			<s:if test="#request.type==0||#request.type==1">
				<a class="mui-control-item <s:if test="#request.type==0||#request.type==1">mui-active</s:if>" href="#item1">学习资料</a>
			</s:if>
			<s:if test="#request.type==0||#request.type==2">
				<a class="mui-control-item <s:if test="#request.type==2">mui-active</s:if>" href="#item2">时间银行</a>
			</s:if>
		</div>
		<div>
			<div id="item1" class="mui-control-content <s:if test="#request.type==0||#request.type==1">mui-active</s:if>">
				<ul class="mui-table-view">
					<s:if test="#request.docList == null || #request.docList.size() <=0">
						<li class="mui-table-view-cell">没有相关结果</li>
					</s:if>
					<s:else>
						<s:iterator var="doc"  value="#request.docList">
							<li class="mui-table-view-cell">
								<a href="docShow.action?itemId=<s:property value="#doc.id"/>" class="mui-navigate-right">
									<s:property value="#doc.docTitle" />
								</a>
							</li>
						</s:iterator>
					</s:else>
				</ul>
			</div>
			<div id="item2" class="mui-control-content <s:if test="#request.type==2">mui-active</s:if>">
				<ul class="mui-table-view">
					<s:if test="#request.infoList == null || #request.infoList.size() <= 0">
						<li class="mui-table-view-cell">没有相关结果</li>
					</s:if>
					<s:else>
						<s:iterator var="info" value="#request.infoList">
							<li class="mui-table-view-cell">
								<a href="infoShow.action?itemId=<s:property value="#info.id"/>" class="mui-navigate-right">
									<s:property value="#info.infoTitle" />
								</a>
							</li>
						</s:iterator>
					</s:else>
				</ul>
			</div>
		</div>
	</div>
	<script src="${pageContext.request.contextPath}/js/mui.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/app.js"></script>
</body>
</html>