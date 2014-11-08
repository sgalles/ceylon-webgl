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
     
        DynScene scene = dynScene();
        DynPerspectiveCamera camera;
        DynWebGLRenderer renderer;
   		dynamic{
	        camera = dynPerspectiveCamera( 75, window.innerWidth / window.innerHeight, 0.1, 1000 );
	        renderer = dynWebGLRenderer();
	        renderer.setSize( window.innerWidth, window.innerHeight );
	        document.body.appendChild( renderer.domElement );
        }
        
        DynBoxGeometry geometry = dynBoxGeometry(1, 1, 1);  
        for(i->color in img.pixels.indexed	){
            if(color != #ffffff){     
                DynMeshLambertMaterial material = dynMeshLambertMaterial(DynMeshLambertMaterialParam(color)) ; 
                DynMesh cube = dynMesh( geometry, material ); 
                //cube.position.x = ((i%img.width) - 30).float;
                //cube.position.y = (-(i/(img.width))+30).float;
                scene.add( cube );
            }
        }
        [DynObject3D?*] object3ds = img.pixels.collect((Color color){
            if(color != #ffffff){     
                DynMeshLambertMaterial material = dynMeshLambertMaterial(DynMeshLambertMaterialParam(color)) ; 
                return dynMesh( geometry, material ); 
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
        DynAmbientLight ambientLight = dynAmbientLight(#222222);
        scene.add(ambientLight);
        
        // directional lighting
        DynDirectionalLight directionalLight = dynDirectionalLight(#ffffff);
        directionalLight.position.set(1, 1, 1).normalize();
        scene.add(directionalLight);
       
        variable Float rotationY = 0.05;
       swarm.nextPosition();
        void renderCallback() { 
           //rotationY+=0.1;
           //;  
           dynRequestAnimationFrame(renderCallback); 
           DynEuler euler = dynEuler(0.0,rotationY, 0.0, "XYZ");
            for(o in object3ds.coalesced){
                //o.rotation.x = o.rotation.x + 0.1;
                //o.rotation.y = o.rotation.y + 0.1;
                o.position.applyEuler(euler);
            }
            renderer.render(scene, camera); 
        } 
        renderCallback();
    
}




