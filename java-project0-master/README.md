# java-project0
-----------------------------------------------------------------------------------------------------------------------------
### 2019-5-30 13:39更新<br/>
  最近很多人加我qq问我这个项目运行怎么报错，我当时是能运行成功的，下面截图为证明。于是我就自己git clone 了下来一运行，真的报错，一直也没时间解决，今天没什么事情，于是把这些问题全部解决了，现在应该不会报错了，如果有问题可以加我qq895484122，大家可以一起探讨
 ## 运行步骤
    1.首先你要安装git
    2.git clone git@github.com:wantao666/java-project0.git
    3.将项目导入eclipse
    4.新建数据库ssm_crud，运行项目里面的ssm_crud.sql文件
    5.将jdbc.properties和mgb.xml文件中的数据库密码改为你自己的
    6.运行成功
    7.具体项目编写参考地址：http://note.youdao.com/noteshare?id=289befdf16eec44b8f0ab6a5e93e5917




-----------------------------------------------------------------------------------------------------------------------------
```SSM-CRUD
###
项目目录:tree.txt(使用指令 tree /f >tree.txt 生成)
功能点:
1.分页
2.数据校验:
  .jquery前端校验+jsr303后端校验
3.ajax
4.rest风格

技术点:
1.基础框架 ssm(spring+springmvc+mybatis)
2.数据库 mysql
3.项目管理 maven
4.分页 pagehelper
5.逆向工程 mybatis-gennerate

过程:
1.创建maven工程
2.引入项目依赖jar包
  .spring
  .springmvc
  .mybatis
  .数据库连接池,驱动包
  .其他(jstl servlet-api junit)
  .bootstrap,jquery
3.编写配置文件
 web.xml spring.xml springmvc.xml mybatis-config.xml xxxMapper.xml 使用逆向工程生成bean和mapper
4.测试dao层
5.crud 
   1.查询: /emps get
      1.访问index.jsp
	  2.index.jsp页面发送出查员工列表请求
	  3.EmployeeController接受请求,查出员工数据
	  3.跳转到show页面
   2.查询-ajax:(实现客户端无关心,brower,android,ios)
      1.index.jsp页面发送ajax请求
	  2.服务器将查出的数据以json形式返回给浏览器
	  3.浏览器收到json字符串,通过js改变dom来改变页面
	  4.返回json
  3.新增:/emp post
      1.在index页面点击新增
	  2.弹出新增对话框
	  3.查出部门的列表,显示在对话框中
	  4.用户输入数据新增
      5.完成校验:
	       .jquery前端校验+.ajax用户名重复性校验+.重要数据后端校验(JSR303)
   3.修改:/emp put
       1.点击编辑
       2.在模态框中显示修改用户信息
       3.点击修改完成
    4.删除"/emp delete
       1.批量删除
       2.单个删除	 
```
项目截图:<br/>
首页
<img src="https://github.com/wantao666/java-project0/blob/master/result-image/index.png"></img>
添加
<img src="https://github.com/wantao666/java-project0/blob/master/result-image/add.png"></img>
修改
<img src="https://github.com/wantao666/java-project0/blob/master/result-image/update.png"></img>
删除
<img src="https://github.com/wantao666/java-project0/blob/master/result-image/delete.png"></img>
流程
<img src="https://github.com/wantao666/java-project0/blob/master/result-image/process.png"></img>
参考视频
<a target="_blank" href="https://pan.baidu.com/s/1077lpVwMiwhw4L6CHSHW1w">点击我</a>
