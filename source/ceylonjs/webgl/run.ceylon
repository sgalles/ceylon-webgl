import ceylon.language.meta {
    type
}
import ceylon.language.meta.declaration {
    ValueDeclaration
}

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
    createWebGLRenderer,
    math,
    threeRequestAnimationFrame,
    Color
}
import ceylonjs.webgl.three.imageutils {
    loadTexture,
    Texture
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



shared void run() {
   
    NativeFuncs nativeFuncs;
    dynamic{
        nativeFuncs = jsNativeFuncs;
    }
   
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
    
  
    Array<Float> noise = Array { for (i in 0:sphereGeometry.vertices.size) random() * 5 };
    Array<Float> displacementValues = Array { for (i in 0:sphereGeometry.vertices.size) 0.0 };
    object attributes extends ShaderValueBundle(){
        shared ShaderValue<Array<Float>> displacement = ShaderValue("f",displacementValues);
    }
    object uniforms extends ShaderValueBundle(){
        shared ShaderValue<Float> amplitude = ShaderValue("f",1.0);
        shared ShaderValue<Color> color = ShaderValue("c", createColor(#ff2200) );
        shared ShaderValue<Texture> texture = ShaderValue("t", loadTexture( "textures/water.jpg" ) );
        
    }
    
    
    ShaderMaterialParam sharedMaterialParam;
   
    dynamic{

        dynamic dynUniforms = uniforms.createDyn();
        dynamic dynAttributes = attributes.createDyn();
        
        dynUniforms.texture.\ivalue.wrapS = dynUniforms.texture.\ivalue.wrapT = THREE.\iRepeatWrapping;
        
        sharedMaterialParam = ShaderMaterialParam{
            attributes = dynAttributes;
            uniforms = dynUniforms;
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
    
    dynamic stats;
    dynamic{
        dynamic container = document.body;
        container.appendChild( renderer.domElement );
        
        stats = Stats();
        stats.domElement.style.position = "absolute";
        stats.domElement.style.top = "0px";
        container.appendChild( stats.domElement );
    }
     
    win.addEventListener( "resize", onWindowResize);
    
    void render(){
        value time = now() * 0.01;
        sphere.rotation.y = sphere.rotation.z = 0.01 * time;
        
        uniforms.amplitude.val = 2.5 * sin( sphere.rotation.y * 0.125 );
        uniforms.color.val.offsetHSL( 0.0005, 0, 0 );
      
        nativeFuncs.updateDisplacement(time, displacementValues, noise);
        attributes.displacement.needsUpdate = true;
   
        renderer.render( scene, camera );
        
    }
    
    void animate() {
        
        threeRequestAnimationFrame( animate );
        
        render();
        
        dynamic{
            stats.update();
        }
        
    }
    
    animate();
    print("done");
    
    
}


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



class ShaderValueBundle() {
    
    shared dynamic createDyn() {
        value declaredMembers = type(this).declaration.declaredMemberDeclarations<ValueDeclaration>();
        <String->Anything> func(ValueDeclaration property) {
            dynamic{
                dynamic propertyValue = property.memberGet(this);
                return property.name->propertyValue.dyn;
            }
        }
        value nameAndVals = declaredMembers.map(func);
        dynamic {
            return jsNativeFuncs.entriesToObject(Array(nameAndVals));
        }
    }
}



class ShaderValue<Type> (
    shared String type,  
    Type _val
){
    shared dynamic dyn;
    dynamic{
        dyn = dynamic [type = type; \ivalue = _val;];
    }
    
    shared Type val {
        dynamic{
            return dyn.\ivalue;
        }    
    }
    assign val {
        dynamic{
            dyn.\ivalue = val;
        }  
    }
    
    shared Boolean needsUpdate {
        dynamic{
            return dyn.needsUpdate;
        }    
    }
    assign needsUpdate {
        dynamic{
            dyn.needsUpdate = needsUpdate;
        }  
    }
    
    string => "[ShaderValue '``type``']";
}



dynamic NativeFuncs{
    shared formal void updateDisplacement(Float time, Array<Float> displacementValues, Array<Float> noise);
    shared formal dynamic entriesToObject({<String->Anything>*} entries);
}

