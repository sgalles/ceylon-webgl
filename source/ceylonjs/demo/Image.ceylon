


shared class Image(String ppmAsciiData) {
    shared Integer width; 
    shared Integer height; 
    shared [Integer*] pixels;
    
    Integer parseMandatoryInteger(String[] seq, Integer pos){
        assert(exists string = seq[pos]);
        if(exists i = parseInteger(string)){
            return i;
        }else {
            throw AssertionError("'``string``' was not an integer");
        }
        
    }
    
    value lines = ppmAsciiData.split('\n'.equals).filter((s) => !s.trimmed.empty).sequence();
    assert(exists type = lines[0], type == "P3"); 
    assert(exists widthAndHeightString = lines[2]); 
    print(widthAndHeightString.split().sequence());
    String[] widthAndHeightPair = widthAndHeightString.split().sequence();
    width = parseMandatoryInteger(widthAndHeightPair,0);
    height = parseMandatoryInteger(widthAndHeightPair,1);
    Integer rgbStringsToInteger([String+] rgb){
        assert(rgb.size == 3);
        Integer r = parseMandatoryInteger(rgb,0);
        Integer g = parseMandatoryInteger(rgb,1);
        Integer b = parseMandatoryInteger(rgb,2);
        return r.leftLogicalShift(16) + g.leftLogicalShift(8) + b;
    }
    pixels = lines[4...].partition(3).map(rgbStringsToInteger).sequence();
    
    string => "``width`` ``height`` ``",".join(pixels.map((p) => formatInteger(p,16)))``";
    
}