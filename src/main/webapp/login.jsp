<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
    <title>登录 | <s:property value="#session.Username" default="未登录" /></title>
    <%@ include file="component/static.jsp" %>
</head>
<body>
<div class="container-fluid">
    <%@ include file="component/navbar.jsp" %>
    <div class="row vertical-center">
        <div class="col-md-4 mx-auto">
            <form action="login.action" method="post">
                <h1 class="h3 mb-3 fw-normal">Please sign in</h1>
                <div class="form-group">
                    <input class="form-control" id="username" type="text" name="username" placeholder="输入用户名" />
                </div>
                <div class="form-group mb-3">
                    <input class="form-control" id="password" type="password" name="password" placeholder="输入密码" />
                </div>
                <div class="form-group">
                    <input class="btn btn-primary w-100 py-2" type="submit" value="登录">
                </div>
                <div class="form-group">
                    <span>没有账号?<a href="signup.jsp">注册</a></span>
                </div>
            </form>
        </div>
    </div>

</div>
</body>
</html>

<style>
    .vertical-center {
        display: flex;
        align-items: center;
        min-height: 80vh; /* Set a minimum height to occupy the full viewport */
    }
    .col-md-4 {
        max-width: 350px; /* 设置最大宽度为您希望的值 */
        width: 100%; /* 让其占据可用宽度 */
        margin: 0 auto; /* 将其水平居中 */
    }
    .form-group input.form-control {
        height: 55px; /* 调整高度为您希望的值 */
        font-size: 16px; /* 可选：调整字体大小为您希望的值 */
        padding: 10px; /* 可选：调整内边距为您希望的值 */
    }
</style>