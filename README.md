Ceylon three.js example  
==========
This is a [Ceylon](http://ceylon-lang.org/) port of the [three.js](http://threejs.org) *custom attributes [example](http://threejs.org/examples/#webgl_custom_attributes)*.

The main code of the example was ported in Ceylon, but of course, the Ceylon example still depends on the original [three.js](https://github.com/mrdoob/three.js) library for the 3D, and the [stats.js](https://github.com/mrdoob/stats.js) library to display the FPS.

 Can I see the result ?
--------------------
The precompiled Ceylon project is live here :
[ceylon-webgl](http://stephane.galles.free.fr/ceylon/ceylon-webgl/)
(works with *Chrome*, for instance)

Why ?
-----
I'm interested in Ceylon, I was experimenting with its JS interop features, and I was looking for an interesting small project to learn more.

I heard about the three.js libs and was amazed by the on-line examples. And given that I'm an absolute beginner in 3D, it was also an opportunity to learn even more.

Why this example ?
---------------------

Because I found the graphics beautiful, the code is rather small, and there are Vertex and Pixel shaders used in the code, and I irrationally wanted to program the GPU of my graphic cards in Ceylon (uhm... ok... not really in Ceylon, of course the code is still GLSL).

Is this really a valid use case for Ceylon ?
---------------------

For now, I don't know. This use case is a micro benchmark as such, and probably not the main target for Ceylon.

And I happily admit that the Ceylon port initially was not on a par with the original JS example FPS-wise. I suspect it has something to do with the GC of the browser when too much Ceylon code is involved in the main render loop. But really I didn't investigate much.

That's why I decided to keep a bit of native JS for the core render loop that must update a large array of floats (8000 elements at each frame).

That being said

* My Ceylon code itself is not optimal and can surely be optimized
* The raw performance of Ceylon itself is improving everyday

Moreover, if you are not interested in raw-FPS, but want to build a complex application with a 3D display, I suspect that it could be a very valid use case
because the static typing helps a lot.

Was it worthwhile ?
---------------------

Yes !

The three.js API is beautiful, and it was a rewarding experience to combine it with the [dynamic interfaces of Ceylon](http://ceylon-lang.org/documentation/1.1/tour/dynamic/).

Also, the metamodel of Ceylon allows interesting things (see what I've done with the *ShaderValue* and *ShaderValueBundle* classes)

It demonstrates the excellent interop capabilities of Ceylon with JS, even for this rather unusual and extreme use case.


Misc
--------------------
* The code was compiled with a bleeding edge recompiled Ceylon > 1.1.1
* To display the HTML page locally on your computer, you way have to launch you browser with an option such as `--allow-file-access-from-files`for Chrome.