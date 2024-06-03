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
<style>
	a {text-decoration:none;}
	#header #hd #gnb a.dp { color:#101010;}
	* {box-sizing:border-box; }
	#contents { clear:both; width:100%; margin-bottom:5rem; box-sizing:border-box; min-width:1400px; min-height:calc(100vh - 610px);}
	#contents .page { clear:both; width:1200px; margin:0 auto; font-family: Noto Sans KR; }
	
	/* #contents::after { content:""; display:block; width:100%; clear:both; } */
	
	.fd-vs { width:100%; height:618px; overflow:hidden; margin:0 auto; font-family: 'HSBombaram'; min-width:1400px; }
	.fd-vs img {width:100%; height:100%; object-fit:cover;}
	.fd-vs .vstit {position:absolute; width:100%; min-width:1400px; color:#fff; top:330px; z-index:998; margin:0 auto; }
	.fd-vs .vstit .ttext {font-size:70px; font-weight:400; width:1200px; min-width:1200px; margin:0 auto; padding-left:25px; letter-spacing:10px; color:#101010; text-shadow: 2px 2px 2px gray;}
	
	/* .page .page-title { margin-top : 2rem; margin-bottom:1.5rem; padding-left:20px; font-family: 'HSBombaram'; font-size:40px; letter-spacing:3px;} */
	.page .food-wrap { width:100%;  padding:20px 0; font-family: Noto Sans KR;  }
	.page .food-wrap .food-col1 {width:50%; float:left;}
	.page .food-wrap .food-col1 .fig {display:block; width:560px; height:540px;}
	.page .food-wrap .food-col1 .fig img { width:100%; height:100%; object-fit:cover;}
	.page .food-wrap .food-col2 {width:50%; float:right;}
	.page .food-wrap .food-col2 hr { margin: 7px auto;}
	.page .food-wrap .food-col2 .food-dtl {width:100%; box-sizing:border-box; padding-right:5%; margin-top:75px;}
	.page .food-wrap .food-col1 .fname { padding:0px 5px 30px 10px; font-family: 'MaruBuri-Regular'; font-size:39px; font-weight:600; }
	.page .food-wrap .food-col2 .food-dtl ul {list-style:none; padding:15px 5px;}
	.page .food-wrap .food-col2 .food-dtl li { line-height:50px;}
	.page .food-wrap .food-col2 .food-dtl p {padding:15px 5px;}
	.page .food-wrap .food-col2 .food-dtl .fcomm {font-size:20px;}
	.food-dtl .tb-wrap {border:5px solid #ececec; padding:0 10px; border-radius:10px; margin:10px 0;}
	.food-dtl .tb {padding:10px 0;}
	.food-dtl .tb th {text-align:left; padding: 8px 5px;}
	.food-dtl .tb th img {display:inline-block; width:20px; height:auto; margin-right:10px; vertical-align:bottom;}
	.food-dtl .tb td {padding-left: 10px;}
	
	.page .buttons { margin:0 auto; margin-top:50px; text-align:center; }
	.page .buttons a { display:inline-block;  border:none; text-align:center; padding:7px 20px; border-radius:30px; margin-left:3px; 
		background-color:#333; color:#fff; font-size:20px; font-weight:500;}
		
	.bread-crumb {width:100%; height:40px; text-align:right; padding-right:10px; margin-top:20px; }
	#contents .bread-crumb li {display:inline-block; line-height:40px; color:#b8b8b8;}
	#contents .bread-crumb li a {color:#666;}
	.bread-crumb li a:hover {text-decoration:underline;}
	.bread-crumb li:last-child a {font-weight:500; color:#595959;}
</style>
</head>
<body>
<div id="header" class="clr-fix">
 	<%@ include file="/header.jsp" %>
</div>
<div id="contents" class="clr-fix">
	<figure class="fd-vs">
		<img src="${path0 }/images/foodlistimg.png" alt="식도락 배너">
		<div class="vstit"><p class="ttext">식도락</p></div>
	</figure>
	<section class="page">
		<!-- <p class="page-title">식도락</p> 
		<hr>-->
		<div class="bread-crumb">
			<ul>
				<li><a href="${path0 }/">홈</a>  >  </li>
				<li><a href="${path0 }/FoodList.do?ftype=all">식도락</a>  >  </li>
				<li><a href="${path0 }/FoodList.do?ftype=${ftype}">
					<c:if test="${ftype.equals('all') }">
						전체
					</c:if>
					<c:if test="${ftype.equals('rest') }">
						음식점
					</c:if>
					<c:if test="${ftype.equals('cafe') }">
						카페
					</c:if>
					<c:if test="${ftype.equals('etc') }">
						기타
					</c:if>
					</a>  >  
				</li>
				<li><a href="${path0 }/GetFood.do?ftype=${ftype}&fno=${food.fno}">상세보기</a></li>
			</ul>
		</div>
		<div class="food-wrap clr-fix">
			<div class="food-col1">
				<p class="fname">${food.fname }</p>
				<figure class="fig"><img src="${path0 }/upload/food/${food.filename}" alt="식도락${food.fno }"></figure>
			</div>
			<div class="food-col2">
				<div class="food-dtl">
				
				<!-- <hr> -->
				<div class="tb-wrap">
					<table class="tb">
						<tbody>
							<tr><th><img src="${path0 }/images/tag.svg" alt="분류">분류</th><td>${food.ftype }</td></tr>
							<tr><th><img src="${path0 }/images/marker.svg" alt="주소">주소</th><td>${food.faddr }</td></tr>
							<tr><th><img src="${path0 }/images/phone.svg" alt="연락처">연락처</th><td>${food.ftel }</td></tr>
						</tbody>
					</table>
				</div>
				
				<p class="fcomm">${food.fcomm }<p>
				</div>
			</div>
		</div>
		<div class="buttons">
			<c:if test="${sid.equals('admin') }">
			<a role="button" id="delbtn">삭제</a>
			<a href="${path0 }/FoodUpdate.do?ftype=${ftype }&fno=${food.fno }" role="button">수정</a>
			</c:if>
			<a role="button" href="${path0 }/FoodList.do?ftype=${ftype}">목록</a>
			
		</div>
	</section>
</div>
<div id="footer" class="clr-fix">
 	<%@ include file="/footer.jsp" %>
</div>
<script>
	var delbtn = document.getElementById('delbtn');
	delbtn.addEventListener("click", function() {
		if(confirm("해당 식도락 정보를 삭제하시겠습니까?")) {
			location.replace("${path0 }/FoodDelete.do?ftype=${ftype }&fno=${food.fno }");
		}
	})
</script>
</body>
</html>