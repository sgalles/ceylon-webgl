
function entriesToObject(entries) {
   var o = new Object();
   for(var i= 0; i < entries.length; i++){
         var e = entries[i];
         o[e.key] = e.item; 
    }        
    return o;
}
    
