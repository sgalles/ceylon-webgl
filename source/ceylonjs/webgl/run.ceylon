import ceylonjs.webgl.resource {
    Image,
    trompon
}
import ceylonjs.webgl.swarm {
    ImageSwarm,
    Swarm
}
import ceylonjs.webgl.three {
    ...
}

"Run CeylonJS Basic Demo - called after the page loads"
shared void run() {
        Image img = Image(trompon.raw);
     
        Scene scene = createScene();
        PerspectiveCamera camera;
        WebGLRenderer renderer;
   		dynamic{
	        camera = createPerspectiveCamera( 75, window.innerWidth / window.innerHeight, 0.1, 1000 );
	        renderer = createWebGLRenderer();
	        renderer.setSize( window.innerWidth, window.innerHeight );
	        document.body.appendChild( renderer.domElement );
        }
        
        BoxGeometry geometry = createBoxGeometry(1, 1, 1);  
        for(i->color in img.pixels.indexed	){
            if(color != #ffffff){     
                MeshLambertMaterial material = createMeshLambertMaterial(MeshLambertMaterialParam(color)) ; 
                Mesh cube = createMesh( geometry, material ); 
                //cube.position.x = ((i%img.width) - 30).float;
                //cube.position.y = (-(i/(img.width))+30).float;
                scene.add( cube );
            }
        }
        [Object3D?*] object3ds = img.pixels.collect((Integer color){
            if(color != #ffffff){     
                MeshLambertMaterial material = createMeshLambertMaterial(MeshLambertMaterialParam(color)) ; 
                return createMesh( geometry, material ); 
                //cube.position.x = ((i%img.width) - 30).float;
                //cube.position.y = (-(i/(img.width))+30).float;
                //scene.add( cube );
            }else{
                return null;
            }
        });
        for( obj in object3ds.coalesced){
            scene.add(obj);
        }
        Swarm swarm = ImageSwarm(img.width, object3ds);   
           
        camera.position.z = 70.0	;
       
        // add subtle ambient lighting
        AmbientLight ambientLight = createAmbientLight(#222222);
        scene.add(ambientLight);
        
        // directional lighting
        DirectionalLight directionalLight = createDirectionalLight(#ffffff);
        directionalLight.position.set(1, 1, 1).normalize();
        scene.add(directionalLight);
       
        variable Float rotationY = 0.05;
       swarm.nextPosition();
        void renderCallback() { 
           //rotationY+=0.1;
           //;  
           treeRequestAnimationFrame(renderCallback); 
           Euler euler = createEuler(0.0,rotationY, 0.0, "XYZ");
            for(o in object3ds.coalesced){
                //o.rotation.x = o.rotation.x + 0.1;
                //o.rotation.y = o.rotation.y + 0.1;
                o.position.applyEuler(euler);
            }
            renderer.render(scene, camera); 
        } 
        renderCallback();
    
}




