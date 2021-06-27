
;
; Simple test for PureBasic binding for libGLES and libEGL shared libraries
;
; Please forgive any "inconsistencies" since I am not a PureBasic expert
;
; title:
; author:
; date:
; version:
; history:
; license:
;
EnableExplicit

	;{ load libs and modules
	IncludeFile "..\libsmacros.pbi"
	Define libpath.s, libname.s, libfullname.s

	libpath = "E:\Programmi\Web\FireFox\"
	#Libmoz = 1
	libname = "mozglue.dll" ; FIX ME: CompilerIf firefox... or place it in program folder
	libsmacros::OpenLib(#Libmoz,libname,libpath)
	#LibGLES = 5002 ; random number but MUST be equal to the one in libgles.pbi
	libname = "libGLESv2.DLL" ; FIX ME: CompilerIf Windows...
	libsmacros::OpenLib(#LibGLES,libname,libpath)
	#LibEGL = 5003 ; random number but MUST be equal to the one in libegl.pbi
	libname = "libEGL.DLL" ; FIX ME: CompilerIf Windows...
	libsmacros::OpenLib(#LibEGL,libname,libpath)

	XIncludeFile "libgles.pbi"
	UseModule gles
	XIncludeFile "libegl.pbi"
	UseModule egl
	;}

	Enumeration
		#Window
		#GLESCanvas
	EndEnumeration

	Procedure SetupGL()
		Global vertexShaderSource.s = ~"#version 300 es\n"+
		    ~"layout (location = 0) in vec3 va_Position;\n"+
		    ~"void main()\n"+
		    ~"{\n"+
			  ;// alter points position to check that they are passed To shader
			  ~"   gl_Position = vec4(va_Position.x, va_Position.y / 1.50, 0,1.0);\n"+
		    ~"}\n";
		Global fragmentShaderSource.s = ~"#version 300 es\n"+
				~"\n"+
				~"precision highp float;\n"+
		    ~"out vec4 FragColor;\n"+
		    ~"void main()\n"+
		    ~"{\n"+
		    ~"   FragColor = vec4(0.0f, 0.5f, 0.2f, 1.0f);\n"+
		    ~"}\n";
		; 
		
		DataSection
			framebuffer_attribs:
			Data.l 	#EGL_SURFACE_TYPE, #EGL_WINDOW_BIT,
							#EGL_NONE, #EGL_NONE

			context_attribs:
			Data.l 	#EGL_CONTEXT_CLIENT_VERSION, 3,
							#EGL_NONE, #EGL_NONE
		EndDataSection
	
		Global *egl_obj.egl_object
		*egl_obj = egl_Start(WindowID(#Window), ?framebuffer_attribs, ?context_attribs, #False)
		
		glViewport (0, 0, 500, 200) ; optional if viewport is entire window
		
		Define vshader = make_shader(#GL_VERTEX_SHADER,"string",vertexShaderSource)
		Define fshader = make_shader(#GL_FRAGMENT_SHADER,"string",fragmentShaderSource)
		
		Global program = make_program (vshader, fshader)
		
		;     // set up vertex Data (And buffer(s)) And configure vertex attributes
		;     // ------------------------------------------------------------------
		DataSection
			datavertices:
			Data.f	-1.0, -1.0, 0.0,
							 1.0, -1.0, 0.0,
							-0.0,  1.0, 0.0
		EndDataSection
		
		Global vertices = ?datavertices

		DataSection
			dataindices:
			Data.l 	0, 1, 2
		EndDataSection
		
		Global indices = ?dataindices
	
		; make vertex buffer object and upload data
		Define VBO.l
		make_buffer (#GL_ARRAY_BUFFER, #GL_STATIC_DRAW, 12 * SizeOf(float), vertices, @VBO)
	
		set_vertex_attribute(program, "va_Position", VBO, 3) ; 3 elements (x, y, z) per vertex
	EndProcedure
	
	Procedure DrawTriangle()

		glClearColor (1.00, 0.0, 0.0, 1.0)
		glClear (#GL_COLOR_BUFFER_BIT)
		
		glUseProgram (program)
		
		; draw triangle made of 3 points (indices) from the given indices array with current in-use shader
		glDrawElements (#GL_TRIANGLES, 3, #GL_UNSIGNED_INT, indices)
	EndProcedure

	; // settings
	#WIN_WIDTH = 530;
	#WIN_HEIGHT = 320;
	; 
	
	OpenWindow(#Window, 0, 0, 530, 320, "LibGLES & LibEGL Hello Triangle", #PB_Window_SystemMenu | #PB_Window_ScreenCentered)

	Gadget(#GLESCanvas,20,20,500,200)

	SetupGL()
	;AddWindowTimer(0, 1, 16) ; about 60 fps
	
	Define Event
	Repeat
	  Event = WaitWindowEvent()
	  
		DrawTriangle()
		Gadget_SwapBuffers(#GLESCanvas)

; 	   Select Event
; 	    Case #PB_Event_Timer
; 	      If EventTimer() = 1
; 	        DrawTriangle()
; 	      EndIf
; 	  EndSelect
	  
	Until Event = #PB_Event_CloseWindow
	
	egl_end(*egl_obj)
	
	CloseLibrary(#PB_All)
	
; IDE Options = PureBasic 5.73 LTS (Windows - x64)
; CursorPosition = 41
; FirstLine = 32
; Folding = x
; EnableXP