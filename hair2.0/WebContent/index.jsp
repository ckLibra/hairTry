<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="x-ua-compatible" content="ie=edge">


<title>hairTry room</title>
  <!-- MDB -->
	<!-- Font Awesome -->
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css">
	<!-- Bootstrap core CSS -->
	<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css" rel="stylesheet">
	<!-- Material Design Bootstrap -->
	<link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.6.0/css/mdb.min.css" rel="stylesheet">
 
	<!-- JQuery -->
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<!-- Bootstrap tooltips -->
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js"></script>
	<!-- Bootstrap core JavaScript -->
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/js/bootstrap.min.js"></script>
	<!-- MDB core JavaScript -->
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.6.0/js/mdb.min.js"></script>
  
  <!-- bootstrap/jquery cdn-->
  <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
  <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script src="js/jquery.js"></script>
  <script src="js/upload.js"></script>
</head>

<!--背景色为浅蓝色-->
<body background="ui/img/background.jpg" style="padding-top: 0px; overflow-y: hidden">

	<!-- 标题部分 -->
	<div class="container-fluid">
			<div >
				<img src="ui/img/logo.png" height=50 width=50></img>注销
				<img style="position: absolute; top: 0%; left:35.2%" src="ui/img/theme_index.png" height=80 width=500></img>			
			</div>
			<!-- 分割线 -->
			<HR style="position: absolute;color: #000000; height: 0.5%; width: 100%; top: 11%; margin-top: 0px; 
			padding-top: 0px" ALIGN=CENTER NOSHADE>
			<HR style="position: absolute; color: #ecf0f1; height: 88%; width: 0.3%; top: 11%; right: 0%; margin-top: 0px; 
			padding-top: 0px" ALIGN=LEFT NOSHADE>
			<HR style="position: absolute; color: #ecf0f1; height: 88%; width: 0.3%; top: 11%; left: 1%; margin-top: 0px; 
			padding-top: 0px" ALIGN=LEFT NOSHADE>		
			<HR style="position: absolute;color: #000000; height: 0.5%; width: 100%; top: 99%; margin-top: 0px; 
			padding-top: 0px" ALIGN=CENTER NOSHADE>	
			
			<HR style="position: absolute; color: #ecf0f1; height: 88%; width: 0.3%; top: 11%; right: 27.4%; margin-top: 0px; 
			padding-top: 0px" ALIGN=LEFT NOSHADE>
			<HR style="position: absolute; color: #ecf0f1; height: 88%; width: 0.3%; top: 11%; left: 29.7%; margin-top: 0px; 
			padding-top: 0px" ALIGN=LEFT NOSHADE>			
	</div>

	
	<div class="container-fluid">
		<div class="row" style="margin-left: 0px">
		
			<!-- 左侧部分 -->
			<div class="col" style="position:absolute; top: 12%; margin-top: 2px;width: 25%;height:80%">
				<div class="panel-group" id="accordion">
					<!-- 照片上传 -->
					<div class="panel panel-default">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a data-toggle="collapse" data-parent="#accordion"
									href="#collapseZero">上传正脸照片</a>
							</h4>
						</div>
						<div id="collapseZero" class="panel-collapse collapse ">
							<div class="panel-body">
								<div style = " width:100%;">
									<div id="drop_area"></div>		
									<script type="text/javascript">
									var dragImgUpload = new DragImgUpload(drop_area,{
										callback:function (files) {
											//回调函数，可以传递给后台等等
											var file = files[0];
											//用formdata封装图片
											var formData = new FormData();  
											formData.append("file",file);
											formData.append("userId",1);
											$.ajax({
								                url: "http://localhost:8090/upload",
								                type: "POST",
								                async : true,//是否异步请求
								                dataType : "json",//数据格式 
								                data: formData,
								       
								                /**formData
								               	 *必须false才会自动加上正确的Content-Type
								                */
								                contentType: false,
								                /**
								               	 * 必须false才会避开jQuery对 formdata 的默认处理
								                * XMLHttpRequest会对 formdata 进行正确的处理
								                */
								                processData: false,
								                success: function (data) {
								                		returnResult = data;
								                        alert("重建成功");							                     
								                },
								                error: function () {
								                   // alert("上传失败！");							                       
								                }
								            });
										}
									});
									</script>
									<div>
										<button type="button" class="btn btn-default" onclick="changeModel()" >更换模型</button>
									</div>						
								</div>
							</div>
						</div>
					</div> 
					
					
					<!-- 发型参数调节 -->
					<div class="panel panel-default">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a data-toggle="collapse" data-parent="#accordion"
									href="#collapseOne">发型模型编辑</a>
							</h4>
						</div>
						<div id="collapseOne" class="panel-collapse collapse">
							<div class="panel-body">
								<div style = " width:100%;">
									发型颜色调配:
									<br/>
									红:
									<input id='red' type="range" class="custom-range" value="0" min="0" max="100" 
										onchange="changeColor();" />
									<br/>
									绿:
									<input id='green' type="range" class="custom-range" value="0" min="0" max="100"
										onchange="changeColor();" />
									<br/>
									蓝:
									<input id='blue' type="range" class="custom-range" value="0" min="0" max="100"
										onchange="changeColor();" />									
									<br/>
									发型长度:<input type="range" class="custom-range" value="0" min="0" max="100"
										onchange="show.execute(new SetFigureCommand(human1, value/100, 'figure'));" />
								</div>
							</div>
						</div>
					</div>
					
					<!-- 发型选择 -->
					<div class="panel panel-default">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a data-toggle="collapse" data-parent="#accordion"
									href="#collapseTwo">发型选择</a>
							</h4>
						</div>
						<div id="collapseTwo" class="panel-collapse collapse">
							<div class="panel-body">
								<div style="width:100%; height:80%">	
									<!-- md表示一个col元素占多少个Div，bs中一个row总是分为12个 -->	
									<div class="row">
										<div class="col-md-4" style = "width:33%;height:25%">
											<img src="ui/hair_pic/Female/5_01_ZQ_S.jpg"
												class="carousel-inner img-responsive img-rounded"
												onclick="changeHair('fm1');">
										</div>
										<div class="col-md-4" style = "width:33%;height:25%">
											<img src="ui/hair_pic/Female/5_02_ZQ_S.jpg"
												class="carousel-inner img-responsive img-rounded"
												onclick="changeHair('fm2');">
										</div>
										
										<div class="col-md-4" style= "width:33%;height:25%">
											<img src="ui/hair_pic/Female/5_03_ZY_L.jpg"
												class="carousel-inner img-responsive img-rounded"
												onclick="changeHair('fm3');">
										</div>
									</div>
									<div class="row">
										<div class="col-md-4" style = "width:33%;height:25%">
											<img src="ui/hair_pic/Female/5_04_TQZ_S.jpg"
												class="carousel-inner img-responsive img-rounded"
												onclick="changeHair('fm4');">
										</div>
										<div class="col-md-4" style = "width:33%;height:25%">
											<img src="ui/hair_pic/Female/5_05_TZQ_M.jpg"
												class="carousel-inner img-responsive img-rounded"
												onclick="changeHair('fm5');">
										</div>
										
										<div class="col-md-4" style= "width:33%;height:25%">
											<img src="ui/hair_pic/Female/5_06_ZY_L.jpg"
												class="carousel-inner img-responsive img-rounded"
												onclick="changeHair('fm6');">
										</div>
									</div>		
									<div class="row">
										<div class="col-md-4" style = "width:33%;height:25%">
											<img src="ui/hair_pic/Female/5_07_TQ_L.jpg"
												class="carousel-inner img-responsive img-rounded"
												onclick="changeHair('fm7');">
										</div>
										<div class="col-md-4" style = "width:33%;height:25%">
											<img src="ui/hair_pic/Female/5_08_TQ_L.jpg"
												class="carousel-inner img-responsive img-rounded"
												onclick="changeHair('fm8');">
										</div>
										
										<div class="col-md-4" style= "width:33%;height:25%">
											<img src="ui/hair_pic/Female/5_09_ZT_L.jpg"
												class="carousel-inner img-responsive img-rounded"
												onclick="changeHair('fm9');">
										</div>
									</div>	
									<div class="row">
										<div class="col-md-4" style = "width:33%;height:25%">
											<img src="ui/hair_pic/Female/5_10_TZQ_L.jpg"
												class="carousel-inner img-responsive img-rounded"
												onclick="changeHair('fm10');">
										</div>
										<div class="col-md-4" style = "width:33%;height:25%">
											<img src="ui/hair_pic/Female/5_11_ZY_M.jpg"
												class="carousel-inner img-responsive img-rounded"
												onclick="changeHair('fm11');">
										</div>
										
										<div class="col-md-4" style= "width:33%;height:25%">
											<img src="ui/hair_pic/Female/5_16_TQ_M.jpg"
												class="carousel-inner img-responsive img-rounded"
												onclick="changeHair('fm12');">
										</div>
									</div>									
								</div>
							</div>
						</div>
					</div>
					
					
				</div>	
			</div>	
					
		<!-- 中间3D试发场景 -->
		<div id="TryRoom" class="col"
			style="position: absolute; height: 92%; width: 40%; left: 30%; top: 11.5%; padding: 0px;">
			<script src="build/three.js"></script>
			<script src="js/threejs/libs/inflate.min.js"></script>
			<script src="js/threejs/controls/OrbitControls.js"></script>
			<script src="js/threejs/WebGL.js"></script>
			<script src="js/threejs/libs/stats.min.js"></script>
			<script src="js/threejs/libs/stats.min.js"></script>
			<script src="js/threejs/loaders/GLTFLoader.js"></script>
			<script src="js/createScene.js"></script>
			
			<script>
				//查看网页是否支持WEBGL
				if ( WEBGL.isWebGLAvailable() === false ) {
	
					document.body.appendChild( WEBGL.getWebGLErrorMessage() );
	
				}
				
				var container, stats, controls;  //场景容器，状态，相机控制器
				var camera, scene, renderer, light;  //相机，场景，光照
				var clock = new THREE.Clock();  //浏览器时刻类
				var mixers = [];
	
				init();
			</script>
		</div>		
		
		<!-- 右侧发型推荐 -->
		<div id="recommendation" class="col" style="position:absolute;right:0%;top:12%;margin-top:2px;width:25%;height:80%">
				<div class="panel-group" id="accordion">
					<!-- 发型推荐-->
					<div class="panel panel-default">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a data-toggle="collapse" data-parent="#accordion"
									href="#collapseThree">发型推荐</a>
							</h4>
						</div>
						<div id="collapseThree" class="panel-collapse collapse in">
							<div class="panel-body">
								<div style="width:100%; height:80%">	
									<div id="hiddenRow" style="display: none;">
										<!-- md表示一个col元素占多少个Div，bs中一个row总是分为12个 -->	
										<div class="row"  >
											<div class="col-md-4"  style = "width:33%;height:25%">
												<img src="ui/hair_pic/Female/5_04_TQZ_S.jpg"
													class="carousel-inner img-responsive img-rounded"
													onclick='wearCloth("cloth4", "top");'>
											</div>
											<div class="col-md-4" style = "width:33%;height:25%">
												<img src="ui/hair_pic/Female/5_05_TZQ_M.jpg"
													class="carousel-inner img-responsive img-rounded"
													onclick="wearCloth('cloth2', 'top');">
											</div>						
											<div class="col-md-4" style= "width:33%;height:25%">
												<img src="ui/hair_pic/Female/5_06_ZY_L.jpg"
													class="carousel-inner img-responsive img-rounded"
													onclick="wearCloth('cloth3', 'top');">
											</div>
										</div>		
										<div class="row" >
											<label >发型推荐度：</label>
										</div>		
										<div class="row" >
											<div class="col-md-4"  style = "width:33%;height:25%">
												<text>70%</text>
											</div>
											<div class="col-md-4"  style = "width:33%;height:25%">
												<text text-align="center">85%</text>
											</div>
											<div class="col-md-4"  style = "width:33%;height:25%">
												<text text-align="center">94%</text>
											</div>
										</div>			
									</div>
								</div>	
							</div>
						</div>
					</div>	
				</div>	
		</div>
	</div>
</div>
		

		
		
		
		
		
		
</body>