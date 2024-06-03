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

<style>
* {box-sizing:border-box; }
	#contents { clear:both; width:100%;  margin-bottom:5rem; box-sizing:border-box; min-width:1400px; min-height:100vh;}
	#contents #page1 { clear:both; width:1200px; margin:0 auto; font-family: Noto Sans KR;}
	#contents a { text-decoration: none;}
	ol { list-style: none; }
	
	#header #hd #gnb a.dp { color:#101010;}
	.fd-vs { width:100%; height:618px; overflow:hidden; margin:0 auto; font-family: 'HSBombaram'; min-width:1400px; }
	.fd-vs img {width:100%; height:100%; object-fit:cover;}
	.fd-vs .vstit {position:absolute; width:100%; min-width:1400px; color:#fff; top:330px; z-index:998; margin:0 auto; }
	.fd-vs .vstit .ttext {font-size:70px; font-weight:400; width:1200px; min-width:1200px; margin:0 auto; padding-left:25px; letter-spacing:10px; color:#fff; text-shadow: 2px 2px 2px gray;}
	
	#page1 .wrap { color:#101010;}
	
	#table {margin:0 auto; width:1200px;}
	#table #td-title {border-top:3px solid #C1A483; font-size:22px; border-bottom:1px solid #C1A483; padding:15px 0 15px 15px; font-weight:500;}
	#table #td-aid {width:1%; white-space:nowrap; padding:5px 0 5px 15px; text-align:left;}
	#table #td-resdate span {margin:0 15px; color:#b8b8b8;}
	#table #td-visited {text-align:right; padding-right:15px;}
	#table #td-visited span {margin-right:15px; }
	#table #td-content {border-top:1px solid #C1A483; padding: 25px; min-height:200px; border-bottom:1px solid #C1A483;}
	#table #td-content .fig {width:900px; margin:0 auto;}
	#table #td-content .fig img {width:100%; height:auto;}
	
	
	.bread-crumb {width:100%; height:40px; text-align:right; padding-right:10px; margin-top:20px; margin-bottom:20px; }
	#contents .bread-crumb li {display:inline-block; line-height:40px; color:#b8b8b8;}
	#contents .bread-crumb li a {color:#666;}
	.bread-crumb li a:hover {text-decoration:underline;}
	.bread-crumb li:last-child a {font-weight:500; color:#595959;}
	
	.page .buttons { margin:0 auto; margin-top:50px; text-align:center; margin-bottom:100px;}
	.page .buttons a { display:inline-block;  border:none; text-align:center; padding:7px 20px; border-radius:30px; margin-left:3px; 
		background-color:#333; color:#fff; font-size:20px; font-weight:500;}

	#page2 {width:1200px; margin:0 auto;}
	#page2 * {box-sizing:border-box;}
	#page2 #reply-wrap {width:100%; height:140px; background-color:#f0eae4; padding:20px;}
	#page2 #reply-wrap #rep-input {display:inline-block; width:1020px; height:100px; margin-right:15px; vertical-align:middle; padding:20px; resize:none; }
	#page2 #reply-wrap #btn-col {display:inline-block; width:115px; height:100px;  }
	#page2 #reply-wrap #btn-col #rep-btn {display:inline-block; width:100%; height:100%; vertical-align:middle; font-size:22px; color:#fff; background-color:#C1A483; border:none; border-radius:5px; font-weight:500; box-shadow: 2px 5px 10px 1px #C1A48366;}
	#page2 #reply-wrap * {font-family: Noto Sans KR; }

</style>
</head>
<body>
<div id="header" class="clr-fix">
	<%@ include file="/header.jsp" %>		
</div>
<div id="contents" class="clr-fix">
	<figure class="fd-vs">
		<img src="${path0 }/images/qnalistimg.png" alt="담벼락 배너">
		<div class="vstit"><p class="ttext">담벼락</p></div>
	</figure>
	<section class="page" id="page1">
		<div class="bread-crumb">
			<ul>
				<li><a href="${path0 }/">홈</a>  >  </li>
				<li><a >커뮤니티</a>  >  </li>
				<li><a href="${path0 }/QnaList.do">담벼락</a>  >  </li>
				<li><a href="${path0 }/GetQna2.do?bno=${qna.bno}">상세보기</a></li>
			</ul>
		</div>
				<div class="wrap">
					<table class="table" id="table">
						<tbody>
							<tr class="tr-title">
								<td id="td-title" colspan="3" >${qna.title }</td>
							</tr>	
							<tr>
								<td id="td-aid">${qna.aid }</td><td id="td-resdate"><span>|</span>${qna.resdate }</td>
								<td id="td-visited"><span>조회</span>${qna.visited }</td>
							</tr>
							<tr class="tr-content" >
								<td id="td-content" colspan="3">
									${qna.content }<br><br><br>
									<c:if test="${not empty qna.filename }">
									<figure class="fig"><img src="${path0 }/upload/community/${qna.filename}" alt="담벼락${qna.bno }"></figure>
									</c:if>
								</td>
							</tr>
							
						</tbody>
					</table>
					<div class="buttons">
					  <c:if test="${sid.equals('admin') or sid.equals(qna.aid) }">
						  <a role="button" id="delbtn">삭제</a>
					  </c:if>
					  <c:if test="${sid.equals(qna.aid) }">
						  <a href="${path0 }/EditQna.do?bno=${qna.bno }">수정</a>
					  </c:if>
					 <a role="button" href="${path0 }/QnaList.do" >목록</a>
					</div>
				</div>
		</section>
		<section id="page2">
			<div id="reply-wrap">
				<form id="repForm"  >
					<textarea id="rep-input" placeholder="댓글 기능 준비 중"></textarea>
					<div id="btn-col"><button id="rep-btn">등록</button></div>
				</form>
				
			</div>
		</section>
	<!-- <section class="page" id="page2">
		<div id="coment">	
			<h3 class="page_title"><i class="xi-hangouts xi-2x"></i> 대화를 시작해보세요</h3>
		</div>	
	</section> -->	
</div>
<div id="footer" class="clr-fix">
	<%@ include file="/footer.jsp" %>		
</div>
<script>
	var delbtn = document.getElementById('delbtn');
	delbtn.addEventListener("click", function() {
		if(confirm("삭제 하시겠습니까?")) {
			location.replace("${path0 }/DelCommunity.do?bno="+<%=request.getAttribute("bno")%>+"&t=qna");
		}
	});
</script>
</body>
</html>