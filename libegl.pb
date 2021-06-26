EnableExplicit

XIncludeFile "..\libsmacros.pb"

	DeclareModule egl
		UseModule libsmacros

		#LibEGL = 5003 ; random number but MUST equal that of OpenLibrary(...)
		;
		Structure egl_object
			display.i ; "void *EGLDisplay"
			surface.i ; "void *EGLSurface"
			context.i ; "void *EGLContext"
		EndStructure
	
		;- defines
		#EGL_CONFIG_ID =                     12328
		#EGL_CONTEXT_CLIENT_TYPE =           12439
		#EGL_CONTEXT_CLIENT_VERSION =        12440
		#EGL_NONE =                          12344
		#EGL_NO_CONTEXT =                    0
		#EGL_NO_SURFACE =                    0
		#EGL_SUCCESS =                       12288
		#EGL_BAD_DISPLAY =                   12296
		#EGL_DEFAULT_DISPLAY =               0 ;EGL_CAST(EGLNativeDisplayType,0)
		#EGL_SURFACE_TYPE =                  12339
		#EGL_WINDOW_BIT =                    4
		;
		routine(#LibEGL,l,eglChooseConfig,(dpy.i, attrib_list.i, configs.i, config_size.l, num_config.i))
		routine(#LibEGL,i,eglCreateContext,(dpy.i, config.i, share_context.i, attrib_list.i))
		routine(#LibEGL,i,eglCreateWindowSurface,(dpy.i, config.i, win.i, attrib_list.i))
		routine(#LibEGL,l,eglDestroyContext,(dpy.i, ctx.i))
		routine(#LibEGL,l,eglDestroySurface,(dpy.i, readsurf.i))
		routine(#LibEGL,l,eglGetConfigs,(dpy.i, configs.i, config_size.l, num_config.i))
		routine(#LibEGL,i,eglGetDisplay,(display_id.i))
		routine(#LibEGL,l,eglGetError,())
		routine(#LibEGL,l,eglInitialize,(dpy.i, major.i, minor.i))
		routine(#LibEGL,l,eglMakeCurrent,(dpy.i, draw.i, readsurf.i, ctx.i))
		routine(#LibEGL,l,eglQueryContext,(dpy.i, ctx.i, attribute.l, value.i))
		routine(#LibEGL,l,eglSwapBuffers,(dpy.i, surface.i))
		routine(#LibEGL,l,eglSwapInterval,(dpy.i, interval.l))
		routine(#LibEGL,l,eglTerminate,(dpy.i))

		;Declare.s egl_GetErrorString(error.l)
		;Declare check_error(msg.s)
		Declare.i egl_Start(Window.i, fb_list.i, ctx_list.i, verbose.l = #False)
		Declare egl_End(*object.egl_object)
	EndDeclareModule
	
	Module egl
	

		Procedure.s egl_GetErrorString(error.l)
			Protected result.s
			Select error
				Case #EGL_SUCCESS : result = "Success"
	; 			Case #EGL_NOT_INITIALIZED : result = "EGL is not or could not be initialized"
	; 			Case #EGL_BAD_ACCESS : result = "EGL cannot access a requested resource"
	; 			Case #EGL_BAD_ALLOC : result = "EGL failed to allocate resources for the requested operation"
	; 			Case #EGL_BAD_ATTRIBUTE : result = "An unrecognized attribute or attribute value was passed in the attribute list"
	; 			Case #EGL_BAD_CONTEXT : result = "An EGLContext argument does not name a valid EGL rendering context"
	; 			Case #EGL_BAD_CONFIG : result = "An EGLConfig argument does not name a valid EGL frame buffer configuration"
	; 			Case #EGL_BAD_CURRENT_SURFACE : result = "The current surface of the calling thread is a window pixel buffer or pixmap that is no longer valid"
		 		Case #EGL_BAD_DISPLAY : result = "An EGLDisplay argument does not name a valid EGL display connection"
	; 			Case #EGL_BAD_SURFACE : result = "An EGLSurface argument does not name a valid surface configured for GL rendering"
	; 			Case #EGL_BAD_MATCH : result = "Arguments are inconsistent"
	; 			Case #EGL_BAD_PARAMETER : result = "One or more argument values are invalid"
	; 			Case #EGL_BAD_NATIVE_PIXMAP : result = "A NativePixmapType argument does not refer to a valid native pixmap"
	; 			Case #EGL_BAD_NATIVE_WINDOW : result = "A NativeWindowType argument does not refer to a valid native window"
	; 			Case #EGL_CONTEXT_LOST : result = "The application must destroy all contexts and reinitialise"
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
	; 		fb_list: block-To-struct fb_list
	; 		ctx_list: block-To-struct ctx_list
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
				;Debug "GL_SHADING_LANGUAGE_VERSION: "+ gles::glGetString (#GL_SHADING_LANGUAGE_VERSION)
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
; CursorPosition = 199
; FirstLine = 143
; Folding = vho
; EnableXP