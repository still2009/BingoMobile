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
				<h1 class="mui-title">学习资料</h1>
			</header>
			<div id="offCanvasContentScroll" class="mui-content mui-scroll-wrapper">
				<div class="mui-scroll">
					<div class="mui-list">
						<!--学习资料-->
						<div class="title">最新上传</div>
						<ul class="mui-table-view">
							<s:if test="#request.docList == null || #request.docList.size() < 10">
								<li>没有文档</li>
							</s:if>
							<s:else>
								<s:iterator var="doc" begin="0" end="4" value="#request.docList">
									<li class="mui-table-view-cell mui-media">
										<a href="docShow.action?itemId=<s:property value="#doc.id"/>">
											<img class="mui-media-object mui-pull-left" src="images/pdf.png">
											<div class="mui-media-body">
												<s:property value="#doc.docTitle" />
												<p class='mui-ellipsis'>
													<span class="mui-pull-left">
														<i class="mui-icon mui-icon-download"></i>
														<s:property value="#doc.user.userName" />
													</span>
													<span class="mui-pull-right">
														<i class="mui-time"></i>
														<s:property value="#doc.getFormatDocTime()" />
													</span>
												</p>
											</div>
										</a>
									</li>
								</s:iterator>
							</s:else>
						</ul>
						<div class="title">官方推荐</div>
						<ul class="mui-table-view">
							<s:if test="#request.docList == null || #request.docList.size() < 10">
								<li>没有文档</li>
							</s:if>
							<s:else>
								<s:iterator var="doc" begin="5" end="9" value="#request.docList">
									<li class="mui-table-view-cell mui-media">
										<a href="docShow.action?itemId=<s:property value="#doc.id"/>">
											<img class="mui-media-object mui-pull-left" src="images/pdf.png">
											<div class="mui-media-body">
												<s:property value="#doc.docTitle" />
												<p class='mui-ellipsis'>
													<span class="mui-pull-left">
														<i class="mui-icon mui-icon-download"></i>
														<s:property value="#doc.user.userName" />
													</span>
													<span class="mui-pull-right">
														<i class="mui-time"></i>
														<s:property value="#doc.getFormatDocTime()" />
													</span>
												</p>
											</div>
										</a>
									</li>
								</s:iterator>
							</s:else>
						</ul>
					</div>
					<!--尾部footer-->
					<footer>
						<a href="law.html">法律保护</a>
						<a href="contact.html">联系我们</a>
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
			<form class="mui-content-padded" action="search.action?type=1" method="post"
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