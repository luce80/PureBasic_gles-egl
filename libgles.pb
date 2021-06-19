EnableExplicit

XIncludeFile "..\libsmacros.pb"
	DeclareModule gles
		UseModule libsmacros
		#LibGLES = 5002 ; random number but MUST equal that of OpenLibrary(...)
		;- defines
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
		;
		routine(#LibGLES,l,glAttachShader,(program.l, shader.l))
		routine(#LibGLES,l,glCompileShader,(shader.l))
		routine(#LibGLES,l,glCreateProgram,())
		routine(#LibGLES,l,glCreateShader,(type.i))
		routine(#LibGLES,l,glDeleteProgram,(program.l))
		routine(#LibGLES,l,glDeleteShader,(shader.l))
		routine(#LibGLES,l,glDetachShader,(program.l, shader.l))
		routine(#LibGLES,l,glGetError,())
		routine(#LibGLES,l,glGetShaderiv,(shader.l, pname.l, params.i))
		routine_s(#LibGLES,i,glGetString,(name.l))
		routine(#LibGLES,l,glGetProgramInfoLog,(program.l, bufSize.l, length.l, infoLog.i ))
		routine(#LibGLES,l,glGetShaderInfoLog,(shader.l, bufSize.l, length.l, infoLog.i ))
		routine(#LibGLES,l,glLinkProgram,(program.l))
		routine(#LibGLES,l,glGetProgramiv,(program.l, pname.l, params.i))
		routine(#LibGLES,l,glShaderSource,(shader.l, count.l, string.i, length.i))
		routine(#LibGLES,l,glValidateProgram,(program.l))

		Declare.s GetErrorString(error.l)
		Declare throw_error(msg.s)
		
		Declare make_shader(type.l, source_type.s = "string", source.s = "")
		Declare make_program(vertex_shader.l, fragment_shader.l, validate.l = #False)
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

	EndModule
	

; IDE Options = PureBasic 5.73 LTS (Windows - x64)
; CursorPosition = 107
; FirstLine = 43
; Folding = T--
; EnableXP