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
ul { list-style: none; }
a { text-decoration: none; font-family: Noto Sans KR;}

#header #hd #gnb a.dp { color:#101010;}

#particles-js { position: absolute; width: 100%; height: 100%; }

#contents { width:100%; min-height:100vh; margin-bottom:5rem; box-sizing:border-box; min-width:1200px; font-family: Noto Sans KR; }

.container{ margin: 0 auto; top: 264px; left: 50%; position: absolute; text-align: center; transform: translateX(-50%);
            background-color: #FFF; border-radius: 8px; border-top: 10px solid #79a6fe; width: 400px; height: 740px; }
.box h2 { font-family: Noto Sans KR; font-weight: 700; color: #101010; font-size: 25pt; margin-top: 30px;}

.box h4 span { color: #FFF; font-weight: lighter;}

.box h5 { font-size: 14pt; color: #CCC; letter-spacing: 1.5px; margin-top: -15px; margin-bottom: 70px;}

.box input[type = "text"] {display: block; margin: 20px auto; background: #DDD; border: 0; border-radius: 5px;
  padding: 14px 10px; width: 194px; outline: none; color: #333; margin-left: 30px;
    -webkit-transition: all .2s ease-out;
    -moz-transition: all .2s ease-out;
    -ms-transition: all .2s ease-out;
    -o-transition: all .2s ease-out;
    transition: all .2s ease-out;
}

.box input[type = "password"] {display: block; margin: 20px auto; background: #DDD; border: 0; border-radius: 5px;
  padding: 14px 10px; width: 320px; outline: none; color: #333;
    -webkit-transition: all .2s ease-out;
    -moz-transition: all .2s ease-out;
    -ms-transition: all .2s ease-out;
    -o-transition: all .2s ease-out;
    transition: all .2s ease-out;
} 

#pwd, #pwd2 {width: 320px; }

.box input[type = "email"] {display: block; margin: 20px auto; background: #DDD; border: 0; border-radius: 5px;
  padding: 14px 10px; width: 320px; outline: none; color: #333;
    -webkit-transition: all .2s ease-out;
    -moz-transition: all .2s ease-out;
    -ms-transition: all .2s ease-out;
    -o-transition: all .2s ease-out;
    transition: all .2s ease-out;
}

.box input[type = "tel"] {display: block; margin: 20px auto; background: #DDD; border: 0; border-radius: 5px;
  padding: 14px 10px; width: 320px; outline: none; color: #333;
    -webkit-transition: all .2s ease-out;
    -moz-transition: all .2s ease-out;
    -ms-transition: all .2s ease-out;
    -o-transition: all .2s ease-out;
    transition: all .2s ease-out;
}

.box input[type = "address"] {display: block; margin-left: 30px; auto; background: #DDD; border: 0; border-radius: 5px;
  padding: 14px 10px; width: 320px; outline: none; color: #333;
    -webkit-transition: all .2s ease-out;
    -moz-transition: all .2s ease-out;
    -ms-transition: all .2s ease-out;
    -o-transition: all .2s ease-out;
    transition: all .2s ease-out;
}

.box input[type = "postcode"] {display: block; margin: 20px auto; background: #DDD; border: 0; border-radius: 5px;
  padding: 14px 10px; width: 220px; outline: none; color: #333; margin-left: 30px;
    -webkit-transition: all .2s ease-out;
    -moz-transition: all .2s ease-out;
    -ms-transition: all .2s ease-out;
    -o-transition: all .2s ease-out;
    transition: all .2s ease-out;
}

.btn_id { border: 0; background: #222; color: #FFF; border-radius: 5px; width: 120px; height: 43px; font-size: 10pt;
        position: absolute; top: 13.3%; left: 62.5%; transition: 0.3s; cursor: pointer; font-weight: 600; }
.btn_id:hover { background: #598ee4;}

.btn_addr {border: 0; background: #222; color: #FFF; border-radius: 5px; width: 154px; height: 43px; font-size: 10pt;
        position: absolute; top: 74.1%; left: 54%; transition: 0.3s; cursor: pointer; font-weight: 600; }

.btn_addr:hover {background-color: #666;}

::-webkit-input-placeholder {color: #A0A0A0;}

.box input[type = "text"]:focus,.box input[type = "password"]:focus,.box input[type = "email"]:focus,.box input[type = "tel"]:focus,.box input[type = "address"]:focus { border: 2px solid #CCC;}

a{color: #598ee4; text-decoration: none;}
a:hover {text-decoration: underline;}

/* style the artificial checkbox */
label span { height: 13px; width: 13px; border: 2px solid #CCC; border-radius: 2px; display: inline-block; position: relative; cursor: pointer; float: left; left: 7.5%;}

.btn { border: 0; background: #222; color: #FFF; border-radius: 100px; width: 338px; height: 48px; font-size: 14pt;
        position: absolute; top: 87%; left: 8%; transition: 0.3s; cursor: pointer; font-weight: 600;}
.btn:hover { background: #598ee4;}

.typcn { position: absolute;  color: #A0A0A0; font-size: 22px; cursor: pointer;}      
.typcn.active {color: #4d4d4d;}
#eye1 {left: 339px; top: 166px;}
#eye2 {left: 339px; top: 229px;}


.error { text-align: center; background-color: #FFF; width: 330px; height: 20px; padding: 2px; border: 0; border-radius: 5px; margin: 10px auto 10px;
  position: absolute; top: 80.5%; left: 8%; color: #d85252; display: block; }
</style>
</head>
<body>
<div id="header" class="clr-fix">
 	<%@ include file="/header.jsp" %>
</div>
<div id="particles-js"></div>
<div id="contents" class="clr-fix">
<div class="animated bounceInDown">
  <div class="container">
    <form name="form1" class="box" onsubmit="return checkStuff()" method="post" action="JoinPro.do">
      <h2>회원가입</h2>
        <input type="text" name="id" placeholder="id (영문자, 숫자 조합 5-20자)" autocomplete="off" id="id" maxlength="20" pattern="[a-zA-Z0-9]{5,20}">
        <input type="button" id="idbtn" value="아이디 중복검사" class="btn_id" >
        <input type="hidden" id="idCheck" name="idCheck" value="false">
        <i class="typcn typcn-eye" id="eye1"></i>
        <input type="password" name="password" placeholder="Passsword (영문자, 숫자, 특수문자 포함 8-20자)" id="pwd" autocomplete="off" maxlength="20" pattern="^(?=.*[A-Za-z0-9])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z0-9\d$@$!%*#?&]{8,20}$" >
        <i class="typcn typcn-eye" id="eye2"></i>
        <input type="password" name="password2" placeholder="Passsword check" id="pwd2" autocomplete="off">
        <input type="email" name="email" placeholder="email@example.com" id="email" autocomplete="off" maxlength="50">
        <input type="tel" name="tel" placeholder="010-0000-0000" id="tel" autocomplete="off">
        <input type="address" name="address1" id="address1" placeholder="기본 주소 입력" class="form-control" ><br>
        <input type="address" name="address2" id="address2" placeholder="상세 주소 입력" class="form-control" ><br>
        <input type="address" name="postcode" id="postcode" placeholder="우편번호 입력" class="form-control" style="width:160px" ><br>
        <button type="button" id="post_btn" class="btn_addr" onclick="findAddr()">우편번호 검색</button>
        <span class="error animated tada" id="msg"></span>
        <input type="submit" onClick="checkStuff()" value="가입하기" class="btn">
      </form>
  </div>
<script>
var pwd = document.getElementById('pwd');
var pwd2 = document.getElementById('pwd2');
var eye1 = document.getElementById('eye1');
var eye2 = document.getElementById('eye2');

eye1.addEventListener('click',togglePass1);
eye2.addEventListener('click',togglePass2);

function togglePass1(){

   eye1.classList.toggle('active');

   (pwd.type == 'password') ? pwd.type = 'text' : pwd.type = 'password';
}
function togglePass2(){

	   eye2.classList.toggle('active');

	   (pwd2.type == 'password') ? pwd2.type = 'text' : pwd2.type = 'password';
	}

// Form Validation

function checkStuff() {
  var id = document.form1.id;
  var pwd1 = document.form1.password;
  var pwd2 = document.form1.password2;
  var email = document.form1.email;
  var tel = document.form1.tel;
  var address1 = document.form1.address1;
  var postcode = document.form1.postcode;
  var idck = document.form1.idCheck;
  
  var msg = document.getElementById('msg');
  
  msg.style.display = 'block';
  if (id.value == "") {
    msg.innerHTML = "아이디를 입력해 주세요.";
    id.focus();
    return false;
  } else if (idck.value != "true") {
	  msg.innerHTML = "아이디 중복검사를 해주세요.";
	  pwd1.focus();
	  return false;
  } else if (pwd1.value == "") {
    msg.innerHTML = "비밀번호를 입력해 주세요.";
    pwd1.focus();
    return false;
  } else if (pwd1.value != pwd2.value) {
	  msg.innerHTML = "비밀번호 확인이 일치하지 않습니다.";
	  pwd1.focus();
	  return false;
	} else if (email.value == "") {
		msg.innerHTML = "이메일을 입력해 주세요.";
		email.focus();
		return false;
   } else if (tel.value == "") {
		msg.innerHTML = "전화번호를 입력해 주세요.";
		tel.focus();
		return false;
   } else if (address1.value == "" || postcode.value == "") {
		msg.innerHTML = "우편번호 검색을 통해 주소를 입력해 주세요.";
		postcode.focus();
		return false;
 	} else {
	   msg.innerHTML = "";
	   return true;
	};
 
	
};

var id = document.form1.id;
id.addEventListener("change", function(e) {
	var idck = document.form1.idCheck;
	idck.value = "false";
});


var idbtn = document.getElementById("idbtn");
idbtn.addEventListener("click", function() {
	var msg = document.getElementById('msg');
	var id = document.form1.id;
	if (id.value == "") {
	  msg.style.display = 'block';
	  msg.innerHTML = "아이디를 입력해 주세요.";
	  id.focus();
	  return false;
	} 
	var params = { id:$("#id").val()};
	$.ajax({
		url:"${path0}/IdCheck.do",
		type:"post",
		dataType:"json",
		data:params,
		success:function(data){
			var idCk = data.result;
			if(idCk==false){
				$("#idCheck").val("true");
				$("#msg").html("<p style='color:#598ee4'>사용 가능한 아이디입니다.</p>");
				return false;
			} else {
				$("#idCheck").val("false");
				$("#msg").html("중복된 아이디입니다.");
			}
		}
	});
	
})

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
<script>
  function findAddr(){
      new daum.Postcode({
          oncomplete:function(data){
              console.log(data);
              var roadAddr = data.roadAddress;
              var jibunAddr = data.jibunAddress;
              document.getElementById("postcode").value = data.zonecode;
              if(roadAddr !== ''){
                  document.getElementById("address1").value = roadAddr;
              } else if(jibunAddr !== ''){
                  document.getElementById("address1").value = jibunAddr;
              }
              document.getElementById("address2").focus();
          }
      }).open();
  }
</script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</div>
</div>
<div id="footer" class="clr-fix">
    <%@ include file="/footer.jsp" %>
</div>
</body>
</html>