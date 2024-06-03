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
	
	#header #hd #gnb a.dp { color:#101010;}
	hr { box-sizing:content-box;  margin-bottom:30px;}
	
	#contents { width:100%; min-height:calc(100vh - 610px);  box-sizing:border-box; min-width:1200px; margin-top:160px;}
	#contents .page { clear:both; width:1200px; margin:0 auto;}
	.page .page-title { width:50%; margin-top : 2rem; margin-bottom:1.5rem; padding-left:20px; font-family: 'HSBombaram'; font-size:40px; letter-spacing:3px; display:inline-block; box-sizing:border-box;}
	
	.insForm {width:1000px; margin:0 auto;}
	.insForm * {font-family: Noto Sans KR;}
	.insForm td {padding-bottom:10px; }
	.insForm .td-ftype {width:200px; padding-right:5px;}
	.insForm .td-ftype select {width:100%; height:60px; padding:10px; border:1px solid #101010; font-size:16px;}
	.insForm input:not([type=file]) {width:100%; height:40px; padding:10px;  border:1px solid #101010;  font-size:16px;}
	.insForm .td-comm textarea {width:100%; height:200px; resize:none; padding:10px; font-size:16px;}
	.insForm .td-ffile .btn-upload {width:100px; text-align:center; padding:5px; display:inline-block;
		border:1px solid #6b717b; border-radius:3px;}
	.insForm .td-ffile #filename {width:800px; padding-left:10px; font-size:14px;}
	.insForm .td-ffile #filename::file-selector-button {display:none;}
	.insForm .td-submit .btn-group { width:300px; margin:0 auto; text-align:center;}
	.insForm .td-submit #submit {display:inline-block;  border:none; text-align:center; padding:7px 20px; border-radius:30px; margin-left:3px; 
		background-color:#333; color:#fff; font-size:20px; font-weight:500;font-family: Noto Sans KR;}
	.insForm .td-submit .btn-back {display:inline-block;  border:none; text-align:center; padding:7px 20px; border-radius:30px; margin-left:3px; 
		background-color:#595959; color:#fff; font-size:20px; font-weight:500; }
	
	.bread-crumb {display:inline-block; width:49%; height:40px; text-align:right; padding-right:10px; margin-top:20px; margin-bottom:20px; box-sizing:border-box;}
	#contents .bread-crumb li {display:inline-block; line-height:40px; color:#b8b8b8;}
	#contents .bread-crumb li a {color:#666;}
	.bread-crumb li a:hover {text-decoration:underline;}
	.bread-crumb li:last-child a {font-weight:500; color:#595959;}
</style>
</head>
<body>
<%
	String sid = (String) session.getAttribute("sid");
	if(sid == null || !sid.equals("admin")) {
		response.sendRedirect("/gyeongju");
	}
%>
<div id="header" class="clr-fix">
	<%@ include file="/header.jsp" %>
</div>
<div id="contents" class="clr-fix">
	<section class="page">
		<h2 class="page-title">식도락</h2>
		
		<div class="bread-crumb">
			<ul>
				<li><a href="${path0 }/">홈</a>  >  </li>
				<li><a href="${path0 }/FoodList.do?ftype=all">식도락</a>  >  </li>
				<li><a href="${path0 }/food/insertFood.jsp?ftype=${ftype}">등록</a></li>
			</ul>
		</div>
		<hr>
		<form action="${path0 }/FoodInsert.do?ftype=<%=request.getParameter("ftype") %>" method="post" 
			onsubmit="return typeCheck(this)" enctype="multipart/form-data" >
			<table class="insForm">
				<tbody>
					<tr>
						<td class="td-ftype">
							<select name="ftypeval" id="ftypeval">
								<option>분류</option>
								<option>음식점</option>
								<option>카페</option>
								<option>기타</option>
							</select>
						</td>
						<td class="td-fname">
							<input type="text" name="fname" id="fname" maxlength="40" placeholder="이름" required>
						</td>
					</tr>	
					<tr>
						<td colspan="2" class="td-faddr">
							<input type="text" name="faddr" id="faddr" maxlength="50" placeholder="주소" required>
						</td>
					</tr>
					<tr>
						<td colspan="2" class="td-ftel">
							<input type="tel" name="ftel" id="ftel" maxlength="20" placeholder="연락처">
						</td>
					</tr>
					<tr>
						<td colspan="2" class="td-comm">
							<textarea name="fcomm" id="fcomm" maxlength="2000"></textarea>
						</td>
					</tr>
					<tr>
						<td colspan="2" class="td-ffile">
							<label for="filename">
								<div class="btn-upload">사진 첨부</div>
							</label>
							<input type="file" name="filename" id="filename" accept=".jpg, .png, .jpeg, .svg, .PNG, .JPG, .JPEG, .SVG">
						</td>
					</tr>
					<tr>
						<td colspan="2" class="td-submit">
							<div class="btn-group">
								<a class="btn-back" href="${path0 }/FoodList.do?ftype=<%=request.getParameter("ftype")%>">취소</a>
								<button id="submit" type="submit">등록</button>
							</div>
							
						</td>
					</tr>
				</tbody>
				
			</table>
		</form>
		
	</section>
</div>
<div id="footer" class="clr-fix">
 	<%@ include file="/footer.jsp" %>
</div>
<script>
	function typeCheck(f) {
		if(f.ftypeval.value=='분류') {
			alert("분류를 선택하시오.");
			return false;
		}
	}
	
	var url = window.location.search;
	var ftype = new URLSearchParams(url).get('ftype');
	if(ftype == 'rest') {
		document.querySelector('#ftypeval option:nth-child(2)').selected = true;
	
	} else if(ftype == 'cafe') {
		document.querySelector('#ftypeval option:nth-child(3)').selected = true;
	} else if(ftype == 'etc') {
		document.querySelector('#ftypeval option:nth-child(4)').selected = true;
	} else {
		document.querySelector('#ftypeval option:nth-child(1)').selected = true;
	}
</script>
</body>
</html>