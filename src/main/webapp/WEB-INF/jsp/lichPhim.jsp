
<%-- 
    Document   : person-form
    Created on : Jun 23, 2021, 9:39:44 AM
    Author     : Admin
--%>

<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="<c:url value="/resources/css/index.css"/>" rel="stylesheet" type="text/css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  		<link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"/>
    	 <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
 		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
      <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
	  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
	  <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	  
 	 <script src="https://kit.fontawesome.com/a076d05399.js"></script>
       <script src="https://unpkg.com/gijgo@1.9.13/js/gijgo.min.js" type="text/javascript"></script>
    <link href="https://unpkg.com/gijgo@1.9.13/css/gijgo.min.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="<c:url value="/resources/js/lichPhim.js"/>"></script>
        <title>Lịch Phim</title>
    </head>
    <style>
		.rate {
		    float: left;
		    height: 46px;
		    padding: 0 10px;
	
		}
		.rate:not(:checked) > input {
		    position:absolute;
		    top:-9999px;
		}
		.rate:not(:checked) > label {
		    float:right;
		    width:1em;
		    overflow:hidden;
		    white-space:nowrap;
		    cursor:pointer;
		    font-size:30px;
		    color:#ccc;
		}
		.rate:not(:checked) > label:before {
		    content: '★ ';
		}
		.rate > input:checked ~ label {
		    color: #ffc700;    
		}
		.rate:not(:checked) > label:hover,
		.rate:not(:checked) > label:hover ~ label {
		    color: #deb217;  
		}
		.rate > input:checked + label:hover,
		.rate > input:checked + label:hover ~ label,
		.rate > input:checked ~ label:hover,
		.rate > input:checked ~ label:hover ~ label,
		.rate > label:hover ~ input:checked ~ label {
		    color: #c59b08;
		}
		
		/* Modified from: https://github.com/mukulkant/Star-rating-using-pure-css */
    </style>
    <script type="text/javascript">
  
    	var idPhim =${idPhim};
    	
    	
   
    	
    </script>
    <body style="background-color: rgba(243, 217, 232, 0.3); min-width: 100%; height: 100%; ">
      <div >
    <div class="container-fluid">
    <!-- navbar -->
    <div class="row">
        <div class="col-md-12 navbar bg-dark">
                    <a  class="logo navbar-brand text-white offset-md-2" href="/">Sơn Hảo Phim</a>
                    <nav class="navbar navbar-light bg-dark">
                        
                    </nav>
                    <ul class="nav">
                        <c:choose>
						    <c:when test="${sessionScope.username==null}">
						        <li class="nav-item"><a href="/login" class="nav-link">Đăng Nhập</a></li>

                        		<li class="nav-item"><a href="/showdangki" class="nav-link">Đăng Ký</a></li>
						    </c:when>    
						    <c:otherwise>
						    <li class="nav-item"><a href="/thongtinNd" class="nav-link">${sessionScope.username}</a></li>
						    <li class="nav-item"><a href="/lichSuDatVe" class="nav-link">Lịch Sử Đặt Vé</a></li>
						    <c:choose>
							    <c:when test="${sessionScope.role==2}">
							     	<li class="nav-item"><a href="/admin/phim" class="nav-link">Quản Lý</a></li>
							    </c:when>    
							</c:choose>
						    	
						        <li class="nav-item"><a href="/logout" class="nav-link">Đăng Xuất</a></li>
						       
						    </c:otherwise>
						</c:choose>
						<input type="hidden" value="${sessionScope.username}" id="tenND"/>
                        
                        
                        

                    </ul>
                </div>
    </div>

    <!-- Chia layout -->
    
        <div class="row mt-3">

            <!-- Hình ảnh phim -->
            <div class="col-6 mt-5">
                <div class="row">
                    <div class="col-6">
                    <a data-toggle="modal" data-target="#modelId">
                      <img src="${p.hinhAnh}"
                            style="width: 300px; height: 455px; margin-left: 75px;" />
                    </a>
                      
                    </div>
                    <div class="col-6 m-0">
                        <h4 style="color: red;">${p.tenPhim}</h4>
                        </br>
                        <i class="fa fa-stopwatch mt-3">${p.thoiLuong}</i>
                       
                        </br>
                        <div class="row">
                        <h6 style="margin-top: 15px;margin-left: 15px" id="danhgiaS">${sao.saoTB}/10 (${sao.soLuong})</h6>
                        <div class="rate">
					    <input type="radio" id="star5" name="rate" value="5" />
					    <label for="star5" title="text">5 stars</label>
					    <input type="radio" id="star4" name="rate" value="4" />
					    <label for="star4" title="text">4 stars</label>
					    <input type="radio" id="star3" name="rate" value="3" />
					    <label for="star3" title="text">3 stars</label>
					    <input type="radio" id="star2" name="rate" value="2" />
					    <label for="star2" title="text">2 stars</label>
					    <input type="radio" id="star1" name="rate" value="1" />
					    <label for="star1" title="text">1 star</label>
					  	</div>
                        </div>
                         
						
						</br>
                        <p class="mt-3">Đạo diễn: ${p.daoDien}</p>
                        </br>
                        <p class="mt-1">Thể loại: ${p.theLoai}</p>
                        </br>
                        <p class="mt-1">Diễn viên: ${p.dienVien}</p>
                        </br>
                        <p class="mt-1">Ngày công chiếu: ${p.ngayCongChieu}</p>
						<button type="button" class="btn btn-warning" data-toggle="modal" data-target="#modelId">Trailer</button>
                    </div>
                    <div class="modal fade" id="modelId" tabindex="-1" role="dialog" aria-labelledby="modelTitleId"
                            aria-hidden="true">
                            <div class="modal-dialog" role="document" style="margin-top: 65px;">
                                <div class="modal-content" style="width: 685px; margin-left: -70px;">
                                    <div class="modal-header">
                                        <h5 class="modal-title">Trailer</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        
                                            <iframe class="embed-responsive-item" src="${p.trailer}" allowfullscreen style="width: 650px; height: 550px;"></iframe>

                                            <!-- <video width="150" height="100" controls>
                                                <source src="../trailer/Sequence 01_2.mp4 " type="video/ogg">
                                                </video> -->

                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary"
                                            data-dismiss="modal">Đóng</button>
                                        
                                    </div>
                                </div>
                            </div>
                      </div>

                    <div style="margin-left: 40px;">
                        <h3 class="mt-3">Nội Dung Phim</h3>
                    <p>${p.moTa}</p>
                </div>
                    </div>


            </div>


            <!-- Col-6 -->
            <div class="col-6">
                <h4 class="mt-5" style="font-weight: bold; color: red; ">LỊCH CHIẾU</h4>

                <div class="row">

                    <div class="col-10 m-2">


                        <input id="datepicker" placeholder="Nhập ngày cần tìm kiếm" width="330" value="${n}"/>
                       <script type="text/javascript">

		                       
                       </script>
                       <select id="kvSelect" class="custom-select mt-3" style="width: 35%;">
                            <c:forEach items="${kv}" var="kv" >
	                            <c:choose>
								    <c:when test="${idKv==kv.id}">
								  		<option value="${kv.id}" selected>${kv.tenKhuVuc}</option>
								    </c:when>  
								    <c:otherwise>
								  		<option value="${kv.id}">${kv.tenKhuVuc}</option>
								    </c:otherwise>  
								</c:choose>
                        	</c:forEach>
                        </select>
                          <br>
						<select  id="tlSelect" class="custom-select mt-3" style="width: 35%;">
                           <c:forEach items="${tl}" var="tl">
                        		<c:choose>
								    <c:when test="${idTl==tl.id}">
								  		 <option value="${tl.id}" selected>${tl.ten}</option>
								    </c:when>  
								    <c:otherwise>
								  		 <option value="${tl.id}">${tl.ten}</option>
								    </c:otherwise>  
								</c:choose>
                        	</c:forEach>
                        </select>
 						

                        

                    
                        


                        <!-- Thông tin rạp -->
                        <div class="mt-5">
                            <div class="card" id="rap">
                              <c:forEach items="${r}" var="r">
                                <div class="card-header" >
                                  ${r.tenRap}
                                </div>
                                <div class="card-body">
                                  <h5 class="card-title">${tenTl}</h5>
                                 
                                  <div class="row" style="margin-left: 10px;">
                                  <c:forEach items="${s}" var="s">
                                  	<c:choose>
									    <c:when test="${s.idRap==r.id}">
									        <a href="/chonve/suat?id=${s.id}" class="btn btn-warning" style="margin-left: 10px; width: 70px; margin: 4px;">${s.gioBatDau}</a>
									        
									    </c:when>  
									</c:choose>
                                    
                                    </c:forEach>
                                  </div>
                               

                                  
                                </div>
                                 </c:forEach>
                              </div>
                        </div>

                    </div>



                </div>

            </div>




        </div>




        </div>
    </div>
       
    </body>
</html>
