<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <title>Floral Design</title>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <link href="css/styles.css" rel="stylesheet" type="text/css" />
</head>
<body>

<div id="container">
  <div id="topLine"></div>

  <jsp:include page="includes/header.jsp" />

  <jsp:include page="includes/menu.jsp" />

  <div id="header">
    <img src="images/slogan2.gif" width="192" height="70" alt="" id="slogan2" />
  </div>

  <div id="content">

    <div id="leftPan">
      <div id="welcome">
        <h2></h2>
        <img src="images/img_welcome.jpg" width="172" height="56" alt="" />
        <p class="headline">Nam eu nulla. Donec lobortis purus vel urna. Nunc laoreet lacinia nunc. </p>
        <p>Nam eu nulla. Donec lobortis purus vel urna. Nunc laoreet lacinia nunc. In volutpat sodales
          ipsum. Sed vestibulum. Integer in ante. Sed Nunc laoreet lacinia nunc. In volutpat sodales </p>
      </div>
    </div>

    <div id="rightPan">
      <div id="featured">
        <h2></h2>
        <p class="headline">Nam eu nulla. Donec lobortis purus vel urna. Nunc laoreet lacinia nunc.Nam eu nulla. Donec lobortis purus vel urna. Nunc laoreet lacinia nunc. In volutpat sodales ipsum. </p>
        <div class="featItem" id="i01">
          <img src="images/img_prod.jpg" width="116" height="125" alt="" />
          <p><span class="headline2">Morbi volutpat leo in</span><br />
            <a href="#">Nam eu nulla. Donec</a><br />
            lobortis purus vel urna. Nunc laoreet lacinia nunc</p>
        </div>
        <div class="featItem" id="i02">
          <img src="images/img_prod-13.jpg" width="116" height="125" alt="" />
          <p><span class="headline2">Morbi volutpat leo in</span><br />
            <a href="#">Nam eu nulla. Donec</a><br />
            lobortis purus vel urna. Nunc laoreet lacinia nunc</p>
        </div>
        <div class="featItem" id="i03">
          <img src="images/img_prod-14.jpg" width="116" height="125" alt="" />
          <p><span class="headline2">Morbi volutpat leo in</span><br />
            <a href="#">Nam eu nulla. Donec</a><br />
            lobortis purus vel urna. Nunc laoreet lacinia nunc</p>
        </div>
        <div class="clear"></div>
      </div>
    </div>

    <div class="clear" id="end"></div>
  </div>
</div>

<jsp:include page="includes/footer.jsp" />

<div align="center">This template downloaded form
  <a href='http://all-free-download.com/free-website-templates/'>free website templates</a>
</div>

</body>
</html>