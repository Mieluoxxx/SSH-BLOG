<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
    <title>编辑文章 | <s:property value="#session.Username" default="未登录" /></title>
    <%@ include file="component/static.jsp" %>
</head>
<body>
<div class="container-fluid">
    <%@ include file="component/navbar.jsp" %>
    <div class="row">
        <div class="col-md-3"></div>
        <div class="col-md-6">
            <form action="produce.action" method="post">
                <div class="form-group">
                    <input id="title" name="title" class="form-control" type="text" placeholder="文章标题">
                </div>
                <div class="form-group">
                    <textarea rows="15" style="resize:none" id="content" name="content" class="form-control" placeholder="正文内容..." style="height: 50%"></textarea>
                </div>
                <div class="form-group text-center">
                    <input class="btn btn-success mx-auto" type="submit">
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>
