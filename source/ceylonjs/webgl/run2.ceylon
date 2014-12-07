import ceylonjs.webgl.three {
    createScene,
    Scene,
    PerspectiveCamera,
    createPerspectiveCamera,
    createWebGLRenderer,
    WebGLRenderer,
    WebGlRendererParam,
    Geometry,
    threeRequestAnimationFrame,
    createSphereGeometry,
    ShaderMaterialParam,
    createPointCloud,
    PointCloud,
    createShaderMaterial
}
import ceylonjs.webgl.three.imageutils {
    loadTexture
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
    camera.position.set(0,0,300);
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
    PointCloud character = buildCharacter();
    scene.add(character);
    
    void animate() {
        Float c;
        dynamic{
            // Update uniform
            c = 0.5+0.5*Math.cos(Date().getTime()/1000.0 * Math.\iPI);
            
        }
        //assert(is ShaderMaterial sharedMaterial = character.material);
        dynamic{
            //sharedMaterial.uniforms.color.\ivalue = c;
        }
      
        // 
        // Render scene
        renderer.render( scene, camera );
        threeRequestAnimationFrame( animate );
    }
    threeRequestAnimationFrame( animate );
}

PointCloud buildCharacter(){
    Geometry g = createSphereGeometry(100.0);
  
 
    ShaderMaterialParam param;
     dynamic {
        param = ShaderMaterialParam {
                    attributes = null;
                    transparent = true;
                    uniforms = dynamic [
                        texture = dynamic [type= "t"; \ivalue=loadTexture("texture/disc.png");];
                        //color= dynamic [type= "f"; \ivalue= 0.5;];
                        
                    ];
                    vertexShader = """
                                      //attribute float size;
                                      //attribute vec3 ca;
                                      
                                      //varying vec3 vColor;
                                      
                                      void main() {
                                      
                                          //vColor = ca;
                                          
                                          vec4 mvPosition = modelViewMatrix * vec4( position, 1.0 );
                                          
                                          //gl_PointSize = size;
                                          gl_PointSize = 40.0;
                                          
                                          gl_Position = projectionMatrix * mvPosition;
                                          
                                      }

                                   """;
                    fragmentShader= """
                                       //uniform vec3 color;
                                       uniform sampler2D texture;
                                       
                                       //varying vec3 vColor;
                                       
                                       void main() {
                                       
                                           gl_FragColor = vec4( vec3(1.0), 1.0 );
                                           gl_FragColor = gl_FragColor * texture2D( texture, gl_PointCoord );
                                       
                                       }
                                    """;
                };
    }
    dynamic{
        param.uniforms.texture.\ivalue.wrapS = param.uniforms.texture.\ivalue.wrapT = THREE.\iRepeatWrapping;
    }
    
    
    return createPointCloud(g, /*createPointCloudMaterial()*/createShaderMaterial(param));
   
}


