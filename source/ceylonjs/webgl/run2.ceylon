import ceylonjs.webgl.three {
    createScene,
    Scene,
    PerspectiveCamera,
    createPerspectiveCamera,
    createWebGLRenderer,
    WebGLRenderer,
    WebGlRendererParam,
    Mesh,
    Geometry,
    createMesh,
    treeRequestAnimationFrame,
    createSphereGeometry,
    ShaderMaterialParam,
    createShaderMaterial
}


shared void run2() {
    // SCENE
    Scene scene = createScene();
  
    Integer screenWidth;
    Integer screenHeight;
    dynamic {
        screenWidth = window.innerWidth;
        screenHeight = window.innerHeight;
    }
    Integer viewAngle = 45;
    Float aspect = screenWidth.float / screenHeight.float;
    Float near = 0.1;
    Integer far = 1000;
    
    PerspectiveCamera camera = createPerspectiveCamera( viewAngle, aspect, near, far );
    scene.add(camera);
    camera.position.set(0,0,5);
    camera.lookAt(scene.position);
    
    // RENDERER
    WebGLRenderer renderer = createWebGLRenderer(WebGlRendererParam{
        antialias = true;
        alpha = true;
    });
    renderer.setSize(screenWidth, screenHeight);
    dynamic{
        dynamic container = document.body;
        container.appendChild( renderer.domElement );
    }
    // Main polygon
    Mesh character = buildCharacter();
    scene.add(character);
    
    void animate() {
        dynamic{
            // Update uniform
            dynamic c = 0.5+0.5*Math.cos(Date().getTime()/1000.0 * Math.\iPI);
            dynamic sharedMaterial = character.material;
            sharedMaterial.uniforms.color.\ivalue = c;
        }
       
        // Render scene
        renderer.render( scene, camera );
        treeRequestAnimationFrame( animate );
    }
    treeRequestAnimationFrame( animate );
}

Mesh buildCharacter(){
    Geometry g = createSphereGeometry(1.0);
    //Material material = createMeshBasicMaterial() ;
    
    // pourquoi ?
    //Material? material;
    //dynamic {
    //    dynamic param = dynamic[
    //        uniforms= dynamic [
    //            color= dynamic [type= "f"; \ivalue= 0.0;];
    //        ];
    //        
    //        vertexShader="""varying vec2 vUv;
    //                        void main() {
    //                            vUv = uv;
    //                            gl_Position = projectionMatrix *
    //                                          modelViewMatrix * vec4(position, 1.0 );
    //                        }
    //                        """;
    //        fragmentShader= """precision highp float;
    //                            varying vec2 vUv;
    //                            uniform float color;
    //                            void main(void) {
    //                                gl_FragColor = vec4(vec3(color), 1.0);
    //                            }
    //                        """;
    //    ];
    //    print(param);
    //    material = createShaderMaterial(param);
    //}
    //assert(exists material);
    
    ShaderMaterialParam param;
     dynamic {
        param = ShaderMaterialParam {
                    uniforms = dynamic [
                        color= dynamic [type= "f"; \ivalue= 0.0;];
                    ];
                    vertexShader = """varying vec2 vUv;
                                      void main() {
                                      vUv = uv;
                                      gl_Position = projectionMatrix *
                                              modelViewMatrix * vec4(position, 1.0 );
                                      }
                                   """;
                    fragmentShader= """precision highp float;
                                        varying vec2 vUv;
                                        uniform float color;
                                        void main(void) {
                                            gl_FragColor = vec4(vec3(color), 1.0);
                                        }
                                    """;
                };
    }
    
    return createMesh(g, createShaderMaterial(param));
   
}


