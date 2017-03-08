<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!--侧滑菜单部分-->
<aside id="offCanvasSide" class="mui-off-canvas-left">
	<div id="offCanvasSideScroll" class="mui-scroll-wrapper">
		<div class="mui-scroll">
			<ul class="mui-table-view mui-table-view-chevron mui-table-view-inverted">
				<li class="mui-table-view-cell my-center">
					<a id="my-center" href="personal.action" class="mui-navigate-right">
						<span class="mui-icon mui-icon-contact"></span>
						我的
					</a>
				</li>
				<li class="mui-table-view-cell index">
					<a href="page.action?pageName=main" class="mui-navigate-right">
						<span class="mui-icon mui-icon-paperplane"></span>
						首页
					</a>
				</li>
				<li class="mui-table-view-cell study">
					<a href="page.action?pageName=doc" class="mui-navigate-right">
						<span class="mui-icon mui-icon-chatboxes"></span>
						学习
					</a>
				</li>
				<li class="mui-table-view-cell timebank">
					<a href="page.action?pageName=info" class="mui-navigate-right">
						<span class="mui-icon mui-icon-pengyouquan"></span>
						时间银行
					</a>
				</li>
			</ul>
		</div>
	</div>
</aside>