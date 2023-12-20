<%@ page import="com.opensymphony.xwork2.ActionContext" %>
<%@ page import="java.io.File" %>
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
            <form action="update.action?essayId=<s:property value='essay.essayId'/>" method="post">
                <div class="form-group">
                    <input id="title" name="title" class="form-control" type="text" placeholder="文章标题" value="<s:property value='essay.title'/>">
                </div>
                <div class="form-group">
                    <textarea rows="15" style="resize:none; height: 50%" id="content" name="content" class="form-control"><s:property value='essay.content'/></textarea>
                </div>
                <div class="mb-3">
                    <label for="picture" class="form-label">选择照片</label>
                    <input type="file" class="form-control" id="picture" name="picture">
                    <div class="invalid-feedback">
                        请选择一个照片文件。
                    </div>
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