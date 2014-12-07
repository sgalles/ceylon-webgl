

shared dynamic Texture{
    shared formal variable dynamic wrapS;
    shared formal variable dynamic wrapT;
}

shared Texture loadTexture(String url) {
    dynamic{
        return THREE.\iImageUtils.loadTexture(url);
    }
    
}