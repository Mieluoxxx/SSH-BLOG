<%@page pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">MyBlog</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" href="index.jsp">主页</a>
                </li>
                <li class="nav-item">
                    <s:a action="list" class="nav-link">浏览文章</s:a>
                </li>
                <s:if test="#session.Username!=null">
                    <a class="nav-link" href="writing.jsp">撰写文章</a>
                </s:if>
            </ul>
            <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                <s:if test="#session.Username==null">
                    <li class="nav-item">
                        <a class="nav-link" href="login.jsp">登录</a>
                    </li>
                </s:if>
                <s:else>
                    <a class="nav-link" href="logout.action">注销</a>
                    <a class="nav-link" href="#"><s:property value="#session.Username" /></a>
                </s:else>
            </ul>
        </div>
    </div>
</nav>