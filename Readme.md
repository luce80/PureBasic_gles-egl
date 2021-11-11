### PureBasic bindings for the libGLES and libEGL shared libraries

You can find the shared libraries in any distribution of FireFox and Chrome browsers and probably also in other "Chromium" browsers. The FireFox libGLES.dll also needs the mozglue.dll that is in the same directory.

To simplify coding a bit a few utility functions are provided.
For the LibEGL library:
 - egl_Start(...)
 - egl_End(...)

for the libGLES library:

 - make_shader(...)
 - make_program(...)
 - make_buffer(...)
 - set\_vertex\_attribute(...)

 - Gadget(...). Creates a CanvasGadget with 3D rendering
 - Gadget_SwapBuffers(...). Copy content of framebuffer to our custom CanvasGadget

Also a "full" example is provided.
