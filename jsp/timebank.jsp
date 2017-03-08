<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>bingowe 首页</title>
<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/mui.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/base.css">
</head>
<body>
	<div id="offCanvasWrapper" class="mui-off-canvas-wrap mui-draggable">
		<!--侧滑菜单部分-->
		<%@include file="aside.jsp"%>
		<!--主界面部分-->
		<div class="mui-inner-wrap">
			<header class="mui-bar mui-bar-nav">
				<a href="#offCanvasSide" class="mui-icon mui-action-menu mui-icon-bars mui-pull-left"></a>
				<a href="#search" class="mui-icon mui-icon-search mui-pull-right"></a>
				<h1 class="mui-title">时间银行</h1>
			</header>
			<div id="offCanvasContentScroll" class="mui-content mui-scroll-wrapper">
				<div class="mui-scroll">
					<div class="mui-list">
						<!--时间银行-->
						<div class="title">时间银行</div>
						<div id="segmentedControl" class="mui-segmented-control">
							<a class="mui-control-item mui-active" href="#item1">需求</a>
							<a class="mui-control-item" href="#item2">服务</a>
						</div>
						<div>
							<div id="item1" class="mui-control-content mui-active">
								<ul class="mui-table-view">
									<s:if test="#request.requestList == null || #request.requestList.size() <=0 ">
										<p>没有需求</p>
									</s:if>
									<s:else>
										<s:iterator var="info" value="#request.requestList">
											<li class="mui-table-view-cell mui-media">
												<a href="infoShow.action?itemId=<s:property value="#info.id"/>">
													<img class="mui-media-object mui-pull-right mui-radius"
													src="${pageContext.request.contextPath}/images/<s:property value="#info.user.headPic"/>">
													<div class="mui-media-body mui-ellipsis">
														<s:property value="#info.infoTitle" />
														<p class='mui-ellipsis'>
															<span class="mui-icon mui-icon-contact" style="color:gray;"></span>
															<s:property value="#info.user.userName" />
														</p>
													</div>
												</a>
											</li>
										</s:iterator>
									</s:else>
								</ul>
							</div>
							<div id="item2" class="mui-control-content">
								<ul class="mui-table-view">
									<s:if test="#request.serviceList == null || #request.servceList.size() <= 0">
										<p>没有服务</p>
									</s:if>
									<s:else>
										<s:iterator var="info" value="#request.serviceList">
											<li class="mui-table-view-cell mui-media">
												<a href="infoShow.action?itemId=<s:property value="#info.id"/>">
													<img class="mui-media-object mui-pull-right mui-radius"
													src="${pageContext.request.contextPath}/images/<s:property value="#info.user.headPic"/>">
													<div class="mui-media-body mui-ellipsis">
														<s:property value="#info.infoTitle" />
														<p class='mui-ellipsis'>
															<span class="mui-icon mui-icon-contact" style="color:gray;"></span>
															<s:property value="#info.user.userName" />
														</p>
													</div>
												</a>
											</li>
										</s:iterator>
									</s:else>
								</ul>
							</div>
						</div>
					</div>
					<!--尾部footer-->
					<footer>
						<a href="html/law.html">法律保护</a>
						<a href="html/contact.html">联系我们</a>
					</footer>
				</div>
			</div>
			<!-- off-canvas backdrop -->
			<div class="mui-off-canvas-backdrop"></div>
			<!--回到顶部-->
			<a id="backTop" href="javascript:;" data-title="返回顶部"
				style="display: block; position: fixed; bottom：10px; right: 10px;">
				<div class="btn-inner-text">返回顶部</div>
			</a>
		</div>
	</div>
	<div id="search" class="mui-modal">
		<header class="mui-bar mui-bar-nav">
			<a class="mui-icon mui-icon-close mui-pull-right" href="#search"></a>
			<h1 class="mui-title">搜索界面</h1>
		</header>
		<div class="mui-content">
			<form class="mui-content-padded" action="search.action?type=2" method="post"
				onsubmit="return checkWord()">
				<input type="search" class="mui-input-clear" id="word"
					placeholder="智能搜索，请输入关键字(分类,标题,内容,标签)" name="keyword">
				<input class="mui-btn mui-btn-positive mui-btn-block" type="submit"
					id="search" value="搜索"/>
			</form>
		</div>
	</div>
	<script src="${pageContext.request.contextPath}/js/mui.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/base.js"></script>
	<%@include file="aside_script.jsp"%>
</body>
</html>