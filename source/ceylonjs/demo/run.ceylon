"Run CeylonJS Basic Demo - called after the page loads"
shared void run() {
    dynamic {
        window.\iScene = THREE.\iScene;
        window.\iPerspectiveCamera = THREE.\iPerspectiveCamera;
        window.\iWebGLRenderer = THREE.\iWebGLRenderer;
        window.\iBoxGeometry = THREE.\iBoxGeometry;
        window.\iMeshBasicMaterial = THREE.\iMeshBasicMaterial;
        window.\iMesh = THREE.\iMesh;
        
        dynamic scene = Scene();
        dynamic camera = PerspectiveCamera( 75, window.innerWidth / window.innerHeight, 0.1, 1000 );
        dynamic renderer = WebGLRenderer();
        renderer.setSize( window.innerWidth, window.innerHeight );
        document.body.appendChild( renderer.domElement );
        dynamic geometry = BoxGeometry(1,1,1);
        object meshBasicMaterialProperties{shared Integer color = #00ff00;}
        dynamic material = MeshBasicMaterial(meshBasicMaterialProperties) ;
        dynamic cube = Mesh( geometry, material ); 
        scene.add( cube ); 
        camera.position.z = 5;
        void render() { 
            requestAnimationFrame(render); 
            cube.rotation.x = cube.rotation.x + 0.1;
            cube.rotation.y = cube.rotation.y + 0.1;
            renderer.render(scene, camera); 
        } 
        render();
    }
}




