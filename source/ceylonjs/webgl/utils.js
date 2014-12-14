function entriesToObject(entries) {
   var o = new Object();
   for(var i= 0; i < entries.length; i++){
         var e = entries[i];
         o[e.key] = e.item; 
    }        
    return o;
}

function createNativeArray(size,val){
    var a = [];
    for(var i= 0; i < size; i++){
        a[i] = val;
    }
    return a;
}

function updateDisplacement(time, displacementValues, noise){
    for ( var i = 0; i < displacementValues.length; i ++ ) {

        displacementValues[ i ] = Math.sin( 0.1 * i + time );

        noise[ i ] += 0.5 * ( 0.5 - Math.random() );
        noise[ i ] = THREE.Math.clamp( noise[ i ], -5, 5 );

        displacementValues[ i ] += noise[ i ];

    }
}

