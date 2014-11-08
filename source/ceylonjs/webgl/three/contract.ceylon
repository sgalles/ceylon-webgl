
shared alias Color => Integer;

shared dynamic DynWebGLRenderer {
	shared formal void setSize(Integer width, Integer height);
	shared formal dynamic domElement;
	shared formal void render(DynScene scene, DynCamera camera);
}

shared dynamic DynScene satisfies DynObject3D{
}

shared dynamic DynGeometry {
}

shared dynamic DynBoxGeometry satisfies DynGeometry{
}

shared dynamic DynObject3D{
	shared formal void add(DynObject3D o);
	shared formal {DynObject3D*} children;
	shared formal DynEuler rotation;
	shared formal variable DynVector3 position;
}

shared dynamic DynEuler{
	shared variable formal Float x;
	shared variable formal Float y;
	shared variable formal Float z;
}

shared dynamic DynVector3{
	shared variable formal Float x;
	shared variable formal Float y;
	shared variable formal Float z;
	shared formal DynVector3 set(Float|Integer x, Float|Integer y, Float|Integer z);
	shared formal DynVector3 normalize();
	shared formal DynVector3 applyEuler(DynEuler euler);
}

shared dynamic DynCamera satisfies DynObject3D{
	
}

shared dynamic DynMesh satisfies DynObject3D{
	
}

shared dynamic DynPerspectiveCamera satisfies DynCamera{
	
}

shared dynamic DynMaterial {
	
}

shared dynamic DynMeshLambertMaterial satisfies DynMaterial{
	
}

shared class DynMeshLambertMaterialParam(shared Color? color = null){}

shared dynamic DynLight satisfies DynObject3D{
	
}

shared dynamic DynAmbientLight satisfies DynLight{
	
}

shared dynamic DynDirectionalLight satisfies DynLight{
	
}

//shared interface AbsMeshLambertMaterialParam satisfies DynMeshLambertMaterialParam{
//	shared actual default Integer? color => #00ff00;
//}

shared DynScene dynScene(){
	DynScene scene;
	dynamic {
		window.\iScene = THREE.\iScene;
		scene = Scene();
	}
	return scene;
}

shared DynEuler dynEuler(Float x,Float y, Float z, String order){
    DynEuler o;
    dynamic {
        window.\iEuler = THREE.\iEuler;
        o = Euler(x,y,z,order);
    }
    return o;
}

shared DynWebGLRenderer dynWebGLRenderer(){
	DynWebGLRenderer o;
	dynamic {
		window.\iWebGLRenderer = THREE.\iWebGLRenderer;
		o = WebGLRenderer();
	}
	return o;
}



shared DynPerspectiveCamera dynPerspectiveCamera( Float|Integer fov, Float|Integer aspect, Float|Integer near, Float|Integer far){
	DynPerspectiveCamera o;
	dynamic {
		window.\iPerspectiveCamera = THREE.\iPerspectiveCamera;
		o = PerspectiveCamera(fov,aspect,near,far);
	}
	return o;
}

shared DynVector3 dynVector3( Float|Integer x, Float|Integer y, Float|Integer z){
    DynVector3 o;
    dynamic {
        window.\iVector3 = THREE.\iVector3;
        o = Vector3(x,y,z);
    }
    return o;
}
	
shared DynBoxGeometry dynBoxGeometry(Float|Integer width,Float|Integer height,Float|Integer depth){
	DynBoxGeometry o;
	dynamic {
		window.\iBoxGeometry = THREE.\iBoxGeometry;
		o = BoxGeometry(width,height,depth);
	}
	return o;
}

shared DynMeshLambertMaterial dynMeshLambertMaterial(DynMeshLambertMaterialParam parameters){
	DynMeshLambertMaterial o;
	dynamic {
		window.\iMeshLambertMaterial = THREE.\iMeshLambertMaterial;
		o = MeshLambertMaterial(parameters);
	}
	return o;
}

shared DynMesh dynMesh(DynGeometry geometry, DynMaterial material){
	DynMesh o;
	dynamic {
		window.\iMesh = THREE.\iMesh;
		o = Mesh(geometry, material);
	}
	return o;
}

shared DynAmbientLight dynAmbientLight(Integer color){
	DynAmbientLight o;
	dynamic {
		window.\iAmbientLight = THREE.\iAmbientLight;
		o = AmbientLight(color);
	}
	return o;
}

shared DynDirectionalLight dynDirectionalLight(Integer color){
	DynDirectionalLight o;
	dynamic {
		window.\iDirectionalLight = THREE.\iDirectionalLight;
		o = DirectionalLight(color);
	}
	return o;
}

shared void dynRequestAnimationFrame(void render()){
	dynamic{
		requestAnimationFrame(render);
	}
}
