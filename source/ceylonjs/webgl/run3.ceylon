import ceylonjs.webgl.three {
    Scene
}
shared void run3() {
    
    dynamic Tr{
        shared formal class Scene(){
            shared formal Boolean autoUpdate;
        }
    }
    
    Tr tr;
    dynamic{
        tr = THREE;
        print(tr);
    }
    Tr.Scene s = tr.Scene();
    print(s.autoUpdate);
    //Scene scene;
    //dynamic {
    //    window.\iDynTreeScene = THREE.\iScene;
    //    scene = DynTreeScene();
    //    
    //}
    //print(scene.autoUpdate);
    
    //dynamic{
    //    d = Date();
    //    print(d);
    //}
}