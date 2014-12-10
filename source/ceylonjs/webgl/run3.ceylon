import ceylon.language.meta {
    type
}
import ceylon.language.meta.declaration {
    ValueDeclaration
}
shared class Foo(){
    
   
    
    shared dynamic createDyn() {
        value declaredMembers = type(this).declaration.declaredMemberDeclarations<ValueDeclaration>();
        <String->Anything> func(ValueDeclaration val) {
            print(val.memberGet(this));
            return val.name->val.memberGet(this);
        }
        value nameAndVals = declaredMembers.map(func);
        dynamic {
            return entriesToObject(Array(nameAndVals));
        }
    }

}

shared object foo extends Foo(){
    shared String bar = "a";
    shared String bar2 = "b";
}



shared void run25(){
    dynamic{
        print(foo.createDyn());
    }
    
}
