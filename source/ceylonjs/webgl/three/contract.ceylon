

shared object three{

    shared object wrapping{
        shared Wrapping repeat = ((){ dynamic { return THREE.\iRepeatWrapping; }})();
    }
    
    shared Scene scene(){
    	dynamic { return THREE.Scene(); }
    }
    
    shared Euler euler(Float x,Float y, Float z, String order){
        dynamic { return THREE.TreeEuler(x,y,z,order); }
    }
    
    shared Color color(Integer color){
        dynamic { return THREE.Color(color); }
    }
        
    shared WebGLRenderer webGLRenderer(WebGlRendererParam param = WebGlRendererParam()){
        dynamic { return THREE.WebGLRenderer(); }
    }
    
    shared PerspectiveCamera perspectiveCamera( Float|Integer fov, Float|Integer aspect, Float|Integer near, Float|Integer far){
        dynamic { return THREE.PerspectiveCamera(fov,aspect,near,far); }
    }
    
    shared Vector3 vector3( Float|Integer x, Float|Integer y, Float|Integer z){
        dynamic { return THREE.Vector3(x,y,z); }
    }
    	
    shared BoxGeometry boxGeometry(Float|Integer width,Float|Integer height,Float|Integer depth){
        dynamic { return THREE.BoxGeometry(width,height,depth); }
    }
    
    shared MeshLambertMaterial meshLambertMaterial(MeshLambertMaterialParam parameters){
        dynamic { return THREE.MeshLambertMaterial(parameters); }
    }
    
    shared PointCloudMaterial pointCloudMaterial(){
        dynamic { return THREE.PointCloudMaterial(); }
    }
    
    shared MeshBasicMaterial meshBasicMaterial(){
        dynamic { return THREE.MeshBasicMaterial(); }
    }
    
    shared ShaderMaterial shaderMaterial(ShaderMaterialParam param){
        dynamic { return THREE.ShaderMaterial(param); }
    }
    
    shared Mesh mesh(Geometry geometry, Material material){
        dynamic { return THREE.Mesh(geometry, material); }
    }
    
    shared PointCloud pointCloud(Geometry geometry, Material? material = null){
        dynamic { return THREE.PointCloud(geometry, material); }
    }
    
    shared AmbientLight ambientLight(Integer color){
        dynamic { return THREE.AmbientLight(color); }
    }
    
    shared DirectionalLight directionalLight(Integer color){
        dynamic { return THREE.DirectionalLight(color); }
    }
    
    shared Geometry planeGeometry(Float width, Float height){
        dynamic { return THREE.PlaneGeometry(width,height); }
    }
    
    shared Geometry sphereGeometry(Float|Integer radius, Integer widthSegments = 8, Integer heightSegments = 6){
        dynamic { return THREE.SphereGeometry(radius, widthSegments, heightSegments); }
    }
    
    shared void requestAnimationFrame(void render()){
    	dynamic{
    		window.requestAnimationFrame(render);
    	}
    }
    
    shared object imageUtils{
        shared Texture loadTexture(String url) {
            dynamic{
                return THREE.\iImageUtils.loadTexture(url);
            }   
        }
    }
    
    

}

shared dynamic WebGLRenderer {
    shared formal void setSize(Integer width, Integer height);
    shared formal dynamic domElement;
    shared formal void render(Scene scene, Camera camera);
    shared formal void setClearColor(Integer color, Integer|Float alpha);
}

shared dynamic Scene satisfies Object3D{
    shared formal Boolean autoUpdate;
}

shared dynamic Geometry {
    shared formal variable Boolean \idynamic;
    shared formal Array<Vector3> vertices;
    
}

shared dynamic BoxGeometry satisfies Geometry{
}

shared dynamic Object3D{
    shared formal void add(Object3D o);
    shared formal {Object3D*} children;
    shared formal Euler rotation;
    shared formal variable Vector3 position;
}

shared dynamic Color{
    shared formal void offsetHSL(Float|Integer h, Float|Integer s, Float|Integer l);
    
}

shared dynamic Euler{
    shared variable formal Float x;
    shared variable formal Float y;
    shared variable formal Float z;
}

shared dynamic Vector3{
    shared variable formal Float|Integer x;
    shared variable formal Float|Integer y;
    shared variable formal Float|Integer z;
    shared formal Vector3 set(Float|Integer x, Float|Integer y, Float|Integer z);
    shared formal Vector3 normalize();
    shared formal Vector3 applyEuler(Euler euler);
}

shared dynamic Camera satisfies Object3D{
    shared formal variable Float aspect;
}

shared dynamic Mesh satisfies Object3D{
    shared formal Material material;
    shared formal Geometry geometry;
    
}

shared dynamic PointCloud satisfies Object3D{
    shared formal Material material;
}

shared dynamic PerspectiveCamera satisfies Camera{
    shared formal void lookAt(Vector3 position);
    shared formal void updateProjectionMatrix();
    
    
}

shared dynamic Material {
    shared formal Boolean transparent;
}

shared dynamic PointCloudMaterial satisfies Material{
    
}

shared dynamic MeshLambertMaterial satisfies Material{
    
}

shared dynamic MeshBasicMaterial satisfies Material{
    
}

shared class MeshLambertMaterialParam(shared Integer? color = null){}

shared dynamic Light satisfies Object3D{
    
}

shared dynamic AmbientLight satisfies Light{
    
}

shared dynamic DirectionalLight satisfies Light{
    
}

shared class WebGlRendererParam(
    shared Boolean? antialias = null, 
    shared Boolean? alpha = null
){}


shared dynamic ShaderMaterialProperties  satisfies Material{
    shared formal dynamic uniforms;
    shared formal dynamic attributes;
    shared formal String vertexShader;
    shared formal String fragmentShader;
}

shared dynamic ShaderMaterial satisfies Material,ShaderMaterialProperties{
    
}

shared class ShaderMaterialParam(
    shared actual dynamic uniforms,
    shared actual dynamic attributes,
    shared actual String vertexShader,
    shared actual String fragmentShader,
    shared actual Boolean transparent = false
    
) satisfies ShaderMaterialProperties{}

shared dynamic Texture{
    shared formal variable Wrapping wrapS;
    shared formal variable Wrapping wrapT;  
}

shared dynamic Wrapping{}
