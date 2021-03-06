<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>

<link rel="stylesheet" type="text/css" href="${request.contextPath}/resources/css/suhee.css">

<div class = "page-wrapper page-get">
	<div class = "page-contnets" style="width: 100%;">
	
		<div class = "detail-navigation-list container-navigation box">
			<div class = "detail-navigation-list">
				<a href="../../acm/list">홈</a>
				<a href="../../acm/detail?person=&in=&out=&acmNum=${book.acmNum}">숙소정보</a>
				<a href="../../mypage/bookListAll">나의예약</a>
				<a href="../../acm/list" target='blank'>예약확정서</a>
			</div>
		</div>
		
		<div class = "container-bookingInfo box" >
			<table>
				<tr><td class="acm-pic" rowspan="4"><img alt='숙소사진' src='/display?fileName=<c:out value="${book.acmPurl}" /><c:out value="${book.acmPname}" />' /></td>
					<td colspan="2"><label><a href="../../acm/detail?person=&in=&out=&acmNum=${book.acmNum}">${book.acmName}</a></label></td></tr>
				<tr><td colspan="2"><label><i class="fas fa-map-marker-alt"></i><a href="https://www.google.co.kr/maps/place/${acm.acmCity}${acm.acmDistr}${acm.acmDetailaddr}" target="_blank">${book.acmCity}${book.acmDistr}${book.acmDetailaddr}</a></label></td></tr>
				<tr><td colspan="2"><label><i class="fa fa-phone" aria-hidden="true"></i><a href="tel:${acm.repPhone}">${book.repPhone}</a></label></td></tr>
				<tr><td colspan="2"><label><i class="fa fa-envelope" aria-hidden="true"></i><a href="mailto:${acm.acmEmail}">${book.acmEmail}</a></label></td></tr>
				
				<tr><td><label>예약번호</label></td>
					<td colspan="2"><c:out value="${book.bookNum }"/></td></tr>
				<tr><td><label>체크인</label></td>
					<td colspan="2"><c:out value="${book.checkinDate }"/><c:out value="${book.checkinTime }"/></td></tr>
				<tr><td><label>체크아웃</label></td>
					<td colspan="2"><c:out value="${book.checkoutDate }"/><c:out value="${book.checkoutTime }"/></td></tr>
				<tr><td><label>숙박일</label></td>
					<td colspan="2"><c:out value="${book.staydays }"/></td></tr>
				<tr><td><label>예약자</label></td>
					<td><c:out value="${book.bookerFirstname}"/><c:out value="${book.bookerLastname}"/></td>
					<td><a href="../../mypage/modify">수정하기(나의예약)</a></td></tr>
				
				<tr><td><label>예약객실</label></td>
					<td colspan="2"><c:out value="${book.romName}"/>(<c:out value="${book.romType}"/>, <c:out value="${book.bedType}"/>-<c:out value="${book.bedCnt}"/>개)</td></tr>
				
				<tr><td><label>결제정보</label></td>
					<td colspan="2"></td></tr>
				<tr><td><label>결제방법</label></td>
					<td colspan="2"></td></tr>
				
			</table>
		</div>
	</div>
</div>

<%@include file="../includes/footer.jsp"%>
