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
* { margin: 0; padding: 0; font-family: Noto Sans KR;}    
body { width: 100%; background-color: #f8f8f8; }
ul { list-style: none; }
a { text-decoration: none;}

.container { width:1400px;}

#contents {overflow-x:hidden;}

.submain_txt { width: 100%; margin: 0 auto; top: 330px; margin-left: -30.5%; color: #FFF; font-family: HSBomBaram; font-weight: Regular; font-size: 54pt;
text-align: center; position:absolute;}
#vs {width: 100%; height: auto;}

.con_1 { clear:both; width:1400px; height: auto; margin: 0 auto; overflow: hidden;}
.con_title1 { color: #101010; font-family: MaruBuri-Regular; font-weight: 600; font-size: 40px; text-align: left; margin-top: 40px; margin-left: 0.2%;}
.con_subtxt1 {font-family: Noto Sans KR; font-size: 15pt; font-weight: 500; color:#333; line-height: 2.4rem; margin-top: 40px;}
.sub_img1 { margin-top: -400px; float:right;}
.sub_bg { margin-top: -220px; margin-left: 220px;}
.sub_img2 { margin-top: 17px;}

.con_2 { clear:both; width:1400px; height: auto; margin: 0 auto; overflow: hidden;}
.con_title2 { color: #101010; font-family: MaruBuri-Regular; font-weight: 600; font-size: 40px; text-align: left; margin-top: 100px; margin-left: 0.2%;}
.con_subtxt2 {font-family: Noto Sans KR; font-size: 15pt; font-weight: 500; color:#333; line-height: 2.4rem; margin-top: 40px; margin-bottom: 40PX; text-align: justify;}
.line2 {width: 1400px; margin: 0 auto; padding: 0; margin-top: 48px; border-top: 3px solid #DDD;}

.con_3 { clear:both; width:1400px; height: auto; margin: 0 auto; overflow: hidden;}
.con_title3 { color: #101010; font-family: MaruBuri-Regular; font-weight: 600; font-size: 40px; text-align: left; margin-top: 60px; margin-left: 0.2%;}
.con_subtxt3 {font-family: Noto Sans KR; font-size: 15pt; font-weight: 500; color:#333; line-height: 2.4rem; margin-top: 40px;}
.sub_img3 { margin-top: -480px; float:right;}
.sub_img4 { margin-top: 120px; float: left;}
.sub_img5 { margin-top: 298px;}
.sub_img6 { float:right;}

.line1 {width: 1400px; margin: 0 auto; padding: 0; margin-top: 48px; border-top: 2px solid #E8E8E8;}
.breadcrumb {width: 1400px; text-align:right; padding-top: 12px; padding-right: 20px; color: #b8b8b8; margin:0 auto;}
.breadcrumb a{ color: #666; font-size: 12pt; font-weight: 400;}
.breadcrumb span{ color: #595959; font-size: 12pt; font-weight: 500;}


</style>
</head>
<body>
<div id="header" class="clr-fix">
 	<%@ include file="/header.jsp" %>
</div>
<main id="contents">
    <figure id="vs">
        <div class="img_box">
            <p class="submain_txt">지역소개</p>
            <img src="${path0}/images/sub_main.png" alt="지역소개 이미지">
        </div>
    </figure>
    <div class="line1"></div>
    <div class="breadcrumb">
        <p>
            <a href="">홈</a> > <a href="">지역소개</a> > <span>신화</span>
        </p>
    </div>
    <div class="con_1">
        <h5 class="con_title1">1500년 전 찬란했던<br>신라 속으로</h5>
        <p class="con_subtxt1">신라(新羅)는 기원전 57년부터 기원후 935년까지<br>
           고구려, 백제와 함께 고대 한반도의 삼국 시대를 이끌고<br>
           발해와 함께 남북국 시대를 구성하였던 국가로,<br>
           세계적으로 오랫동안 지속된 왕국 중 하나이다.<br>
           <br>
           진한에 성읍국가 중 하나인 경주 지역의 사로국(斯盧國)이<br>
           시초로 혁거세 거서간이 나라를 세웠다고 알려져 있다.
        </p>
        <img class="sub_img1" src="${path0}/images/sub_img1.png" alt="경주 감포 문무대왕릉">
        <img class="sub_bg" src="${path0}/images/sub_bg.png" alt="배경이미지">
        <img class="sub_img2" src="${path0}/images/sub_img2.png" alt="경주 신라의 미소">
    </div>
    <div class="con_2">
        <h5 class="con_title2">신라의 신화</h5>
        <p class="con_subtxt2">박혁거세신화 [朴赫居世神話]<br>
         옛날 진한(辰韓) 땅에 여섯 마을이 있었는데, 어느날 고허촌(高墟村) 촌장 소벌공(蘇伐公)이, 양산 밑의 나정(蘿井)이라는 우물 곁에서 흰 말이 무릎을 꿇고 우는 것을 이상히
         여겨 보았더니, 말은 간 곳 없고 불그스럼한 알이 하나 있었다. 깨 보니 아기가 있어 소벌공이 데려가 정성껏 길렀다. 아기는 점점 준수하여져 나이 열세 살에 뛰어난 젊은이가 되었다.
         이에 여섯 마을 촌장들이 모여 아이를 임금으로 삼고, 박에서 나왔으므로 성을 박(朴)이라 하였으며, 세상을 밝게 다스린다는 뜻으로 이름을 혁거세라 하였다고 한다.
        </p>
        <div class="line2"></div>
        <P class="con_subtxt2">삼국사기와  삼국유사에 기록된 박혁거세신화는 한국 고대 건국신화의 전통을 잘 따르고 있으면서도, ‘하강한 운반체를 통한 난생과 부부 신성혼’을 내용의 특징으로 한다는 점에서
            북방 지역 건국신화와 다른 면을 보여 준다. 이러한 면은 같은 남방 지역의 건국신화인 금관가야 김수로신화에서도 나타난다. 아울러 ‘선도산 여산신이 신라 건국시조인 혁거세와
            알영을 낳았다.’라는 내용의 신화가 전승되고 있는데, 이는 지배층이 천신계 건국신화를 전승하는 것과 달리 토착 집단에서는 산신숭배에 따른 지모신 계통의 신화를 전승하고 있음을
            의미한다.
        </P>
    </div>
    <div class="con_3">
        <h5 class="con_title3">그외의 신화</h5>
        <p class="con_subtxt3">
            신라의 신화는 박혁거세(朴赫居世)가 대표적이지만 그 외에도<br>
            석(昔)씨와 김(金)씨의 시조로서 석탈해(昔脫解), 김알지(金閼智)<br>
            신화도 함께 전해진다. 석탈해와 김알지 신화는 그 자체로는 건국<br>
            신화라고 할 수 없지만, 이 두 신화 역시 왕실의 시조 신화로서의<br>
            위상을 지니므로 함께 주목하지 않을 수 없다.<br>
            <br>
            이처럼 건국 신화 외에 다른 왕실의 시조 신화가 존재한다는 점이<br>
            고구려나 백제, 가야의 건국 신화와는 차별되는 신라 건국기<br>
            신화만의 특징이라고 할 수 있다.<br>
        </p>
        <img class="sub_img3" src="${path0}/images/sub_img3.png" alt="경주 월정교 내부">
        <img class="sub_img4" src="${path0}/images/sub_img4.png" alt="경주 첨성대">
        <img class="sub_img5" src="${path0}/images/sub_img5.png" alt="경주 석굴암">
        <img class="sub_img6" src="${path0}/images/sub_img6.png" alt="경주 월정교 외관">
    </div>
</main>
<div id="footer" class="clr-fix">
    <%@ include file="/footer.jsp" %>
</div>
</body>
</html>