<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<c:set var="path0" value="<%=request.getContextPath() %>" /> 
<style>
#hd { width: 100%; position: absolute; top: 0; left: 0; min-width: 1400px; z-index:999;}
a{text-decoration: none;}
.sub a:hover {text-decoration: underline;}
.topmenu { background-color: black; height: 40px; overflow: hidden; opacity: 84%; font-family: Noto Sans KR; width:100%;}
.txt_left { margin: 0 auto; padding: 0; width:1400px; font-size:12pt; margin-top: 8PX;}
.txt_left li{ float:left}
.txt_left li a{ color:#FFF;}

.txt_right {cursor:pointer;}
.txt_right { margin: 0 auto; padding: 0; width:1400px; font-size:12pt;}
.txt_right li{ float:right}
.txt_right li a{color:#FFF;}

.nav { clear:both; width:1400px; margin: 0 auto; height: 120px;}
.logo { display:block; width: auto; height: auto; float:left; margin-top:32px; margin-right: 64px;}

#gnb { cursor:pointer; }
#gnb > .menu > li { margin-top:45px; float:left; width: 14%; text-align: center; position:relative; font-size:15pt; z-index: 999;}
#gnb a.dp { display:block; color: #FFF; font-weight:500;}
#gnb li a.dp { margin-bottom: 41px;}
#gnb li:hover a.dp2 { font-weight: 600; }
#gnb .sub { display:none; top: 68px; z-index:100; width: 100%; height: 180px; }
#gnb:hover .menu .sub { padding-top: 17px; display:block; height: 180px; background-color:#f4f8fc;}
#gnb .sub li a { color:#0C182E; font-weight: 400; line-height: 1.6em;}

#gnb:before, #gnb:after { content:""; display:block; height: 197px; width:100%; position:absolute; top:155px; background-color: #f4f8fc; display:none; }
#gnb:before { left: 0;  }
#gnb:after{ right: 0; }

#gnb:hover::before, #gnb:hover::after { display:block; }
</style>
<header id="hd" >
	<div class="topmenu">
          <ul class="txt_left">
          <li><a href="https://www.gyeongju.go.kr/open_content/ko/index.do" style="margin-right:28px">경주시청</a></li>
          <li><a href="https://www.gyeongju.go.kr/tour/index.do">경주문화관광</a></li>
          </ul>
          <ul class="txt_right">
          	<c:if test="${empty sid}">
          		<li><a href="${path0 }/Join.do" style="margin-left:28px; color:#78BEFF;">회원가입</a></li>
          		<li><a href="${path0 }/Login.do">로그인</a></li>
          	</c:if>
          	<c:if test="${not empty sid}">
          		<li><a href="#" style="margin-left:28px; color:#78BEFF;">마이페이지</a></li>
          		<li><a role="button" id="logout">로그아웃</a></li>
          	</c:if>
          
          </ul>
	  </div>
	  <div class="nav">
	      <a href="${path0 }" class="logo"><img src="${path0 }/images/logo.png" alt="경주소개 홈페이지 로고"></a>
	      <nav id="gnb">
	          <ul class="menu clr-fix">
	              <li class="item1">
	                  <a href="${path0 }/intro/sub_history.jsp" class="dp">지역소개</a>
	                  <ul class="sub">
	                      <li><a href="${path0 }/intro/sub_history.jsp" class="dp2">설화</a></li>
	                  </ul>
	              </li>
	              <li class="item2">
	                  <a href="${path0 }/FoodList.do?ftype=all" class="dp">식도락</a>
	                  <ul class="sub">
	                      <li><a href="${path0 }/FoodList.do?ftype=rest" class="dp2">음식점</a></li>
	                      <li><a href="${path0 }/FoodList.do?ftype=cafe" class="dp2">카페</a></li>
	                      <li><a href="${path0 }/FoodList.do?ftype=etc" class="dp2">기타</a></li>
	                      <li><a href="" class="dp2">특산품</a></li>
	                  </ul>
	              </li>
	              <li class="item3">
	                  <a href="${path0 }/PlaceList.do?ptype=all" class="dp">여기어때</a>
	                  <ul class="sub">
	                      <li><a href="${path0 }/PlaceList.do?ptype=curtural" class="dp2">문화재</a></li>
	                      <li><a href="${path0 }/PlaceList.do?ptype=theme" class="dp2">테마파크 및 공원</a></li>
	                      <li><a href="${path0 }/PlaceList.do?ptype=etc" class="dp2">기타</a></li>
	                      <li><a href="" class="dp2">여행코스</a></li>
	                  </ul>
	              </li>
	              <li class="item4">
	                  <a href="${path0 }/QnaList.do" class="dp">커뮤니티</a>
	                  <ul class="sub">
	                      <li><a href="${path0 }/NoticeList.do" class="dp2">공지사항</a></li>
	                      <li><a href="${path0 }/QnaList.do" class="dp2">담벼락</a></li>
	                  </ul>
	              </li>
	              <li class="item5">
	                  <a href="" class="dp">고객지원</a>
	                  <ul class="sub">
	                      <li><a href="${path0 }/intro/map.jsp" class="dp2">오시는 길</a></li>
	                      <li><a href="${path0 }/DataList.do" class="dp2">자료실</a></li>
	                  </ul>
	              </li>
	          </ul>
	      </nav>
	  </div>
<script>
	var logout = document.getElementById('logout');
	logout.addEventListener("click", function() {
		if(confirm("로그아웃 하시겠습니까?")) {
			location.replace("${path0 }/Logout.do");
		}
	})
</script>
</header>