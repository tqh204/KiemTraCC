# FULL CODE – FLORAL DESIGN JSP PROJECT

---

## 1. CẤU TRÚC THƯ MỤC & FILE CẦN TẠO

```
KiemTra/
│
├── pom.xml                                         (file Maven)
│
└── src/
    └── main/
        └── webapp/
            │
            ├── WEB-INF/
            │   └── web.xml
            │
            ├── css/
            │   └── styles.css
            │
            ├── images/                             (copy toàn bộ từ thư mục images/ gốc)
            │   ├── b_header.jpg
            │   ├── btn_1.gif / btn_1_over.gif
            │   ├── btn_2.gif / btn_2_over.gif
            │   ├── btn_3.gif / btn_3_over.gif
            │   ├── btn_4.gif / btn_4_over.gif
            │   ├── btn_5.gif / btn_5_over.gif
            │   ├── bullet_m.gif
            │   ├── h_prod.gif
            │   ├── h_welcome.gif
            │   ├── img_prod.jpg
            │   ├── img_prod-13.jpg
            │   ├── img_prod-14.jpg
            │   ├── img_welcome.jpg
            │   ├── logo.gif
            │   ├── slogan.gif
            │   └── slogan2.gif
            │
            ├── includes/
            │   ├── header.jsp
            │   ├── menu.jsp
            │   └── footer.jsp
            │
            └── index.jsp                           (trang chính)
```

---

## 2. CODE TỪNG FILE

---

### 📄 pom.xml
> Vị trí: `KiemTra/pom.xml`

```xml
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0
         http://maven.apache.org/xsd/maven-4.0.0.xsd">
    <modelVersion>4.0.0</modelVersion>
    <groupId>com.floraldesign</groupId>
    <artifactId>KiemTra</artifactId>
    <version>1.0-SNAPSHOT</version>
    <packaging>war</packaging>
    <name>Floral Design JSP</name>
    <properties>
        <maven.compiler.source>11</maven.compiler.source>
        <maven.compiler.target>11</maven.compiler.target>
        <project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
    </properties>
    <dependencies>
        <dependency>
            <groupId>javax.servlet</groupId>
            <artifactId>javax.servlet-api</artifactId>
            <version>4.0.1</version>
            <scope>provided</scope>
        </dependency>
        <dependency>
            <groupId>javax.servlet.jsp</groupId>
            <artifactId>javax.servlet.jsp-api</artifactId>
            <version>2.3.3</version>
            <scope>provided</scope>
        </dependency>
        <dependency>
            <groupId>javax.servlet</groupId>
            <artifactId>jstl</artifactId>
            <version>1.2</version>
        </dependency>
    </dependencies>
    <build>
        <finalName>KiemTra</finalName>
        <plugins>
            <plugin>
                <groupId>org.apache.tomcat.maven</groupId>
                <artifactId>tomcat7-maven-plugin</artifactId>
                <version>2.2</version>
                <configuration>
                    <port>8080</port>
                    <path>/KiemTra</path>
                </configuration>
            </plugin>
        </plugins>
    </build>
</project>
```

---

### 📄 web.xml
> Vị trí: `src/main/webapp/WEB-INF/web.xml`

```xml
<?xml version="1.0" encoding="UTF-8"?>
<web-app xmlns="http://xmlns.jcp.org/xml/ns/javaee"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/javaee
         http://xmlns.jcp.org/xml/ns/javaee/web-app_4_0.xsd"
         version="4.0">
    <display-name>Floral Design JSP</display-name>
    <welcome-file-list>
        <welcome-file>index.jsp</welcome-file>
    </welcome-file-list>
</web-app>
```

---

### 📄 styles.css
> Vị trí: `src/main/webapp/css/styles.css`

```css
/* CSS Document */
body{padding:0px; margin:0px; background:#fff; color:#616161; font:10px/14px Tahoma, sans-serif;}
div, p, ul, h2, h3, h4, img{padding:0px; margin:0px;}
ul{list-style-type:none;}

.clear {clear: both; margin: 0px; height:0}

p a{font:10px/14px Tahoma, sans-serif; color:#868e36; text-decoration:underline;}
p a:hover{ color:#868e36; text-decoration:none;}

.headline{font:10px/14px Tahoma, Geneva, sans-serif; color:#868e36; font-weight:bold}
.headline2{font:10px/14px Tahoma, Geneva, sans-serif; color:#9d1263; font-weight:bold}

#container{width:685px; position:relative; margin:0 auto;}

/* top */
#topLine{width:685px; height:14px; background:#e9e9e9;}

/* logo */
#logoPan{width:685px; height:92px; position:relative}
#logoPan img#logo{position:absolute; top:0; left:19px}
#logoPan img#slogan{position:absolute; top:25px; left:376px}

/* menu */
#menuPan{width:685px; height:38px; background:#f8dae8; position:relative;}
#menuPan ul.menu{position:absolute; top:12px; left:33px; width:640px}
#menuPan ul.menu li{height:16px; margin-right:28px; float:left}
#menuPan ul.menu li a{height:16px; display:block; text-indent:-20000px;}
#menuPan ul.menu li a:hover{height:16px;}

#menuPan ul.menu li.btn_1 a{width:78px; background:url(../images/btn_1.gif) 0 0 no-repeat;}
#menuPan ul.menu li.btn_1 a:hover{width:78px; background:url(../images/btn_1_over.gif) 0 0 no-repeat;}

#menuPan ul.menu li.btn_2 a{width:68px; background:url(../images/btn_2.gif) 0 0 no-repeat;}
#menuPan ul.menu li.btn_2 a:hover{width:68px; background:url(../images/btn_2_over.gif) 0 0 no-repeat;}

#menuPan ul.menu li.btn_3 a{width:75px; background:url(../images/btn_3.gif) 0 0 no-repeat;}
#menuPan ul.menu li.btn_3 a:hover{width:75px; background:url(../images/btn_3_over.gif) 0 0 no-repeat;}

#menuPan ul.menu li.btn_4 a{width:64px; background:url(../images/btn_4.gif) 0 0 no-repeat;}
#menuPan ul.menu li.btn_4 a:hover{width:64px; background:url(../images/btn_4_over.gif) 0 0 no-repeat;}

#menuPan ul.menu li.btn_5{margin-right:0}
#menuPan ul.menu li.btn_5 a{width:71px; background:url(../images/btn_5.gif) 0 0 no-repeat;}
#menuPan ul.menu li.btn_5 a:hover{width:71px; background:url(../images/btn_5_over.gif) 0 0 no-repeat;}

#menuPan ul.menu li.line{width:9px; background:url(../images/bullet_m.gif) 0 4px no-repeat}

/* HEADER */
#header{width:685px; height:238px; background: url(../images/b_header.jpg) 0 0 no-repeat; position:relative;}
#header img#slogan2{position:absolute; top:76px; left:19px}

/* content */
#content{width:685px; position:relative; background:#FFF}

#leftPan{width:179px; float:left; margin:26px 39px 0 19px; display:inline}
#rightPan{width:436px; float:left; margin:17px 0 0 0;}

#welcome h2{height:40px; position:relative; background:url(../images/h_welcome.gif) 0 0 no-repeat; margin-bottom:8px}
#welcome img{margin:0 0 16px 4px}
#welcome p{margin-left:4px; margin-right:12px}
#welcome p.headline{margin-bottom:15px}

#featured h2{height:38px; position:relative; background:url(../images/h_prod.gif) 0 0 no-repeat; margin-bottom:6px}
#featured p.headline{margin-bottom:5px}
.featItem{width:116px; float:left; margin-right:44px}
.featItem#i03{margin-right:0}
.featItem img{margin-bottom:15px}

.clear#end{height:20px}

/* footer */
#footer{height:49px; clear:both; width:775px; background:#e8f09c; margin: 0 auto}
#footer p{padding: 10px 0 0 0; font:10px/16px Tahoma, sans-serif; font-weight:normal; text-align:center; color:#000;}
#footer p a{font:10px/16px Tahoma, sans-serif; font-weight:normal; color:#000; text-decoration:none; padding: 0 3px}
#footer p a:hover{text-decoration:underline; color:#000}
```

---

### 📄 header.jsp
> Vị trí: `src/main/webapp/includes/header.jsp`

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div id="logoPan">
  <img src="images/logo.gif" width="192" height="92" alt="" id="logo" />
  <img src="images/slogan.gif" width="297" height="46" alt="" id="slogan" />
</div>
```

---

### 📄 menu.jsp
> Vị trí: `src/main/webapp/includes/menu.jsp`

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div id="menuPan">
  <ul class="menu">
    <li class="btn_1"><a href="#">home page</a></li>
    <li class="line"></li>
    <li class="btn_2"><a href="#">about us</a></li>
    <li class="line"></li>
    <li class="btn_3"><a href="#">bouquets</a></li>
    <li class="line"></li>
    <li class="btn_4"><a href="#">specials</a></li>
    <li class="line"></li>
    <li class="btn_5"><a href="#">contacts</a></li>
  </ul>
</div>
```

---

### 📄 footer.jsp
> Vị trí: `src/main/webapp/includes/footer.jsp`

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div id="footer">
  <p>
    <a href="#">HOME PAGE</a> |
    <a href="#">ABOUT US</a> |
    <a href="#">BOUTQUETS</a> |
    <a href="#">SPECIALS</a> |
    <a href="#">NEWS</a> |
    <a href="#">CONTACTS</a><br/>
    Copyright &copy; Your Company Name | Design by
    <a href="http://freshtemplates.com/">Website Templates</a>
  </p>
</div>
```

---

### 📄 index.jsp  ← TRANG CHÍNH (BẢN HOÀN CHỈNH – DÙNG CÁI NÀY)
> Vị trí: `src/main/webapp/index.jsp`
> ⚠️ **Đây là bản HOÀN CHỈNH** – chứa cả `leftPan` (welcome) + `rightPan` (sản phẩm), giống hệt `index.html`

```jsp
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
        <p class="headline">Nam eu nulla. Donec lobortis purus vel urna. Nunc laoreet lacinia nunc.</p>
        <p>Nam eu nulla. Donec lobortis purus vel urna. Nunc laoreet lacinia nunc. In volutpat sodales
          ipsum. Sed vestibulum. Integer in ante. Sed Nunc laoreet lacinia nunc. In volutpat sodales</p>
      </div>
    </div>

    <div id="rightPan">
      <div id="featured">
        <h2></h2>
        <p class="headline">Nam eu nulla. Donec lobortis purus vel urna. Nunc laoreet lacinia nunc.
          Nam eu nulla. Donec lobortis purus vel urna. Nunc laoreet lacinia nunc. In volutpat sodales ipsum.</p>
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
```

---

## 3. LƯU Ý

- **images/**: Copy toàn bộ file ảnh từ thư mục `images/` gốc vào `src/main/webapp/images/`
- **Deploy**: Dùng Tomcat, trỏ vào thư mục `webapp/` hoặc build WAR rồi deploy
- **Chạy thử nhanh**: Có thể dùng IntelliJ IDEA / Eclipse với Tomcat plugin
