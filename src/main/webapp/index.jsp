<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
  <title>Home | <s:property value="#session.Username" default="未登录" /></title>
  <%@ include file="component/static.jsp" %>
</head>
<body>
<div class="container-fluid">
  <%@ include file="component/navbar.jsp" %>
  <!-- 轮播 -->
  <div id="demo" class="carousel slide" data-bs-ride="carousel">

    <!-- 指示符 -->
    <div class="carousel-indicators">
      <button type="button" data-bs-target="#demo" data-bs-slide-to="0" class="active"></button>
      <button type="button" data-bs-target="#demo" data-bs-slide-to="1"></button>
      <button type="button" data-bs-target="#demo" data-bs-slide-to="2"></button>
    </div>

    <div class="carousel-inner">
      <div class="carousel-item active">
        <img src="img/1.png" class="d-block" style="width:100%">
      </div>
      <div class="carousel-item">
        <img src="img/2.png" class="d-block" style="width:100%">
      </div>
      <div class="carousel-item">
        <img src="img/3.png" class="d-block" style="width:100%">
      </div>
    </div>

    <button class="carousel-control-prev" type="button" data-bs-target="#demo" data-bs-slide="prev">
      <span class="carousel-control-prev-icon"></span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#demo" data-bs-slide="next">
      <span class="carousel-control-next-icon"></span>
    </button>
  </div>
</div>
</body>
</html>

<style>
  .carousel {
    width: 100%;
  }

  .carousel-inner {
    width: 100%;
    max-height: 100vh; /* 限制轮播图高度至视口高度 */
  }

  .carousel-item {
    width: 100%;
    height: 100vh; /* 设置轮播项高度为视口高度 */
  }

  .carousel-item img {
    object-fit: cover;
    width: 100%;
    height: 100%;
  }
</style>
