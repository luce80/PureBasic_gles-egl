
;
; Simple test for PureBasic binding for libGLES end libEGL shared libraries
;
; Please forgive any "inconsistencies" since I am not a PureBasic expert
;
;
EnableExplicit

	Global libpath.s, libname.s, libfullname.s

	libpath = "E:\Programmi\Web\FireFo\"
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

	XIncludeFile "libgles.pb"
	UseModule gles
	XIncludeFile "libegl.pb"
	UseModule egl


; // settings
#SCR_WIDTH = 800;
#SCR_HEIGHT = 600;
; 
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
    ~"   FragColor = vec4(1.0f, 0.5f, 0.2f, 1.0f);\n"+
    ~"}\n";
; 


; int main()
; {
OpenWindow(0, 0, 0, 530, 320, "OpenGL Gadget", #PB_Window_SystemMenu | #PB_Window_ScreenCentered)

;OpenGLGadget(0, 10, 10, 200, 200)
Global egl
Dim fb_list(10)
Dim ctx_list(10)

fb_list(0) = #EGL_NONE
;fb_list(1) = #EGL_NONE
ctx_list(0) = #EGL_NONE
Global *egl_obj.egl_object
*egl_obj = egl_Start(WindowID(0), fb_list(), ctx_list(), #False)

Define vshader = make_shader(#GL_VERTEX_SHADER,"string",vertexShaderSource)
Define fshader = make_shader(#GL_FRAGMENT_SHADER,"string",fragmentShaderSource)

Define program = make_program (vshader, fshader)

;SetupGL()
; Debug glGetError()
; Debug GetErrorString(1280)
; throw_error("ciao")
AddWindowTimer(0, 1, 16) ; about 60 fps

Global Event
Repeat
  Event = WaitWindowEvent()
  
  Select Event
    Case #PB_Event_Timer
      If EventTimer() = 1
        ;DrawTriangle(0)
      EndIf
  EndSelect
  
Until Event = #PB_Event_CloseWindow

;     // set up vertex Data (And buffer(s)) And configure vertex attributes
;     // ------------------------------------------------------------------
;     float vertices[] = {
;          0.5f,  0.5f, 0.0f,  // top right
;          0.5f, -0.5f, 0.0f,  // bottom right
;         -0.5f, -0.5f, 0.0f,  // bottom left
;         -0.5f,  0.5f, 0.0f   // top left 
;     };
;     unsigned int indices[] = {  // note that we start from 0!
;         0, 1, 3,  // first Triangle
;         1, 2, 3   // second Triangle
;     };
;     unsigned int VBO, VAO, EBO;
;     glGenVertexArrays(1, &VAO);
;     glGenBuffers(1, &VBO);
;     glGenBuffers(1, &EBO);
;     // bind the Vertex Array Object first, then bind And set vertex buffer(s), And then configure vertex attributes(s).
;     glBindVertexArray(VAO);
; 
;     glBindBuffer(GL_ARRAY_BUFFER, VBO);
;     glBufferData(GL_ARRAY_BUFFER, SizeOf(vertices), vertices, GL_STATIC_DRAW);
; 
;     glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, EBO);
;     glBufferData(GL_ELEMENT_ARRAY_BUFFER, SizeOf(indices), indices, GL_STATIC_DRAW);
; 
;     glVertexAttribPointer(0, 3, GL_FLOAT, GL_FALSE, 3 * SizeOf(float), (void*)0);
;     glEnableVertexAttribArray(0);
; 
;     // note that this is allowed, the call To glVertexAttribPointer registered VBO As the vertex attribute's bound vertex buffer object so afterwards we can safely unbind
;     glBindBuffer(GL_ARRAY_BUFFER, 0); 
; 
;     // remember: do Not unbind the EBO While a VAO is active As the bound element buffer object IS stored in the VAO; keep the EBO bound.
;     //glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, 0);
; 
;     // You can unbind the VAO afterwards so other VAO calls won't accidentally modify this VAO, but this rarely happens. Modifying other
;     // VAOs requires a call To glBindVertexArray anyways so we generally don't unbind VAOs (nor VBOs) when it's Not directly necessary.
;     glBindVertexArray(0); 
; 
; 
;     // uncomment this call To draw in wireframe polygons.
;     //glPolygonMode(GL_FRONT_AND_BACK, GL_LINE);
; 
;     // render loop
;     // -----------
;     While (!glfwWindowShouldClose(window))
;     {
;         // input
;         // -----
;         processInput(window);
; 
;         // render
;         // ------
;         glClearColor(0.2f, 0.3f, 0.3f, 1.0f);
;         glClear(GL_COLOR_BUFFER_BIT);
; 
;         // draw our first triangle
;         glUseProgram(shaderProgram);
;         glBindVertexArray(VAO); // seeing as we only have a single VAO there's no need to bind it every time, but we'll do so to keep things a bit more organized
;         //glDrawArrays(GL_TRIANGLES, 0, 6);
;         glDrawElements(GL_TRIANGLES, 6, GL_UNSIGNED_INT, 0);
;         // glBindVertexArray(0); // no need to unbind it every time 
;  
;         // glfw: Swap buffers And poll IO events (keys pressed/released, mouse moved etc.)
;         // -------------------------------------------------------------------------------
;         glfwSwapBuffers(window);
;         glfwPollEvents();
;     }
; 
;     // optional: de-allocate all resources once they've outlived their purpose:
;     // ------------------------------------------------------------------------
;     glDeleteVertexArrays(1, &VAO);
;     glDeleteBuffers(1, &VBO);
;     glDeleteBuffers(1, &EBO);
;     glDeleteProgram(shaderProgram);
; 
;     // glfw: terminate, clearing all previously allocated GLFW resources.
;     // ------------------------------------------------------------------
;     glfwTerminate();
;     Return 0;
; }
; 
; // process all input: query GLFW whether relevant keys are pressed/released this frame And react accordingly
; // ---------------------------------------------------------------------------------------------------------
; void processInput(GLFWwindow *window)
; {
;     If (glfwGetKey(window, GLFW_KEY_ESCAPE) == GLFW_PRESS)
;         glfwSetWindowShouldClose(window, true);
; }
; 
; // glfw: whenever the window size changed (by OS Or user resize) this callback function executes
; // ---------------------------------------------------------------------------------------------
; void framebuffer_size_callback(GLFWwindow* window, int width, int height)
; {
;     // make sure the viewport matches the new window dimensions; note that width and 
;     // height will be significantly larger than specified on retina displays.
;     glViewport(0, 0, width, height);
; }
	egl_end(*egl_obj)

	CloseLibrary(#LibEGL)
	CloseLibrary(#LibGLES)
	CloseLibrary(#Libmoz)
; IDE Options = PureBasic 5.73 LTS (Windows - x64)
; CursorPosition = 11
; FirstLine = 5
; Folding = -
; EnableXP