
var jsNativeFuncs = {

    entriesToObject: function(entries) {
       var o = new Object();
       for(var i= 0; i < entries.length; i++){
             var e = entries[i];
             o[e.key] = e.item; 
        }        
        return o;
    },
    
   
    updateDisplacement: function(time, displacementValues, noise){
        for ( var i = 0; i < displacementValues.length; i ++ ) {
    
            displacementValues[ i ] = Math.sin( 0.1 * i + time );
    
            noise[ i ] += 0.5 * ( 0.5 - Math.random() );
            noise[ i ] = THREE.Math.clamp( noise[ i ], -5, 5 );
    
            displacementValues[ i ] += noise[ i ];
    
        }
    }

}

