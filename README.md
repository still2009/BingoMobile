# Bingo大学帮网站移动版
*mui + struts2 + hibernate 实现*

mui是一个混合app开发框架，可以让前端页面在移动平台上拥有和native app相似的视图。移动版网站原域名为`m.bingowe.com`，pc版网站原域名为`bingowe.com`

## 目录结构
- `css/` 存放前端所有样式表
- `js/` 存放前端所有javascript脚本
- `images/` 存放静态图像
- `fonts/` 存放静态字体资源
- `jsp/` 存放动态jsp页面
- `PDF/` 存放显示PDF文档的前端插件和pdf文档
- `WEB-INF/` 存放后端Java代码
	- `classes/`
		- `bean/` model模型所在包
		- `conn/` 数据库连接相关功能包
		- `controller/` 业务action所在包
		- `dao/` 数据访问层
		- `service/` pdf文档转html功能所在包
		- `test/` 测试包
		- `utils/` 工具包
- `META-INF/` 其他

author:李文杰