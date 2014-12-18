import ceylon.language.meta.declaration {

    ValueDeclaration
}
import ceylon.language.meta {

    type
}


"Wrap a shader value to communicate with the GLSL program.
 A dynamic enumeration is exposed to Threejs for interop."
shared class ShaderValue<Type> (
    shared String type,  
    Type _val
){
    shared dynamic dyn;
    dynamic{
        dyn = dynamic [type = type; \ivalue = _val;];
    }
    
    shared Type val {
        dynamic{
            return dyn.\ivalue;
        }    
    }
    assign val {
        dynamic{
            dyn.\ivalue = val;
        }  
    }
    
    shared Boolean needsUpdate {
        dynamic{
            return dyn.needsUpdate;
        }    
    }
    assign needsUpdate {
        dynamic{
            dyn.needsUpdate = needsUpdate;
        }  
    }
    
    string => "[ShaderValue '``type``']";
}


"Collection of [[ShaderValue]]. The metamodel is used
 to exposed a dynamic enumeration with the name of 
 the attribute of the declared values. The Ceylon attribute
 names for [[ShaderValue]] must match the names of the 
 attributes in the GLSL program"
shared class ShaderValueBundle() {
    
    shared dynamic createDyn() {
        value declaredMembers = type(this).declaration.declaredMemberDeclarations<ValueDeclaration>();
        <String->Anything> func(ValueDeclaration property) {
            dynamic{
                dynamic propertyValue = property.memberGet(this);
                return property.name->propertyValue.dyn;
            }
        }
        value nameAndVals = declaredMembers.map(func);
        dynamic {
            // use a native method to dynamically
            // create JS objects
            return entriesToObject(Array(nameAndVals));
        }
    }
}

