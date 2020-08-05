<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String location = (String) session.getAttribute("location");
%>
<!DOCTYPE html>
<html lang="en">
<%@include file="../includes/header.jsp"%>
<head>

<style>

.modal-content1 {
	background-color: #fefefe;
	margin: auto;
	padding: 20px;
	border: 1px solid #888;

	width: 100%
	display: flex;
	flex-direction: column;
	pointer-events: auto;
}


.modal {
	z-index: 12000;
}


.modal-content1{
    border-radius: 12px !important;
}

.modal-body{
	border: 1px solid red;
	height: 120px;
}

.modal-footer{
    border: 1px solid black;
}

.h1Name{
		font-size: 14px;
    font-weight: 800;
    padding-top: 5px;
    text-align: center !important;
    margin: 0 auto;
    padding-left: 20px;
}

.closeBtn{

        float: right;
    font-size: 1.5rem;
    font-weight: 700;
    line-height: 1;
    color: #000;
    text-shadow: 0 1px 0 #fff;
    opacity: .5;
        padding: 0;
    background: 0 0;
    border: 0;
}


</style>


<link rel="stylesheet" type="text/css"
	href="${request.contextPath}/resources/css/result.css">

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

<title>Booking Form HTML Template</title>


</head>

<body>


	<div id="wrap">
		<div class="container1">
			<section class="search_section">
				<div class="row1">
					<div class="booking-container">
						<form class="booking-form1" action="/acm/result" method='get'
							onsubmit="return checkValidation()">
							<div class="result-container">
								<div>
									<div class="no-margin1">
										<div class="formLayout1">
											<div class="form-group1">
												<div id="pac-container">
													<span>Location</span> <input class="form-control2"
														id="pac-input" type="text" name="keyword"
														value='<c:out value="${pageMaker.cri.keyword}"/>'
														placeholder="Enter a location">
												</div>
												<input type="hidden" value="CW" name="type">


											</div>

										</div>

										<div class="formLayout1">
											<div class="form-group1">
												<span>Check In</span>
												<div class="ui calendar" id="rangestart">
													<div class="ui input left icon width400">
														<i class="calendar icon"></i> <input type="text"
															placeholder="Start" id="in" name="in"
															value="<c:out value="${pageMaker.cri.in}"/>">
													</div>
												</div>
											</div>
										</div>

										<div class="formLayout1">
											<div class="form-group1">
												<span>Check out</span>
												<div class="ui calendar" id="rangeend">
													<div class="ui input left icon width400">
														<i class="calendar icon"></i> <input type="text"
															placeholder="End" id="out" name="out"
															value="<c:out value="${pageMaker.cri.out}"/>">
													</div>
												</div>
											</div>
										</div>
										<div class="formLayout1">
											<div class="form-group1">
												<span>Guests</span> <select class="form-control1"
													id="person" name="person">
													<option value="1">1</option>
													<option value="2">2</option>
													<option value="3">3</option>
													<option value="4">4</option>
													<option value="5">5</option>
													<option value="6">6</option>
													<option value="7">7</option>
													<option value="8">8</option>
												</select> <span class="select-arrow"></span>
											</div>
										</div>

									</div>
								</div>
								<div class="">
									<div class="form-btn1">

										<button
											class="submit-btn btn btn-primary btn btn-search text-uppercase"
											id="submitBtn" type="submit">
											<i class="fa fa-search"></i>
										</button>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
				<!-- end of row -->


			</section>
		</div>
		<!-- end container -->

		<div class="container-1">

			<!-- start : gallery_section -->
			<section class="gallery_section">

				<!-- start : main_text -->
				<div class="main_text">
					<p>?? 개 이상의 숙소</p>
					<h1 class="banner-title">강남구의 숙소</h1>
					<ul>
						<li><a href="#">유연한 환불 정책</a></li>
						<li><a href="#">숙소 정책</a></li>
						<li><a href="#">요금</a></li>
						<li><a href="#">즉시 예약</a></li>
						<li><a href="#">필터 추가하기</a></li>
					</ul>
				</div>
				<!-- end : main_text -->


				<!-- start : gallery_list -->
				<div id="myTable" class="gallery_list">

					<div>
						<c:forEach items="${list}" var="acm">

							<div class='room room1 move'
								href='<c:out value="${acm.acmNum}"/>'
								<%-- onclick="location.href='<c:out value="${acm.acmNum}"/>'" --%>
								style="cursor: pointer;">
															
								<input type="hidden" id="acmTest" value='<c:out value="${acm.acmNum}" />'>

								<div class="room-images" onclick="location.href='<c:out value="${acm.acmNum}"/>'">
									<a href="#">
										<figure>
											<img alt='객실사진'
												src='/display?fileName=<c:out value="${acm.acmPurl}" />s/<c:out value="${acm.acmPname}" />' />
										</figure>
									</a>
								</div>

								<div class="room-details" onclick="location.href='<c:out value="${acm.acmNum}"/>'">
									<h2 class="title">
										<a href="#"><c:out value="${acm.acmName}" /></a>
										</h1>
										<p class="address">
											<c:out value="${acm.acmCity }" />
											<c:out value="${acm.acmDistr }" />
											<c:out value="${acm.acmDetailaddr }" />
										</p>
										<p>
											<c:out value="${acm.acmDesc }" />
										</p>
										<div class="room-services">
											<div class="room-service-item">
												<i class="fa fa-wifi"></i>
											</div>
										</div>
										<div class="room-services">
											<div class="room-service-item">
												<i class="fa fa-bath"></i>
											</div>
										</div>
								</div>


<!-- ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ -->
<!-- ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ -->

								<div class="room-ect" value='<c:out value="${acm.acmNum}" />'>
									<button id="wishButton" class="wishButton" value='<c:out value="${acm.acmNum}" />'>
										<i></i>
									</button>
									<p>
										<span> ₩ 100,000</span> / 1박
									</p>
								</div>

<!-- ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ -->
<!-- ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ -->
								<input type="hidden" id="latitude"
									value='<c:out value="${acm.latitude }" />'> <input
									type="hidden" id="longitude"
									value='<c:out value="${acm.longitude }" />'>

							</div>
						</c:forEach>
					</div>
					<!-- 테이블 대신 -->


					<!-- end of myTable -->




					<div class='pull-right'>
						<ul class="pagination">

							<c:if test="${pageMaker.prev}">
								<li class="paginate_button previous"><a
									href="${pageMaker.startPage -1}">Previous</a></li>
							</c:if>

							<c:forEach var="num" begin="${pageMaker.startPage}"
								end="${pageMaker.endPage}">
								<li class="paginate_button ${pageMaker.cri.pageNum == num ? "active":""} "><a
									href="${num}">${num}</a></li>
							</c:forEach>

							<c:if test="${pageMaker.next}">
								<li class="paginate_button next"><a
									href="${pageMaker.endPage +1 }">Next</a></li>
							</c:if>
						</ul>
					</div>

					<form id='actionForm' action="/acm/result" method='get'>
						<input type='hidden' name='pageNum'
							value='${pageMaker.cri.pageNum}'> <input type='hidden'
							name='amount' value='${pageMaker.cri.amount}'> <input
							type='hidden' name='type'
							value='<c:out value="${pageMaker.cri.type}"/>'> <input
							type='hidden' name='keyword'
							value='<c:out value="${pageMaker.cri.keyword}"/>'> <input
							type='hidden' name='person'
							value='<c:out value="${pageMaker.cri.person}"/>'> <input
							type='hidden' name='in'
							value='<c:out value="${pageMaker.cri.in}"/>'> <input
							type='hidden' name='out'
							value='<c:out value="${pageMaker.cri.out}"/>'>
					</form>


				</div>

				<!-- <div class="pac-card" id="pac-card">
					<div>
						<div id="title">Autocomplete search</div>
						<div id="type-selector" class="pac-controls">
							<input type="radio" name="type" id="changetype-all"
								checked="checked"> <label for="changetype-all">All</label>

							<input type="radio" name="type" id="changetype-establishment">
							<label for="changetype-establishment">Establishments</label> <input
								type="radio" name="type" id="changetype-address"> <label
								for="changetype-address">Addresses</label> <input type="radio"
								name="type" id="changetype-geocode"> <label
								for="changetype-geocode">Geocodes</label>
						</div>
						<div id="strict-bounds-selector" class="pac-controls">
							<input type="checkbox" id="use-strict-bounds" value=""> <label
								for="use-strict-bounds">Strict Bounds</label>
						</div>
					</div>
					<div id="pac-container">
						<input id="pac-input" type="text" placeholder="Enter a location">
					</div>
				</div> -->

			</section>

			<section class="map_section" id="map">
				<div id="infowindow-content" class="container">
					<img src="" width="16" height="16" id="place-icon"> <span
						id="place-name" class="title"></span><br> <span
						id="place-address"></span>
				</div>
			</section>


		</div>

		<!-- wishList 모달창 -->

		<!-- Modal -->
		
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
		
				<div class="modal-content1">
					<div class="modal-header">
						<h1 class="h1Name">당신의 여행을 찜하세요</h1>
						<button type="button" class="closeBtn" data-dismiss="modal"
							aria-hidden="true">&times;</button>

					</div>
					<div class="modal-body">				
						<div class="form-group info-group sr-only">
							<label>#유저번호</label> <input class="form-control" name='userNum'
								value='<%=userNum%>' readonly="readonly">
						</div>
						
						<div class="form-group info-group sr-only">
							<label>#숙소번호</label> <input class="form-control acmNum"  name='acmNum' readonly="readonly" > 					
 							<%-- <label>#숙소번호</label> <input class="form-control" name='acmNum' value='<c:out value="${acmNum}" />' readonly="readonly" >  --%>					
						</div>
						<div class="form-group info-group">
							<label>#타이틀</label> 
							<!-- <input class="form-control" name='listTitle' value='' > -->
							<select class="form-control" name='listTitle' value=''>
							    <option value="분류없음" hidden>분류선택</option>
							    <option value="관광">관광</option>
							    <option value="휴식">휴식</option>
							    <option value="쇼핑">쇼핑</option>
							</select>
								
								
								
						</div>
						<div class="form-group info-group">
							<label>#내용</label> <input class="form-control" name='listContent'
								value=''>
						</div>

					
					</div>
					<div class="modal-footer">
						<button id='modalRegisterBtn' type="button"
							class="btn btn-primary">Register</button>
						<button id='modalCloseBtn' type="button" class="btn btn-default">Close</button>
					</div>
				</div>
			
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>

		<!-- /.modal -->

	</div>
	<!-- end : wrap -->
</body>

<script>


/* var hidenBtn = document.getElementsByClassName("hidenBtn").value; */



</script>

<script>

      // This example requires the Places library. Include the libraries=places
      // parameter when you first load the API. For example:
      // <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&libraries=places">
      function initMap() {
    	  var acmNum = "${acmNum}";
			console.log(acmNum);
			var latitude = document.getElementById("latitude").value;
			var longitude = document.getElementById("longitude").value;
			
			var arrOpt = new Array();
			//숙소번호로 해당 위도,경도 값 가져옴
			let i=0;
			<c:forEach items="${list }" var="acm">
			
			if("${acm.acmNum}"===acmNum){
				latitude = ${acm.latitude};
				longitude = ${acm.longitude};
			}
			
			arrOpt[i]=${acm.acmOptcode};
				i++;
			</c:forEach>
			
			for(let i=0;i<arrOpt.length;i++){
				console.log(arrOpt[i]);
			}
			
			
			var latVal = parseFloat(latitude);
			var lngVal = parseFloat(longitude);
    	  var mapLocation = {
  				lat : latVal,
  				lng : lngVal
  			};
    	  
        var map = new google.maps.Map(document.getElementById('map'), {
          center: mapLocation,
          zoom: 15
        });
        
        var card = document.getElementById('pac-card');
        var input = document.getElementById('pac-input');
        var types = document.getElementById('type-selector');
        var strictBounds = document.getElementById('strict-bounds-selector');
        map.controls[google.maps.ControlPosition.TOP_RIGHT].push(card);
        var autocomplete = new google.maps.places.Autocomplete(input);
        // Bind the map's bounds (viewport) property to the autocomplete object,
        // so that the autocomplete requests use the current map bounds for the
        // bounds option in the request.
        autocomplete.bindTo('bounds', map);
        // Set the data fields to return when the user selects a place.
        autocomplete.setFields(
            ['address_components', 'geometry', 'icon', 'name']);
        var infowindow = new google.maps.InfoWindow();
        var infowindowContent = document.getElementById('infowindow-content');
        infowindow.setContent(infowindowContent);
        
        var size_x = 60; // 마커로 사용할 이미지의 가로 크기
		var size_y = 60;
        var image = new google.maps.MarkerImage(
				'http://www.weicherthallmark.com/wp-content/themes/realty/lib/images/map-marker/map-marker-gold-fat.png',
				new google.maps.Size(size_x, size_y),
				'',
				'',
				new google.maps.Size(size_x, size_y));
        
        <c:forEach items="${list }" var="acm">
        
        var latLng = {lat:parseFloat(${acm.latitude}), lng:parseFloat(${acm.longitude})};
		var marker;
		marker = new google.maps.Marker({
			position : latLng, // 마커가 위치할 위도와 경도(변수)
			map : map,
			icon : image, // 마커로 사용할 이미지(변수)
			title : "${acm.acmName}" // 마커에 마우스 포인트를 갖다댔을 때 뜨는 타이틀
		});
		</c:forEach>
		
       /*  var marker = new google.maps.Marker({
          map: map,
          anchorPoint: new google.maps.Point(0, -29)
        }); */
        autocomplete.addListener('place_changed', function() {
          infowindow.close();
          marker.setVisible(false);
          var place = autocomplete.getPlace();
          if (!place.geometry) {
            // User entered the name of a Place that was not suggested and
            // pressed the Enter key, or the Place Details request failed.
            window.alert("No details available for input: '" + place.name + "'");
            return;
          }
          // If the place has a geometry, then present it on a map.
          if (place.geometry.viewport) {
            map.fitBounds(place.geometry.viewport);
          } else {
            map.setCenter(place.geometry.location);
            map.setZoom(17);  // Why 17? Because it looks good.
          }
          marker.setPosition(place.geometry.location);
          marker.setVisible(true);
          var address = '';
          if (place.address_components) {
            address = [
              (place.address_components[0] && place.address_components[0].short_name || ''),
              (place.address_components[1] && place.address_components[1].short_name || ''),
              (place.address_components[2] && place.address_components[2].short_name || '')
            ].join(' ');
          }
          infowindowContent.children['place-icon'].src = place.icon;
          infowindowContent.children['place-name'].textContent = place.name;
          infowindowContent.children['place-address'].textContent = address;
          infowindow.open(map, marker);
        });
        // Sets a listener on a radio button to change the filter type on Places
        // Autocomplete.
        function setupClickListener(id, types) {
          var radioButton = document.getElementById(id);
          radioButton.addEventListener('click', function() {
            autocomplete.setTypes(types);
          });
        }
        setupClickListener('changetype-all', []);
        setupClickListener('changetype-address', ['address']);
        setupClickListener('changetype-establishment', ['establishment']);
        setupClickListener('changetype-geocode', ['geocode']);
        document.getElementById('use-strict-bounds')
            .addEventListener('click', function() {
              console.log('Checkbox clicked! New state=' + this.checked);
              autocomplete.setOptions({strictBounds: this.checked});
            });
      }
    </script>
<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCfPvjuhr6JlAFHlbwqn_I5VfzqglJ7iSo&libraries=places&callback=initMap"
	async defer></script>

<script>
    $(document).ready(function() { $("#e1").select2(); });
    
 	/* 날짜 선택(수희) */
		var today = new Date();
		
		$("#out").datepicker({
			minDate: new Date(today.getFullYear(), today.getMonth(), today.getDate()+1),
			maxDate: new Date(today.getFullYear()+1, today.getMonth(), today.getDate()),
			dateFormat: 'yy-mm-dd'
		});
		$("#in").datepicker({
			minDate: 0,
			maxDate: new Date(today.getFullYear()+1, today.getMonth(), today.getDate()-1),
			onSelect: function(selectedDate) {
				var nextDay = new Date(selectedDate);
				nextDay.setDate(nextDay.getDate() + 1);
			  $("#out").datepicker("option","minDate", nextDay);
				var nextMonth = new Date(selectedDate);
				nextMonth.setDate(nextMonth.getDate() + 90);
			  $("#out").datepicker("option","maxDate", nextMonth);
			},
			dateFormat: 'yy-mm-dd'
		});
		// 구글맵 api
		var address = null;
		/*  function getAddr(){
		
		     $.ajax({
		           type:'post',
		           headers:{
		               "Content-Type":"application/json"
		           },
		           async : false, // ajax를 동기화(순서대로) 처리해야하는 경우 true로하거나 기술하지 않으면 비동기로 작동한다.
		           url:"/board/category/getAddr?userId=${boardDTO.userId}",
		           dataType:"text",
		           success : function(result){
		               if ( result != null ){
		                   console.log("넘어온 값 : " + result);
		                   address = result;  
		               }
		           }
		       });
		 }; */
		function initMap1() { // 지도 요청시 callback으로 호출될 메서드 부분으로 지도를 맨처음 초기화하고, 표시해주는 함수
/*
			getAddr();
			var latVal = $
			{
				boardDTO.lat
			}
			; // 게시글 DTO에서 위도값을 가져옴
			var lngVal = $
			{
				boardDTO.lon
			}
			; // 게시글 DTO에서 경도값을 가져옴
*/			
			var acmNum = "${acmNum}";
			console.log(acmNum);
			var latitude = document.getElementById("latitude").value;
			var longitude = document.getElementById("longitude").value;
			
			//숙소번호로 해당 위도,경도 값 가져옴
			<c:forEach items="${list }" var="acm">
			if("${acm.acmNum}"===acmNum){
				var latitude = ${acm.latitude};
				var longitude = ${acm.longitude};
			}
			</c:forEach>
			
			var latVal = parseFloat(latitude);
			var lngVal = parseFloat(longitude);
			console.log('initMap');
			
			var mapLocation = {
				lat : latVal,
				lng : lngVal
			}; // 위도, 경도를 가지는 객체를 생성
			/*     var map = new google.maps.Map(document.getElementById('map'), { // 위의 div id="map" 부분에 지도를 추가하는 부분
			      zoom: 18, // 확대 정도(ZOOM)
			      center: uluru // 지도에 표시해주는 중심이 우리가 만든 객체의 위치를 지정해주도록 함
			    });
			
			 */
			var mapOptions = {
				center : mapLocation, // 지도에서 가운데로 위치할 위도와 경도(변수)
				zoom : 15, // 지도 zoom단계
				mapTypeId : google.maps.MapTypeId.ROADMAP
			};
			var map = new google.maps.Map(document.getElementById("map"), // id: map-canvas, body에 있는 div태그의 id와 같아야 함
			mapOptions);
			var size_x = 60; // 마커로 사용할 이미지의 가로 크기
			var size_y = 60; // 마커로 사용할 이미지의 세로 크기
			// 마커로 사용할 이미지 주소
			var image = new google.maps.MarkerImage(
					'http://www.weicherthallmark.com/wp-content/themes/realty/lib/images/map-marker/map-marker-gold-fat.png',
					new google.maps.Size(size_x, size_y),
					'',
					'',
					new google.maps.Size(size_x, size_y));
			<c:forEach items="${list }" var="acm">
			var latLng = {lat:parseFloat(${acm.latitude}), lng:parseFloat(${acm.longitude})};
			
			var marker;
			marker = new google.maps.Marker({
				position : latLng, // 마커가 위치할 위도와 경도(변수)
				map : map,
				icon : image, // 마커로 사용할 이미지(변수)
				title : "${acm.acmName}" // 마커에 마우스 포인트를 갖다댔을 때 뜨는 타이틀
			});
			</c:forEach>
			var content = "${acm.acmName}" ; // 말풍선 안에 들어갈 내용
			// 마커를 클릭했을 때의 이벤트. 말풍선
			var infowindow = new google.maps.InfoWindow({
				content : content
			});
			google.maps.event.addListener(marker, "click", function() {
				infowindow.open(map, marker);
			});
			/*
			 단순한 마커로 default로 표시할 때 쓰는 마커 세팅
			var marker = new google.maps.Marker({
			    position: uluru,
			    map: map
			  });
			 */
		}
	</script>
<!--
                    아래는 서버로부터 지도를 로딩하기 위해 요청하는 경로 async는 비동기로 로딩하도록해 지도 로딩 중 다른 웹 부분들이 열릴 수 있도록하기 위함
                    key부분에는 자신의 키를 넣고, 로딩이 완료되면 callback에 지정한 함수를 수행하게 됨.
                 -->

<script type="text/javascript">
		$("#person").val('<c:out value="${pageMaker.cri.person}"/>');
		$("#e1").val('<c:out value="${pageMaker.cri.keyword}"/>');
	
		$(document)
				.ready(
						function() {
							history.replaceState({}, null, null);
							var actionForm = $("#actionForm");
							$(".paginate_button a").on(
									"click",
									function(e) {
										e.preventDefault();
										console.log('click');
										actionForm
												.find("input[name='pageNum']")
												.val($(this).attr("href"));
										actionForm.submit();
									});
							 $(".move").on("click",function(e) {
												e.preventDefault();
												actionForm.append("<input type='hidden' name='acmNum' value='"
																+ $(this).attr("href")
																+ "'>");
												actionForm.attr("action","/acm/detail");
												actionForm.submit();
											}); 
							 
							 
		});
		
		
		
		
		
	</script>
<script type="text/javascript" src="/resources/js/wishlist.js"></script>
<script>



$(document).ready(function(){	

	
	/* ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■찜하면 하트에 불이 들어오게끔 하는 코드를 적용한다. ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■*/
	
	var wishBtn = $(".wishButton"); //배열 	
	var i = 0;
	
				
	<c:forEach items="${drawValue}" var="drawValue">		
		wishBtn[i].childNodes[1].setAttribute("class","<c:out value="${drawValue}" />");
		wishBtn[i].childNodes[1].setAttribute("id","heart");
		i++;		
	</c:forEach>
	
	
	
	
	/* ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■*/	
	

	
	var modal = $(".modal");
	var modalRegisterBtn = $("#modalRegisterBtn");	
	var modalInputuserNum = modal.find("input[name='userNum']").val();		
	var modalInputacmNum = $("#acmTest").val();		
	//var modalInputlistTitle = modal.find("select[name='listTitle']").val();
	var modalInputlistTitle = $("select[name='listTitle']").val();
	var modalInputlistContent = modal.find("input[name='listContent']").val();
	
	
	//클로즈 버튼 클릭시 모달창을 숨긴다.
	$("#modalCloseBtn").on("click", function(e){	    	
	    	modal.modal('hide');      	      		      		
	});
	
	
	
/* 	찜버튼 클릭하면 이벤트 발생 (이때 class로 받아와야 for문이 된다,,,) */
	var btn = document.getElementsByClassName("wishButton");
	for(var i=0; i<btn.length; i++){btn[i].onclick=function(e){
		var modalInputuserNum = modal.find("input[name='userNum']").val();
		var modalInputacmNum = $("#acmTest").val();				
		var heartbtn = $(".fa-heart");
		var thisbtn = this;
		 e.stopImmediatePropagation();
		
		if($(this).length>0){
			var val1 = $(this).attr('value');
			console.log("당신이 클릭한 숙소의 번호는 "+val1);					
			var acmNum = $(".acmNum");
			acmNum.val(val1);	
			
		}					
		if(modalInputuserNum == ""){								
 			alert("로그인이 필요합니다.")
 			}else{
 				
				alert("하트를 눌렀습니다!"); 
 				
				
			
/* ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ */
/* ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ */
									
			

					if($(this).children(0).hasClass("fa-heart")==1){

						alert("이미 추가한 숙소입니다.");
						
						
						
						

						}else{
							alert("찜합니다.");
							$(this).children().attr('class','fa fa-heart fa-2x');
							$(".modal").modal("show"); 
		 					modal.addClass("show") ;
							
						}
 				}  									
			}		
	}
	


 
	/* btn의 자식인 i클래스의 .attr('class','fa fa-heart fa-2x');의 상태라면 */
	
 
		
	 modalRegisterBtn.on("click", function(e){	 	
		 
		var modal = $(".modal");
		var modalRegisterBtn = $("#modalRegisterBtn");				
			
		var modalInputuserNum = modal.find("input[name='userNum']").val();
		var modalInputacmNum = modal.find("input[name='acmNum']").val();		
		var modalInputlistTitle = $("select[name='listTitle']").val();
		var modalInputlistContent = modal.find("input[name='listContent']").val();
		
	
		
		
		alert(1);
		
		 wishService.add({
			 userNum : modalInputuserNum, acmNum: modalInputacmNum, listTitle: modalInputlistTitle, listContent: modalInputlistContent 
		 }, function(result){
			 modal.modal('hide');
			 console.log("Result : " + result)
			 
			 
			 if(result==("fail..")){
				 alert("이미 등록된 숙소입니다.")
			 }
		 }
		)
		 
	 });
	 

})



</script>




<%@include file="../includes/footer.jsp"%>


</html>