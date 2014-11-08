import ceylonjs.webgl.three {
    DynObject3D
}

shared interface Swarm{
    shared formal void nextPosition();
}

shared abstract class AsbtractSwarm(shared [DynObject3D*] children) satisfies Swarm{
    
    
}