;
; Simple test for PureBasic bindings for libGLES and libEGL shared libraries
;
; Adjust libpath and libname variables to your needs.
;
; Please forgive any "inconsistencies" since I am not a PureBasic expert
;
; title: "Test for libgles.pbi and libegl.pbi"
; author: "Marco Antoniazzi"
; date: 03-07-2021
; version: 1.0.0
; history:
;		1.0.0 "Initial version"
; license: http://creativecommons.org/licenses/by/4.0/
;
EnableExplicit

	;{ load libs and modules
	IncludeFile "libsmacros.pbi"
	Define libpath.s, libname.s

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
		#Window1
		#timer1
		#Window2
		#GLESCanvas
		#text1
		#trackbar1
		#trackbar2
		#timer2
	EndEnumeration

	;{ fragment shaders
	Global glslsandbox_com_e59828_0.s = ~"//http://glslsandbox.com/e#59828.0\n"+
	~"	//translate variable names\n"+
	~"	#define time u_Time\n"+
	~"	#define resolution u_Resolution\n"+

	~"	#ifdef GL_ES\n"+
	~"	precision mediump float;\n"+
	~"	#endif\n"+

	~"	uniform float time;\n"+
	~"	uniform vec2 resolution;\n"+

	~"	#define t time\n"+

	~"	vec2 pos_for_aspect_min(vec2 fragCoord , vec2 resolution) {\n"+
	~"		return fragCoord / min(resolution.x,resolution.y) * 2. - 1.;\n"+
	~"	}\n"+

	~"	void main() {\n"+
	~"		vec2 p = pos_for_aspect_min( gl_FragCoord.xy , resolution);\n"+

	~"		float c = 0.0;\n"+
	~"		for(float l = 0.0;l < 10.0;l++){\n"+
	~"			for (float i = 0.0;i < 10.0;i++){\n"+
	~"				float j = i - 1.0; \n"+
	~"				float si = sin(t + i * 0.628318) / 2.0 - sin(t/4.-l);\n"+
	~"				float co = cos(t - i * 0.628318) / 8.0 + tan(t/8.-l);\n"+
	~"				c += 0.003 / abs(length(p - vec2(si,co)/(1.25/abs(cos(t/4.0)))) - 0.1 );\n"+
	~"			}\n"+
	~"		}\n"+
	~"		gl_FragColor = vec4(vec3(abs(c*atan(t))- 0.5,c*cos(t),abs(c*sin(t))), 1.0 );\n"+
	~"	}\n"
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

	Global sld_speed.f = 4, sld_radius.f = 0.3

	; // settings
	#frame_width = 640;
	#frame_height = 480;
	; 
	Procedure OpenWindow_1st()
		OpenWindow(#Window1, 0, 0, #frame_width, #frame_height, "LibGLES & LibEGL Hello Triangle", #PB_Window_SystemMenu | #PB_Window_ScreenCentered)
	EndProcedure

	Procedure Window_1st_Events(event)
		Select event
			Case #PB_Event_CloseWindow
				ProcedureReturn #False
				
		EndSelect
		ProcedureReturn #True
	EndProcedure

	Procedure OpenWindow_2nd()
		OpenWindow(#Window2, 0, 0, #frame_width + 40, #frame_height + 65, "LibGLES & LibEGL Hello Triangle", #PB_Window_SystemMenu | #PB_Window_ScreenCentered)
		TextGadget(#text1, 0,0,210,20,"Use sliders to control speed and radius")
		TrackBarGadget(#trackbar1, 10, 20, 100, 25, 0, 100)
		SetGadgetState(#trackbar1,20)
		TrackBarGadget(#trackbar2, 110, 20, 100, 25, 0, 100)
		SetGadgetState(#trackbar2,30)
	
		Gadget(#GLESCanvas,20,45,#frame_width,#frame_height)
	EndProcedure

	Procedure Window_2nd_Events(event)
		Select event
			Case #PB_Event_CloseWindow
				ProcedureReturn #False
				
			Case #PB_Event_Gadget
				Select EventGadget()
					Case #trackbar1 : sld_speed = 20 * ((GetGadgetState(#trackbar1) / 100.0))
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
	
	Procedure DrawTriangle(w.f,h.f)
	
		; assign changing variables values
		glUniform1f (u_TimeLoc, (ElapsedMilliseconds() - t0) / 1000)
		glUniform2f (u_ResolutionLoc, w, h)
		
		glUniform1f (u_speedLoc, sld_speed)
		glUniform1f (u_radiusLoc, sld_radius)

		glClearColor (1.00, 0.0, 0.0, 1.0)
		glClear (#GL_COLOR_BUFFER_BIT)
		
		; draw triangle made of 3 points (indices) from the given indices array with current in-use shader
		glDrawElements (#GL_TRIANGLES, 3, #GL_UNSIGNED_INT, indices)
	EndProcedure

	Global *egl_obj.egl_object

	OpenWindow_1st()

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
	*egl_obj = egl_Start(WindowID(#Window1), ?framebuffer_attribs, ?context_attribs, #False)
	
	;glViewport (0, 0, #frame_width, #frame_height) ; optional if viewport is entire window

	SetupGL(glslsandbox_com_e59828_0)
	glUseProgram (program)
		
	AddWindowTimer(#Window1, #timer1, 1000 / 60) ; about 60 fps
	
	While Window_1st_Events(WaitWindowEvent()) <> #False
		DrawTriangle(#frame_width, #frame_height)
		eglSwapBuffers(*egl_obj\display, *egl_obj\surface)
	Wend
	
	egl_end(*egl_obj)
	
	
	
	OpenWindow_2nd()

	;Create and assign an OpenGL context to current window using EGL
	*egl_obj = egl_Start(WindowID(#Window2), ?framebuffer_attribs, ?context_attribs)
	
	glViewport (0, 0, #frame_width, #frame_height)

	SetupGL(woah_circle)
	glUseProgram (program)
		
	AddWindowTimer(#Window2, #timer2, 1000 / 60) ; about 60 fps
	
	While Window_2nd_Events(WaitWindowEvent()) <> #False
		DrawTriangle(#frame_width, #frame_height)
		Gadget_SwapBuffers(#GLESCanvas)
	Wend
	
	egl_end(*egl_obj)
	
	CloseLibrary(#PB_All)
	
; IDE Options = PureBasic 5.73 LTS (Windows - x64)
; CursorPosition = 98
; FirstLine = 85
; Folding = lh-
; EnableXP