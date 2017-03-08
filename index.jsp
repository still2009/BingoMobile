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
<link rel="stylesheet" href="css/mui.min.css">
<link rel="stylesheet" href="css/base.css">
<link rel="stylesheet" href="css/animate.css">
</head>
<body>
	<!--欢迎页-->
	<s:if test="#request.firstTime != null && #request.firstTime == 1">
		<div class="welcome">
			<div class="mui-slider-item">
				<div class="item-logo"
					style="background: url(../assets/img/guide/guide_01.png) no-repeat 0 0; background-size: 100% 100%;">
					<div class="animate guide-show">
						<h2 class="animated bounceInDown">
							<img src="images/slide_02.png">
						</h2>
						<li class="animated bounceInLeft">
							<img src="images/slide_03.png">
						</li>
						<li class="animated bounceInRight">
							<img src="images/slide_04.png">
						</li>
					</div>
				</div>
			</div>
			<a id="closeSelf" class="mui-btn mui-btn-warning">进入首页</a>
		</div>
	</s:if>
	<div id="offCanvasWrapper" class="mui-off-canvas-wrap mui-draggable">
		<!--侧滑菜单部分-->
			<%@include file="jsp/aside.jsp"%>
		<!--主界面部分-->
		<div class="mui-inner-wrap">
			<header class="mui-bar mui-bar-nav">
				<a href="#offCanvasSide" class="mui-icon mui-action-menu mui-icon-bars mui-pull-left"></a>
				<a href="#search" class="mui-icon mui-icon-search mui-pull-right"></a>
				<h1 class="mui-title">首页</h1>
			</header>
			<div id="offCanvasContentScroll" class="mui-content mui-scroll-wrapper">
				<div class="mui-scroll">
					<!--首页轮播-->
					<div id="slider" class="mui-slider">
						<div class="mui-slider-group mui-slider-loop">
							<!-- 额外增加的一个节点(循环轮播：第一个节点是最后一张轮播) -->
							<div class="mui-slider-item mui-slider-item-duplicate">
								<a href="#">
									<img src="images/yuantiao.jpg">
									<p class="mui-slider-title">学习是积累的过程</p>
								</a>
							</div>
							<div class="mui-slider-item">
								<a href="#">
									<img src="images/shuijiao.jpg">
									<p class="mui-slider-title">文档就是这么齐全</p>
								</a>
							</div>
							<div class="mui-slider-item">
								<a href="#">
									<img src="images/muwu.jpg">
									<p class="mui-slider-title">时间银行，存储现在，掌握未来</p>
								</a>
							</div>
							<div class="mui-slider-item">
								<a href="#">
									<img src="images/cbd.jpg">
									<p class="mui-slider-title">Color of SIP CBD</p>
								</a>
							</div>
							<div class="mui-slider-item">
								<a href="#">
									<img src="images/yuantiao.jpg">
									<p class="mui-slider-title">静静看这世界</p>
								</a>
							</div>
							<!-- 额外增加的一个节点(循环轮播：最后一个节点是第一张轮播) -->
							<div class="mui-slider-item mui-slider-item-duplicate">
								<a href="#">
									<img src="images/shuijiao.jpg">
									<p class="mui-slider-title">幸福就是可以一起睡觉</p>
								</a>
							</div>
						</div>
						<div class="mui-slider-indicator mui-text-right">
							<div class="mui-indicator mui-active"></div>
							<div class="mui-indicator"></div>
							<div class="mui-indicator"></div>
							<div class="mui-indicator"></div>
						</div>
					</div>
					<div class="mui-list">
						<!--学习资料-->
						<div class="title">
							学习资料
							<a href="page.action?pageName=doc" class="mui-pull-right more">
								更多
								<span class="mui-icon mui-icon-arrowthinright"></span>
							</a>
						</div>
						<ul class="mui-table-view">
							<s:if test="#request.docList == null || #request.docList.size() < 5">
								<p>没有文档</p>
							</s:if>
							<s:else>
								<s:iterator var="doc" value="#request.docList">
									<li class="mui-table-view-cell mui-media">
										<a href="docShow.action?itemId=<s:property value="#doc.id"/>">
											<img class="mui-media-object mui-pull-left" src="images/pdf.png">
											<div class="mui-media-body mui-ellipsis">
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
						<!--时间银行-->
						<div class="title">
							时间银行
							<a href="page.action?pageName=info" class="mui-pull-right more">
								更多
								<span class="mui-icon mui-icon-arrowthinright"></span>
							</a>
						</div>
						<div id="segmentedControl" class="mui-segmented-control">
							<a class="mui-control-item mui-active" href="#item1">服务</a>
							<a class="mui-control-item" href="#item2">需求</a>
						</div>
						<div>
							<div id="item1" class="mui-control-content mui-active">
								<ul class="mui-table-view">
									<s:if test="#request.serviceList == null || #request.servceList.size() < 5">
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
							<div id="item2" class="mui-control-content">
								<ul class="mui-table-view">
									<s:if test="#request.requestList == null || #request.requestList.size() < 5">
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
	<!--搜索div-->
	<div id="search" class="mui-modal">
		<header class="mui-bar mui-bar-nav">
			<a class="mui-icon mui-icon-close mui-pull-right" href="#search"></a>
			<h1 class="mui-title">搜索界面</h1>
		</header>
		<div class="mui-content">
			<form class="mui-content-padded" action="search.action?type=0" method="post"
				onsubmit="return checkWord()">
				<input type="search" class="mui-input-clear" id="word"
					placeholder="智能搜索，请输入关键字(分类,标题,内容,标签)" name="keyword">
				<input class="mui-btn mui-btn-positive mui-btn-block" type="submit"
					id="search" value="搜索"/>
			</form>
		</div>
	</div>
	<script src="js/mui.min.js"></script>
	<script src="js/base.js"></script>
	<%@include file="jsp/aside_script.jsp"%>
	<script>
		//轮播js
		var slider = mui("#slider");
		slider.slider({
			interval : 5000
		});
		//点击隐藏欢迎页
		var closeBtn = document.getElementById("closeSelf");
		closeBtn.addEventListener("tap", function() {
			var that = this;
			that.parentNode.classList.add("fade-out");
			setTimeout(function() {
				that.parentNode.style.display = "none";
			}, 1000);

		})
	</script>
</body>
</html>