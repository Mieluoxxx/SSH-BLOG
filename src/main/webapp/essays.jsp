<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
    <title>文章 | <s:property value="#session.Username" default="未登录" /></title>
    <%@ include file="component/static.jsp" %>
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
    <%@ include file="component/navbar.jsp" %>
    <form class="d-flex my-2 w-50 mx-auto" action="search.action" method="post">
        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" name="keyword">
        <button class="btn btn-outline-success" type="submit">Search</button>
    </form>

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
                    <s:if test="#session.Username!=null">
                        <a href="
                            <s:url action="star">
                                <s:param name="essayId" value="#essay.getEssayId()" />
                            </s:url>
                        " class="option option-star">收藏</a>
                    </s:if>
                </s:if>
                <s:else>
                    <s:if test="#session.Username!=null">
                    <a href="
                        <s:url action="unstar">
                            <s:param name="essayId" value="#essay.getEssayId()" />
                        </s:url>
                    " class="option option-unstar">取消收藏</a>
                    </s:if>
                </s:else>
                <s:if test="#session.Username==#essay.getAuthor()">
                    <a href="
                        <s:url action="delete">
                            <s:param name="essayId" value="#essay.getEssayId()" />
                        </s:url>
                    " class="option option-delete">删除</a>
                </s:if>
            </p>
        </div>
    </s:iterator>
</div>
</body>
</html>
