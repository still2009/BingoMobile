<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>用户中心</title>
<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/mui.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/base.css">
<style>
html, body {
	background-color: #efeff4;
}

.mui-views, .mui-view, .mui-pages, .mui-page, .mui-page-content {
	position: absolute;
	left: 0;
	right: 0;
	top: 0;
	bottom: 0;
	width: 100%;
	height: 100%;
	background-color: #efeff4;
}

.mui-pages {
	top: 46px;
	height: auto;
}

.mui-scroll-wrapper, .mui-scroll {
	background-color: #efeff4;
}

.mui-page.mui-transitioning {
	-webkit-transition: -webkit-transform 200ms ease;
	transition: transform 200ms ease;
}

.mui-page-left {
	-webkit-transform: translate3d(0, 0, 0);
	transform: translate3d(0, 0, 0);
}

.mui-ios .mui-page-left {
	-webkit-transform: translate3d(-20%, 0, 0);
	transform: translate3d(-20%, 0, 0);
}

.mui-navbar {
	position: fixed;
	right: 0;
	left: 0;
	z-index: 10;
	height: 44px;
	background-color: #f7f7f8;
}

.mui-navbar .mui-bar {
	position: absolute;
	background: transparent;
	text-align: center;
}

.mui-android .mui-navbar-inner.mui-navbar-left {
	opacity: 0;
}

.mui-ios .mui-navbar-left .mui-left, .mui-ios .mui-navbar-left .mui-center,
	.mui-ios .mui-navbar-left .mui-right {
	opacity: 0;
}

.mui-navbar .mui-btn-nav {
	-webkit-transition: none;
	transition: none;
	-webkit-transition-duration: .0s;
	transition-duration: .0s;
}

.mui-navbar .mui-bar .mui-title {
	display: inline-block;
	position: static;
	width: auto;
}

.mui-page-shadow {
	position: absolute;
	right: 100%;
	top: 0;
	width: 16px;
	height: 100%;
	z-index: -1;
	content: '';
}

.mui-page-shadow {
	background: -webkit-linear-gradient(left, rgba(0, 0, 0, 0) 0,
		rgba(0, 0, 0, 0) 10%, rgba(0, 0, 0, .01) 50%, rgba(0, 0, 0, .2) 100%);
	background: linear-gradient(to right, rgba(0, 0, 0, 0) 0,
		rgba(0, 0, 0, 0) 10%, rgba(0, 0, 0, .01) 50%, rgba(0, 0, 0, .2) 100%);
}

.mui-navbar-inner.mui-transitioning, .mui-navbar-inner .mui-transitioning
	{
	-webkit-transition: opacity 200ms ease, -webkit-transform 200ms ease;
	transition: opacity 200ms ease, transform 200ms ease;
}

.mui-page {
	display: none;
}

.mui-pages .mui-page {
	display: block;
}

.mui-page .mui-table-view:first-child {
	margin-top: 15px;
}

.mui-page .mui-table-view:last-child {
	margin-bottom: 30px;
}

.mui-table-view {
	margin-top: 20px;
}

.mui-table-view:after {
	height: 0;
}

.mui-table-view span.mui-pull-right {
	color: #999;
}

.mui-table-view-divider {
	background-color: #efeff4;
	font-size: 14px;
}

.mui-table-view-divider:before, .mui-table-view-divider:after {
	height: 0;
}

.mui-content-padded {
	margin: 10px 0px;
}

.mui-locker {
	margin: 35px auto;
	display: none;
}

.mui-navbar {
	background-color: #c9394a;
}

.mui-navbar h1 {
	color: #fff;
}

.mui-navbar button {
	color: #fff;
}

.mui-navbar-inner .mui-btn-link {
	color: #fff;
}

.info .mui-state {
	margin: 10px 0 10px 20px;
}

#avatar .mui-btn {
	text-indent: 0;
}

#avatar .publish {
	width: 90px;
}

.mui-modal .mui-content .mui-scroll-wrapper {
	top: 46px;
}

.mui-radio {
	width: 45%;
}

.mui-input-row {
	clear: none;
	line-height: 35px;
}

form label {
	font-size: 14px;
}

.mui-input-row {
	text-align: center;
	padding: 0 10px;
}

.mui-input-row .mui-btn {
	float: none;
	width: auto;
	padding: 5px 15px;
}

.mui-card {
	margin-bottom: 10px;
	/*                padding:5px;*/
}

.mui-card h3 {
	font-size: 16px;
	font-weight: normal;
	text-indent: 10px;
	background-color: #F5D6DC;
	margin: 0 -5px;
	line-height: 40px;
	height: 40px;
}

label {
	padding-left: 30px;
}

.inner-content {
	text-indent: 10px;
	color: #666;
	font-size: 14px;
	padding: 5px;
}
</style>
</head>
<body>
	<!--页面主结构开始-->
	<div id="app" class="mui-views">
		<div class="mui-view">
			<div class="mui-navbar"></div>
			<div class="mui-pages"></div>
		</div>
	</div>
	<!--页面主结构结束-->
	<!--单页面开始-->
	<div id="setting" class="mui-page">
		<!--页面标题栏开始-->
		<div class="mui-navbar-inner mui-bar mui-bar-nav">
			<button type="button"
				class="mui-left mui-action-back mui-btn  mui-btn-link mui-btn-nav mui-pull-left">
				<span class="mui-icon mui-icon-left-nav"></span>
			</button>
			<h1 class="mui-center mui-title">个人中心</h1>
		</div>
		<!--页面标题栏结束-->
		<!--页面主内容区开始-->
		<div class="mui-page-content">
			<div class="mui-scroll-wrapper">
				<div class="mui-scroll">
					<!-- 头像+信息-->
					<ul class="mui-table-view">
						<li class="mui-table-view-cell avatar">
							<div id="avatar">
								<span class="mui-pull-left head">
									<img class="head-img mui-action-preview" id="head-img1"
										src="${pageContext.request.contextPath}/images/<s:property value="#session.user.headPic"/>"
										width="80" height="80" />
								</span>
								<div class="mui-pull-left info">
									<p>
										昵称：
										<s:property value="#session.user.userName" />
									</p>
									<span class="mui-btn mui-btn-sm mui-btn-outlined mui-btn-danger mui-state">普通用户</span>
									<p>
										时间币：
										<span class="num">
											<s:property value="#session.user.points" />
										</span>
									</p>
								</div>
								<!-- 上传、发布-->
								<div class="mui-pull-left publish">
									<p style="margin-bottom: 10px;">
										<a href="#mypublish" class="mui-btn mui-btn-sm mui-btn-danger mui-state">我要发布</a>
									</p>
									<%-- <p>
										<a href="#myupload" class="mui-btn mui-btn-sm mui-btn-primary mui-state" id="uploadBtn">我要上传</a>
									</p> --%>
								</div>
							</div>
						</li>
					</ul>
					<ul class="mui-table-view mui-table-view-chevron">
						<li class="mui-table-view-cell avatar">
							<a href="#info-list" class="mui-navigate-right">
								个人信息
								<span class="mui-pull-right">查看/修改</span>
							</a>
						</li>
						<li class="mui-table-view-cell">
							<a href="#mytime" class="mui-navigate-right">
								我的时间
								<s:if test="#session.user.releasedInfos.size() + #session.infoPartList.size() + #session.infoCollectList.size() != 0">
									<span class="mui-badge mui-badge-danger">
										<s:property value="#session.user.releasedInfos.size() + #session.infoPartList.size() + #session.infoCollectList.size()" />
									</span>
								</s:if>
							</a>
						</li>
						<li class="mui-table-view-cell">
							<a href="#mydocs" class="mui-navigate-right">
								我的文档
								<s:if test="#session.docDownloadList.size() + #session.user.uploadedDocs.size() + #session.docCollectList.size() != 0">
									<span class="mui-badge mui-badge-danger">
										<s:property value="#session.docDownloadList.size() + #session.user.uploadedDocs.size() + #session.docCollectList.size()" />
									</span>
								</s:if>
							</a>
						</li>
						<li class="mui-table-view-cell">
							<a href="#my-orderlist" class="mui-navigate-right">
								我的订单
								<s:if test="#session.user.orderList.size() != 0">
									<span class="mui-badge mui-badge-danger">
										<s:property value="#session.user.orderList.size()" />
									</span>
								</s:if>
							</a>
						</li>
						<%-- <li class="mui-table-view-cell">
							<a href="#time-coins" class="mui-navigate-right">
								时间币明细
								<s:if test="#session.user.points != 0">
									<span class="mui-badge mui-badge-danger">
										<s:property value="#session.user.points" />
									</span>
								</s:if>
							</a>
						</li> --%>
						<li class="mui-table-view-cell">
							<a href="${pageContext.request.contextPath}/page.action?pageName=main"
								class="mui-navigate-right">回到首页 <span class="mui-pull-right">首页</span>
							</a>
						</li>
						<li class="mui-table-view-cell">
							<a id="logoutBtn" class="mui-navigate-right"> 退出登录 </a>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<!--页面主内容区结束-->
	</div>
	<!--单页面结束-->
	<!--个人信息-->
	<div id="info-list" class="mui-page">
		<div class="mui-navbar-inner mui-bar mui-bar-nav">
			<button type="button"
				class="mui-left mui-action-back mui-btn  mui-btn-link mui-btn-nav mui-pull-left">
				<span class="mui-icon mui-icon-left-nav"></span>
			</button>
			<h1 class="mui-center mui-title">个人信息</h1>
		</div>
		<div class="mui-page-content">
			<div class="mui-scroll-wrapper">
				<div class="mui-scroll">
					<div id="segmentedControlUser" class="mui-segmented-control">
						<a class="mui-control-item mui-active" href="#userBasic"> 基本信息 </a>
						<a class="mui-control-item" href="#userHead"> 头像设置 </a>
						<a class="mui-control-item" href="#userPwd"> 密码修改 </a>
						<a class="mui-control-item" href="#userStudent"> 在校生信息 </a>
					</div>
					<div class="mui-content-padded">
						<div id="userBasic" class="mui-control-content mui-active">
							<form class="mui-input-group">
								<div class="mui-input-row">
									<label>用户名</label> <input type="text" id="userName" class="mui-input-clear"
										value="<s:property value="#session.user.userName"/>"
										placeholder="请输入用户名">
								</div>
								<div class="mui-input-row">
									<label>邮箱</label> <input type="text" id="mail" class="mui-input-clear"
										value="<s:property value="#session.user.mail"/>"
										placeholder="请输入常用邮箱">
								</div>
								<div class="mui-input-row">
									<label>电话</label> <input type="text" id="phone" class="mui-input-clear"
										value="<s:property value="#session.user.phone"/>"
										placeholder="请输入常用手机号">
								</div>
								<div class="mui-input-row">
									<label>收货地址</label> <input type="text" id="receiveAddress" class="mui-input-clear"
										value="<s:property value="#session.user.address"/>"
										placeholder="请输入收货地址">
								</div>
								<div class="mui-input-row">
									<a class="mui-btn mui-btn-primary" id="basicBtn">保存</a>
								</div>
							</form>
						</div>
						<div id="userHead" class="mui-control-content">
							<form class="mui-input-group" enctype="multipart/form-data"
								action="headPic.action" method="post" onsubmit="return saveHeadPic()">
								<div class="mui-input-row">
									<input type="file" id="pic" name="pic" class="mui-input-clear" onchange="showPic()"
										placeholder="请选择头像文件">
								</div>
								<div class="mui-button-row">
									<button class="mui-btn mui-btn-primary" type="submit">保存头像</button>
								</div>
							</form>
						</div>
						<div id="userPwd" class="mui-control-content">
							<form class="mui-input-group">
								<div class="mui-input-row">
									<label>原密码</label>
									<input type="password" id="oldPwd" class="mui-input-clear" placeholder="输入原密码">
								</div>
								<div class="mui-input-row">
									<label>新密码</label>
									<input type="password" id="newPwd" class="mui-input-clear" placeholder="输入新密码">
								</div>
								<div class="mui-input-row">
									<label>确认密码</label>
									<input id="confirmPwd" type="password"  placeholder="再次输入新密码">
								</div>
								<div class="mui-input-row">
									<a class="mui-btn mui-btn-primary" id="newPwdBtn">保存</a>
								</div>
							</form>
						</div>
						<div id="userStudent" class="mui-control-content">
							<form class="mui-input-group">
								<div class="mui-input-row">
									<label>真实姓名</label> <input type="text" id="realName" class="mui-input-clear"
										value="<s:property value="#session.user.realName"/>"
										placeholder="输入身份证姓名">
								</div>
								<div class="mui-input-row">
									<label>学号</label> <input type="text" id="studentId" class="mui-input-clear"
										value="<s:property value="#session.user.studentId"/>"
										placeholder="输入您的学号">
								</div>
								<div class="mui-input-row">
									<label>学校</label> <input type="text" id="college" class="mui-input-clear"
										value="<s:property value="#session.user.college"/>"
										placeholder="输入您就读的大学">
								</div>
								<div class="mui-input-row">
									<label>学院</label> <input type="text" id="academy" class="mui-input-clear"
										value="<s:property value="#session.user.academy"/>"
										placeholder="输入您所在的学院">
								</div>
								<div class="mui-input-row">
									<label>专业</label> <input type="text" id="major" class="mui-input-clear"
										value="<s:property value="#session.user.major"/>"
										placeholder="输入您主修的专业">
								</div>
								<div class="mui-input-row">
									<a class="mui-btn mui-btn-primary" id="studentInfoBtn">保存</a>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--我的时间-->
	<div id="mytime" class="mui-page">
		<div class="mui-navbar-inner mui-bar mui-bar-nav">
			<button type="button"
				class="mui-left mui-action-back mui-btn  mui-btn-link mui-btn-nav mui-pull-left">
				<span class="mui-icon mui-icon-left-nav"></span>
			</button>
			<h1 class="mui-center mui-title">我的时间</h1>
		</div>
		<div class="mui-page-content">
			<div class="mui-scroll-wrapper">
				<div class="mui-scroll">
					<div id="segmentedControlInfo" class="mui-segmented-control">
						<a class="mui-control-item mui-active" href="#releasedInfo"> 我发布的 </a>
						<a class="mui-control-item" href="#partInfo"> 我参与的 </a>
						<a class="mui-control-item" href="#collectInfo"> 我收藏的 </a>
					</div>
					<div class="mui-content-padded">
						<div id="releasedInfo" class="mui-control-content mui-active">
							<ul class="mui-table-view">
								<s:if test="#session.user.releasedInfos == null || #session.user.releasedInfos.size() <= 0">
									<li class="mui-table-view-cell">您还没有发布过时间银行信息</li>
								</s:if>
								<s:else>
									<s:iterator var="info" value="#session.user.releasedInfos">
										<li class="mui-table-view-cell">
											<a class="mui-navigate-right"
												href="infoShow.action?itemId=<s:property value="#info.id"/>">
												<s:property value="#info.infoTitle"/>
												<s:if test="#info.infoDirection == 1">
													<span class="mui-badge mui-badge-success">
														需求 $<s:property value="#info.infoPayment" />
													</span>
												</s:if>
												<s:else>
													<span class="mui-badge mui-badge-primary">
														服务 $<s:property value="#info.infoPayment" />
													</span>
												</s:else>
											</a>
										</li>
									</s:iterator>
								</s:else>
							</ul>
						</div>
						<div id="partInfo" class="mui-control-content">
							<ul class="mui-table-view">
								<s:if test="#session.infoPartList == null || #session.infoPartList.size() <= 0">
									<li class="mui-table-view-cell">您还没有取出过时间</li>
								</s:if>
								<s:else>
									<s:iterator var="infoRel" value="#session.infoPartList">
										<li class="mui-table-view-cell">
											<a class="mui-navigate-right"
												href="infoShow.action?itemId=<s:property value="#infoRel.info.id"/>">
												<s:property value="#infoRel.info.infoTitle"/>
												<s:if test="#infoRel.info.infoDirection == 1">
													<span class="mui-badge mui-badge-success">
														需求 $<s:property value="#infoRel.info.infoPayment" />
													</span>
												</s:if>
												<s:else>
													<span class="mui-badge mui-badge-primary">
														服务 $<s:property value="#infoRel.info.infoPayment" />
													</span>
												</s:else>
											</a>
										</li>
									</s:iterator>
								</s:else>
							</ul>
						</div>
						<div id="collectInfo" class="mui-control-content">
							<ul class="mui-table-view">
								<s:if test="#session.infoCollectList == null || #session.infoCollectList.size() <= 0">
									<li class="mui-table-view-cell">您还没有收藏过一段时间(预约过的时间将从这里转移哦~)</li>
								</s:if>
								<s:else>
									<s:iterator var="infoRel" value="#session.infoCollectList">
										<li class="mui-table-view-cell">
											<a class="mui-navigate-right"
												href="infoShow.action?itemId=<s:property value="#infoRel.info.id"/>">
												<s:property value="#infoRel.info.infoTitle"/>
												<s:if test="#infoRel.info.infoDirection == 1">
													<span class="mui-badge mui-badge-success">
														需求 $<s:property value="#infoRel.info.infoPayment" />
													</span>
												</s:if>
												<s:else>
													<span class="mui-badge mui-badge-primary">
														服务 $<s:property value="#infoRel.info.infoPayment" />
													</span>
												</s:else>
											</a>
										</li>
									</s:iterator>
								</s:else>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--我的文档-->
	<div id="mydocs" class="mui-page">
		<div class="mui-navbar-inner mui-bar mui-bar-nav">
			<button type="button"
				class="mui-left mui-action-back mui-btn  mui-btn-link mui-btn-nav mui-pull-left">
				<span class="mui-icon mui-icon-left-nav"></span>
			</button>
			<h1 class="mui-center mui-title">我的文档</h1>
		</div>
		<div class="mui-page-content">
			<div class="mui-scroll-wrapper">
				<div class="mui-scroll">
					<div id="segmentedControlDoc" class="mui-segmented-control">
						<a class="mui-control-item mui-active" href="#releasedDoc"> 我上传的 </a>
						<a class="mui-control-item" href="#downDoc"> 我下载的 </a>
						<a class="mui-control-item" href="#collectDoc"> 我收藏的 </a>
					</div>
					<div class="mui-content-padded">
						<div id="releasedDoc" class="mui-control-content mui-active">
							<ul class="mui-table-view">
								<s:if test="#session.user.uploadedDocs == null || #session.user.uploadedDocs.size() <= 0">
									<li class="mui-table-view-cell">您还没有上传过文档</li>
								</s:if>
								<s:else>
									<s:iterator var="doc" value="#session.user.uploadedDocs">
										<li class="mui-table-view-cell">
											<a class="mui-navigate-right" href="docShow.action?itemId=<s:property value="#doc.id"/>">
												<span class="mui-icon mui-icon-paperclip"></span>
												<span class="mui-badge">$<s:property value="#doc.docPayment" /></span>
												<span class="mui-ellipsis-1"><s:property value="#doc.docTitle" /></span>
											</a>
										</li>
									</s:iterator>
								</s:else>
							</ul>
						</div>
						<div id="downDoc" class="mui-control-content">
							<ul class="mui-table-view">
								<s:if test="#session.docDownloadList == null || #session.docDownloadList.size() <= 0">
									<li class="mui-table-view-cell">您还没有下载过文档</li>
								</s:if>
								<s:else>
									<s:iterator var="docRel" value="#session.docDownloadList">
										<li class="mui-table-view-cell">
											<a class="mui-navigate-right"
												href="docShow.action?itemId=<s:property value="#docRel.doc.id"/>">
												<span class="mui-icon mui-icon-paperclip"></span>
												<span class="mui-badge">
													$
													<s:property value="#docRel.doc.docPayment" />
												</span>
												<span class="mui-ellipsis-1">
													<s:property value="#docRel.doc.docTitle" />
												</span>
											</a>
										</li>
									</s:iterator>
								</s:else>
							</ul>
						</div>
						<div id="collectDoc" class="mui-control-content">
							<ul class="mui-table-view">
								<s:if test="#session.docCollectList == null || #session.docCollectList.size() <= 0">
									<li class="mui-table-view-cell">您还没有收藏过文档</li>
								</s:if>
								<s:else>
									<s:iterator var="docRel" value="#session.docCollectList">
										<li class="mui-table-view-cell">
											<a class="mui-navigate-right"
												href="docShow.action?itemId=<s:property value="#docRel.doc.id"/>">
												<span class="mui-icon mui-icon-paperclip"></span>
												<span class="mui-badge">
													$
													<s:property value="#docRel.doc.docPayment" />
												</span>
												<span class="mui-ellipsis-1">
													<s:property value="#docRel.doc.docTitle" />
												</span>
											</a>
										</li>
									</s:iterator>
								</s:else>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--我的订单-->
	<div id="my-orderlist" class="mui-page">
		<div class="mui-navbar-inner mui-bar mui-bar-nav">
			<button type="button"
				class="mui-left mui-action-back mui-btn  mui-btn-link mui-btn-nav mui-pull-left">
				<span class="mui-icon mui-icon-left-nav"></span>
			</button>
			<h1 class="mui-center mui-title">我的订单</h1>
		</div>
		<div class="mui-page-content">
			<div class="mui-scroll-wrapper">
				<div class="mui-scroll">
					<div id="segmentedControlOrder" class="mui-segmented-control">
						<a class="mui-control-item mui-active" href="#notConfirmed"> 未确认订单 </a>
						<a class="mui-control-item" href="#confirmed"> 已确认订单 </a>
					</div>
					<div id="notConfirmed" class="mui-control-content mui-active">
						<ul class="mui-table-view">
							<s:if test="#session.user.notConfirmedOrders().size() == 0">
								<li class="mui-table-view-cell">还没有未确认的订单</li>
							</s:if>
							<s:else>
								<s:iterator value="#session.user.notConfirmedOrders()" var="order">
									<li class="mui-table-view-cell">
										<span class="mui-icon mui-icon-paperclip"></span>
										<s:property value="#order.docTitle"/>
										<span class="mui-badge">
											未确认 $<s:property value="#order.price"/>
										</span>
									</li>
								</s:iterator>
							</s:else>
						</ul>
					</div>
					<div id="confirmed" class="mui-control-content">
						<ul class="mui-table-view">
							<s:if test="#session.user.confirmedOrders().size() == 0">
								<li class="mui-table-view-cell">还没有已确认的订单</li>
							</s:if>
							<s:else>
								<s:iterator value="#session.user.confirmedOrders()" var="order">
									<li class="mui-table-view-cell">
										<span class="mui-icon mui-icon-paperclip"></span>
										<s:property value="#order.docTitle"/>
										<span class="mui-badge">
											已确认 $<s:property value="#order.price"/>
										</span>
									</li>
								</s:iterator>
							</s:else>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--时间币明细-->
	<%-- <div id="time-coins" class="mui-page">
		<div class="mui-navbar-inner mui-bar mui-bar-nav">
			<button type="button"
				class="mui-left mui-action-back mui-btn  mui-btn-link mui-btn-nav mui-pull-left">
				<span class="mui-icon mui-icon-left-nav"></span>
			</button>
			<h1 class="mui-center mui-title">时间币明细</h1>
		</div>
		<div class="mui-page-content">
			<div class="mui-scroll-wrapper">
				<div class="mui-scroll">
					<ul class="mui-table-view">
							<li class="mui-table-view-cell">
								消费日期
								<span class="mui-badge mui-badge-success">+$18</span>
							</li>
							<li class="mui-table-view-cell">
								消费日期
								<span class="mui-badge mui-badge-danger">+$18</span>
							</li>
						</ul>
				</div>
			</div>
		</div>
	</div> --%>
	<!--发布-->
	<div id="mypublish" class="mui-modal">
		<header class="mui-bar mui-bar-nav">
			<a class="mui-icon mui-icon-close mui-pull-right" href="#mypublish"></a>
			<h1 class="mui-title">发布界面</h1>
		</header>
		<div class="mui-content">
			<form class="mui-input-group">
				<div class="mui-input-row">
					<div class="mui-input-row mui-radio mui-pull-left mui-left">
						<input name="infoType" type="radio" value="-1"> <label>发布服务</label>
					</div>
					<div class="mui-input-row mui-radio mui-pull-left mui-left">
						<input name="infoType" type="radio" value="1"> <label>发布需求</label>
					</div>
				</div>
				<div class="mui-input-row">
					<label>标签</label> <input type="text" placeholder="普通输入框" id="infoTag">
				</div>
				<div class="mui-input-row">
					<label>标题</label> <input type="text" class="mui-input-clear"
						id="infoTitle" placeholder="输入标题">
				</div>
				<div class="mui-input-row" style="height: auto;">
					<label>内容</label>
					<textarea rows="5" id="infoContent"></textarea>
				</div>
				<div class="mui-input-row">
					<label>截止时间</label> <input type="date" placeholder="截止时间" id="infoDeadline">
				</div>
				<div class="mui-input-row">
					<label>时间币价格</label> <input type="number" id="price">
				</div>
				<button class="mui-btn mui-btn-primary mui-btn-block" id="releaseInfo">发布</button>
			</form>
		</div>
	</div>
	<!--上传-->
	<div id="myupload" class="mui-modal">
		<header class="mui-bar mui-bar-nav">
			<a class="mui-icon mui-icon-close mui-pull-right" href="#myupload"></a>
			<h1 class="mui-title">上传界面</h1>
		</header>
		<div class="mui-content">
			<form class="mui-input-group">
				<div class="mui-input-row">
					<label>文件</label> <input type="file">
				</div>
				<div class="mui-input-row">
					<label>标签</label> <input type="text" class="mui-input-clear" placeholder="输入标签">
				</div>
				<div class="mui-input-row">
					<label>标题</label> <input type="text" class="mui-input-clear" placeholder="输入标题">
				</div>
				<div class="mui-input-row" style="height: auto;">
					<label>简介</label>
					<textarea rows="8"></textarea>
				</div>
				<div class="mui-input-row">
					<label>分类</label> <select>
						<option>理学</option>
						<option>文学</option>
						<option>历史学</option>
						<option>工学</option>
						<option>医学</option>
						<option>管理学</option>
						<option>艺术学</option>
						<option>其他</option>
					</select>
				</div>
				<div class="mui-input-row">
					<label>售价</label> <input type="number">
				</div>
				<div class="mui-button-row">
					<button class="mui-btn mui-btn-primary" onclick="return false;">上传</button>
					&nbsp;&nbsp;
					<button class="mui-btn mui-btn-primary" onclick="return false;">取消</button>
				</div>
			</form>
		</div>
	</div>
</body>
<script src="${pageContext.request.contextPath}/js/mui.min.js"></script>
<script src="${pageContext.request.contextPath}/js/mui.view.js "></script>
<script src="${pageContext.request.contextPath}/js/app.js"></script>
<script>
	mui.init();
	//初始化单页view
	var viewApi = mui('#app').view({
		defaultPage : '#setting'
	});
	//初始化单页的区域滚动
	mui('.mui-scroll-wrapper').scroll();
	var view = viewApi.view;
	(function($) {
		//处理view的后退与webview后退
		var oldBack = $.back;
		$.back = function() {
			if (viewApi.canBack()) { //如果view可以后退，则执行view的后退
				viewApi.back();
				window.location.reload();
			} else { //执行webview后退
				oldBack();
				window.location.reload();
			}
		};
		//监听页面切换事件方案1,通过view元素监听所有页面切换事件，目前提供pageBeforeShow|pageShow|pageBeforeBack|pageBack四种事件(before事件为动画开始前触发)
		//第一个参数为事件名称，第二个参数为事件回调，其中e.detail.page为当前页面的html对象
		view.addEventListener('pageBeforeShow', function(e) {
			//				console.log(e.detail.page.id + ' beforeShow');
		});
		view.addEventListener('pageShow', function(e) {
			//				console.log(e.detail.page.id + ' show');
		});
		view.addEventListener('pageBeforeBack', function(e) {
			//				console.log(e.detail.page.id + ' beforeBack');
		});
		view.addEventListener('pageBack', function(e) {
			//				console.log(e.detail.page.id + ' back');
		});
	})(mui);
	window.onload = function() {
		var basic = document.getElementById('basicBtn');
		var newPwd = document.getElementById('newPwdBtn');
		var Student = document.getElementById('studentInfoBtn');
		var releaseInfo = document.getElementById('releaseInfo');
		basic.addEventListener('tap', saveBasic);
		newPwd.addEventListener('tap', saveNewPwd);
		Student.addEventListener('tap', saveStudentInfo);
		releaseInfo.addEventListener('tap', releaseInfoFunc);
		
		var logout = document.getElementById('logoutBtn');
		logout.addEventListener('tap',logoutFunc);
	}
	//发布信息
	//js获取radioGroup的值
	function GetRadioValue(RadioName) {
		var obj;
		obj = document.getElementsByName(RadioName);
		if (obj != null) {
			var i;
			for (i = 0; i < obj.length; i++) {
				if (obj[i].checked) {
					return obj[i].value;
				}
			}
		}
		return null;
	}
	function releaseInfoFunc(){
		var infoType = GetRadioValue('infoType');
		if(infoType==null) {alert('发布类型不能为空');return;}
		
		var infoTag = document.getElementById('infoTag').value;
		infoTag = infoTag.trim();
		if(infoTag == null || infoTag == ''){alert('标签不能为空');return;}
		
		var infoTitle = document.getElementById('infoTitle').value;
		infoTitle = infoTitle.trim();
		if(infoTitle == null || infoTitle == '' || infoTitle.length > 10){alert('标题在10个字以内');return;}
		
		var infoContent = document.getElementById('infoContent').value;
		infoContent = infoContent.trim();
		if(infoContent == null || infoContent == '' || infoContent.length < 25){alert('内容至少25字');return;}
		
		var infoDeadline = document.getElementById('infoDeadline').value;
		infoDeadline = infoDeadline.trim();
		if(infoDeadline == null || infoDeadline == ''){alert('截止日期不能为空');return;}
		
		var price = document.getElementById('price').value;
		price = price.trim();
		if(price == null || price == ''){alert('价格不能为空');return;}
		
		var formData = {
				infoType:infoType,
				infoTag:infoTag,
				infoTitle:infoTitle,
				infoDeadline:infoDeadline,
				infoDescription:infoContent,
				infoDeadline:infoDeadline,
				infoPay:price
		};
		mui.post('releaseInfo.action',formData,function(data){
			if(data=='no_points') alert('积分不足，无法发布');
			else if(data=='success') {
				alert('发布成功');
				window.location.reload();
			}
			else if(data=='logout') {
				alert('登陆失效，请重新登陆');
				window.location.href='${pageContext.request.contextPath}/jsp/login.jsp';
			}
		},'text');
	}
	//退出登录
	function logoutFunc() {
		var flag = confirm("确定退出登录吗？");
		if (flag)
			window.location.href = 'logout.action';
	}
	//保存个人基本信息
	function saveBasic() {
		mui.post('basic.action', {
			userName : document.getElementById('userName').value,
			mail : document.getElementById('mail').value,
			phone : document.getElementById('phone').value,
			address : document.getElementById('receiveAddress').value
		}, function(data) {
			//服务器返回响应，根据响应结果，分析是否登录成功；
			alert(data);
		}, 'text');
	}
	//本地图片预览
	//file域发生变化时显示本地图片
	function showPic() {
		/* var file = document.getElementById('headPic').files[0];
		var reader = new FileReader();
		reader.readAsDataURL(file);
		reader.onload = function(e){
		    var pic = document.getElementById('headPic');
		    pic.src=this.result;
		} */
	}
	//保存头像
	function saveHeadPic() {
		var file = document.getElementById('pic').files[0];
		if(file == null){
			alert('请选择图片');
			return false;
		}
		return true;
	}
	//保存新密码
	function saveNewPwd() {
		var oldPwd = document.getElementById('oldPwd');
		var newPwd = document.getElementById('newPwd');
		var confirmPwd = document.getElementById('confirmPwd');
		if (newPwd.value != confirmPwd.value) {
			alert("两次输入的密码不一致");
			return;
		}
		mui.post('pwd.action', {
			oldPwd : oldPwd.value,
			newPwd : newPwd.value,
			confirmPwd : confirmPwd.value,
		}, function(data) {
			alert(data);
			if (data == "密码修改成功,请重新登陆")
				loacation.reload(true);
		}, 'text');
	}
	//保存大学生信息
	function saveStudentInfo() {
		mui.post('campus.action', {
			realName : document.getElementById('realName').value,
			studentId : document.getElementById('studentId').value,
			college : document.getElementById('college').value,
			academy : document.getElementById('academy').value,
			major : document.getElementById('major').value
		}, function(data) {
			alert(data);
		}, 'text');
	}
</script>
</html>