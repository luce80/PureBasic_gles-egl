
; BEWARE: ONLY A FEW FUNCTIONS TESTED !!!! 

; == instructions ==
; use egl_Start(...) to create an OpenGL context and use egl_End() with the returned structure pointer to release it.
; 
; object = egl_Start(Window.i, ; "Window to assign the new context to"
; 			fb_list.i,; "Array with keys and values of desired frame buffer"
; 			ctx_list.i,; "Array with keys and values of desired context attributes"
; 			verbose.l = #False); "Print some information"


EnableExplicit

XIncludeFile "..\libsmacros.pbi"

	DeclareModule egl
		UseModule libsmacros

		#LibEGL = 5003 ; random number but MUST equal that of OpenLibrary(...)
		;
		Structure egl_object
			display.i ; "void *EGLDisplay"
			surface.i ; "void *EGLSurface"
			context.i ; "void *EGLContext"
		EndStructure
	
		;{ defines 1.0
		#EGL_ALPHA_SIZE =                    12321
		#EGL_BAD_ACCESS =                    12290
		#EGL_BAD_ALLOC =                     12291
		#EGL_BAD_ATTRIBUTE =                 12292
		#EGL_BAD_CONFIG =                    12293
		#EGL_BAD_CONTEXT =                   12294
		#EGL_BAD_CURRENT_SURFACE =           12295
		#EGL_BAD_DISPLAY =                   12296
		#EGL_BAD_MATCH =                     12297
		#EGL_BAD_NATIVE_PIXMAP =             12298
		#EGL_BAD_NATIVE_WINDOW =             12299
		#EGL_BAD_PARAMETER =                 12300
		#EGL_BAD_SURFACE =                   12301
		#EGL_BLUE_SIZE =                     12322
		#EGL_BUFFER_SIZE =                   12320
		#EGL_CONFIG_CAVEAT =                 12327
		#EGL_CONFIG_ID =                     12328
		#EGL_CORE_NATIVE_ENGINE =            12379
		#EGL_DEPTH_SIZE =                    12325
		#EGL_DONT_CARE =                     -1
		#EGL_DRAW =                          12377
		#EGL_EXTENSIONS =                    12373
		#EGL_FALSE =                         0
		#EGL_GREEN_SIZE =                    12323
		#EGL_HEIGHT =                        12374
		#EGL_LARGEST_PBUFFER =               12376
		#EGL_LEVEL =                         12329
		#EGL_MAX_PBUFFER_HEIGHT =            12330
		#EGL_MAX_PBUFFER_PIXELS =            12331
		#EGL_MAX_PBUFFER_WIDTH =             12332
		#EGL_NATIVE_RENDERABLE =             12333
		#EGL_NATIVE_VISUAL_ID =              12334
		#EGL_NATIVE_VISUAL_TYPE =            12335
		#EGL_NONE =                          12344
		#EGL_NON_CONFORMANT_CONFIG =         12369
		#EGL_NOT_INITIALIZED =               12289
		#EGL_NO_CONTEXT =                    0 ;EGL_CAST(EGLContext,0)
		#EGL_NO_DISPLAY =                    0 ;EGL_CAST(EGLDisplay,0)
		#EGL_NO_SURFACE =                    0 ;EGL_CAST(EGLSurface,0)
		#EGL_PBUFFER_BIT =                   1
		#EGL_PIXMAP_BIT =                    2
		#EGL_READ =                          12378
		#EGL_RED_SIZE =                      12324
		#EGL_SAMPLES =                       12337
		#EGL_SAMPLE_BUFFERS =                12338
		#EGL_SLOW_CONFIG =                   12368
		#EGL_STENCIL_SIZE =                  12326
		#EGL_SUCCESS =                       12288
		#EGL_SURFACE_TYPE =                  12339
		#EGL_TRANSPARENT_BLUE_VALUE =        12341
		#EGL_TRANSPARENT_GREEN_VALUE =       12342
		#EGL_TRANSPARENT_RED_VALUE =         12343
		#EGL_TRANSPARENT_RGB =               12370
		#EGL_TRANSPARENT_TYPE =              12340
		#EGL_TRUE =                          1
		#EGL_VENDOR =                        12371
		#EGL_VERSION =                       12372
		#EGL_WIDTH =                         12375
		#EGL_WINDOW_BIT =                    4
		;}
		;{ prototypes 1.0
		routine(#LibEGL,l,eglChooseConfig,(dpy.i, attrib_list.i, configs.i, config_size.l, num_config.i ))
		routine(#LibEGL,l,eglCopyBuffers,(dpy.i, surface.i, target.i ))
		routine(#LibEGL,i,eglCreateContext,(dpy.i, config.i, share_context.i, attrib_list.i ))
		routine(#LibEGL,i,eglCreatePbufferSurface,(dpy.i, config.i, attrib_list.i ))
		routine(#LibEGL,i,eglCreatePixmapSurface,(dpy.i, config.i, pixmap.i, attrib_list.i ))
		routine(#LibEGL,i,eglCreateWindowSurface,(dpy.i, config.i, win.i, attrib_list.i ))
		routine(#LibEGL,l,eglDestroyContext,(dpy.i, ctx.i ))
		routine(#LibEGL,l,eglDestroySurface,(dpy.i, surface.i ))
		routine(#LibEGL,l,eglGetConfigAttrib,(dpy.i, config.i, attribute.l, value.i ))
		routine(#LibEGL,l,eglGetConfigs,(dpy.i, configs.i, config_size.l, num_config.i ))
		routine(#LibEGL,i,eglGetCurrentDisplay,())
		routine(#LibEGL,i,eglGetCurrentSurface,(readdraw.l ))
		routine(#LibEGL,i,eglGetDisplay,(display_id.i ))
		routine(#LibEGL,l,eglGetError,( ))
		;__eglMustCastToProperFunctionPointerType eglGetProcAddress (const char *procname);
		routine(#LibEGL,l,eglInitialize,(dpy.i, major.i, minor.i ))
		routine(#LibEGL,l,eglMakeCurrent,(dpy.i, draw.i, readsurf.i, ctx.i ))
		routine(#LibEGL,l,eglQueryContext,(dpy.i, ctx.i, attribute.l, value.i ))
		routine_s(#LibEGL,l,eglQueryString,(dpy.i, name.l ))
		routine(#LibEGL,l,eglQuerySurface,(dpy.i, surface.i, attribute.l, value.i ))
		routine(#LibEGL,l,eglSwapBuffers,(dpy.i, surface.i ))
		routine(#LibEGL,l,eglTerminate,(dpy.i ))
		routine(#LibEGL,l,eglWaitGL,( ))
		routine(#LibEGL,l,eglWaitNative,(engine.l ))
		;}
		;{ defines 1.1
		#EGL_BACK_BUFFER =                   12420
		#EGL_BIND_TO_TEXTURE_RGB =           12345
		#EGL_BIND_TO_TEXTURE_RGBA =          12346
		#EGL_CONTEXT_LOST =                  12302
		#EGL_MIN_SWAP_INTERVAL =             12347
		#EGL_MAX_SWAP_INTERVAL =             12348
		#EGL_MIPMAP_TEXTURE =                12418
		#EGL_MIPMAP_LEVEL =                  12419
		#EGL_NO_TEXTURE =                    12380
		#EGL_TEXTURE_2D =                    12383
		#EGL_TEXTURE_FORMAT =                12416
		#EGL_TEXTURE_RGB =                   12381
		#EGL_TEXTURE_RGBA =                  12382
		#EGL_TEXTURE_TARGET =                12417
		;}
		;{ prototypes 1.1
		routine(#LibEGL,l,eglBindTexImage,(dpy.i, surface.i, buffer.l ))
		routine(#LibEGL,l,eglReleaseTexImage,(dpy.i, surface.i, buffer.l ))
		routine(#LibEGL,l,eglSurfaceAttrib,(dpy.i, surface.i, attribute.l, value.l ))
		routine(#LibEGL,l,eglSwapInterval,(dpy.i, interval.l ))
		;}
		;{ defines 1.2
		#EGL_ALPHA_FORMAT =                  12424
		#EGL_ALPHA_FORMAT_NONPRE =           12427
		#EGL_ALPHA_FORMAT_PRE =              12428
		#EGL_ALPHA_MASK_SIZE =               12350
		#EGL_BUFFER_PRESERVED =              12436
		#EGL_BUFFER_DESTROYED =              12437
		#EGL_CLIENT_APIS =                   12429
		#EGL_COLORSPACE =                    12423
		#EGL_COLORSPACE_sRGB =               12425
		#EGL_COLORSPACE_LINEAR =             12426
		#EGL_COLOR_BUFFER_TYPE =             12351
		#EGL_CONTEXT_CLIENT_TYPE =           12439
		#EGL_DISPLAY_SCALING =               10000
		#EGL_HORIZONTAL_RESOLUTION =         12432
		#EGL_LUMINANCE_BUFFER =              12431
		#EGL_LUMINANCE_SIZE =                12349
		#EGL_OPENGL_ES_BIT =                 1
		#EGL_OPENVG_BIT =                    2
		#EGL_OPENGL_ES_API =                 12448
		#EGL_OPENVG_API =                    12449
		#EGL_OPENVG_IMAGE =                  12438
		#EGL_PIXEL_ASPECT_RATIO =            12434
		#EGL_RENDERABLE_TYPE =               12352
		#EGL_RENDER_BUFFER =                 12422
		#EGL_RGB_BUFFER =                    12430
		#EGL_SINGLE_BUFFER =                 12421
		#EGL_SWAP_BEHAVIOR =                 12435
		#EGL_UNKNOWN =                       -1 ;EGL_CAST(EGLint,-1)
		#EGL_VERTICAL_RESOLUTION =           12433
		;}
		;{ prototypes 1.2
		routine(#LibEGL,l,eglBindAPI,(api.l ))
		routine(#LibEGL,l,eglQueryAPI,())
		routine(#LibEGL,i,eglCreatePbufferFromClientBuffer,(dpy.i, buftype.l, buffer.i, config.i, attrib_list.i ))
		routine(#LibEGL,l,eglReleaseThread,())
		routine(#LibEGL,l,eglWaitClient,( ))
		;}
		;{ defines 1.3
		#EGL_CONFORMANT =                    12354
		#EGL_CONTEXT_CLIENT_VERSION =        12440
		#EGL_MATCH_NATIVE_PIXMAP =           12353
		#EGL_OPENGL_ES2_BIT =                4
		#EGL_VG_ALPHA_FORMAT =               12424
		#EGL_VG_ALPHA_FORMAT_NONPRE =        12427
		#EGL_VG_ALPHA_FORMAT_PRE =           12428
		#EGL_VG_ALPHA_FORMAT_PRE_BIT =       64
		#EGL_VG_COLORSPACE =                 12423
		#EGL_VG_COLORSPACE_sRGB =            12425
		#EGL_VG_COLORSPACE_LINEAR =          12426
		#EGL_VG_COLORSPACE_LINEAR_BIT =      32
		;}
		;{ defines 1.4
		#EGL_DEFAULT_DISPLAY =               0 ;EGL_CAST(EGLNativeDisplayType,0)
		#EGL_MULTISAMPLE_RESOLVE_BOX_BIT =   512
		#EGL_MULTISAMPLE_RESOLVE =           12441
		#EGL_MULTISAMPLE_RESOLVE_DEFAULT =   12442
		#EGL_MULTISAMPLE_RESOLVE_BOX =       12443
		#EGL_OPENGL_API =                    12450
		#EGL_OPENGL_BIT =                    8
		#EGL_SWAP_BEHAVIOR_PRESERVED_BIT =   1024
		;}
		;{ prototypes 1.4
		routine(#LibEGL,i,eglGetCurrentContext,( ))
		;}
		;{ defines 1.5
		#EGL_CONTEXT_MAJOR_VERSION =         12440
		#EGL_CONTEXT_MINOR_VERSION =         12539
		#EGL_CONTEXT_OPENGL_PROFILE_MASK =   12541
		#EGL_CONTEXT_OPENGL_RESET_NOTIFICATION_STRATEGY = 12733
		#EGL_NO_RESET_NOTIFICATION =         12734
		#EGL_LOSE_CONTEXT_ON_RESET =         12735
		#EGL_CONTEXT_OPENGL_CORE_PROFILE_BIT = 1
		#EGL_CONTEXT_OPENGL_COMPATIBILITY_PROFILE_BIT = 2
		#EGL_CONTEXT_OPENGL_DEBUG =          12720
		#EGL_CONTEXT_OPENGL_FORWARD_COMPATIBLE = 12721
		#EGL_CONTEXT_OPENGL_ROBUST_ACCESS =  12722
		#EGL_OPENGL_ES3_BIT =                64
		#EGL_CL_EVENT_HANDLE =               12444
		#EGL_SYNC_CL_EVENT =                 12542
		#EGL_SYNC_CL_EVENT_COMPLETE =        12543
		#EGL_SYNC_PRIOR_COMMANDS_COMPLETE =  12528
		#EGL_SYNC_TYPE =                     12535
		#EGL_SYNC_STATUS =                   12529
		#EGL_SYNC_CONDITION =                12536
		#EGL_SIGNALED =                      12530
		#EGL_UNSIGNALED =                    12531
		#EGL_SYNC_FLUSH_COMMANDS_BIT =       1
		;#EGL_FOREVER =                       0xFFFFFFFFFFFFFFFFull
		#EGL_TIMEOUT_EXPIRED =               12533
		#EGL_CONDITION_SATISFIED =           12534
		#EGL_NO_SYNC =                       0 ;EGL_CAST(EGLSync,0)
		#EGL_SYNC_FENCE =                    12537
		#EGL_GL_COLORSPACE =                 12445
		#EGL_GL_COLORSPACE_SRGB =            12425
		#EGL_GL_COLORSPACE_LINEAR =          12426
		#EGL_GL_RENDERBUFFER =               12473
		#EGL_GL_TEXTURE_2D =                 12465
		#EGL_GL_TEXTURE_LEVEL =              12476
		#EGL_GL_TEXTURE_3D =                 12466
		#EGL_GL_TEXTURE_ZOFFSET =            12477
		#EGL_GL_TEXTURE_CUBE_MAP_POSITIVE_X = 12467
		#EGL_GL_TEXTURE_CUBE_MAP_NEGATIVE_X = 12468
		#EGL_GL_TEXTURE_CUBE_MAP_POSITIVE_Y = 12469
		#EGL_GL_TEXTURE_CUBE_MAP_NEGATIVE_Y = 12470
		#EGL_GL_TEXTURE_CUBE_MAP_POSITIVE_Z = 12471
		#EGL_GL_TEXTURE_CUBE_MAP_NEGATIVE_Z = 12472
		#EGL_IMAGE_PRESERVED =               12498
		#EGL_NO_IMAGE =                      0 ;EGL_CAST(EGLImage,0)
		;}
		;{ prototypes 1.5
		routine(#LibEGL,i,eglCreateSync,(dpy.i, type.l, attrib_list.i ))
		routine(#LibEGL,l,eglDestroySync,(dpy.i, sync.i ))
		routine(#LibEGL,l,eglClientWaitSync,(dpy.i, sync.i, flags.l, timeout.d))
		routine(#LibEGL,l,eglGetSyncAttrib,(dpy.i, sync.i, attribute.l, value.i ))
		routine(#LibEGL,i,eglCreateImage,(dpy.i, ctx.i, target.l, buffer.i, attrib_list.i ))
		routine(#LibEGL,l,eglDestroyImage,(dpy.i, image.i ))
		routine(#LibEGL,i,eglGetPlatformDisplay,(platform.l, native_display.i, attrib_list.i ))
		routine(#LibEGL,i,eglCreatePlatformWindowSurface,(dpy.i, config.i, native_window.i, attrib_list.i ))
		routine(#LibEGL,i,eglCreatePlatformPixmapSurface,(dpy.i, config.i, native_pixmap.i, attrib_list.i))
		routine(#LibEGL,l,eglWaitSync,(dpy.i, sync.i, flags.l ))
		;}

		;Declare.s egl_GetErrorString(error.l)
		;Declare check_error(msg.s)
		Declare.i egl_Start(Window.i, fb_list.i, ctx_list.i, verbose.l = #False)
		Declare egl_End(*object.egl_object)
		
	EndDeclareModule
	
	Module egl
	
		routine_proc_s(eglQueryString,(dpy.i, name.l))

		Procedure.s egl_GetErrorString(error.l)
			Protected result.s
			Select error
				Case #EGL_SUCCESS : result = "Success"
				Case #EGL_NOT_INITIALIZED : result = "EGL is not or could not be initialized"
				Case #EGL_BAD_ACCESS : result = "EGL cannot access a requested resource"
				Case #EGL_BAD_ALLOC : result = "EGL failed to allocate resources for the requested operation"
				Case #EGL_BAD_ATTRIBUTE : result = "An unrecognized attribute or attribute value was passed in the attribute list"
				Case #EGL_BAD_CONTEXT : result = "An EGLContext argument does not name a valid EGL rendering context"
				Case #EGL_BAD_CONFIG : result = "An EGLConfig argument does not name a valid EGL frame buffer configuration"
				Case #EGL_BAD_CURRENT_SURFACE : result = "The current surface of the calling thread is a window pixel buffer or pixmap that is no longer valid"
		 		Case #EGL_BAD_DISPLAY : result = "An EGLDisplay argument does not name a valid EGL display connection"
				Case #EGL_BAD_SURFACE : result = "An EGLSurface argument does not name a valid surface configured for GL rendering"
				Case #EGL_BAD_MATCH : result = "Arguments are inconsistent"
				Case #EGL_BAD_PARAMETER : result = "One or more argument values are invalid"
				Case #EGL_BAD_NATIVE_PIXMAP : result = "A NativePixmapType argument does not refer to a valid native pixmap"
				Case #EGL_BAD_NATIVE_WINDOW : result = "A NativeWindowType argument does not refer to a valid native window"
				Case #EGL_CONTEXT_LOST : result = "The application must destroy all contexts and reinitialise"
			Default : result = "UNKNOWN EGL ERROR"
			EndSelect
			ProcedureReturn result
		EndProcedure
		;FIXTHIS: CompilerIf not debugging Macro throw_error(msg.s) : EndMacro
		Procedure check_error(msg.s)
			Protected error.l, error_string.s
			error = eglGetError()
			If error <> #EGL_SUCCESS
				error_string = egl_GetErrorString(error)
				Debug "libEGL ERROR: "+error+" "+error_string+". "+msg
			EndIf
		EndProcedure

		Global egl_obj.egl_object

		; some comments taken from eglIntro.html
		;	"Creates and assigns an OpenGL context to given window"
		Procedure.i egl_Start(Window.i, ; "Window to assign the new context to"
			fb_list.i,; "Array with keys and values of desired frame buffer"
			ctx_list.i,; "Array with keys and values of desired context attributes"
			verbose.l = #False); "Print some information"
			Protected NULL.l = 0
	
	; 		If Not find ctx_list: reduce ctx_list EGL_CONTEXT_CLIENT_VERSION [
	; 			; try an high version
	; 			attempt [insert find ctx_list EGL_NONE [EGL_CONTEXT_CLIENT_VERSION 2]]
	; 		]
	; 
			;/* get an EGL display connection */
			egl_obj\display = eglGetDisplay (#EGL_DEFAULT_DISPLAY)
			check_error ("eglGetDisplay")
	
			;/* initialize the EGL display connection */
			Protected major.i, minor.i
			eglInitialize (egl_obj\display, @major, @minor)
			check_error ("eglInitialize")
			If verbose
				Debug "EGL version: " +major+ "." +minor
			EndIf
	
			; optional ?
			;eglBindAPI (#EGL_OPENGL_ES_API)
			;check_error ("eglBindAPI")
	
			; return total number of possible configs
			Protected num_config.i
			eglGetConfigs (egl_obj\display, NULL, 0, @num_config)
			check_error ("eglGetConfigs")
			If verbose
				Debug "total number of possible EGL frame buffer configs: "+ num_config
			EndIf
			If num_config = 0
				Debug "No possible EGL frame buffer configuration exists."
				End
			EndIf
	
			;/* get an appropriate EGL frame buffer configuration */
	
			; return total number of configs that match given attributes
			eglChooseConfig (egl_obj\display, fb_list, NULL, 0, @num_config)
			check_error ("eglChooseConfig GET")
			If verbose
				Debug "total number of configs that match given attributes: " +num_config
			EndIf
			; fall down to a possible config
			If num_config = 0
				PokeL(fb_list, #EGL_NONE)
				eglChooseConfig (egl_obj\display, fb_list, NULL, 0, @num_config)
				check_error ("eglChooseConfig GET")
			EndIf
	
			; alloc mem for the possible configs
			Dim configs.i(num_config)
			
			; fill configs array of matching configs
			eglChooseConfig (egl_obj\display, fb_list, configs(), num_config, @num_config)
			check_error ("eglChooseConfig UPD")
	
			;/* create an EGL rendering context */
			; try to find a valid config. Seems that last ones are better ? so reverse the list ? ; FIX ME: should try to find the best match
			Protected config, last_error, elem, error, error_string.s
			config = 0
			last_error = 0
			For elem = 0 To num_config
				config = configs (elem)
				egl_obj\context = eglCreateContext (egl_obj\display, config, #EGL_NO_CONTEXT, ctx_list)
				error = eglGetError()
				If error = #EGL_SUCCESS
					Break
				Else
					last_error = error
				EndIf
			Next
			If last_error > 0
				error_string = egl_GetErrorString(last_error)
				Debug "libEGL ERROR: "+last_error+" "+error_string+". "+msg
	
				End
				
			EndIf
	
			; some information for the curious
			Protected result.i
			If verbose
				eglQueryContext (egl_obj\display, egl_obj\context, #EGL_CONFIG_ID, @result)
				Debug "EGL_CONFIG_ID " +result
				eglQueryContext (egl_obj\display, egl_obj\context, #EGL_CONTEXT_CLIENT_TYPE, @result)
				Debug "EGL_CONTEXT_CLIENT_TYPE " +result ; attempt [form first back find eglblock120 result/value]]
				eglQueryContext (egl_obj\display, egl_obj\context, #EGL_CONTEXT_CLIENT_VERSION, @result)
				Debug "EGL_CONTEXT_CLIENT_VERSION " +result
			EndIf
	
			;/* create an EGL window surface */
			egl_obj\surface = eglCreateWindowSurface (egl_obj\display, config, Window, NULL)
			check_error ("eglCreateWindowSurface")
	
			;/* connect the context to the surface */
			eglMakeCurrent (egl_obj\display, egl_obj\surface, egl_obj\surface, egl_obj\context)
			check_error ("eglMakeCurrent")
			
			; some information for the curious
			If verbose
				Debug "GL_VERSION: "+ gles::glGetString (#GL_VERSION)
				Debug "GL_VENDOR: "+ gles::glGetString (#GL_VENDOR)
				Debug "GL_RENDERER: "+ gles::glGetString (#GL_RENDERER)
				Debug "GL_SHADING_LANGUAGE_VERSION: "+ gles::glGetString (35724);#GL_SHADING_LANGUAGE_VERSION)
				Debug ~"GL_EXTENSIONS:\n"+ ReplaceString(gles::glGetString (#GL_EXTENSIONS)," ",~"\n")
			EndIf
	
			eglSwapInterval (egl_obj\display, 1)
	
			ProcedureReturn @egl_obj
		EndProcedure
	
		;"Free EGL resources"
		Procedure egl_End(*object.egl_object)
			eglMakeCurrent (*object\display, #EGL_NO_SURFACE, #EGL_NO_SURFACE, #EGL_NO_CONTEXT)
			eglDestroyContext (*object\display, *object\context)
			eglDestroySurface (*object\display, *object\surface)
			eglTerminate (*object\display)
		EndProcedure
	EndModule

; IDE Options = PureBasic 5.73 LTS (Windows - x64)
; CursorPosition = 316
; FirstLine = 41
; Folding = BAyAw
; EnableXP