import ceylonjs.webgl.three {

    Geometry
}
shared dynamic loadTexture(String url) {
    dynamic{
        return THREE.\iImageUtils.loadTexture(url);
    }
    
}