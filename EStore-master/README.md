# EStore百脑科技商城

# 一、起步
- ### 项目简介

	该项目基于JavaWeb的网上电子科技购物平台，实现展示商品、购买商品、提交订单、持久化保存到数据库等基本功能。该系统分为登录、注册、商品展示、购物车管理、退出五个模块。登录模块实现了用户名和密码登录验证、验证码验证、记住用户名等功能；商品展示模块实现了商品详情、加入购物车和按价格查询等功能；购物车模块实现了查看、删除、结账和清空购物车等功能；退出模块实现了查看账户信息和退出用户等功能。

- ### 使用技术
	* IDE：Eclipse
	* 数据库：MySQL
	* 数据源：C3P0 
	* JDBC 工具：DBUtils
	* 前端框架：Bootstrap
	* Ajax 解决方案：jQuery + JavaScript + JSON

- ### 快速上手
	- 在MySQL中创建一个名为estore的数据库（字符编码gb2312），导入提供的estore.sql
	- 使用eclipse导入项目
	- 用到的jar包在WEB-INF/lib目录下，记得添加tomcat的jar包，build path即可
	- 修改src/c3p0-config.xml中的数据库账号密码
	- 在eclipse中配置好tomcat，然后启动即可


# 二、预览



### 1、首页

![](EStore-master/img-folder/homepage.gif)

### 2、分页

![](https://i.imgur.com/IuFmvYt.png)

### 3、范围筛选

![](https://i.imgur.com/35SjE32.png)

### 4、购物车

![](https://i.imgur.com/5bczaKm.png)

### 5、结账

![](https://i.imgur.com/xPb2N4m.png)




 

