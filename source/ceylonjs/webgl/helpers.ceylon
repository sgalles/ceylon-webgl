
dynamic StaticMath{
    shared formal Float sin(Float a);
    shared formal Float random();
}

StaticMath math { dynamic { return \iMath; } }

dynamic StaticDate{
    shared formal Integer now();
}

StaticDate date { dynamic { return \iDate; } }

dynamic StaticWindow{
    shared formal Integer innerWidth;
    shared formal Integer innerHeight;
    shared formal void addEventListener( String type, void listener(), Boolean useCapture = false);
}

StaticWindow win { dynamic { return window; } }