<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title>注册 | <s:property value="#session.Username" default="未登录"/></title>
    <%@ include file="component/static.jsp" %>
</head>
<body>
<div class="container-fluid">
    <%@ include file="component/navbar.jsp" %>
    <div class="row">
        <div class="col-md-4"></div>
        <div class="col-md-4">
            <form action="register.action" method="post">
                <div class="form-group">
                    <label for="username">用户名：</label>
                    <input class="form-control" type="text" id="username" name="username" placeholder="输入用户名"/>
                </div>
                <div class="form-group">
                    <label for="password">密码：</label>
                    <input class="form-control" type="password" id="password" name="password" placeholder="输入密码"/>
                </div>
                <div class="form-group">
                    <label for="password_repeat">重复密码：</label>
                    <input class="form-control" type="password" id="password_repeat" name="password_repeat"
                           placeholder="重复密码"/>
                </div>
                <div class="form-group">
                    <input type="submit" class="btn btn-success" value="注册">
                    <input type="reset" class="btn btn-warning" value="重置">
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>
