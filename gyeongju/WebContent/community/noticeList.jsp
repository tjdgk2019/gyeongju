<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path0" value="<%=request.getContextPath() %>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Gyeongju</title>
<%@ include file="/head.jsp" %>
<%-- <script src="${path0 }/js/jquery.dataTables.js"></script> --%>
<%-- <link rel="stylesheet" href="${path0 }/css/jquery.dataTables.css"> --%>
<!-- <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css"> -->
<style>
* {box-sizing:border-box; }
	#contents { clear:both; width:100%;  margin-bottom:5rem; box-sizing:border-box; min-width:1400px; min-height:100vh;}
	#contents #page1 { clear:both; width:1200px; margin:0 auto;  margin-bottom: 50px; font-family: Noto Sans KR;}
	#contents a {color:#101010;}
	#page1 a { text-decoration: none;}
	ol { list-style: none; }
	
	#header #hd #gnb a.dp { color:#101010;} 
	.fd-vs { width:100%; height:618px; overflow:hidden; margin:0 auto; font-family: 'HSBombaram'; min-width:1400px; }
	.fd-vs img {width:100%; height:100%; object-fit:cover;}
	.fd-vs .vstit {position:absolute; width:100%; min-width:1400px; color:#fff; top:330px; z-index:998; margin:0 auto; }
	.fd-vs .vstit .ttext {font-size:70px; font-weight:400; width:1200px; min-width:1200px; margin:0 auto; padding-left:25px; letter-spacing:10px; color:#fff; text-shadow: 2px 2px 2px gray;}
	
	.head { clear: both; width: 100%; height: 300px; overflow: hidden; }
	#nav { width: 100%; float: left; }
	#title { float:left; text-align: left; margin-top: 3rem; margin-left: 15%; display: flex; align-items: center; }
	
	
			
	table { border: 1px #a39485 solid; font-size: 18px; box-shadow: 0 2px 5px rgba(0,0,0,.25); width: 1200px; margin: 0 auto; border-collapse: collapse; border-radius: 5px; overflow: hidden; margin-bottom:40px;}
	thead { font-weight: bold; color: #fff; background-color: #C1A483; }
	td, th { padding: 1em .5em; vertical-align: middle; text-align: center; }
  	td { border-bottom: 1px solid rgba(0,0,0,.1); background: #fff; }
	
	#table .td-title {text-align:left; padding-left:30px;}
  	#table .td-title a:hover {font-weight:500; text-decoration:underline;}
 	/* @media all and (max-width: 768px) {
    
 	table, thead, tbody, th, td, tr { display: block; }
	th { text-align: right; }
	table { position: relative; padding-bottom: 0; border: none; box-shadow: 0 0 10px rgba(0,0,0,.2); }
	thead { float: left; white-space: nowrap; }
	tbody { overflow-x: auto; overflow-y: hidden; position: relative; white-space: nowrap; }
	tr { display: inline-block; vertical-align: top; }
	th { border-bottom: 1px solid #a39485; }
	td { border-bottom: 1px solid #e5e5e5; } */
	
	#page2 { clear: both; width: 100%; height: auto; }
	#board-search .search-window { padding: 15px auto; background-color: #f9f7f9; }
	#board-search .search-window .search-wrap { position: relative; margin: 0 auto; width: 80%; max-width: 564px; }
	#board-search .search-window .search-wrap input { height: 40px; width: 100%; font-size: 14px; padding: 7px 14px; border: 1px solid #ccc; }
	#board-search .search-window .search-wrap input:focus { border-color: #333; outline: 0; border-width: 1px; }
	#board-search .search-window .search-wrap .btn { position: absolute; right: 50%; top: 0; bottom: 0; width: 108px; padding: 0; font-size: 16px; } 
	
	.btn-dark {
	  background: #555;
	  color: #fff;
	}
	
	.btn-dark:hover, .btn-dark:focus {
	  background: #373737;
	  border-color: #373737;
	  color: #fff;
	}
	
	.blind {
	  position: absolute;
	  overflow: hidden;
	  clip: rect(0 0 0 0);
	  margin: -1px;
	  width: 1px;
	  height: 1px;
	}
	
	
	.btn_group1 { margin: 0 auto; padding: 10px auto; }
	.btn { text-align: center; color: #000; width:20px; height: 20px; }
	
	#contents .buttons #insbtn {border:none; text-align:center; padding:7px 20px; border-radius:30px; margin-left:3px; 
		background-color:#333; color:#fff; float:right; font-size:20px; font-weight:500;}
	
	.bread-crumb {width:100%; height:40px; text-align:right; padding-right:10px;margin-top:20px; margin-bottom:20px;  }
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
		<img src="${path0 }/images/noticelistimg.jpg" alt="공지사항 배너">
		<div class="vstit"><p class="ttext">공지사항</p></div>
	</figure>
	<section id="page1">
		<div class="bread-crumb">
			<ul>
				<li><a href="${path0 }/">홈</a>  >  </li>
				<li><a >커뮤니티</a>  >  </li>
				<li><a href="${path0 }/NoticeList.do">공지사항</a>
				</li>
			</ul>
		</div>
		<div>
			<table id="table" class="tb">
				<colgroup>
					<col style="width:88px">
					<col>
					<col style="width:220px">
					<col style="width:80px">
				</colgroup>
				<thead>
					<tr>
						<th scope="col">번호</th>
						<th scope="col">제목</th>
						<th scope="col">작성일</th>
						<th scope="col">조회</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${not empty noticeList }">
						<c:forEach var="dto" items="${noticeList }">
						<tr>
							<td>${dto.bno }</td>
							<td class="td-title">
								<c:if test="${empty sid }">
									${dto.title }
								</c:if>
								<c:if test="${not empty sid }">
								<a href="${path0 }/GetNotice.do?bno=${dto.bno }">${dto.title }</a>
								</c:if>
							</td>
							<td>${dto.resdate }</td>
							<td>${dto.visited }</td>
						</tr>
						</c:forEach>
					</c:if>
					<c:if test="${empty noticeList }">
						<tr>
							<td colspan="4">
								<strong>공지사항이 존재하지 않습니다.</strong>
							</td>
						</tr>
					</c:if>
				</tbody>
			</table>
			
			</div>
		<div class="buttons">
			<c:if test="${sid.equals('admin') }">
			<a id="insbtn" role="button" href="${path0 }/NoticeInsert.do">공지사항 등록</a>
			</c:if>
		</div>
	</section>
			<!-- <div id="board-search">
       			<div class="container">
		            <div class="search-window">
		                <form action="">
		                    <div class="search-wrap">
		                        <h6><label for="search" class="blind">공지사항 내용 검색</label></h6>
		                        <input id="search" type="search" name="title" placeholder="검색어를 입력해주세요." value="">
		                        <button type="submit" class="btn btn-dark">검색</button>
		                    </div>
		                </form>
		            </div>
		        </div>
		    </div> -->
				<!-- <div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">
				<div class="btn_group1">
					<div class="btn-group me-2" role="group" aria-label="Second group">
				        <button type="button" class="btn btn-secondary">1</button>
				        <button type="button" class="btn btn-secondary">2</button>
				        <button type="button" class="btn btn-secondary">3</button>
				    </div> -->
					<!-- <button type="button" class="btn">2</button>
					<button type="button" class="btn">3</button>
					<button type="button" class="btn">4</button>
					<button type="button" class="btn">5</button> -->
				<!-- </div> -->
				<!-- <div class="input_group">
					<div class="btn-group dropup">
					  <button type="button" class="btn btn-secondary dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false"></button>
					  <ul class="dropdown-menu">
					  	<li>제목</li>
					  	<li>작성자</li>
					  	<li>제목+작성자</li>
					  </ul>
					</div>
					<input type="search" size="30" placeholder="검색어를 입력하세요" />
					<button type="button" class="btn btn-outline-secondary">검색</button>
				</div> 
			</div>-->
		
</div>
<div id="footer" class="clr-fix">
    <%@ include file="/footer.jsp" %>
</div>

</body>
</html>