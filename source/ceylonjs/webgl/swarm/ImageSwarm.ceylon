import ceylonjs.webgl.three {
    DynObject3D,
    dynVector3,
    DynVector3
}
shared class ImageSwarm(Integer width, [DynObject3D?*] childrenInRectangle) extends AsbtractSwarm(childrenInRectangle.coalesced.sequence()){
   //  alias XY => Float[2]; 
          
    //XY[] xys = [for (i->obj in childrenInRectangle.indexed) 
    //            if(obj exists) [((i%width) - 30).float, (-(i/(width))+30).float]
    //          ];          
    //      
    //Anything() collectingCommand([DynObject3D, XY] pair){
    //      DynObject3D obj = pair[0];
    //      XY xy = pair[1];
    //      void command(){
    //          obj.position.x = xy[0];
    //          obj.position.y = xy[1];
    //      }
    //      return command;         
    //}
    //Anything()[] commands = zipPairs(childrenInRectangle.coalesced, xys).collect(collectingCommand);
          
          //alias XY => [Float,Float]; 
          
   [Float,Float][] xys = [for (i->obj in childrenInRectangle.indexed) 
          if(obj exists) [((i%width) - 30).float, (-(i/(width))+30).float]
          ];          
          
          Anything() collectingCommand([DynObject3D, [Float,Float]] pair){
              DynObject3D obj = pair[0];
              Float x = pair[1][0];
              Float y = pair[1][1];
              DynVector3 v = dynVector3(x, y, 0);
              void command(){
                  obj.position = v;
                 // obj.position.y = v.y;
                 // obj.position.z = v.z;
              }
              return command;         
          }
          Anything()[] commands = zipPairs(childrenInRectangle.coalesced, xys).collect(collectingCommand);      
    
    shared actual void nextPosition() {
        for(command in commands){
            command();
        }
    }
    //shared actual void nextPosition() {
    //    for(pair in zipPairs(children, xys)){
    //        DynObject3D obj = pair[0];
    //        XY xy = pair[1];
    //        obj.position.x = xy[0];
    //        obj.position.y = xy[1];
    //    }
    //}
    
}