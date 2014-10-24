//shared void run() {
//    dynamic {
//        dynamic x = XMLHttpRequest();
//        print(x);
//    }
//}

"Run CeylonJS Basic Demo - called after the page loads"
shared void run() {
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
        
        
        dynamic scene = Scene();
        dynamic camera = PerspectiveCamera( 75, window.innerWidth / window.innerHeight, 0.1, 1000 );
        dynamic renderer = WebGLRenderer();
        renderer.setSize( window.innerWidth, window.innerHeight );
        document.body.appendChild( renderer.domElement );
        dynamic geometry = SphereGeometry(0.3, 10, 10);
        //dynamic geometry = BoxGeometry(1,1,1);
        object materialProperties{
            // light
            shared Integer specular = #a9fcff;
            // intermediate
            shared Integer color = #00ff00;
            // dark
            shared Integer emissive = #006063;
            shared Integer shininess = 100;
        }
       
        dynamic material = MeshPhongMaterial(materialProperties) ;
        dynamic cube = Mesh( geometry, material ); 
        scene.add( cube ); 
        camera.position.z = 5;
        
        // add subtle ambient lighting
        dynamic ambientLight = AmbientLight(#222222);
        scene.add(ambientLight);
        
        // directional lighting
        dynamic directionalLight = DirectionalLight(#ffffff);
        directionalLight.position.set(1, 1, 1).normalize();
        scene.add(directionalLight);
        
        void render() { 
            requestAnimationFrame(render); 
            cube.rotation.x = cube.rotation.x += 0.1;
            cube.rotation.y = cube.rotation.y += 0.1;
            renderer.render(scene, camera); 
        } 
        render();
    }
}




