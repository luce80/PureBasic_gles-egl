EnableExplicit

XIncludeFile "..\libsmacros.pb"
	DeclareModule gles
		UseModule libsmacros
		#LibGLES = 5002 ; random number but MUST equal that of OpenLibrary(...)
		;- defines
		#GL_FALSE =                          0
		#GL_TRUE =                           1
		#GL_TRIANGLES =                      4
		#GL_UNSIGNED_INT =                   5125
		#GL_FLOAT =                          5126
		#GL_VENDOR =                         7936
		#GL_RENDERER =                       7937
		#GL_VERSION =                        7938
		#GL_EXTENSIONS =                     7939
		#GL_FRAGMENT_SHADER =                35632
		#GL_VERTEX_SHADER =                  35633
		#GL_INFO_LOG_LENGTH =                35716
		#GL_SHADING_LANGUAGE_VERSION =       35724
		#GL_LINK_STATUS =                    35714
		#GL_VALIDATE_STATUS =                35715
		#GL_ARRAY_BUFFER =                   34962
		#GL_STATIC_DRAW =                    35044
		;
		routine(#LibGLES,l,glAttachShader,(program.l, shader.l))
		routine(#LibGLES,l,glBindBuffer,(target.l, buffer.l))
		routine(#LibGLES,l,glBufferData,(target.l, size.l, data_.i, usage.l))
		routine(#LibGLES,l,glCompileShader,(shader.l))
		routine(#LibGLES,l,glClear,(mask.l))
		routine(#LibGLES,l,glClearColor,(red.f, green.f, blue.f, alpha.f))
		routine(#LibGLES,l,glCreateProgram,())
		routine(#LibGLES,l,glCreateShader,(type.i))
		routine(#LibGLES,l,glDeleteProgram,(program.l))
		routine(#LibGLES,l,glDeleteShader,(shader.l))
		routine(#LibGLES,l,glDetachShader,(program.l, shader.l))
		routine(#LibGLES,l,glDrawElements,(mode.l, count.l, type.l, indices.i))
		routine(#LibGLES,l,glGetAttribLocation,(program.l, name.p-ascii))
		routine(#LibGLES,l,glGenBuffers,(n.l, buffers.i))
		routine(#LibGLES,l,glGetError,())
		routine(#LibGLES,l,glGetShaderiv,(shader.l, pname.l, params.i))
		routine_s(#LibGLES,i,glGetString,(name.l))
		routine(#LibGLES,l,glGetProgramInfoLog,(program.l, bufSize.l, length.l, infoLog.i ))
		routine(#LibGLES,l,glGetShaderInfoLog,(shader.l, bufSize.l, length.l, infoLog.i ))
		routine(#LibGLES,l,glLinkProgram,(program.l))
		routine(#LibGLES,l,glEnableVertexAttribArray,(index.l))
		routine(#LibGLES,l,glGetProgramiv,(program.l, pname.l, params.i))
		routine(#LibGLES,l,glShaderSource,(shader.l, count.l, string.i, length.i))
		routine(#LibGLES,l,glUseProgram,(program.l))
		routine(#LibGLES,l,glValidateProgram,(program.l))
		routine(#LibGLES,l,glVertexAttribPointer,(index.l, size.l, type.l, normalized.b, stride.l, pointer.i))
		routine(#LibGLES,l,glViewport,(x.l, y.l, width.l, height.l))

		Declare.s GetErrorString(error.l)
		Declare throw_error(msg.s)
		
		Declare make_shader(type.l, source_type.s = "string", source.s = "")
		Declare make_program(vertex_shader.l, fragment_shader.l, validate.l = #False)
		Declare make_buffer(type.l, usage.l, data_size.l, data_.i, bo.i)
		Declare set_vertex_attribute(program.l, varname.s, buffer.i, size.l, stride.l = 0, start.l = 0,no_checks = #False) 
	EndDeclareModule
	
	Module gles
	
		routine_proc_s(glGetString,(name.l))
	
		Procedure.s GetErrorString(error.l)
			Protected result.s
			Select error
			Case 0 : result = "GL_NO_ERROR"
			Case 1280 : result = "GL_INVALID_ENUM"
	; 		Case 1281 : result = "GL_INVALID_VALUE"
	; 		Case 1282 : result = "GL_INVALID_OPERATION"
	; 		Case 1283 : result = "GL_STACK_OVERFLOW"
	; 		Case 1284 : result = "GL_STACK_UNDERFLOW"
	; 		Case 1285 : result = "GL_OUT_OF_MEMORY"
	; 		Case 1286 : result = "GL_INVALID_FRAMEBUFFER_OPERATION"
	; 
	; 		Case #GL_FRAMEBUFFER_UNDEFINED : result = "target is the default framebuffer, but the default framebuffer does not exist."
	; 		Case #GL_FRAMEBUFFER_INCOMPLETE_ATTACHMENT : result = "any of the framebuffer attachment points are framebuffer incomplete."
	; 		Case #GL_FRAMEBUFFER_INCOMPLETE_MISSING_ATTACHMENT : result = "the framebuffer does not have at least one image attached to it."
	; 		Case #GL_FRAMEBUFFER_UNSUPPORTED : result = "depth and stencil attachments, if present, are not the same renderbuffer, or if the combination of internal formats of the attached images violates an implementation-dependent set of restrictions."
	; 		Case #GL_FRAMEBUFFER_INCOMPLETE_MULTISAMPLE : result = "the value of GL_RENDERBUFFER_SAMPLES is not the same for all attached renderbuffers or, if the attached images are a mix of renderbuffers and textures, the value of GL_RENDERBUFFER_SAMPLES is not zero."
	
			Default : result = "UNKNOWN GLES ERROR"
			EndSelect
			ProcedureReturn result
		EndProcedure
		;FIXTHIS: CompilerIf not debugging Macro throw_error(msg.s) : EndMacro
		Procedure throw_error(msg.s)
			Protected error.l
			error = glGetError()
			If error <> 0
				Debug "libGLES ERROR: "+error+" "+msg
			EndIf
		EndProcedure

		Procedure make_shader(type.l, source_type.s = "string", source.s = "")
			Protected shader.l, *sourcebuff, InfoLogLength, shader_type.s, msg.s
			
			; FIX ME: if source_type = "file" : *sourcebuff = ReadData (...
			
			*sourcebuff = Ascii(source) ; convert to ascii
			shader = glCreateShader(type)
			glShaderSource(shader, 1, @*sourcebuff, 0)
			glCompileShader(shader)
			glGetShaderiv( shader, #GL_INFO_LOG_LENGTH , @InfoLogLength)
			If InfoLogLength > 0
				; alloc a string long enough
				msg = LSet("",InfoLogLength * 2)
				glGetShaderInfoLog (shader, InfoLogLength,  @InfoLogLength, @msg)
				glDeleteShader (shader)
				Select type
					Case #GL_VERTEX_SHADER : shader_type = "GL_VERTEX_SHADER "
					Case #GL_FRAGMENT_SHADER : shader_type = "GL_FRAGMENT_SHADER "
				EndSelect
				; return only 1st line of log ? or better it all?
				msg = PeekS(@msg,-1,#PB_Ascii)
				Debug shader_type+msg ;Left(msg,FindString(msg,Chr(10)))
			EndIf
			ProcedureReturn shader
		EndProcedure

		Procedure make_program(vertex_shader.l, fragment_shader.l, validate.l = #False)
			Protected program.l
			
			; FIX ME: if source_type = "file" : *sourcebuff = ReadData (...
			; FIX ME: if source_type = "string" : *sourcebuff = Ascii(source)...

			program = glCreateProgram()
			throw_error("glCreateProgram")
			glAttachShader (program, vertex_shader)
			glAttachShader (program, fragment_shader)
			glLinkProgram (program)
			throw_error("glLinkProgram")
		
			; it can happen that linking fails but without log
			Protected Result, InfoLogLength, msg.s
			glGetProgramiv (program, #GL_LINK_STATUS,  @Result)
			throw_error("GL_LINK_STATUS")
			glGetProgramiv (program, #GL_INFO_LOG_LENGTH,  @InfoLogLength)
			throw_error("GL_INFO_LOG_LENGTH")
				If InfoLogLength > 0
				; alloc a string long enough
				msg = LSet("",InfoLogLength * 2)
				glGetShaderInfoLog (program, InfoLogLength,  @InfoLogLength, @msg)
				msg = PeekS(@msg,-1,#PB_Ascii)
				If FindString (msg, "warning") > 0
						Debug msg
					Else
					glDeleteProgram (program)
					Debug msg
		
					End
		
				EndIf
				EndIf
			If validate
				;FIX ME: can a program be correctly linked but not validated ?
				glValidateProgram (program)
				throw_error("glValidateProgram")
				glGetProgramiv (program, #GL_VALIDATE_STATUS, @Result)
				throw_error("GL_VALIDATE_STATUS")
				glGetProgramiv (program, #GL_INFO_LOG_LENGTH,  @InfoLogLength)
				throw_error("GL_INFO_LOG_LENGTH")
				If InfoLogLength > 0
					; alloc a string long enough
					msg = LSet("",InfoLogLength * 2)
					glGetProgramInfoLog (program, InfoLogLength,  @InfoLogLength, @msg)
					glDeleteProgram (program)
					Debug PeekS(@msg,-1,#PB_Ascii)
		
					End
		
				EndIf
				EndIf
			;// delete the shaders as they're linked into our program now and no longer necessary
			glDetachShader (program, vertex_shader)
			glDeleteShader (vertex_shader)
			glDetachShader (program, fragment_shader)
			glDeleteShader (fragment_shader)
		
			ProcedureReturn program
		EndProcedure

		Procedure make_buffer (type.l, ;"GL_ARRAY_BUFFER or GL_ELEMENT_ARRAY_BUFFER"
			usage.l, ;"GL_STREAM_DRAW, GL_STATIC_DRAW, or GL_DYNAMIC_DRAW"
			data_size.l, ; size in bytes of the buffer object's new data store
			data_.i, ;a pointer to data that will be copied into the data store for initialization, or NULL if no data is to be copied
			bo.i) ; address of a variable to hold result

			glGetError() ; flush possible current error
			glGenBuffers (1, bo)
			throw_error ("glGenBuffers")
			glBindBuffer (type, PeekL(bo))
			throw_error ("glBindBuffer")
			glBufferData (type, data_size, data_, usage)
			throw_error ("glBufferData")
			glBindBuffer (type, 0)
			throw_error ("glBindBuffer")
			ProcedureReturn bo
		EndProcedure
		
		Procedure set_vertex_attribute(program.l, ;"Value returned by gles-make-program or glCreateProgram"
			varname.s, ; "Symbolic name of vertex attribute"
			buffer.i, ; "buffer object"
			size.l, ; "Number of components for this vertex attribute. Must be 1, 2, 3, or 4." ; FIX ME: accept also format as "P2C3" or "P3T2N3" etc.
			stride.l = 0, ; "Bytes to skip to reach next components of this attribute. Default is 0"
			start.l = 0, ; "Offset in bytes of first element of this attribute. Default is 0"
			no_checks = #False)
			
			Protected vertexLoc.l, varname_ascii.i
			glGetError() ; flush possible current error
			; get attribute location corrisponding to <varname> variable in vertex shader
			;varname_ascii = Ascii(varname)
			vertexLoc = glGetAttribLocation (program, varname)
			throw_error ("glGetAttribLocation")
			If vertexLoc = -1
				Debug "Not an active vertex attribute: " +varname
				; If Not no_checks : End
			EndIf
			;// Tell OpenGL how to pull out the attributes from the attributes buffer into the vertex attribute
			glBindBuffer (#GL_ARRAY_BUFFER, buffer)
			throw_error ("glBindBuffer")
			glVertexAttribPointer (vertexLoc, size, #GL_FLOAT, #GL_FALSE, stride, start)
			throw_error ("glVertexAttribPointer")
			glEnableVertexAttribArray (vertexLoc)
			throw_error ("glEnableVertexAttribArray")
			glBindBuffer (#GL_ARRAY_BUFFER, 0)
			ProcedureReturn vertexLoc
		EndProcedure

	EndModule
	

; IDE Options = PureBasic 5.73 LTS (Windows - x64)
; CursorPosition = 51
; FirstLine = 40
; Folding = T0+
; EnableXP