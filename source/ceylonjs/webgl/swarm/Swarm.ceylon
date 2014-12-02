import ceylonjs.webgl.three {
    Object3D
}

shared interface Swarm{
    shared formal void nextPosition();
}

shared abstract class AsbtractSwarm(shared [Object3D*] children) satisfies Swarm{
    
    
}