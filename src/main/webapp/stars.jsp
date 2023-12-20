<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title>收藏夹 | <s:property value="#session.Username" default="未登录"/></title>
    <%@ include file="component/static.jsp" %>
    <style>
        .essayBlock {
            border: 2px dashed #666;
            margin: 20px 30px;
            padding: 15px;
        }

        .essay-props {
            color: #666;
            font-size: 12px;
        }

        .option {
            font-size: 12px;
        }

        .option-unstar {
            color: rgba(147, 134, 0, 0.87);
        }
    </style>
</head>
<body>
<div class="container-fluid">
    <%@ include file="component/navbar.jsp" %>

    <s:iterator value="starList" var="staredEssay">

        <div class="essayBlock">
                <%-- 标题 --%>
            <h4 class="essay-title">
                <s:property value="#staredEssay.getTitle()" default="err"/>
            </h4>

                <%-- 文章属性 --%>
            <p class="essay-props">
                <span><s:property value="#staredEssay.getTime()" default="err"/></span>
                <span>&nbsp;&nbsp;|&nbsp;&nbsp;by&nbsp;</span>
                <span><s:property value="#staredEssay.getAuthor()" default="err"/></span>
            </p>

                <%-- 正文 --%>
            <p class="essay-content">
                <s:property value="#staredEssay.getContent()" default="err"/>
            </p>

                <%-- 操作 --%>
            <p>
                <a href="
                    <s:url action="delete">
                        <s:param name="essayId" value="#staredEssay.getEssayId()" />
                    </s:url>
                " class="option option-unstar">取消收藏</a>
            </p>
        </div>
    </s:iterator>
</div>
</body>
</html>
