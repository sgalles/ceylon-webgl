import ceylon.language.meta.declaration {

    ValueDeclaration
}
import ceylon.language.meta {

    type
}
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
            return entriesToObject(Array(nameAndVals));
        }
    }
}



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

