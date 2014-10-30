import ceylonjs.demo.contract {
	DynScene,
	dynScene,
	dynPerspectiveCamera,
	DynPerspectiveCamera,
	DynWebGLRenderer,
	dynWebGLRenderer,
	DynBoxGeometry,
	dynBoxGeometry,
	DynMeshLambertMaterialParam,
	dynMeshLambertMaterial,
	DynMeshLambertMaterial,
	dynMesh,
	DynMesh,
	DynDirectionalLight,
	dynDirectionalLight,
	dynAmbientLight,
	DynAmbientLight,
	dynRequestAnimationFrame
}

"Run CeylonJS Basic Demo - called after the page loads"
shared void run() {
    Image img = Image(trompon.raw);
   
       
        
        
        DynScene scene = dynScene();
        DynPerspectiveCamera camera;
        DynWebGLRenderer renderer;
   		dynamic{
	        camera = dynPerspectiveCamera( 75, window.innerWidth / window.innerHeight, 0.1, 1000 );
	        renderer = dynWebGLRenderer();
	        renderer.setSize( window.innerWidth, window.innerHeight );
	        document.body.appendChild( renderer.domElement );
        }
        
        for(i->color in img.pixels.indexed	){
            if(color != #ffffff){
                DynBoxGeometry geometry = dynBoxGeometry(1, 1, 1);              
                DynMeshLambertMaterial material = dynMeshLambertMaterial(DynMeshLambertMaterialParam(color)) ; 
                DynMesh cube = dynMesh( geometry, material ); 
                cube.position.x = ((i%img.width) - 30).float;
                cube.position.y = (-(i/(img.width))+30).float;
                scene.add( cube );
            }
        }
       
        
        
        
        camera.position.z = 70.0	;
      
        
        // add subtle ambient lighting
        DynAmbientLight ambientLight = dynAmbientLight(#222222);
        scene.add(ambientLight);
        
        // directional lighting
        DynDirectionalLight directionalLight = dynDirectionalLight(#ffffff);
        directionalLight.position.set(1, 1, 1).normalize();
        scene.add(directionalLight);
       
        void render() { 
           dynRequestAnimationFrame(render); 
            for(o in scene.children){
                o.rotation.x = o.rotation.x + 0.1;
                o.rotation.y = o.rotation.y + 0.1;
            }
            
            renderer.render(scene, camera); 
        } 
        render();
    
}




