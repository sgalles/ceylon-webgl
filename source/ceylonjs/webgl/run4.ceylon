import ceylonjs.webgl.three {
    PerspectiveCamera,
    createPerspectiveCamera,
    createScene,
    Scene,
    createColor,
    ShaderMaterialParam,
    createSphereGeometry,
    Geometry,
    ShaderMaterial,
    createShaderMaterial,
    createMesh,
    Mesh,
    createWebGLRenderer
}
import ceylonjs.webgl.three.imageutils {
    loadTexture
}
shared void run4() {
   
    Integer screenWidth = win.innerWidth;
    Integer screenHeight = win.innerHeight;
    PerspectiveCamera camera =  createPerspectiveCamera( 30, screenWidth / screenHeight, 1, 10000 );
    camera.position.z = 300;
    
    Scene scene = createScene();
    
    Geometry sphereGeometry = createSphereGeometry{ 
        radius = 50;
        widthSegments = 128;
        heightSegments = 64;
    };
    sphereGeometry.\idynamic = true;
    
    Array<Float> displacementValues = Array{ for (i in 0:sphereGeometry.vertices.size) 0.0 };
    Array<Float> noise = Array { for (i in 0:sphereGeometry.vertices.size) random() * 5 };
    
    ShaderMaterialParam sharedMaterialParam;
    dynamic{
        dynamic attributes = dynamic [
            displacement= dynamic [type= "f"; \ivalue = displacementValues;];
        ];
        dynamic uniforms = dynamic [
             amplitude = dynamic [type= "f"; \ivalue = 1.0;];
             color = dynamic [type= "c"; \ivalue = createColor(#ff2200);];
             texture = dynamic [type= "t"; \ivalue = loadTexture( "textures/water.jpg" );];
        ];
        
        uniforms.texture.\ivalue.wrapS = uniforms.texture.\ivalue.wrapT = THREE.\iRepeatWrapping;
        
        sharedMaterialParam = ShaderMaterialParam{
            attributes = attributes;
            uniforms = uniforms;
            vertexShader = vertexshader;
            fragmentShader = fragmentshader;
        };
        
    }
    
    ShaderMaterial shaderMaterial = createShaderMaterial(sharedMaterialParam);
    
    Mesh sphere = createMesh( sphereGeometry, shaderMaterial );
    
    scene.add( sphere );
    value renderer = createWebGLRenderer();
    renderer.setClearColor( #050505, 1 );
    renderer.setSize( screenWidth, screenHeight );
    
    void onWindowResize() {
        value w = win.innerWidth;
        value h = win.innerHeight;
        camera.aspect = w.float / h.float;
        camera.updateProjectionMatrix();
        renderer.setSize( w, h );
    }
    
    dynamic{
        dynamic container = document.body;
        container.appendChild( renderer.domElement );
    }
    win.addEventListener( "resize", onWindowResize);
    
    void render(){
        value time = now();
        sphere.rotation.y = sphere.rotation.z = 0.01 * time;
        
        value amplitude = 2.5 * sin( sphere.rotation.y * 0.125 );
        dynamic{
            uniforms.amplitude.\ivalue = amplitude;
            uniforms.color.\ivalue.offsetHSL( 0.0005, 0, 0 );
        }
        
        for(i in 0:displacementValues.size){
            displacementValues.set(i,  0.1 * i + time );
            noise.set(i, 0.5 * ( 0.5 - random() ));
        }
        
        //for ( var i = 0; i < attributes.displacement.value.length; i ++ ) {
        //    
        //    attributes.displacement.value[ i ] = Math.sin( 0.1 * i + time );
        //    
        //    noise[ i ] += 0.5 * ( 0.5 - Math.random() );
        //    noise[ i ] = THREE.Math.clamp( noise[ i ], -5, 5 );
        //    
        //    attributes.displacement.value[ i ] += noise[ i ];
        //    
        //}
        
    }
    
    //function render() {
    //    
    //    var time = Date.now() * 0.01;
    //    
    //    sphere.rotation.y = sphere.rotation.z = 0.01 * time;
    //    
    //    uniforms.amplitude.value = 2.5 * Math.sin( sphere.rotation.y * 0.125 );
    //    uniforms.color.value.offsetHSL( 0.0005, 0, 0 );
    //    
    //    for ( var i = 0; i < attributes.displacement.value.length; i ++ ) {
    //        
    //        attributes.displacement.value[ i ] = Math.sin( 0.1 * i + time );
    //        
    //        noise[ i ] += 0.5 * ( 0.5 - Math.random() );
    //        noise[ i ] = THREE.Math.clamp( noise[ i ], -5, 5 );
    //        
    //        attributes.displacement.value[ i ] += noise[ i ];
    //        
    //    }
    //    
    //    attributes.displacement.needsUpdate = true;
    //    
    //    renderer.render( scene, camera );
    //    
    //}    
    
    print("done");
    void init() {
    //    
        
    //    camera.position.z = 300;
    //    
    //    scene = new THREE.Scene();
    //    
    //    attributes = {
    //        
    //        displacement: {	type: 'f', value: [] }
    //        
    //    };
    //    
    //    uniforms = {
    //        
    //        amplitude: { type: "f", value: 1.0 },
    //        color:     { type: "c", value: new THREE.Color( 0xff2200 ) },
    //        texture:   { type: "t", value: THREE.ImageUtils.loadTexture( "textures/water.jpg" ) },
    //        
    //    };
    //    
    //    uniforms.texture.value.wrapS = uniforms.texture.value.wrapT = THREE.RepeatWrapping;
    //    
    //    var shaderMaterial = new THREE.ShaderMaterial( {
    //        
    //        uniforms: 		uniforms,
    //        attributes:     attributes,
    //        vertexShader:   document.getElementById( 'vertexshader' ).textContent,
    //        fragmentShader: document.getElementById( 'fragmentshader' ).textContent
    //        
    //    });
    //    
    //    
    //    var radius = 50, segments = 128, rings = 64;
    //    var geometry = new THREE.SphereGeometry( radius, segments, rings );
    //    geometry.dynamic = true;
    //    
    //    sphere = new THREE.Mesh( geometry, shaderMaterial );
    //    
    //    var vertices = sphere.geometry.vertices;
    //    var values = attributes.displacement.value;
    //    
    //    for ( var v = 0; v < vertices.length; v++ ) {
    //        
    //        values[ v ] = 0;
    //        noise[ v ] = Math.random() * 5;
    //        
    //    }
    //    
    //    scene.add( sphere );
    //    
    //    renderer = new THREE.WebGLRenderer();
    //    renderer.setClearColor( 0x050505, 1 );
    //    renderer.setSize( WIDTH, HEIGHT );
    //    
    //    var container = document.getElementById( 'container' );
    //    container.appendChild( renderer.domElement );
    //    
    //    stats = new Stats();
    //    stats.domElement.style.position = 'absolute';
    //    stats.domElement.style.top = '0px';
    //    container.appendChild( stats.domElement );
    //    
    //    //
    //    
    //    window.addEventListener( 'resize', onWindowResize, false );
    //    
    }
    //
    //function onWindowResize() {
    //    
    //    camera.aspect = window.innerWidth / window.innerHeight;
    //    camera.updateProjectionMatrix();
    //    
    //    renderer.setSize( window.innerWidth, window.innerHeight );
    //    
    //}
    //
    //function animate() {
    //    
    //    requestAnimationFrame( animate );
    //    
    //    render();
    //    stats.update();
    //    
    //}
    //
    //function render() {
    //    
    //    var time = Date.now() * 0.01;
    //    
    //    sphere.rotation.y = sphere.rotation.z = 0.01 * time;
    //    
    //    uniforms.amplitude.value = 2.5 * Math.sin( sphere.rotation.y * 0.125 );
    //    uniforms.color.value.offsetHSL( 0.0005, 0, 0 );
    //    
    //    for ( var i = 0; i < attributes.displacement.value.length; i ++ ) {
    //        
    //        attributes.displacement.value[ i ] = Math.sin( 0.1 * i + time );
    //        
    //        noise[ i ] += 0.5 * ( 0.5 - Math.random() );
    //        noise[ i ] = THREE.Math.clamp( noise[ i ], -5, 5 );
    //        
    //        attributes.displacement.value[ i ] += noise[ i ];
    //        
    //    }
    //    
    //    attributes.displacement.needsUpdate = true;
    //    
    //    renderer.render( scene, camera );
    //    
    //}    
    init();
    
}

String vertexshader = 
 """
    
    uniform float amplitude;
    
    attribute float displacement;
    
    varying vec3 vNormal;
    varying vec2 vUv;
    
    void main() {
    
        vNormal = normal;
        vUv = ( 0.5 + amplitude ) * uv + vec2( amplitude );
        
        vec3 newPosition = position + amplitude * normal * vec3( displacement );
        gl_Position = projectionMatrix * modelViewMatrix * vec4( newPosition, 1.0 );
    
    }                        
        
                                            
 """;

String fragmentshader = 
"""
                           
   varying vec3 vNormal;
   varying vec2 vUv;
   
   uniform vec3 color;
   uniform sampler2D texture;
   
   void main() {
   
       vec3 light = vec3( 0.5, 0.2, 1.0 );
       light = normalize( light );
       
       float dProd = dot( vNormal, light ) * 0.5 + 0.5;
       
       vec4 tcolor = texture2D( texture, vUv );
       vec4 gray = vec4( vec3( tcolor.r * 0.3 + tcolor.g * 0.59 + tcolor.b * 0.11 ), 1.0 );
       
       gl_FragColor = gray * vec4( vec3( dProd ) * vec3( color ), 1.0 );
   
   }
   
                           
""";
Float random(){
    dynamic{
        return Math.random();
    }
}

Integer now(){
    dynamic{
        return Date.now();
    }
}

Float sin(Float a){
    dynamic{
        return Math.sin(a);
    }
}

object win{
    
    shared Integer innerWidth{
        dynamic {
            return window.innerWidth;
        }
    }
    shared Integer innerHeight{
        dynamic {
            return window.innerHeight;
        }
    }
  
   shared void addEventListener( String type, void listener(), Boolean useCapture = false){
      dynamic{
          window.addEventListener(type, listener, useCapture);
      }
  }
   
    
}