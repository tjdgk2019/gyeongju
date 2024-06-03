<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<c:set var="path0" value="<%=request.getContextPath() %>" /> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Gyeongju</title>
<%@ include file="/head.jsp" %>
<script src="${path0 }/js/jquery-3.2.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/particles.js/2.0.0/particles.min.js" defer data-deferred="1"></script>
<style>
body { width: 100%; /* overflow-x:hidden; */ background-color: #c4dfff;}
#header #hd #gnb a.dp { color:#101010;}
#particles-js { position: absolute; width: 100%; height: 100%; }

#contents { width:100%; min-height:calc(100vh - 160px); margin-bottom:5rem; box-sizing:border-box; min-width:1200px; font-family: Noto Sans KR;}
#contents::after { content:""; display:block; width:100%; clear:both; }

.container{ margin: 0 auto; top: 264px; left: 50%; position: absolute; text-align: center; transform: translateX(-50%);
  background-color: #FFF; border-radius: 8px; border-top: 10px solid #79a6fe;
  width: 400px; height: 420px; margin-bottom:160px;}
.box h2 { font-family: Noto Sans KR; font-weight: 700; color: #101010; font-size: 25pt; margin-top: 30px;}

.box h4 span { color: #FFF; font-weight: lighter;}

.box h5 { font-size: 14pt; color: #CCC; letter-spacing: 1.5px; margin-top: -15px; margin-bottom: 70px;}

.box input[type = "text"],.box input[type = "password"] {display: block; margin: 20px auto; background: #DDD; border: 0; border-radius: 5px;
  padding: 14px 10px; width: 320px; outline: none; color: #333;
    -webkit-transition: all .2s ease-out;
    -moz-transition: all .2s ease-out;
    -ms-transition: all .2s ease-out;
    -o-transition: all .2s ease-out;
    transition: all .2s ease-out;
}
::-webkit-input-placeholder {color: #A0A0A0;}

.box input[type = "text"]:focus,.box input[type = "password"]:focus { border: 2px solid #CCC;}

a{color: #598ee4; text-decoration: none;}

a:hover {text-decoration: underline;}

label input[type = "checkbox"] {display: none;}

/* style the artificial checkbox */
label span { height: 13px; width: 13px; border: 2px solid #CCC; border-radius: 2px; display: inline-block; position: relative; cursor: pointer; float: left; left: 7.5%;}

.btn { border: 0; background: #222; color: #FFF; border-radius: 100px; width: 338px; height: 48px; font-size: 14pt;
        position: absolute; top: 71%; left: 8%; transition: 0.3s; cursor: pointer; font-weight: 600;}
.btn:hover { background: #598ee4;}

.id_save { position: absolute; margin-left: -26%; margin-top: -0.6%; color: #333; font-family: Noto Sans KR; font-weight: 400; font-size: 11pt;}
.forgetpass { position: relative; float: right; right: 28px; color: #333; font-family: Noto Sans KR; font-weight: 400; font-size: 11pt;}

.dnthave{ position: absolute; top: 87%; left: 40%; font-weight: 500; font-size: 12pt;}

[type=checkbox]:checked + span:before {/* <-- style its checked state */ font-family: Noto Sans KR;
    font-size: 16px; content: "\f00c"; position: absolute; top: -4px; color: #598ee4; left: -1px; width: 13px;}

.typcn { position: absolute; left: 339px; top: 166px; color: #A0A0A0; font-size: 22px; cursor: pointer;}      
.typcn.active {color: #4d4d4d;}

.error { text-align: center; background-color: #FFF; width: 330px; height: 20px; padding: 2px; border: 0; border-radius: 5px; margin: 10px auto 10px;
  position: absolute; top: 60.6%; left: 8%; color: #d85252; display: none; }

.footer {}
</style>
</head>
<body>
<div id="header" class="clr-fix">
 	<%@ include file="/header.jsp" %>
</div>
<div id="particles-js" class="clr-fix"></div>
<div id="contents" class="clr-fix">
<div class="animated bounceInDown">
  <div class="container">
    <script>
        	$(document).ready(function() {
        		 if ( "<%=request.getAttribute("msg")%>" != "null" ) {
        	     	   msg.style.display = 'block';
        	     	   msg.innerHTML = "<%=request.getAttribute("msg")%>";
        	     	   id.focus();
        	     	   return false;
        	        } else {
        	     	   msg.innerHTML = "";
        	        }
        	});
        </script>
    <form name="form1" class="box" onsubmit="return checkStuff()" action="${path0 }/LoginPro.do" method="post">
      <h2>로그인</h2>
        <input type="text" name="id" placeholder="id" autocomplete="off">
        <i class="typcn typcn-eye" id="eye"></i>
        <input type="password" name="password" placeholder="Passsword" id="pwd" autocomplete="off">
        <label>
          <input type="checkbox">
          <span></span>
          <small class="id_save">아이디 저장</small>
        </label>
        <a href="#" class="forgetpass">비밀번호 찾기</a>
        <span class="error animated tada clr-fix" id="msg"></span>
        <input type="submit" value="로그인" class="btn">
      </form>
        <a href="#" class="dnthave">회원가입하기</a>
        
  </div>
 </div>
</div>
<script>
    var pwd = document.getElementById('pwd');
var eye = document.getElementById('eye');

eye.addEventListener('click',togglePass);

function togglePass(){

   eye.classList.toggle('active');

   (pwd.type == 'password') ? pwd.type = 'text' : pwd.type = 'password';
}

// Form Validation

function checkStuff() {
  var id = document.form1.id;
  var password = document.form1.password;
  var msg = document.getElementById('msg');
  
  if (id.value == "") {
    msg.style.display = 'block';
    msg.innerHTML = "아이디를 입력해 주세요.";
    id.focus();
    return false;
  } else {
    msg.innerHTML = "";
  }
  
   if (password.value == "") {
	msg.style.display = 'block';
    msg.innerHTML = "비밀번호를 입력해 주세요.";
    password.focus();
    return false;
  } else {
    msg.innerHTML = "";
  }
   
   <%-- if ( "<%=request.getAttribute("msg")%>" != "null" ) {
	   msg.style.display = 'block';
	   msg.innerHTML = "<%=request.getAttribute("msg")%>";
	   id.focus();
	   return false;
   } else {
	   msg.innerHTML = "";
   } --%>
   /* var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
  if (!re.test(id.value)) {
    msg.innerHTML = "유효한 이메일을 입력 해주세요.";
    id.focus();
    return false;
  } else {
    msg.innerHTML = ""; 
  }*/
}

// ParticlesJS
window.addEventListener('DOMContentLoaded', function() {
// ParticlesJS Config.
particlesJS("particles-js", {
  "particles": {
    "number": {
      "value": 60,
      "density": {
        "enable": true,
        "value_area": 800
      }
    },
    "color": {
      "value": "#ffffff"
    },
    "shape": {
      "type": "circle",
      "stroke": {
        "width": 0,
        "color": "#000000"
      },
      "polygon": {
        "nb_sides": 5
      },
      "image": {
        "src": "img/github.svg",
        "width": 100,
        "height": 100
      }
    },
    "opacity": {
      "value": 0.1,
      "random": false,
      "anim": {
        "enable": false,
        "speed": 1,
        "opacity_min": 0.1,
        "sync": false
      }
    },
    "size": {
      "value": 6,
      "random": false,
      "anim": {
        "enable": false,
        "speed": 40,
        "size_min": 0.1,
        "sync": false
      }
    },
    "line_linked": {
      "enable": true,
      "distance": 150,
      "color": "#ffffff",
      "opacity": 0.1,
      "width": 2
    },
    "move": {
      "enable": true,
      "speed": 1.5,
      "direction": "top",
      "random": false,
      "straight": false,
      "out_mode": "out",
      "bounce": false,
      "attract": {
        "enable": false,
        "rotateX": 600,
        "rotateY": 1200
      }
    }
  },
  "interactivity": {
    "detect_on": "canvas",
    "events": {
      "onhover": {
        "enable": false,
        "mode": "repulse"
      },
      "onclick": {
        "enable": false,
        "mode": "push"
      },
      "resize": true
    },
    "modes": {
      "grab": {
        "distance": 400,
        "line_linked": {
          "opacity": 1
        }
      },
      "bubble": {
        "distance": 400,
        "size": 40,
        "duration": 2,
        "opacity": 8,
        "speed": 3
      },
      "repulse": {
        "distance": 200,
        "duration": 0.4
      },
      "push": {
        "particles_nb": 4
      },
      "remove": {
        "particles_nb": 2
      }
    }
  },
  "retina_detect": true
});
});
</script>
<div id="footer" class="clr-fix">
    <%@ include file="/footer.jsp" %>
</div>
</body>
</html>