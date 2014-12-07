



shared class Image(String ppmAsciiData) {
    shared Integer width; 
    shared Integer height; 
    shared [Integer*] pixels;
    
    /*Integer parseMandatoryInteger(String[] seq, Integer pos){
        assert(exists string = seq[pos]);
        if(exists i = parseInteger(string)){
            return i;
        }else {
            throw AssertionError("'``string``' was not an integer");
        }  
    }*/
    
    
    value lines = ppmAsciiData
            .split('\n'.equals)
            .filter((s) => !s.startsWith("#"))
    		.flatMap((s) => s.split())
            .filter((s) => !s.trimmed.empty)
            .sequence();
    
        shared Integer getintFromArray([String*] array)(Integer key) {
            assert(exists string = array[key]);
            if(exists i = parseInteger(string)){
                return i;
            }else {
                throw AssertionError("'``string``' was not an integer");
            }  
        }
        

    assert(exists type = lines[0], type == "P3"); 
    value getintFromLines = getintFromArray(lines);
    width = getintFromLines(1);
    height = getintFromLines(2);
    
    Integer rgbStringsToInteger([String+] rgb){
        assert(rgb.size == 3);
        value getIntFromRgb = getintFromArray(rgb);
        Integer r = getIntFromRgb(0);
        Integer g = getIntFromRgb(1);
        Integer b = getIntFromRgb(2);
        return r.leftLogicalShift(16) + g.leftLogicalShift(8) + b;
    }
    pixels = lines[4...].partition(3).map(rgbStringsToInteger).sequence();
    print("done");
    string => "``width`` ``height`` ``",".join(pixels.map((p) => formatInteger(p,16)))``";
    
}