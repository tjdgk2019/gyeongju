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
	* {box-sizing:border-box; }
	#header #hd #gnb a.dp { color:#101010;}
	
	#contents { clear:both; width:100%;  margin-bottom:5rem; box-sizing:border-box; min-width:1400px; min-height:calc(100vh - 610px);}
	#contents a {color:#101010;}
	#contents .page { clear:both; width:1200px; margin:0 auto; font-family: Noto Sans KR;}
	.fd-vs { width:100%; height:618px; overflow:hidden; margin:0 auto; font-family: 'HSBombaram'; min-width:1400px; }
	.fd-vs img {width:100%; height:100%; object-fit:cover;}
	.fd-vs .vstit {position:absolute; width:100%; min-width:1400px; color:#fff; top:330px; z-index:998; margin:0 auto; }
	.fd-vs .vstit .ttext {font-size:70px; font-weight:400; width:1200px; min-width:1200px; margin:0 auto; padding-left:25px; letter-spacing:10px; color:#101010; text-shadow: 2px 2px 2px gray;}
	.page .page-title { margin-top : 2rem; margin-bottom:1.5rem; padding-left:20px;}
	.page .lst-food { clear:both; width:1170px; margin:0 auto; min-width:1170px; margin-bottom:50px; }
	.page .lst-food::after { content:""; display:block; width:100%; clear:both; }
    .lst-food .food-div { width: 370px; float:left; padding-bottom:50px; height:485px; border:1px solid #66666625;
     border-radius:10px 10px 0px 0px; box-shadow:5px 5px 4px #66666625; margin: 20px 10px 0 10px;}
    /* @media (max-width:1198px) {
    	.food-div {width:617px; float:left;  }
    }
    @media (max-width:798px) {
    	.food-div {width:100%; float:left; min-width:399px;}
    } */
    
    .food-div li {  overflow:hidden; box-sizing:border-box; }
	.lst-food .food-div .fig { display:block; width: 100%; height:auto; aspect-ratio:4/3; overflow:hidden; margin:0 auto;}
	.lst-food .food-div .fig img {width:100%; height:100%; object-fit:cover; transition:0.5s; }
	.lst-food .food-div:hover .fig img {transform:scale(1.1);}
	.lst-food .food-div:hover .item_tit {font-weight: 800;}
	
	.lst-food .food-div li {margin-top:15px; display:flex; }
    .lst-food .food-div li span { display:inline-block;  }
    .lst-food .food-div .card-body {padding-right:18px; padding-left:18px;}
    .lst-food .food-div .card-body li img {display:inline-block; width:20px; height:auto; margin-right:10px; vertical-align:bottom;}
	.lst-food .food-div .item_tit {font-weight:600; font-size:24px;}
	.lst-food .food-div .item_addr {white-space: nowrap; overflow: hidden; text-overflow: ellipsis;}
	
	.page .buttons { clear:both; margin-top:30px;}
	
	.food-tab { width:100%; float:left; margin-bottom:20px; }
	.food-tab .foodtab-list {width:100%; float:left;}
	.food-tab .foodtab-list li { float:left; height:48px; line-height:47px;
		text-align:center; border: 1px solid #eaeaee; font-size:15px; width:300px;}
	#contents .food-tab .foodtab-list li a {width:100%; height:100%; text-decoration:none; color:#888888; }
	#contents .food-tab .foodtab-list li.active {border-bottom:3px solid #C1A483; background-color:#f7f7f7; }
	#contents .food-tab .foodtab-list li.active a {color:#101010;}
	
	
	
	.emptylist { width:500px; text-align:center; margin:30px auto;}
	
	.paging {text-align:center;}
	.paging-list {margin:0 auto;}
	.paging-list li { display:inline-block; line-height:50px; }
	.paging-list li:not(:last-child) {margin-right:15px;}
	.paging-list li:last-child a, .paging-list li:first-child a {background-color:#f0eae4;}
	.paging-list li a {display:block; text-align:center; width:50px; border-radius:25px; background-color:#d1bfab; color:#fff;}
	#contents .paging-list li a.active {font-weight:600; background-color:#C1A483; }
	
	#contents .buttons .insbtn {border:none; text-align:center; padding:7px 20px; border-radius:30px; margin-left:3px; 
		background-color:#333; color:#fff; float:right; font-size:20px; font-weight:500;}

	.bread-crumb {width:100%; height:40px; text-align:right; padding-right:10px; margin-top:20px; margin-bottom:20px;}
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
					</a>
				</li>
			</ul>
		</div>
		<!-- <h2 class="page-title">식도락</h2> -->
		<div class="food-tab">
			<ul class="foodtab-list">
				<li><a href="${path0 }/FoodList.do?ftype=all">전체</a></li>
				<li><a href="${path0 }/FoodList.do?ftype=rest">음식점</a></li>
				<li><a href="${path0 }/FoodList.do?ftype=cafe">카페</a></li>
				<li><a href="${path0 }/FoodList.do?ftype=etc">기타</a></li>
			</ul>
		</div>
		<div class="lst-food" id="lst-food">
				<c:if test="${ftype.equals('all') }">
					<c:if test="${not empty foodList }">
					<c:forEach var="dto" items="${foodList }">
						<a href="${path0}/GetFood.do?ftype=all&fno=${dto.fno}">
						<div class="food-div" id="food-div">
							<div class="card-image">
								<figure class="fig"><img src="${path0 }/upload/food/${dto.filename}" alt="식도락${dto.fno }"></figure>
							</div>
							<div class="card-body">
							<ul class="food-ul">
								<li><span class="item_tit">${dto.fname }</span></li>
								<li><img src="${path0 }/images/tag.svg" alt="분류"><span class="item_type">${dto.ftype }</span></li>
								<li><img src="${path0 }/images/marker.svg" alt="주소"><span class="item_addr">${dto.faddr }</span></li>
								<li><img src="${path0 }/images/phone.svg" alt="연락처"><span class="item_tel">
									<c:if test="${empty dto.ftel }">
										정보 없음
									</c:if>
									<c:if test="${not empty dto.ftel }">
										${dto.ftel }
									</c:if></span></li>
							</ul>
							</div>
						</div>
						</a>
					</c:forEach>
					</c:if>
					<c:if test="${empty foodList }">
						<div class="emptylist"><h3>등록된 식도락 정보가 없습니다.</h3></div>
					</c:if>
				</c:if>
				<c:if test="${ftype.equals('rest') }">
					<c:if test="${not empty foodList }">
					<c:forEach var="dto" items="${foodList }">
						<a href="${path0}/GetFood.do?ftype=rest&fno=${dto.fno}">
						<div class="food-div" id="food-div">
							<div class="card-image">
								<figure class="fig"><img src="${path0 }/upload/food/${dto.filename}" alt="식도락${dto.fno }"></figure>
							</div>
							<div class="card-body">
							<ul class="food-ul">
								<li><span class="item_tit">${dto.fname }</span></li>
								<li><img src="${path0 }/images/tag.svg" alt="분류"><span class="item_type">${dto.ftype }</span></li>
								<li><img src="${path0 }/images/marker.svg" alt="주소"><span class="item_addr">${dto.faddr }</span></li>
								<li><img src="${path0 }/images/phone.svg" alt="연락처"><span class="item_tel">
									<c:if test="${empty dto.ftel }">
										정보 없음
									</c:if>
									<c:if test="${not empty dto.ftel }">
										${dto.ftel }
									</c:if></span></li>
							</ul>
							</div>
						</div>
						</a>
					</c:forEach>
					</c:if>
					<c:if test="${empty foodList }">
						<div class="emptylist"><h3>등록된 식도락 정보가 없습니다.</h3></div>
					</c:if>
				</c:if>
				<c:if test="${ftype.equals('cafe') }">
					<c:if test="${not empty foodList }">
					<c:forEach var="dto" items="${foodList }">
						<a href="${path0}/GetFood.do?ftype=cafe&fno=${dto.fno}">
						<div class="food-div" id="food-div">
							<div class="card-image">
								<figure class="fig"><img src="${path0 }/upload/food/${dto.filename}" alt="식도락${dto.fno }"></figure>
							</div>
							<div class="card-body">
							<ul class="food-ul">
								<li><span class="item_tit">${dto.fname }</span></li>
								<li><img src="${path0 }/images/tag.svg" alt="분류"><span class="item_type">${dto.ftype }</span></li>
								<li><img src="${path0 }/images/marker.svg" alt="주소"><span class="item_addr">${dto.faddr }</span></li>
								<li><img src="${path0 }/images/phone.svg" alt="연락처"><span class="item_tel">
									<c:if test="${empty dto.ftel }">
										정보 없음
									</c:if>
									<c:if test="${not empty dto.ftel }">
										${dto.ftel }
									</c:if></span></li>
							</ul>
							</div>
						</div>
						</a>
					</c:forEach>
					</c:if>
					<c:if test="${empty foodList }">
						<div class="emptylist"><h3>등록된 식도락 정보가 없습니다.</h3></div>
					</c:if>
				</c:if>
				<c:if test="${ftype.equals('etc') }">
					<c:if test="${not empty foodList }">
					<c:forEach var="dto" items="${foodList }">
						<a href="${path0}/GetFood.do?ftype=etc&fno=${dto.fno}">
						<div class="food-div" id="food-div">
							<div class="card-image">
								<figure class="fig"><img src="${path0 }/upload/food/${dto.filename}" alt="식도락${dto.fno }"></figure>
							</div>
							<div class="card-body">
							<ul class="food-ul">
								<li><span class="item_tit">${dto.fname }</span></li>
								<li><img src="${path0 }/images/tag.svg" alt="분류"><span class="item_type">${dto.ftype }</span></li>
								<li><img src="${path0 }/images/marker.svg" alt="주소"><span class="item_addr">${dto.faddr }</span></li>
								<li><img src="${path0 }/images/phone.svg" alt="연락처"><span class="item_tel">
									<c:if test="${empty dto.ftel }">
										정보 없음
									</c:if>
									<c:if test="${not empty dto.ftel }">
										${dto.ftel }
									</c:if></span></li>
							</ul>
							</div>
						</div>
						</a>
					</c:forEach>
					</c:if>
					<c:if test="${empty foodList }">
						<div class="emptylist"><h3>등록된 식도락 정보가 없습니다.</h3></div>
					</c:if>
				</c:if>
		</div>
		<div class="paging">
			<ul class="paging-list">
				<li><a href="${path0 }/FoodList.do?ftype=${ftype}&page=1"><</a></li>
				<c:forEach var="i" begin="1" end="${pcnt }" >
					<li><a id="page${i }" href="${path0 }/FoodList.do?ftype=${ftype}&page=${i}"><c:out value="${i }"/></a></li>
				</c:forEach>
				<li><a href="${path0 }/FoodList.do?ftype=${ftype}&page=${pcnt}">></a></li>
			</ul>
		</div>
		
		<div class="buttons">
			<c:if test="${sid.equals('admin') }">
			<a class="insbtn" role="button" href="${path0 }/food/insertFood.jsp?ftype=${ftype}">식도락 등록</a>
			</c:if>
		</div>
	</section>
</div>
<div id="footer" class="clr-fix">
    <%@ include file="/footer.jsp" %>
</div>
<script>
	var ftype = "<%=request.getParameter("ftype")%>";
	if (ftype == 'all') {
		document.querySelector(".foodtab-list li:nth-child(1)").classList.add('active');
	} else if (ftype == 'rest') {
		document.querySelector(".foodtab-list li:nth-child(2)").classList.add('active');
	} else if (ftype == 'cafe') {
		document.querySelector(".foodtab-list li:nth-child(3)").classList.add('active');
	} else if (ftype == 'etc') {
		document.querySelector(".foodtab-list li:nth-child(4)").classList.add('active');
	} 
	
	
	document.querySelector("#page<%=request.getAttribute("curPage")%>").classList.add('active');
	
</script>
</body>
</html>