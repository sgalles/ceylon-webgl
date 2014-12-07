



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

//shared interface AbsMeshLambertMaterialParam satisfies DynMeshLambertMaterialParam{
//	shared actual default Integer? color => #00ff00;
//}

shared Scene createScene(){
	Scene scene;
	dynamic {
		window.\iDynTreeScene = THREE.\iScene;
		scene = DynTreeScene();
	}
	return scene;
}

shared Euler createEuler(Float x,Float y, Float z, String order){
    Euler o;
    dynamic {
        window.\iDynTreeEuler = THREE.\iEuler;
        o = DynTreeEuler(x,y,z,order);
    }
    return o;
}

shared Color createColor(Integer color){
    Color o;
    dynamic {
        window.\iDynColor = THREE.\iColor;
        o = DynColor(color);
    }
    return o;
}


shared class WebGlRendererParam(
    shared Boolean? antialias = null, 
    shared Boolean? alpha = null
    ){}
    
    
shared WebGLRenderer createWebGLRenderer(WebGlRendererParam param = WebGlRendererParam()){
	WebGLRenderer o;
	dynamic {
		window.\iDynTreeWebGLRenderer = THREE.\iWebGLRenderer;
		o = DynTreeWebGLRenderer();
	}
	return o;
}



shared PerspectiveCamera createPerspectiveCamera( Float|Integer fov, Float|Integer aspect, Float|Integer near, Float|Integer far){
	PerspectiveCamera o;
	dynamic {
		window.\iDynTreePerspectiveCamera = THREE.\iPerspectiveCamera;
		o = DynTreePerspectiveCamera(fov,aspect,near,far);
	}
	return o;
}

shared Vector3 createVector3( Float|Integer x, Float|Integer y, Float|Integer z){
    Vector3 o;
    dynamic {
        window.\iDynTreeVector3 = THREE.\iVector3;
        o = DynTreeVector3(x,y,z);
    }
    return o;
}
	
shared BoxGeometry createBoxGeometry(Float|Integer width,Float|Integer height,Float|Integer depth){
	BoxGeometry o;
	dynamic {
		window.\iDynTreeBoxGeometry = THREE.\iBoxGeometry;
		o = DynTreeBoxGeometry(width,height,depth);
	}
	return o;
}

shared MeshLambertMaterial createMeshLambertMaterial(MeshLambertMaterialParam parameters){
	MeshLambertMaterial o;
	dynamic {
		window.\iDynTreeMeshLambertMaterial = THREE.\iMeshLambertMaterial;
		o = DynTreeMeshLambertMaterial(parameters);
	}
	return o;
}

shared PointCloudMaterial createPointCloudMaterial(){
    PointCloudMaterial o;
    dynamic {
        window.\iDynPointCloudMaterial = THREE.\iPointCloudMaterial;
        o = DynPointCloudMaterial();
    }
    return o;
}

shared MeshBasicMaterial createMeshBasicMaterial(){
    MeshBasicMaterial o;
    dynamic {
        window.\iDynMeshBasicMaterial = THREE.\iMeshBasicMaterial;
        o = DynMeshBasicMaterial();
    }
    return o;
}

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

shared ShaderMaterial createShaderMaterial(ShaderMaterialParam param){
    ShaderMaterial o;
    dynamic {
        window.\iDynShaderMaterial = THREE.\iShaderMaterial;
        o = DynShaderMaterial(param);
    }
    return o;
}

shared Mesh createMesh(Geometry geometry, Material material){
	Mesh o;
	dynamic {
		window.\iDynTreeMesh = THREE.\iMesh;
		o = DynTreeMesh(geometry, material);
	}
	return o;
}

shared PointCloud createPointCloud(Geometry geometry, Material? material = null){
    PointCloud o;
    dynamic {
        window.\iDynPointCloud = THREE.\iPointCloud;
        o = DynPointCloud(geometry, material);
    }
    return o;
}

shared AmbientLight createAmbientLight(Integer color){
	AmbientLight o;
	dynamic {
		window.\iDynTreeAmbientLight = THREE.\iAmbientLight;
		o = DynTreeAmbientLight(color);
	}
	return o;
}

shared DirectionalLight createDirectionalLight(Integer color){
	DirectionalLight o;
	dynamic {
		window.\iDynTreeDirectionalLight = THREE.\iDirectionalLight;
		o = DynTreeDirectionalLight(color);
	}
	return o;
}

shared Geometry createPlaneGeometry(Float width, Float height){
    Geometry o;
    dynamic {
        window.\iDynPlaneGeometry = THREE.\iPlaneGeometry;
        o = DynPlaneGeometry(width,height);
    }
    return o;
}


shared Geometry createSphereGeometry(Float|Integer radius, Integer widthSegments = 8, Integer heightSegments = 6){
    Geometry o;
    dynamic {
        window.\iDynSphereGeometry = THREE.\iSphereGeometry;
        o = DynSphereGeometry(radius, widthSegments, heightSegments);
    }
    return o;
}

shared void treeRequestAnimationFrame(void render()){
	dynamic{
		requestAnimationFrame(render);
	}
}
