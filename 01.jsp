<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
   <!-- Required meta tags -->
   <meta charset="utf-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css"> <!-- 폰트 아이콘 사용할수있게 -->

   <!-- Bootstrap CSS -->
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

   <title>Gorri</title>
<style>
	
	/* 주황 테두리 부분 */
	.border-line{
		border : 2px solid #ffaa00; width : 60%; 
		margin-top: 100px;
		margin-left:auto; margin-right:auto;
		border-top-left-radius: 30px; border-top-right-radius: 30px; border-bottom-left-radius: 30px; border-bottom-right-radius: 30px;
	}
	
	
	/* top - 프로필 사진 동그라미 부분*/
	#profile-back{ /* 맨뒤에 주황*/
		width: 150px; height: 75px;
		background: #ffaa00;
		border-radius: 75px 75px 0 0;
		margin-top: -76.5px; margin-left:auto; margin-right:auto;
		}
	#profile-white{ /* 가운데 흰색 */
		width: 145px; height:145px;
		background: white;
		border-radius: 50% 50% 50% 50%;
		margin-top: -73px; margin-left:auto; margin-right:auto;
		}
	#profile{width: 130px; height:130px;
		margin: -138px; margin-left:auto; margin-right:auto;
		border-radius: 50%;
		overflow: hidden;
		}
	#profile-img{width: 100%; height: 100%; object-fit: cover;}
	
	
	/* 닉네임, 간단소개 태그 부분 */
	.mid-userinfo{width : 60%; margin-left:auto; margin-right:auto;}
	#id{text-align: center; margin-top: 145px; font-weight: bold;} /*닉네임*/
	#edit-icon{width: 15px; height: 15px; cursor: pointer;} /*프로필 수정 아이콘*/

		
	/* 프로필 수정 창 */
	.modal-body{margin-left:auto; margin-right:auto;}

	
	/* 마이홈 메뉴관련 - 게시글, 모임, 구매내역 */
	.myhome-menu{text-align: center; margin: auto; width: 100%;}
	.div-button{ /* 게시글, 모임, 구매내역 각 버튼들... */
		width: 100px; height: 40px; background: lightgray; color: gray; border-radius: 5px;
		display: inline-block; 
		padding-top: 5px; /* 얘 안해주면 글자가 너무 위로 쏠림 */
		margin : 2px; /* 버튼사이 간격*/
		text-decoration: none; /* 버튼 글자에 밑줄 없애기 */
		font-size: 18px; /* 버튼 글자 크기 변경*/
		}
	.div-button:hover{background: gray; color: white; cursor: pointer;}  /* 버튼에 마우스 올렸을때*/
	.div-button:active{background : white; color: black;} /* 버튼 클릭했을때*/
	.select{background: black; color: white;} /* 현재 선택된 버튼*/
	.bi-pencil-square{font-size: 30px;} /* 게시글 등록 아이콘 관련 */
	
	
	/* 글쓰기 버튼 */
	.my-menu-write:hover{color: black; cursor: pointer;}
	
	
	/* 중간 줄*/
	.mid-line{
		border : 1px solid gray; width: 90%;
		margin-left:auto; margin-right:auto; margin-top: 20px; margin-bottom: 20px;}
		
	
	/* bottom 취미 썸네일 나오는 부분*/ /*가운데 정렬 해야함...*/
	.thumb-img{width:200px; height:200px; margin-bottom: 4px;}
	em{ /* 마우스 올렸을때 나오는 글자부분...*/
	display:none; position:absolute; width:200px; height:200px;
	left:0; top:-89px;
	background: rgba(0, 0, 0, .5); color: #eee;
	text-align: center; padding-top: 45%; font-weight: bold;
	}
	.col span:hover em{display: block;}
	.thum{position: relative; dicplay:block; margin: 0 auto;}


</style>
</head>
<body>
	<%@ include file="top.jsp" %>
	<br>


   <!-- Option 2: Separate Popper and Bootstrap JS -->
   <!--
   <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
   -->
   
   <div class="border-line"> <!-- 겉에 주황색 테두리 -->
   
   		<!-- 프로필사진 관련 -->
		<div class="top-profile-img"> 
			<div id="profile-back"></div>
			<div id="profile-white"></div>
			<div id="profile">
				<img id="profile-img" src="https://botsitivity.org/static/media/noprofile.c3f94521.png">
			</div>
		</div>
		
		
		<!-- 프로필 정보 관련 -->
		<div class="mid-userinfo"> 
			<div id="id">
				<a>닉네임</a>
				<i class="bi bi-gear-fill" id="edit-icon" data-bs-toggle="modal" data-bs-target="#exampleModal"></i>
			</div>
			<p id="introduce">간단 자기소개</p>
			
			<!-- 메뉴 버튼 -->
			<table class="myhome-menu">
				<tr>
					<td width="40px"/>
					<td width="200px">
						<div class="myhome-menu-div div-button select" onclick="location.href='01.jsp';">게시글</div>
						<div class="myhome-menu-div div-button" onclick="location.href='02.jsp';">모임</div>
						<div class="myhome-menu-div div-button" onclick="location.href='03.jsp';">구매내역</div>
					</td>
					<td width="40px">
						<div class="myhome-menu-div my-menu-write" onclick="location.href='04.jsp';">
							<i class="bi bi-pencil-square"></i>
						</div>
					</td>
				</tr>
			</table>
		</div>
		
		
		<div class="mid-line"></div>	
	
	
		<!-- Modal --> <!-- 프로필 수정 버튼 클릭하면 뜨는 프로필 수정페이지 -->
		<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">프로필 수정</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
			    <div class="modal-body">
				  <div class="container-fluid">
				    <div class="row">
				      <div class="col-md-4">.col-md-4</div> <!-- 4 3 2 순서로...가로 위치.....-->
				      <div class="col-md-4 ms-auto">.col-md-4 .ms-auto</div>
				    </div>
				    <div class="row">
				      <div class="col-md-3 ms-auto">.col-md-3 .ms-auto</div>
				      <div class="col-md-2 ms-auto">.col-md-2 .ms-auto</div>
				      
				    </div>
				    <div class="row">
				      <div class="col-sm-9">
				        <textarea cols="50" rows="5" style="resize:none;" name="content" placeholder="자기소개를 입력해주세요."></textarea>
				      </div>
				    </div>
				  </div>
				</div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary btn-modal" data-bs-dismiss="modal">취소</button>
		        <button type="button" class="btn btn-primary btn-modal">저장</button>
		      </div>
		    </div>
		  </div>
		</div>
	
	
		
		<!-- 미니홈 이미지 썸네일 부분 -->
		<div class="bottom"> 
			<div class="col">
			<table class="myhome-menu">
			
				<tr>
					<td width="800px">
						<span class="thum" onclick="location.href='01.jsp';">
							<img src="assets/pic1.jpg" class="thumb-img">
							<em>제목이나 태그...</em>
						</span>
						<span class="thum" onclick="location.href='01.jsp';">
							<img src="assets/pic1.jpg" class="thumb-img">
							<em>제목이나 태그...</em>
						</span>
						<span class="thum" onclick="location.href='01.jsp';">
							<img src="assets/pic1.jpg" class="thumb-img">
							<em>제목이나 태그...</em>
						</span>
						<span class="thum" onclick="location.href='01.jsp';">
							<img src="assets/pic1.jpg" class="thumb-img">
							<em>제목이나 태그...</em>
						</span>
						<span class="thum" onclick="location.href='01.jsp';">
							<img src="assets/pic1.jpg" class="thumb-img">
							<em>제목이나 태그...</em>
						</span>
						<span class="thum" onclick="location.href='01.jsp';">
							<img src="assets/pic1.jpg" class="thumb-img">
							<em>제목이나 태그...</em>
						</span>
						<span class="thum" onclick="location.href='01.jsp';">
							<img src="assets/pic1.jpg" class="thumb-img">
							<em>제목이나 태그...</em>
						</span>
						<span class="thum" onclick="location.href='01.jsp';">
							<img src="assets/pic1.jpg" class="thumb-img">
							<em>제목이나 태그...</em>
						</span>
						<span class="thum" onclick="location.href='01.jsp';">
							<img src="assets/pic1.jpg" class="thumb-img">
							<em>제목이나 태그...</em>
						</span>
						<span class="thum" onclick="location.href='01.jsp';">
							<img src="assets/pic1.jpg" class="thumb-img">
							<em>제목이나 태그...</em>
						</span>
						<span class="thum" onclick="location.href='01.jsp';">
							<img src="assets/pic1.jpg" class="thumb-img">
							<em>제목이나 태그...</em>
						</span>
					</td>
				</tr>
			</table>
			</div>
			
				
<!-- 			<div class="col"> -->
<!-- 				<ul> -->
<!-- 					<li> -->
<!-- 						<a href="#"> -->
<!-- 							<span class="thumb"> -->
<!-- 								<img src="assets/pic1.jpg" class="thumb-img"> -->
<!-- 								<em>제목이나 태그...</em> -->
<!-- 							</span> -->
<!-- 						</a> -->
<!-- 					</li> -->
<!-- 					<li> -->
<!-- 						<a href="#"> -->
<!-- 							<span class="thumb"> -->
<!-- 								<img src="assets/pic1.jpg" class="thumb-img"> -->
<!-- 								<em>제목이나 태그...</em> -->
<!-- 							</span> -->
<!-- 						</a> -->
<!-- 					</li> -->
<!-- 					<li> -->
<!-- 						<a href="#"> -->
<!-- 							<span class="thumb"> -->
<!-- 								<img src="assets/pic1.jpg" class="thumb-img"> -->
<!-- 								<em>제목이나 태그...</em> -->
<!-- 							</span> -->
<!-- 						</a> -->
<!-- 					</li> -->
<!-- 					<li> -->
<!-- 						<a href="#"> -->
<!-- 							<span class="thumb"> -->
<!-- 								<img src="assets/pic1.jpg" class="thumb-img"> -->
<!-- 								<em>제목이나 태그...</em> -->
<!-- 							</span> -->
<!-- 						</a> -->
<!-- 					</li> -->
<!-- 					<li> -->
<!-- 						<a href="#"> -->
<!-- 							<span class="thumb"> -->
<!-- 								<img src="assets/pic1.jpg" class="thumb-img"> -->
<!-- 								<em>제목이나 태그...</em> -->
<!-- 							</span> -->
<!-- 						</a> -->
<!-- 					</li> -->
<!-- 				</ul> -->
<!-- 			</div> -->
<!-- 		</div> -->
		

		
		
		</div>
		<br>
	</div>
	

<script>

</script>
</body>
</html>