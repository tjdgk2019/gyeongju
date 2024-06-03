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
<style>
	* {margin:0; padding:0; box-sizing:border-box; list-style:none;}
	#header #hd #gnb a.dp { color:#101010;}
	
	#contents { width:100%; min-height:100vh; margin-bottom:5rem; box-sizing:border-box; min-width:1200px;}
	#contents a {color:#101010;}
	
	.fd-vs { width:100%; height:618px; overflow:hidden; margin:0 auto; font-family: 'HSBombaram'; min-width:1400px; }
	.fd-vs img {width:100%; height:100%; object-fit:cover;}
	.fd-vs .vstit {position:absolute; width:100%; min-width:1400px; color:#fff; top:330px; z-index:998; margin:0 auto; }
	.fd-vs .vstit .ttext {font-size:70px; font-weight:400; width:1200px; min-width:1200px; margin:0 auto; padding-left:25px; letter-spacing:10px; text-shadow: 2px 2px 2px gray;}
	
	#contents .page { clear:both; width:1200px; margin:0 auto; font-family: Noto Sans KR;}
	.page .page-title { margin-top : 2rem; margin-bottom:1.5rem; padding-left:20px;}
	.page .lst-place { clear:both; width:1170px; margin:0 auto; min-width:1170px; margin-bottom:50px; }
	.page .lst-place::after { content:""; display:block; width:100%; clear:both; }
    .lst-place .place-div { width: 370px; float:left; padding-bottom:50px; height:485px; border:1px solid #66666625;
     border-radius:10px 10px 0px 0px; box-shadow:5px 5px 4px #66666625; margin: 20px 10px 0 10px;}
    
    .place-div li {  overflow:hidden; box-sizing:border-box; }
	.lst-place .place-div .fig { display:block; width: 100%; height:auto; aspect-ratio:4/3; overflow:hidden; margin:0 auto;}
	.lst-place .place-div .fig img {width:100%; height:100%; object-fit:cover; transition:0.5s; }
	.lst-place .place-div:hover .fig img {transform:scale(1.1);}
    .lst-place .place-div:hover .item_tit {font-weight:800;}
    
    .lst-place .place-div li {margin-top:15px; display:flex; }
    .lst-place .place-div li span { display:inline-block;  }
    .lst-place .place-div .card-body {padding-right:18px; padding-left:18px;}
    .lst-place .place-div .card-body li img {display:inline-block; width:20px; height:auto; margin-right:10px; vertical-align:bottom;}
	.lst-place .place-div .item_tit {font-weight:600; font-size:24px;}
	.lst-place .place-div .item_addr {white-space: nowrap; overflow: hidden; text-overflow: ellipsis;}
	
	.place-tab { width:100%; float:left; margin-bottom:20px; }
	.place-tab .placetab-list {width:100%; float:left;}
	.place-tab .placetab-list li {float:left; height:48px; line-height:47px;
		text-align:center; border: 1px solid #eaeaee; font-size:15px; width:300px;}
	#contents .place-tab .placetab-list li a {width:100%; height:100%; text-decoration:none; color:#888888;}
	#contents .place-tab .placetab-list li.active {border-bottom:3px solid #C1A483; background-color:#f7f7f7;}
	#contents .place-tab .placetab-list li.active a {color:#101010;}
	
	.emptylist { width:500px; text-align:center; margin:30px auto;}
	
	.paging {text-align:center;}
	.paging-list {margin:0 auto;}
	.paging-list li { display:inline-block; line-height:50px; }
	.paging-list li:not(:last-child) {margin-right:15px;}
	.paging-list li:last-child a, .paging-list li:first-child a {background-color:#f0eae4;}
	.paging-list li a {display:block; text-align:center; width:50px; border-radius:25px; background-color:#d1bfab; color:#fff;}
	#contents .paging-list li a.active {font-weight:600; background-color:#C1A483; }
	
	.page .buttons { clear:both; margin-top:30px;}
	
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
		<img src="${path0 }/images/placelistimg.png" alt="여기어때 배너">
		<div class="vstit"><p class="ttext">여기어때</p></div>
	</figure>
	<section class="page">
		<div class="bread-crumb">
			<ul>
				<li><a href="${path0 }/">홈</a>  >  </li>
				<li><a href="${path0 }/PlaceList.do?ptype=all">여기어때</a>  >  </li>
				<li><a href="${path0 }/PlaceList.do?ptype=${ptype}">
					<c:if test="${ptype.equals('all') }">
						전체
					</c:if>
					<c:if test="${ptype.equals('curtural') }">
						문화재
					</c:if>
					<c:if test="${ptype.equals('theme') }">
						테마파크/공원
					</c:if>
					<c:if test="${ptype.equals('etc') }">
						기타
					</c:if>
					</a>
				</li>
			</ul>
		</div>
		<!-- <h2 class="page-title">여기어때</h2> -->
		<div class="place-tab">
			<ul class="placetab-list">
				<li><a href="${path0 }/PlaceList.do?ptype=all">전체</a></li>
				<li><a href="${path0 }/PlaceList.do?ptype=curtural">문화재</a></li>
				<li><a href="${path0 }/PlaceList.do?ptype=theme">테마파크/공원</a></li>
				<li><a href="${path0 }/PlaceList.do?ptype=etc">기타</a></li>
			</ul>
		</div>
		<div class="lst-place" id="lst-place">
				<c:if test="${ptype.equals('all') }">
					<c:if test="${not empty placeList }">
					<c:forEach var="dto" items="${placeList }">
						<a href="${path0}/GetPlace.do?ptype=all&pno=${dto.pno}">
						<div class="place-div" id="place-div">
							<div class="card-image">
								<figure class="fig"><img src="${path0 }/upload/place/${dto.filename }" alt="여기어때${dto.pno }"></figure>
							</div>
							<div class="card-body">
								<ul class="place-ul">
									<li><span class="item_tit">${dto.pname }</span></li>
									<li><img src="${path0 }/images/tag.svg" alt="분류"><span class="item_type">${dto.ptype }</span></li>
									<li><img src="${path0 }/images/marker.svg" alt="주소"><span class="item_addr">${dto.paddr }</span></li>
									<li><img src="${path0 }/images/phone.svg" alt="연락처"><span class="item_tel">
										<c:if test="${empty dto.ptel }">
											정보 없음
										</c:if>
										<c:if test="${not empty dto.ptel }">
											${dto.ptel }
										</c:if></span></li>
								</ul>
							</div>
						</div>
						</a>
					</c:forEach>
					</c:if>
					<c:if test="${empty placeList }">
						<div class="emptylist"><h3>등록된 여기어때 정보가 없습니다.</h3></div>
					</c:if>
				</c:if>
				<c:if test="${ptype.equals('curtural') }">
					<c:if test="${not empty placeList }">
					<c:forEach var="dto" items="${placeList }">
						<a href="${path0}/GetPlace.do?ptype=curtural&pno=${dto.pno}">
						<div class="place-div" id="place-div">
							<div class="card-image">
								<figure class="fig"><img src="${path0 }/upload/place/${dto.filename }" alt="여기어때${dto.pno }"></figure>
							</div>
							<div class="card-body">
								<ul class="place-ul">
									<li><span class="item_tit">${dto.pname }</span></li>
									<li><img src="${path0 }/images/tag.svg" alt="분류"><span class="item_type">${dto.ptype }</span></li>
									<li><img src="${path0 }/images/marker.svg" alt="주소"><span class="item_addr">${dto.paddr }</span></li>
									<li><img src="${path0 }/images/phone.svg" alt="연락처"><span class="item_tel">
										<c:if test="${empty dto.ptel }">
											정보 없음
										</c:if>
										<c:if test="${not empty dto.ptel }">
											${dto.ptel }
										</c:if></span></li>
								</ul>
							</div>
						</div>
						</a>
					</c:forEach>
					</c:if>
					<c:if test="${empty placeList }">
						<div class="emptylist"><h3>등록된 여기어때 정보가 없습니다.</h3></div>
					</c:if>
				</c:if>
				<c:if test="${ptype.equals('theme') }">
					<c:if test="${not empty placeList }">
					<c:forEach var="dto" items="${placeList }">
						<a href="${path0}/GetPlace.do?ptype=theme&pno=${dto.pno}">
						<div class="place-div" id="place-div">
							<div class="card-image">
								<figure class="fig"><img src="${path0 }/upload/place/${dto.filename }" alt="여기어때${dto.pno }"></figure>
							</div>
							<div class="card-body">
								<ul class="place-ul">
									<li><span class="item_tit">${dto.pname }</span></li>
									<li><img src="${path0 }/images/tag.svg" alt="분류"><span class="item_type">${dto.ptype }</span></li>
									<li><img src="${path0 }/images/marker.svg" alt="주소"><span class="item_addr">${dto.paddr }</span></li>
									<li><img src="${path0 }/images/phone.svg" alt="연락처"><span class="item_tel">
										<c:if test="${empty dto.ptel }">
											정보 없음
										</c:if>
										<c:if test="${not empty dto.ptel }">
											${dto.ptel }
										</c:if></span></li>
								</ul>
							</div>
						</div>
						</a>
					</c:forEach>
					</c:if>
					<c:if test="${empty placeList }">
						<div class="emptylist"><h3>등록된 여기어때 정보가 없습니다.</h3></div>
					</c:if>
				</c:if>
				<c:if test="${ptype.equals('etc') }">
					<c:if test="${not empty placeList }">
					<c:forEach var="dto" items="${placeList }">
						<a href="${path0}/GetPlace.do?ptype=etc&pno=${dto.pno}">
						<div class="place-div" id="place-div">
							<div class="card-image">
								<figure class="fig"><img src="${path0 }/upload/place/${dto.filename }" alt="여기어때${dto.pno }"></figure>
							</div>
							<div class="card-body">
								<ul class="place-ul">
									<li><span class="item_tit">${dto.pname }</span></li>
									<li><img src="${path0 }/images/tag.svg" alt="분류"><span class="item_type">${dto.ptype }</span></li>
									<li><img src="${path0 }/images/marker.svg" alt="주소"><span class="item_addr">${dto.paddr }</span></li>
									<li><img src="${path0 }/images/phone.svg" alt="연락처"><span class="item_tel">
										<c:if test="${empty dto.ptel }">
											정보 없음
										</c:if>
										<c:if test="${not empty dto.ptel }">
											${dto.ptel }
										</c:if></span></li>
								</ul>
							</div>
						</div>
						</a>
					</c:forEach>
					</c:if>
					<c:if test="${empty placeList }">
						<div class="emptylist"><h3>등록된 여기어때 정보가 없습니다.</h3></div>
					</c:if>
				</c:if>				
		</div>
		<div class="paging">
			<ul class="paging-list">
				<li><a href="${path0 }/PlaceList.do?ptype=${ptype}&page=1"><</a></li>
				<c:forEach var="i" begin="1" end="${pcnt }" >
					<li><a id="page${i }" href="${path0 }/PlaceList.do?ptype=${ptype}&page=${i}"><c:out value="${i }"/></a></li>
				</c:forEach>
				<li><a href="${path0 }/PlaceList.do?ptype=${ptype}&page=${pcnt}">></a></li>
			</ul>
		</div>
		<div class="buttons">
			<c:if test="${sid.equals('admin') }">
			<a role="button" class="insbtn" href="${path0 }/place/insertPlace.jsp?ptype=${ptype}">여기어때 등록</a>
			</c:if>
		</div>
	</section>
</div>
<div id="footer" class="clr-fix">
    <%@ include file="/footer.jsp" %>
</div>
<script>
	var ptype = "<%=request.getParameter("ptype")%>";
	if (ptype == 'all') {
		document.querySelector(".placetab-list li:nth-child(1)").classList.add('active');
	} else if (ptype == 'curtural') {
		document.querySelector(".placetab-list li:nth-child(2)").classList.add('active');
	} else if (ptype == 'theme') {
		document.querySelector(".placetab-list li:nth-child(3)").classList.add('active');
	} else if (ptype == 'etc') {
		document.querySelector(".placetab-list li:nth-child(4)").classList.add('active');
	} 
	
	document.querySelector("#page<%=request.getAttribute("curPage")%>").classList.add('active');
</script>
</body>
</html>