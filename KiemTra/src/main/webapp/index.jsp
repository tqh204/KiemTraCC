<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <!DOCTYPE html
    PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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
    <div id="rightPan">
      <div id="featured">
        <h2></h2>
        <p class="headline">Nam eu nulla. Donec lobortis purus vel urna. Nunc laoreet lacinia nunc.Nam eu nulla. Donec lobortis purus vel urna. Nunc laoreet lacinia nunc. In volutpat sodales ipsum. </p>
        <div class="row text-center mt-4">
                  <!-- Người B code giao diện Bootstrap nhưng vẫn điền dữ liệu cứng (tĩnh) -->
                  <div class="col-md-4 mb-4">
                    <div class="card shadow-sm">
                      <img src="images/img_prod.jpg" class="card-img-top" alt="Product" />
                      <div class="card-body">
                        <h5 class="card-title text-primary">Morbi volutpat leo in</h5>
                        <h6 class="card-subtitle mb-2"><a href="#" class="text-decoration-none">Nam eu nulla. Donec</a></h6>
                        <p class="card-text text-muted">lobortis purus vel urna. Nunc laoreet lacinia nunc</p>
                        <button class="btn btn-sm btn-success">Thêm vào giỏ</button>
                      </div>
                    </div>
                  </div>
                  <!-- B copy paste HTML ra 2 khối Card y hệt cho sản phẩm 2, 3... -->
                </div>
                <div class="clear"></div>
    </div>

      <jsp:include page="includes/footer.jsp" />

      <div align="center">This template downloaded form
        <a href='http://all-free-download.com/free-website-templates/'>free website templates</a>
      </div>

  </body>

  </html>