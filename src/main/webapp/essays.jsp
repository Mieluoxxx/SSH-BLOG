<%--
  Created by IntelliJ IDEA.
  User: Valdis
  Date: 2019/6/7
  Time: 18:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
    <title>文章 | <s:property value="#session.Username" default="未登录" /></title>
    <link href="https://cdn.bootcss.com/twitter-bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <link href="./style/myStyle.css" rel="stylesheet">
    <script src="https://cdn.bootcss.com/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <style>
        .essayBlock{
            border: 2px dashed #666;
            margin: 20px 30px;
            padding: 15px;
        }
        .essay-props{
            color: #666;
            font-size: 12px;
        }
        .option {font-size: 12px;}
        .option-delete {
            color: #b30f0c;
        }
        .option-star {
            color: rgba(232, 218, 0, 0.87);
        }
        .option-unstar {
            color: rgba(147, 134, 0, 0.87);
        }
    </style>
</head>
<body>
<div class="container-fluid">
    <ul class="nav">
        <li class="nav-item">
            <a class="nav-link active" href="index.jsp">首页</a>
        </li>
        <li class="nav-item">
            <s:a action="list" class="nav-link">文章</s:a>
        </li>
        <li class="nav-item ml-md-auto">
            <s:if test="#session.Username==null">
                <a class="nav-link" href="login.jsp">登录</a>
            </s:if>
            <s:else>
                <a class="nav-link" href="userHomepage.jsp"><s:property value="#session.Username" /></a>
            </s:else>
        </li>
    </ul>
    <s:iterator value="essayList" var="essay">

        <div class="essayBlock">
            <%-- 标题 --%>
            <h4 class="essay-title">
                <s:property value="#essay.getTitle()" default="err" />
            </h4>

            <%-- 文章属性 --%>
            <p class="essay-props">
                <span><s:property value="#essay.getTime()" default="err" /></span>
                <span>&nbsp;&nbsp;|&nbsp;&nbsp;by&nbsp;</span>
                <span><s:property value="#essay.getAuthor()" default="err" /></span>
            </p>

            <%-- 正文 --%>
            <p class="essay-content">
                <s:property value="#essay.getContent()" default="err" />
            </p>

            <%-- 操作 --%>
            <p>
                <s:set var="j" value="%{!ifStar(#essay.getEssayId())}" />
                <s:if test="#j">
                    <a href="
                        <s:url action="star">
                            <s:param name="essayID" value="#essay.getEssayId()" />
                        </s:url>
                    " class="option option-star">收藏</a>
                </s:if>
                <s:else>
                    <a href="
                        <s:url action="unstar">
                            <s:param name="essayID" value="#essay.getEssayId()" />
                        </s:url>
                    " class="option option-unstar">取消收藏</a>
                </s:else>
                <s:if test="#session.Username==#essay.getAuthor()">
                    <a href="
                        <s:url action="delete">
                            <s:param name="essayID" value="#essay.getEssayId()" />
                        </s:url>
                    " class="option option-delete">删除</a>
                </s:if>
            </p>
        </div>
    </s:iterator>
</div>
</body>
</html>
