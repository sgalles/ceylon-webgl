
var jsNativeFuncs =  {
   
    updateDisplacement: function(time, displacementValues, noise){
        for ( var i = 0; i < displacementValues.length; i ++ ) {
    
            displacementValues[ i ] = Math.sin( 0.1 * i + time );
    
            noise[ i ] += 0.5 * ( 0.5 - Math.random() );
            noise[ i ] = THREE.Math.clamp( noise[ i ], -5, 5 );
     
            displacementValues[ i ] += noise[ i ];
     
        }
    }

}

