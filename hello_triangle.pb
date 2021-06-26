
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
	Define libpath.s, libname.s, libfullname.s

	libpath = "E:\Programmi\Web\FireFox\"
	#Libmoz = 1
	libname = "mozglue.dll" ; FIX ME: CompilerIf firefox... or place it in program folder
	libfullname = libpath+libname
	If OpenLibrary(#Libmoz, libfullname) = 0
		MessageRequester("ERROR","Can not find or open "+libfullname ,#PB_MessageRequester_Error)
		End 1
	EndIf
	#LibGLES = 5002 ; random number but MUST be equal to the one in libgles.pb
	libname = "libGLESv2.DLL" ; FIX ME: CompilerIf Windows...
	libfullname = libpath+libname
	If OpenLibrary(#LibGLES, libfullname) = 0
		MessageRequester("ERROR","Can not find or open "+libfullname ,#PB_MessageRequester_Error)
		End 1
	EndIf
	#LibEGL = 5003 ; random number but MUST be equal to the one in libgles.pb
	libname = "libEGL.DLL" ; FIX ME: CompilerIf Windows...
	libfullname = libpath+libname
	If OpenLibrary(#LibEGL, libfullname) = 0
		MessageRequester("ERROR","Can not find or open "+libfullname ,#PB_MessageRequester_Error)
		End 1
	EndIf

	XIncludeFile "libgles.pbi"
	UseModule gles
	XIncludeFile "libegl.pbi"
	UseModule egl
	;}

	Enumeration
		#Window
		#Canvas
		#GLESCanvas
		#Image
	EndEnumeration

	;InitSprite()
	; // settings
	#WIN_WIDTH = 530;
	#WIN_HEIGHT = 320;
	; 
	
	OpenWindow(#Window, 0, 0, 530, 320, "LibGLES & LibEGL Hello Triangle", #PB_Window_SystemMenu | #PB_Window_ScreenCentered)
	;CanvasGadget(#Canvas,20,20,500,200)
	Gadget(#GLESCanvas,20,20,500,200)

	;Global imagenum = CreateImage(#PB_Any, GadgetWidth(#Canvas), GadgetHeight(#Canvas), 32)
	
	;Define canvas = CanvasOutput(0)
	
	Procedure gles_canvas_SwapBuffers(canvas)
		If StartDrawing(CanvasOutput(canvas))
			glReadPixels (0, 0, GadgetWidth(canvas), GadgetHeight(canvas), #GL_RGBA, #GL_UNSIGNED_BYTE, GetGadgetAttribute(canvas,#PB_Canvas_Image))
			StopDrawing()
		EndIf
	EndProcedure
	
	
	Procedure SetupGL()
		Global vertexShaderSource.s = ~"#version 300 es\n"+
		    ~"layout (location = 0) in vec3 aPos;\n"+
		    ~"void main()\n"+
		    ~"{\n"+
		    ~"   gl_Position = vec4(aPos.x, aPos.y, aPos.z, 1.0);\n"+
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
		EndDataSection
		DataSection
			context_attribs:
			Data.l 	#EGL_CONTEXT_CLIENT_VERSION, 3,
							#EGL_NONE, #EGL_NONE
		EndDataSection
	
		Global *egl_obj.egl_object
		*egl_obj = egl_Start(WindowID(0), ?framebuffer_attribs, ?context_attribs, #False)
		
		;glViewport (0, 0, 530, 320) ; optional if viewport is entire window
		
		Define vshader = make_shader(#GL_VERTEX_SHADER,"string",vertexShaderSource)
		Define fshader = make_shader(#GL_FRAGMENT_SHADER,"string",fragmentShaderSource)
		
		Global program = make_program (vshader, fshader)
		
		;     // set up vertex Data (And buffer(s)) And configure vertex attributes
		;     // ------------------------------------------------------------------
		Define i
		Dim vertices.f(12-1)
		Restore datavertices
		For i = 0 To 12-1
			Read.f vertices(i)
		Next
		DataSection
			datavertices:
			Data.f	 0.5,  0.5, 0.0,  ;// top right
							 0.5, -0.5, 0.0,  ;// bottom right
							-0.5, -0.5, 0.0,  ;// bottom left
							-0.5,  0.5, 0.0   ;// top left 
		EndDataSection
		
	
		Global Dim indices.l(3-1)
		Restore dataindices
		For i = 0 To 3-1
			Read.l indices(i)
		Next
		DataSection
			dataindices:
			Data.l 	0, 1, 3;,  ;// first Triangle
							;1, 2, 3   ;// second Triangle
		EndDataSection
	
		Define VBO.l
		make_buffer (#GL_ARRAY_BUFFER, #GL_STATIC_DRAW, 12 * SizeOf(float), vertices(), @VBO)
		;make_buffer (#GL_ARRAY_BUFFER, #GL_STATIC_DRAW, 12 * SizeOf(float), ?datavertices, @VBO)
	
		set_vertex_attribute(program, "aPos", VBO, 3)
	EndProcedure
	
	Procedure DrawTriangle()
		Shared indices()

		glClearColor (1.00, 0.0, 0.0, 1.0)
		glClear (#GL_COLOR_BUFFER_BIT)
		
		glUseProgram (program)
		
		; draw triangle made of 3 points (indices) from the given indices array with current in-use shader
		glDrawElements (#GL_TRIANGLES, 3, #GL_UNSIGNED_INT, indices())
		;glDrawElements (#GL_TRIANGLES, 3, #GL_UNSIGNED_INT, ?dataindices)
		;eglSwapBuffers(*egl_obj\display, *egl_obj\surface)
	EndProcedure
	
	SetupGL()
	;AddWindowTimer(0, 1, 16) ; about 60 fps
	
	Global Event, buf
	Repeat
	  Event = WaitWindowEvent()
	  
		DrawTriangle()
		Gadget_SwapBuffers(#GLESCanvas)
; 		If StartDrawing(ImageOutput(imagenum))
; 			glReadPixels (0, 0, GadgetWidth(#Canvas), GadgetHeight(#Canvas), #GL_BGRA, #GL_UNSIGNED_BYTE, DrawingBuffer())
; 			;glReadPixels (0, 0, GadgetWidth(#Canvas), GadgetHeight(#Canvas), #GL_BGR, #GL_UNSIGNED_BYTE, GetGadgetAttribute(#Canvas, #PB_Canvas_Image))
; 			;glReadPixels (0, 0, GadgetWidth(#Canvas), GadgetHeight(#Canvas), #GL_BGR, #GL_UNSIGNED_BYTE, ImageID(#Image))
; 			;DrawImage(ImageID(#Image),0,0)
; 			StopDrawing()
; 		EndIf
; 		If StartDrawing(CanvasOutput(#Canvas))
; 			DrawImage(ImageID(imagenum),0,0)
; 			StopDrawing()
; 		EndIf

; 	   Select Event
; 	    Case #PB_Event_Timer
; 	      If EventTimer() = 1
; 	        DrawTriangle()
; 	      EndIf
; 	  EndSelect
	  
	Until Event = #PB_Event_CloseWindow
	
	egl_end(*egl_obj)
	
	CloseLibrary(#LibEGL)
	CloseLibrary(#LibGLES)
	CloseLibrary(#Libmoz)
	
; IDE Options = PureBasic 5.73 LTS (Windows - x64)
; CursorPosition = 167
; FirstLine = 64
; Folding = x6
; EnableXP