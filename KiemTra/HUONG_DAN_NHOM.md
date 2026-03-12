# HƯỚNG DẪN LÀM NHÓM – FLORAL DESIGN JSP PROJECT
## Thành viên: Nam (A) và Linh (B)

---

## CẤU TRÚC PROJECT

```
KiemTra/
├── pom.xml                                 ← Nam tạo (Commit 1)
├── HUONG_DAN_NHOM.md
├── src/main/webapp/
│   ├── WEB-INF/
│   │   └── web.xml                         ← Nam tạo (Commit 1)
│   ├── css/
│   │   └── styles.css                      ← Linh tạo (Commit 2)
│   ├── images/                             ← Linh copy (Commit 2)
│   ├── includes/
│   │   ├── header.jsp                      ← Linh tạo (Commit 4)
│   │   ├── menu.jsp                        ← Linh tạo (Commit 4)
│   │   └── footer.jsp                      ← Nam (Commit 6) ⚡ Linh (Commit 8) → CONFLICT
│   └── index.jsp                           ← Nam (Commit 3) ⚡ cả 2 sửa → CONFLICT
```

---

## SƠ ĐỒ LUỒNG CÔNG VIỆC

```
GitHub Remote (origin/main)
        │
        ├── [Commit 1] Nam PUSH: pom.xml + web.xml
        ├── [Commit 2] Linh PULL → PUSH: css + images
        ├── [Commit 3] Nam  PULL → PUSH: index.jsp skeleton
        ├── [Commit 4] Linh PULL → PUSH: header.jsp + menu.jsp
        │
        ├── Nam  PULL → checkout -b feature/nam ─────────────────────┐
        │                                                              │
        ├── Linh PULL → checkout -b feature/linh ──────────────────┐  │
        │                                                           │  │
        │   [Commit 5] Nam: rightPan → index.jsp                   │  │ (feature/nam)
        │   [Commit 6] Nam: footer.jsp (nav links)                 │  │
        │            PUSH origin feature/nam ──────────────────────┼──┘
        │            MERGE feature/nam → main (CLEAN) ─────────────┤
        │                                                           │
        │   [Commit 7] Linh: leftPan → index.jsp         (feature/linh)
        │   [Commit 8] Linh: footer.jsp (copyright)
        │            PUSH origin feature/linh
        │            Linh PULL main → MERGE feature/linh → ⚡ CONFLICT!
        │
        ├── [Commit 9]  Nam  fix index.jsp  → PUSH
        └── [Commit 10] Linh fix footer.jsp → PUSH → DONE ✅
```

---

## THIẾT LẬP BAN ĐẦU (Chỉ làm 1 lần)

### Cả hai người cùng thực hiện:

```bash
# Clone repo về máy (mỗi người chạy trên máy của mình)
git clone https://github.com/<ten-repo>/KiemTra.git
cd KiemTra
```

---

## ===== PHẦN CỦA NAM (Person A) =====

---

### ✅ COMMIT 1 – NAM | `pom.xml` + `web.xml`

**Bước 1: Không cần pull (Nam commit đầu tiên)**

**Bước 2: Tạo file `pom.xml`** ở thư mục gốc:

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

**Bước 3: Tạo file `src/main/webapp/WEB-INF/web.xml`:**

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

**Bước 4: Commit + PUSH lên GitHub:**
```bash
git add pom.xml src/main/webapp/WEB-INF/web.xml
git -c user.name="Nam" -c user.email="nam@example.com" commit -m "[Nam] Commit 1: Khoi tao project, them pom.xml va web.xml"
git push origin main
```
> 📤 **Nam PUSH** → GitHub nhận commit 1

---

### ✅ COMMIT 3 – NAM | `index.jsp` skeleton

**Bước 1: PULL về lấy commit 2 của Linh:**
```bash
git pull origin main
```
> 📥 **Nam PULL** ← lấy commit 2 (css + images của Linh)

**Bước 2: Tạo file `src/main/webapp/index.jsp`:**

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
    <!-- TODO: leftPan va rightPan se duoc them sau -->
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

**Bước 3: Commit + PUSH:**
```bash
git add src/main/webapp/index.jsp
git -c user.name="Nam" -c user.email="nam@example.com" commit -m "[Nam] Commit 3: Them index.jsp khung co ban"
git push origin main
```
> 📤 **Nam PUSH** → GitHub nhận commit 3

---

### ✅ COMMIT 5 – NAM | Thêm `rightPan` vào `index.jsp`

**Bước 1: PULL + tạo nhánh `feature/nam`:**
```bash
git pull origin main
git checkout -b feature/nam
```
> 📥 **Nam PULL** ← lấy commit 4 (header.jsp + menu.jsp của Linh)  
> 🌿 Nam tạo nhánh `feature/nam` để làm song song với Linh

**Bước 2: Sửa `src/main/webapp/index.jsp` – thay phần `<div id="content">` bằng:**

```jsp
  <div id="content">
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
```

**Bước 3: Commit (chưa push vội, tiếp tục commit 6):**
```bash
git add src/main/webapp/index.jsp
git -c user.name="Nam" -c user.email="nam@example.com" commit -m "[Nam] Commit 5: Them noi dung rightPan san pham vao index.jsp"
```

---

### ✅ COMMIT 6 – NAM | Tạo `footer.jsp` (nav links)

**Bước 1: Tạo file `src/main/webapp/includes/footer.jsp`:**

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

**Bước 2: Commit + PUSH nhánh `feature/nam`:**
```bash
git add src/main/webapp/includes/footer.jsp
git -c user.name="Nam" -c user.email="nam@example.com" commit -m "[Nam] Commit 6: Tao footer.jsp voi lien ket dieu huong"
git push origin feature/nam
```
> 📤 **Nam PUSH** nhánh `feature/nam` lên GitHub

**Bước 3: MERGE `feature/nam` vào `main` (Nam làm trước Linh):**
```bash
git checkout main
git pull origin main
git merge feature/nam --no-ff -m "Merge feature/nam: them rightPan va footer nav"
git push origin main
```
> 🔀 **Nam MERGE** `feature/nam` → `main` (clean, không conflict)  
> 📤 **Nam PUSH** `main` lên GitHub

---

### ✅ COMMIT 9 – NAM | Fix conflict `index.jsp`

> ⚡ Lúc này `main` đang bị conflict sau khi Linh merge `feature/linh`

**Bước 1: Mở `src/main/webapp/index.jsp`, xóa các dòng conflict markers và giữ CẢ HAI panel:**

```diff
- <<<<<<< HEAD
- (phiên bản của Nam: chỉ có rightPan)
- =======
- (phiên bản của Linh: chỉ có leftPan)
- >>>>>>> feature/linh
```

**Sửa thành nội dung đầy đủ cả leftPan và rightPan:**

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

**Bước 2: Commit:**
```bash
git add src/main/webapp/index.jsp
git -c user.name="Nam" -c user.email="nam@example.com" commit -m "[Nam] Commit 9: Fix conflict - gop leftPan va rightPan trong index.jsp"
```
> ✅ Nam fix xong conflict của mình, Linh sẽ fix tiếp footer.jsp

---

## ===== PHẦN CỦA LINH (Person B) =====

---

### ✅ COMMIT 2 – LINH | `styles.css` + `images/`

**Bước 1: PULL về lấy commit 1 của Nam:**
```bash
git pull origin main
```
> 📥 **Linh PULL** ← lấy commit 1 (pom.xml + web.xml của Nam)

**Bước 2: Tạo file `src/main/webapp/css/styles.css`:**

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
#topLine{width:685px; height:14px; background:#e9e9e9;}
#logoPan{width:685px; height:92px; position:relative}
#logoPan img#logo{position:absolute; top:0; left:19px}
#logoPan img#slogan{position:absolute; top:25px; left:376px}
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
#header{width:685px; height:238px; background: url(../images/b_header.jpg) 0 0 no-repeat; position:relative;}
#header img#slogan2{position:absolute; top:76px; left:19px}
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
#footer{height:49px; clear:both; width:775px; background:#e8f09c; margin: 0 auto}
#footer p{padding: 10px 0 0 0; font:10px/16px Tahoma, sans-serif; font-weight:normal; text-align:center; color:#000;}
#footer p a{font:10px/16px Tahoma, sans-serif; font-weight:normal; color:#000; text-decoration:none; padding: 0 3px}
#footer p a:hover{text-decoration:underline; color:#000}
```

**Bước 3: Copy toàn bộ ảnh gốc vào `src/main/webapp/images/`** (copy thủ công từ thư mục `images/`)

**Bước 4: Commit + PUSH:**
```bash
git add src/main/webapp/css/styles.css src/main/webapp/images/
git -c user.name="Linh" -c user.email="linh@example.com" commit -m "[Linh] Commit 2: Them CSS va toan bo hinh anh vao webapp"
git push origin main
```
> 📤 **Linh PUSH** → GitHub nhận commit 2

---

### ✅ COMMIT 4 – LINH | `header.jsp` + `menu.jsp`

**Bước 1: PULL về lấy commit 3 của Nam:**
```bash
git pull origin main
```
> 📥 **Linh PULL** ← lấy commit 3 (index.jsp skeleton của Nam)

**Bước 2: Tạo file `src/main/webapp/includes/header.jsp`:**

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div id="logoPan">
  <img src="images/logo.gif" width="192" height="92" alt="" id="logo" />
  <img src="images/slogan.gif" width="297" height="46" alt="" id="slogan" />
</div>
```

**Bước 3: Tạo file `src/main/webapp/includes/menu.jsp`:**

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

**Bước 4: Commit + PUSH:**
```bash
git add src/main/webapp/includes/header.jsp src/main/webapp/includes/menu.jsp
git -c user.name="Linh" -c user.email="linh@example.com" commit -m "[Linh] Commit 4: Tao header.jsp va menu.jsp"
git push origin main
```
> 📤 **Linh PUSH** → GitHub nhận commit 4

---

### ✅ COMMIT 7 – LINH | Thêm `leftPan` vào `index.jsp`

**Bước 1: PULL rồi tạo nhánh `feature/linh`:**
```bash
git pull origin main
git checkout -b feature/linh
```
> 📥 **Linh PULL** ← lấy commit 4 (vì Linh vừa push commit 4 xong)  
> 🌿 Linh tạo nhánh `feature/linh` – **làm song song đồng thời với Nam**

> ⚠️ **Quan trọng:** Linh checkout từ `main` tại thời điểm commit 4 (trước khi Nam merge feature/nam).  
> Đây chính là nguyên nhân tạo ra conflict khi merge sau này!

**Bước 2: Sửa `src/main/webapp/index.jsp` – thay phần `<div id="content">` bằng:**

```jsp
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
    <div class="clear" id="end"></div>
  </div>
```

**Bước 3: Commit (chưa push vội):**
```bash
git add src/main/webapp/index.jsp
git -c user.name="Linh" -c user.email="linh@example.com" commit -m "[Linh] Commit 7: Them noi dung leftPan welcome vao index.jsp"
```

---

### ✅ COMMIT 8 – LINH | Tạo `footer.jsp` (copyright)

**Bước 1: Tạo file `src/main/webapp/includes/footer.jsp`:**

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div id="footer">
  <p>
    Copyright &copy; 2024 Floral Design. All rights reserved.<br/>
    Thiet ke boi <a href="http://freshtemplates.com/">Website Templates</a> |
    Phat trien boi Nhom JSP
  </p>
</div>
```

**Bước 2: Commit + PUSH nhánh `feature/linh`:**
```bash
git add src/main/webapp/includes/footer.jsp
git -c user.name="Linh" -c user.email="linh@example.com" commit -m "[Linh] Commit 8: Tao footer.jsp voi thong tin ban quyen"
git push origin feature/linh
```
> 📤 **Linh PUSH** nhánh `feature/linh` lên GitHub

**Bước 3: Linh MERGE `feature/linh` vào `main` → CONFLICT xảy ra!**
```bash
git checkout main
git pull origin main      # ← Lấy về merge của Nam (feature/nam đã vào main)
git merge feature/linh
```
> 📥 **Linh PULL** ← lấy main đã có commit của Nam  
> 🔀 **Linh MERGE** `feature/linh` → `main`  
> ⚡ **CONFLICT 1:** `src/main/webapp/index.jsp`  
> ⚡ **CONFLICT 2:** `src/main/webapp/includes/footer.jsp`

```
CONFLICT (content): Merge conflict in src/main/webapp/index.jsp
CONFLICT (add/add): Merge conflict in src/main/webapp/includes/footer.jsp
Automatic merge failed; fix conflicts and then commit the result.
```

---

### ✅ COMMIT 10 – LINH | Fix conflict `footer.jsp`

> Hai người cùng ngồi fix: Nam fix `index.jsp`, Linh fix `footer.jsp`

**Bước 1: Mở `src/main/webapp/includes/footer.jsp`, xóa conflict markers:**

```diff
- <<<<<<< HEAD
- (phiên bản của Nam: chỉ có nav links)
- =======
- (phiên bản của Linh: chỉ có copyright)
- >>>>>>> feature/linh
```

**Sửa thành nội dung đầy đủ cả nav links + copyright:**

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
    Copyright &copy; 2024 Floral Design. All rights reserved. | Design by
    <a href="http://freshtemplates.com/">Website Templates</a>
  </p>
</div>
```

**Bước 2: Commit + PUSH lên main:**
```bash
git add src/main/webapp/includes/footer.jsp
git -c user.name="Linh" -c user.email="linh@example.com" commit -m "[Linh] Commit 10: Fix conflict - hoan thien footer.jsp day du nav va ban quyen"
git push origin main
```
> 📤 **Linh PUSH** → Project hoàn thành! ✅

---

## LỆNH GIT ĐẦY ĐỦ THEO THỨ TỰ (Tóm tắt nhanh)

```bash
# ══════════════════════════════════════════════════════════
# PHASE 1 – MAIN BRANCH (Commit 1 → 4, xen kẽ Nam & Linh)
# ══════════════════════════════════════════════════════════

# ── Commit 1: NAM ─────────────────────────────────────────
# [Tạo pom.xml và src/main/webapp/WEB-INF/web.xml]
git add pom.xml src/main/webapp/WEB-INF/web.xml
git -c user.name="Nam" -c user.email="nam@example.com" commit -m "[Nam] Commit 1: Khoi tao project, them pom.xml va web.xml"
git push origin main                    # 📤 Nam PUSH

# ── Commit 2: LINH ────────────────────────────────────────
git pull origin main                    # 📥 Linh PULL ← commit 1 của Nam
# [Tạo src/main/webapp/css/styles.css và copy images/]
git add src/main/webapp/css/ src/main/webapp/images/
git -c user.name="Linh" -c user.email="linh@example.com" commit -m "[Linh] Commit 2: Them CSS va toan bo hinh anh vao webapp"
git push origin main                    # 📤 Linh PUSH

# ── Commit 3: NAM ─────────────────────────────────────────
git pull origin main                    # 📥 Nam PULL ← commit 2 của Linh
# [Tạo src/main/webapp/index.jsp skeleton]
git add src/main/webapp/index.jsp
git -c user.name="Nam" -c user.email="nam@example.com" commit -m "[Nam] Commit 3: Them index.jsp khung co ban"
git push origin main                    # 📤 Nam PUSH

# ── Commit 4: LINH ────────────────────────────────────────
git pull origin main                    # 📥 Linh PULL ← commit 3 của Nam
# [Tạo header.jsp và menu.jsp]
git add src/main/webapp/includes/header.jsp src/main/webapp/includes/menu.jsp
git -c user.name="Linh" -c user.email="linh@example.com" commit -m "[Linh] Commit 4: Tao header.jsp va menu.jsp"
git push origin main                    # 📤 Linh PUSH

# ══════════════════════════════════════════════════════════
# PHASE 2 – FEATURE BRANCHES (Commit 5-6 Nam, Commit 7-8 Linh)
# Cả hai làm SONG SONG, mỗi người trên nhánh riêng
# ══════════════════════════════════════════════════════════

# ── Nam tạo nhánh feature/nam ─────────────────────────────
git pull origin main                    # 📥 Nam PULL ← lấy mới nhất
git checkout -b feature/nam             # 🌿 Tạo nhánh mới

# ── Linh tạo nhánh feature/linh (cùng lúc với Nam) ────────
# (Linh chạy lệnh này SONG SONG trên máy của Linh)
git pull origin main                    # 📥 Linh PULL ← lấy mới nhất
git checkout -b feature/linh            # 🌿 Tạo nhánh mới

# ════════════════════════════════════
# PHÍA NAM (chạy trên máy Nam)
# ════════════════════════════════════
# [Sửa index.jsp: thêm rightPan – xem code trong phần Nam commit 5]
git add src/main/webapp/index.jsp
git -c user.name="Nam" -c user.email="nam@example.com" commit -m "[Nam] Commit 5: Them noi dung rightPan san pham vao index.jsp"

# [Tạo footer.jsp phiên bản nav links – xem code trong phần Nam commit 6]
git add src/main/webapp/includes/footer.jsp
git -c user.name="Nam" -c user.email="nam@example.com" commit -m "[Nam] Commit 6: Tao footer.jsp voi lien ket dieu huong"
git push origin feature/nam             # 📤 Nam PUSH nhánh feature/nam

# Nam merge feature/nam vào main TRƯỚC
git checkout main
git pull origin main
git merge feature/nam --no-ff -m "Merge feature/nam: them rightPan va footer nav"
git push origin main                    # 📤 Nam PUSH main (sau merge)

# ════════════════════════════════════
# PHÍA LINH (chạy trên máy Linh)
# ════════════════════════════════════
# [Sửa index.jsp: thêm leftPan – xem code trong phần Linh commit 7]
git add src/main/webapp/index.jsp
git -c user.name="Linh" -c user.email="linh@example.com" commit -m "[Linh] Commit 7: Them noi dung leftPan welcome vao index.jsp"

# [Tạo footer.jsp phiên bản copyright – xem code trong phần Linh commit 8]
git add src/main/webapp/includes/footer.jsp
git -c user.name="Linh" -c user.email="linh@example.com" commit -m "[Linh] Commit 8: Tao footer.jsp voi thong tin ban quyen"
git push origin feature/linh            # 📤 Linh PUSH nhánh feature/linh

# ══════════════════════════════════════════════════════════
# PHASE 3 – MERGE FEATURE/LINH → CONFLICT!
# ══════════════════════════════════════════════════════════

git checkout main
git pull origin main                    # 📥 Linh PULL ← lấy main đã có merge của Nam
git merge feature/linh
# ⚡ CONFLICT 1: src/main/webapp/index.jsp
# ⚡ CONFLICT 2: src/main/webapp/includes/footer.jsp
# >> Automatic merge failed; fix conflicts and then commit the result.

# ════════════════════════════════════
# FIX CONFLICTS (2 người cùng làm)
# ════════════════════════════════════

# Nam fix index.jsp (xem code đầy đủ trong phần Nam commit 9)
git add src/main/webapp/index.jsp
git -c user.name="Nam" -c user.email="nam@example.com" commit -m "[Nam] Commit 9: Fix conflict - gop leftPan va rightPan trong index.jsp"

# Linh fix footer.jsp (xem code đầy đủ trong phần Linh commit 10)
git add src/main/webapp/includes/footer.jsp
git -c user.name="Linh" -c user.email="linh@example.com" commit -m "[Linh] Commit 10: Fix conflict - hoan thien footer.jsp"
git push origin main                    # 📤 PUSH lần cuối → DONE ✅

# ══════════════════════════════════════════════════════════
# KIỂM TRA KẾT QUẢ
# ══════════════════════════════════════════════════════════
git log --oneline --graph --all         # Xem đồ thị commit
git shortlog -sn                        # Đếm commit theo từng người
```

---

## BẢNG TỔNG KẾT

| # | **Nam (A)** | Hành động | **Linh (B)** | Hành động |
|---|------------|-----------|-------------|-----------|
| 1 | ✅ pom.xml + web.xml | 📤 PUSH | | |
| 2 | | | ✅ css + images | 📥 PULL → 📤 PUSH |
| 3 | ✅ index.jsp skeleton | 📥 PULL → 📤 PUSH | | |
| 4 | | | ✅ header.jsp + menu.jsp | 📥 PULL → 📤 PUSH |
| 5 | ✅ rightPan → index.jsp | (feature/nam) | | |
| 6 | ✅ footer.jsp nav | 📤 PUSH → 🔀 MERGE → 📤 PUSH | | |
| 7 | | | ✅ leftPan → index.jsp ⚡ | (feature/linh) |
| 8 | | | ✅ footer.jsp copyright ⚡ | 📤 PUSH → 🔀 MERGE → ⚡ |
| 9 | ✅ Fix index.jsp | 📥 PULL (ngầm) | | |
| 10 | | | ✅ Fix footer.jsp | 📤 PUSH |
| **Tổng** | **5 commits** | | **5 commits** | |

**⚡ Conflicts:** 2 &nbsp;|&nbsp; **📦 Tổng commit:** 10 commits thường + 2 merge commits = **12 commits**
