var scene;

var returnResult=null;

function changeModel(){
	//if(returnResult!='' || returnResult!=null){
	//	var url= "u3d/upload/1";
		//url += returnResult.HeadTexturePath;
		//alert(url);
		document.getElementById("hiddenRow").style.display="";
		//销毁原脸型和发型，这样做的目的是为了让发型始终是场景中的最后一个子物体
		var allObj = scene.children;
		var hair = allObj[allObj.length-1];
		var head = allObj[allObj.length-2];
		//if(hair instanceof THREE.mesh){
			scene.remove(head);
			scene.remove(hair);
		//}
						
		var url = 'model/texture/temp1.jpg';
		var path = 'model/heads/heart.js';
		var objectLoader = new THREE.JSONLoader();
		objectLoader.load( path,  function ( geometry, materials ) {
			//创建材质
		 	var texture = THREE.ImageUtils.loadTexture(url, {}, function() {
	        renderer.render(scene, camera)});
	            	 
		 	var material = new THREE.MeshLambertMaterial({
				map: texture
			});  
		 	material.morphTargets = true; 
		    var object = new THREE.Mesh( geometry, material );
		    //初始化
		    object.scale.set(58,58,58);
		    object.position.set(0,-137,-4);
		    scene.add( object );		
		} );   
		
		objectLoader.load( "model/malehair/mh2.js",  function ( geometry, materials ) {
			//创建材质
		 	var texture = THREE.ImageUtils.loadTexture('model/texture/hairT.png', {}, function() {
	        renderer.render(scene, camera)});
	            	 
		 	var material = new THREE.MeshLambertMaterial({
				map: texture
			});  
		 	material.morphTargets = true; 
		    var object = new THREE.Mesh( geometry, material );
		    //初始化
		    object.scale.set(120,120,120);
		    object.position.set(0,-105,0);
		    scene.add( object );		
		} );   
//	}
}

//创建场景的天空
function makeSkybox( urls, size ) {
	//天空的物理场景也是一个长方体
	var skyboxCubemap = new THREE.CubeTextureLoader().load( urls );
	skyboxCubemap.format = THREE.RGBFormat;

	//着色器
	var skyboxShader = THREE.ShaderLib['cube'];
	skyboxShader.uniforms['tCube'].value = skyboxCubemap;
		
	//创建实例，也是一个mesh
	return new THREE.Mesh(
		new THREE.BoxGeometry( size, size, size ),
		new THREE.ShaderMaterial({
			fragmentShader : skyboxShader.fragmentShader, 
				vertexShader : skyboxShader.vertexShader,
				uniforms : skyboxShader.uniforms, 
				depthWrite : false, 
				side : THREE.BackSide
			})
	);
}

//初始化整个场景scene
function init() {
	container = document.getElementById("TryRoom");
	//document.body.appendChild( container );

	//相机
	camera = new THREE.PerspectiveCamera( 45, container.offsetWidth / container.offsetHeight, 1, 1000 );
	camera.position.set( 0, 120, 300 );

	//相机移动控制器
	controls = new THREE.OrbitControls( camera,container);
	controls.target.set( 0, 100, 0 );
	controls.update();

	//场景
	scene = new THREE.Scene();
	scene.background = new THREE.Color( 0xa0a0a0 );
	scene.fog = new THREE.Fog( 0xa0a0a0, 200, 1000 );

	//灯光，自然光
	light = new THREE.HemisphereLight( 0xffffff, 0x444444 );
	light.position.set( 0, 200, 0 );
	scene.add( light );

	//直射光
	light = new THREE.DirectionalLight( 0xffffff );
	light.position.set( 0, 600, 300 );
	light.castShadow = true;
	light.shadow.camera.top = 180;
	light.shadow.camera.bottom = - 100;
	light.shadow.camera.left = - 120;
	light.shadow.camera.right = 120;
	scene.add( light );

	
	//天空
	scene.add(makeSkybox([
		'texture/skybox/rightImage.png', // right
		'texture/skybox/leftImage.png', // left
		'texture/skybox/upImage.png', // top
		'texture/skybox/downImage.png', // bottom
		'texture/skybox/backImage.png', // back
		'texture/skybox/frontImage.png'  // front		
	],1000));
	
	//地面
	var mesh = new THREE.Mesh( new THREE.PlaneBufferGeometry( 2000, 2000 ), new THREE.MeshPhongMaterial( { color: 0x999999, depthWrite: false } ) );
	mesh.rotation.x = - Math.PI / 2;
	mesh.receiveShadow = true;
	scene.add( mesh );

	//地面网格
	var grid = new THREE.GridHelper( 2000, 20, 0x000000, 0x000000 );
	grid.material.opacity = 0.2;
	grid.material.transparent = true;
	scene.add( grid );
	
	var objectLoader = new THREE.JSONLoader();
	objectLoader.load( "model/head.js",  function ( geometry, materials ) {
		//创建材质
		//THREE.ImageLoader.setCrossOrigin('anonymous');
		//var texture = THREE.ImageUtils.loadTexture('u3d/upload/1/1_face_TextureRes.jpg', {}, function() { renderer.render(scene, camera)});
		
		var texture = THREE.ImageUtils.loadTexture('model/texture/faceT.jpg', {}, function() { renderer.render(scene, camera)});
		//var loader = new THREE.ImageLoader();
		//var texture;
		//loader.setCrossOrigin('anonymous');
		/*loader.load('model/texture/faceT.jpg',
				function(image)
				{
					texture = image;
				},
				function(xhr)
				{
					console.log( (xhr.loaded / xhr.total * 100) + '% loaded' );
				},
				function()
				{
					console.log( 'An error happened');
				});*/
		//var texture = THREE.ImageLoader.Load('http://212.64.0.15:8090/static/123/123_face_TextureRes.jpg');
	         	 
		var material = new THREE.MeshLambertMaterial({
				map: texture
		});
				
		material.morphTargets = true;
	    var object = new THREE.Mesh( geometry, material );
	    //初始化
	    object.scale.set(120,120,120);
	    object.position.set(0,-105,0);
	   /* object.scale.set(58,58,58);
	    object.position.set(0,-135,-4); */
	    scene.add( object );		
			// alert(1)
	} );   
		
	objectLoader.load( "model/malehair/mh2.js",  function ( geometry, materials ) {
		//创建材质
		var textloader = new THREE.TextureLoader();
	 	var texture = textloader.load('model/texture/hairT.png');
            	 
	 	var material = new THREE.MeshLambertMaterial({
			map: texture
		});  
	 	material.morphTargets = true; 
	    var object = new THREE.Mesh( geometry, material );
	    //初始化
	    object.scale.set(120,120,120);
	    object.position.set(0,-105,0);
	    scene.add( object );		
	} );   


    //渲染器
	renderer = new THREE.WebGLRenderer( { antialias: true } );
	renderer.setPixelRatio( window.devicePixelRatio );
	renderer.setSize( container.offsetHeight, container.offsetWidth );
	renderer.shadowMap.enabled = true;
	container.appendChild( renderer.domElement );

	animate();//不断刷新
}

//刷新函数，对场景进行刷新
function animate() {

	requestAnimationFrame( animate );  //调用浏览器的间隔重新渲染函数，参数为需要不断调用的函数

	if ( mixers.length > 0 ) {

		for ( var i = 0; i < mixers.length; i ++ ) {
			mixers[ i ].update( clock.getDelta() );
		}

	}
	renderer.render( scene, camera );
}

function changeHair(url){
	//销毁原发型
	var allObj = scene.children;
	var hair = allObj[allObj.length-1];
	//if(hair instanceof THREE.mesh){
		scene.remove(hair);
	//}
	
	var path = 'model/femalehair/' + url + '.js';
	var pathtexture = 'model/texture/' + url + '.png';
	var objectLoader = new THREE.JSONLoader();
	objectLoader.load( path,  function ( geometry, materials ) {
		//创建材质
	 	var texture = THREE.ImageUtils.loadTexture(pathtexture, {}, function() {
        renderer.render(scene, camera)});
            	 
	 	var material = new THREE.MeshLambertMaterial({
			map: texture
		});  
	 	material.morphTargets = true; 
	    var object = new THREE.Mesh( geometry, material );
	    //初始化
	    object.scale.set(143,143,143);
	    object.position.set(0,-128,-4);
	    scene.add( object );		
	} );   
}

function changeColor(){
	var allObj = scene.children;
	var hair = allObj[allObj.length-1];
	
	var red = document.getElementById('red').value;
	var green = document.getElementById('green').value;
	var blue = document.getElementById('blue').value;
	
	var rv = parseInt(parseFloat(red)*255/100.0 );  //RGB的最大值为255而不是256
	var gv = parseInt(parseFloat(green)*255/100.0 );
	var bv = parseInt(parseFloat(blue)*255/100.0);
	
	var bit1 = parseInt(rv/16);
	var bit2 = parseInt(rv%16);
	var bit3 = parseInt(gv/16);
	var bit4 = parseInt(gv%16);
	var bit5 = parseInt(bv/16);
	var bit6 = parseInt(bv%16);
	var c = "#"+bit1.toString(16)+bit2.toString(16)+bit3.toString(16)+bit4.toString(16)+bit5.toString(16)+bit6.toString(16);
	//加载颜色
	hair.material.color.set(c);	
	
	//以下是测试更换材质颜色的代码
//	alert(c);
//	if(color=='red'){
//		hair.material.color.set('#ff0000');		
//	}
//	else if(color=='green'){
//		hair.material.color.set('#00ff00');			
//	}
//	else if(color=='blue'){
//		hair.material.color.set('#0091ff');			
//	}
}