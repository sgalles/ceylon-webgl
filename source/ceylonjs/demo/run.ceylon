//shared void run() {
//    dynamic {
//        dynamic x = XMLHttpRequest();
//        print(x);
//    }
//}

"Run CeylonJS Basic Demo - called after the page loads"
shared void run() {
    Image img = Image(trompon.raw);
    dynamic {
        window.\iScene = THREE.\iScene;
        window.\iPerspectiveCamera = THREE.\iPerspectiveCamera;
        window.\iWebGLRenderer = THREE.\iWebGLRenderer;
        window.\iBoxGeometry = THREE.\iBoxGeometry;
        window.\iMeshBasicMaterial = THREE.\iMeshBasicMaterial;
        window.\iMeshPhongMaterial = THREE.\iMeshPhongMaterial;
        window.\iMesh = THREE.\iMesh;
        window.\iAmbientLight = THREE.\iAmbientLight;
        window.\iDirectionalLight = THREE.\iDirectionalLight;
        window.\iSphereGeometry = THREE.\iSphereGeometry;
        window.\iVector3 = THREE.\iVector3;
       
        
        
        dynamic scene = Scene();
        dynamic camera = PerspectiveCamera( 75, window.innerWidth / window.innerHeight, 0.1, 1000 );
        dynamic renderer = WebGLRenderer();
        renderer.setSize( window.innerWidth, window.innerHeight );
        document.body.appendChild( renderer.domElement );
       
        variable Integer j = 0;
       
        for(Integer c in img.pixels){
            if(c != #ffffff){
                dynamic geometry = SphereGeometry(0.3, 5, 5);
                object materialProperties{
                    // light
                    shared Integer specular = #a9fcff;
                    // intermediate
                    shared Integer color = c;
                    // dark
                    shared Integer emissive = #006063;
                    shared Integer shininess = 100;
                }
                
                dynamic material = MeshPhongMaterial(materialProperties) ;   
                dynamic sphere = Mesh( geometry, material ); 
                sphere.position.x = (j%img.width)/4;
                sphere.position.y = (j/img.height)/4;
                scene.add( sphere );
            }
            
           j+=1;
        }
       
        
        
        
        camera.position.z = 30;
        
        // add subtle ambient lighting
        dynamic ambientLight = AmbientLight(#222222);
        scene.add(ambientLight);
        
        // directional lighting
        dynamic directionalLight = DirectionalLight(#ffffff);
        directionalLight.position.set(1, 1, 1).normalize();
        scene.add(directionalLight);
        
        void render() { 
            requestAnimationFrame(render); 
            //sphere.rotation.x += 0.1;
            //sphere.rotation.y += 0.1;
            renderer.render(scene, camera); 
        } 
        render();
    }
}




