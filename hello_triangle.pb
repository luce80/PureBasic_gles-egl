
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
		#Window2
		#GLESCanvas
		#text1
		#trackbar1
		#trackbar2
		#timer2
	EndEnumeration

	;{ fragment shader
	Global woah_circle.s = ~"//http://glslsandbox.com/e#58416.0 woah circle\n"+
	~"	#ifdef GL_ES\n"+
	~"	precision highp float;\n"+
	~"	#endif\n"+

	~"	uniform float u_Time;\n"+
	~"	uniform vec2 u_Resolution;\n"+
		
	~"	uniform float u_speed;\n"+
	~"	uniform float u_radius;\n"+

	~"	void main() {\n"+

	~"		float t = u_Time * u_speed;\n"+
	~"		vec2 r = u_Resolution,\n"+
	~"		     o = gl_FragCoord.xy - r/2.;\n"+
	~"		o = vec2(length(o) / r.y - u_radius, atan(o.y,o.x));\n"+
	~"		vec4 s = 0.08*cos(1.5*vec4(0,1,2,3) + t + o.y + sin(o.y) * cos(t)),\n"+
	~"		     e = s.yzwx, \n"+
	~"		     f = max(o.x-s,e-o.x);\n"+

	~"		gl_FragColor = dot(clamp(f*r.y,0.,1.), 72.*(s-e)) * (s-.1) + f;\n"+
	~"		gl_FragColor.a = 1.0;\n"+
	~"	}\n"
	;}

	Global sld_speed.f = 0.004, sld_radius.f = 0.3

	; // settings
	#WIN_WIDTH = 530;
	#WIN_HEIGHT = 320;
	; 
	Procedure OpenWindow_2nd()
		OpenWindow(#Window2, 0, 0, 530, 400, "LibGLES & LibEGL Hello Triangle", #PB_Window_SystemMenu | #PB_Window_ScreenCentered)
		TextGadget(#text1, 0,0,210,20,"Use sliders to control speed and radius")
		TrackBarGadget(#trackbar1, 10, 20, 100, 25, 0, 100)
		SetGadgetState(#trackbar1,20)
		TrackBarGadget(#trackbar2, 10, 45, 100, 25, 0, 100)
		SetGadgetState(#trackbar2,30)
	
		Gadget(#GLESCanvas,20,120,500,200)
	EndProcedure

	Procedure Window_2nd_Events(event)
		Select event
			Case #PB_Event_CloseWindow
				ProcedureReturn #False
				
			Case #PB_Event_Gadget
				Select EventGadget()
					Case #trackbar1 : sld_speed = 0.02 * ((GetGadgetState(#trackbar1) / 100.0))
					Case #trackbar2 : sld_radius = (GetGadgetState(#trackbar2) / 100.0)
				EndSelect
		EndSelect
		ProcedureReturn #True
	EndProcedure

	Procedure SetupGL(fragment.s)
		Global vertexShaderSource.s = ~"#version 100\n"+
		    ;~"layout (location = 0) in vec3 va_Position;\n"+ ; use #version 300 es for this
		    ~"attribute vec3 va_Position;\n"+
		    ~"void main()\n"+
		    ~"{\n"+
			  ;// alter points position to check that they are passed To shader
			  ~"   gl_Position = vec4(va_Position.x, va_Position.y / 1.50, 0,1.0);\n"+
		    ~"}\n";

		 ; simple unused fragment shader to be used for test purposes
		Define fragmentShaderSource.s = ~"#version 300 es\n"+
				~"\n"+
				~"precision highp float;\n"+
		    ~"out vec4 FragColor;\n"+
		    ~"void main()\n"+
		    ~"{\n"+
		    ~"   FragColor = vec4(0.0f, 0.5f, 0.2f, 1.0f);\n"+
		    ~"}\n";
		; 
		
		Define vshader = make_shader(#GL_VERTEX_SHADER,"string",vertexShaderSource)
		Define fshader = make_shader(#GL_FRAGMENT_SHADER,"string",fragment)
		
		Global program = make_program (vshader, fshader)
		
		;// set up vertex Data (And buffer(s)) And configure vertex attributes
		;// ------------------------------------------------------------------
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

		Global u_TimeLoc.l = glGetUniformLocation (program, "u_Time")
		Global u_ResolutionLoc.l = glGetUniformLocation (program, "u_Resolution")
		
		Global u_speedLoc.l = glGetUniformLocation (program, "u_speed")
		Global u_radiusLoc.l = glGetUniformLocation (program, "u_radius")

		Global t0.l = ElapsedMilliseconds()  
	EndProcedure
	
	Procedure DrawTriangle()
	
		; assign changing variables values
		glUniform1f (u_TimeLoc, ElapsedMilliseconds() - t0)
		glUniform2f (u_ResolutionLoc, 500.0, 200.0)
		
		glUniform1f (u_speedLoc, sld_speed)
		glUniform1f (u_radiusLoc, sld_radius)

		glClearColor (1.00, 0.0, 0.0, 1.0)
		glClear (#GL_COLOR_BUFFER_BIT)
		
		; draw triangle made of 3 points (indices) from the given indices array with current in-use shader
		glDrawElements (#GL_TRIANGLES, 3, #GL_UNSIGNED_INT, indices)
	EndProcedure

	OpenWindow_2nd()

	; init and make egl context
	DataSection
		framebuffer_attribs:
		Data.l 	#EGL_SURFACE_TYPE, #EGL_WINDOW_BIT,
						#EGL_NONE, #EGL_NONE

		context_attribs:
		Data.l 	#EGL_CONTEXT_CLIENT_VERSION, 3,
						#EGL_NONE, #EGL_NONE
	EndDataSection

	;Create and assign an OpenGL context to current window using EGL
	Global *egl_obj.egl_object
	*egl_obj = egl_Start(WindowID(#Window2), ?framebuffer_attribs, ?context_attribs, #False)
	
	glViewport (0, 0, 500, 200) ; optional if viewport is entire window

	SetupGL(woah_circle)
	glUseProgram (program)
		
	AddWindowTimer(#Window2, #timer2, 1000 / 60) ; about 60 fps
	
	While Window_2nd_Events(WaitWindowEvent()) <> #False
		DrawTriangle()
		Gadget_SwapBuffers(#GLESCanvas)
	Wend
	
	egl_end(*egl_obj)
	
	CloseLibrary(#PB_All)
	
; IDE Options = PureBasic 5.73 LTS (Windows - x64)
; CursorPosition = 206
; FirstLine = 179
; Folding = --
; EnableXP