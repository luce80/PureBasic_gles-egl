;{ ===== MIT License =====
;
; Copyright (c) 2021 Marco Antoniazzi
;
; Permission is hereby granted, free of charge, to any person obtaining a copy
; of this software and associated documentation files (the "Software"), to deal
; in the Software without restriction, including without limitation the rights
; to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
; copies of the Software, and to permit persons to whom the Software is
; furnished to do so, subject to the following conditions:
;
; The above copyright notice and this permission notice shall be included in all
; copies or substantial portions of the Software.
;
; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
; IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
; FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
; AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
; LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
; OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
; SOFTWARE.
;}
;{** Copyright (c) 2013-2018 The Khronos Group Inc.
; **
; ** Permission is hereby granted, free of charge, To any person obtaining a
; ** copy of this software And/Or associated documentation files (the
; ** "Materials"), To deal in the Materials without restriction, including
; ** without limitation the rights To use, copy, modify, merge, publish,
; ** distribute, sublicense, And/Or sell copies of the Materials, And To
; ** permit persons To whom the Materials are furnished To do so, subject To
; ** the following conditions:
; **
; ** The above copyright notice And this permission notice shall be included
; ** in all copies Or substantial portions of the Materials.
; **
; ** THE MATERIALS ARE PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
; ** EXPRESS Or IMPLIED, INCLUDING BUT Not LIMITED To THE WARRANTIES OF
; ** MERCHANTABILITY, FITNESS For A PARTICULAR PURPOSE And NONINFRINGEMENT.
; ** IN NO EVENT SHALL THE AUTHORS Or COPYRIGHT HOLDERS BE LIABLE For ANY
; ** CLAIM, DAMAGES Or OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
; ** TORT Or OTHERWISE, ARISING FROM, OUT OF Or IN CONNECTION With THE
; ** MATERIALS Or THE USE Or OTHER DEALINGS IN THE MATERIALS.
;}

EnableExplicit

XIncludeFile "..\libsmacros.pbi"

	DeclareModule gles
		UseModule libsmacros
		#LibGLES = 5002 ; random number but MUST equal that of OpenLibrary(...)
		;- defines
		#GL_BGR =                        32992
		#GL_BGRA =                       32993
		#GL_FALSE =                          0
		#GL_TRUE =                           1
		#GL_TRIANGLES =                      4
		#GL_UNSIGNED_BYTE =                  5121
		#GL_UNSIGNED_INT =                   5125
		#GL_FLOAT =                          5126
		#GL_RGB =                            6407
		#GL_RGBA =                           6408
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
; 		routine(#LibGLES,l,glAttachShader,(program.l, shader.l))
; 		routine(#LibGLES,l,glBindBuffer,(target.l, buffer.l))
; 		routine(#LibGLES,l,glBufferData,(target.l, size.l, data_.i, usage.l))
; 		routine(#LibGLES,l,glCompileShader,(shader.l))
; 		routine(#LibGLES,l,glClear,(mask.l))
; 		routine(#LibGLES,l,glClearColor,(red.f, green.f, blue.f, alpha.f))
; 		routine(#LibGLES,l,glCreateProgram,())
; 		routine(#LibGLES,l,glCreateShader,(type.i))
; 		routine(#LibGLES,l,glDeleteProgram,(program.l))
; 		routine(#LibGLES,l,glDeleteShader,(shader.l))
; 		routine(#LibGLES,l,glDetachShader,(program.l, shader.l))
; 		routine(#LibGLES,l,glDrawElements,(mode.l, count.l, type.l, indices.i))
; 		routine(#LibGLES,l,glGetAttribLocation,(program.l, name.p-ascii))
; 		routine(#LibGLES,l,glGenBuffers,(n.l, buffers.i))
; 		routine(#LibGLES,l,glGetError,())
; 		routine(#LibGLES,l,glGetShaderiv,(shader.l, pname.l, params.i))
; 		routine_s(#LibGLES,i,glGetString,(name.l))
; 		routine(#LibGLES,l,glGetProgramInfoLog,(program.l, bufSize.l, length.l, infoLog.i ))
; 		routine(#LibGLES,l,glGetShaderInfoLog,(shader.l, bufSize.l, length.l, infoLog.i ))
; 		routine(#LibGLES,l,glLinkProgram,(program.l))
; 		routine(#LibGLES,l,glEnableVertexAttribArray,(index.l))
; 		routine(#LibGLES,l,glGetProgramiv,(program.l, pname.l, params.i))
; 		routine(#LibGLES,l,glGetUniformLocation,(program.l, name.p-ascii))
; 		routine(#LibGLES,l,glShaderSource,(shader.l, count.l, string.i, length.i))
; 		routine(#LibGLES,l,glUseProgram,(program.l))
; 		routine(#LibGLES,l,glUniform1f,(location.l, v0.f ))
; 		routine(#LibGLES,l,glUniform2f,(location.l, v0.f, v1.f ))
; 		routine(#LibGLES,l,glValidateProgram,(program.l))
; 		routine(#LibGLES,l,glVertexAttribPointer,(index.l, size.l, type.l, normalized.b, stride.l, pointer.i))
; 		routine(#LibGLES,l,glViewport,(x.l, y.l, width.l, height.l))
; 		routine(#LibGLES,l,glReadPixels,(x.l, y.l, width.l, height.l, format.l, type.l, pixels.i))



	;{ GLES 2.0 defines
		#GL_DEPTH_BUFFER_BIT =               256
		#GL_STENCIL_BUFFER_BIT =             1024
		#GL_COLOR_BUFFER_BIT =               16384
		#GL_FALSE =                          0
		#GL_TRUE =                           1
		#GL_POINTS =                         0
		#GL_LINES =                          1
		#GL_LINE_LOOP =                      2
		#GL_LINE_STRIP =                     3
		#GL_TRIANGLES =                      4
		#GL_TRIANGLE_STRIP =                 5
		#GL_TRIANGLE_FAN =                   6
		#GL_ZERO =                           0
		#GL_ONE =                            1
		#GL_SRC_COLOR =                      768
		#GL_ONE_MINUS_SRC_COLOR =            769
		#GL_SRC_ALPHA =                      770
		#GL_ONE_MINUS_SRC_ALPHA =            771
		#GL_DST_ALPHA =                      772
		#GL_ONE_MINUS_DST_ALPHA =            773
		#GL_DST_COLOR =                      774
		#GL_ONE_MINUS_DST_COLOR =            775
		#GL_SRC_ALPHA_SATURATE =             776
		#GL_FUNC_ADD =                       32774
		#GL_BLEND_EQUATION =                 32777
		#GL_BLEND_EQUATION_RGB =             32777
		#GL_BLEND_EQUATION_ALPHA =           34877
		#GL_FUNC_SUBTRACT =                  32778
		#GL_FUNC_REVERSE_SUBTRACT =          32779
		#GL_BLEND_DST_RGB =                  32968
		#GL_BLEND_SRC_RGB =                  32969
		#GL_BLEND_DST_ALPHA =                32970
		#GL_BLEND_SRC_ALPHA =                32971
		#GL_CONSTANT_COLOR =                 32769
		#GL_ONE_MINUS_CONSTANT_COLOR =       32770
		#GL_CONSTANT_ALPHA =                 32771
		#GL_ONE_MINUS_CONSTANT_ALPHA =       32772
		#GL_BLEND_COLOR =                    32773
		#GL_ARRAY_BUFFER =                   34962
		#GL_ELEMENT_ARRAY_BUFFER =           34963
		#GL_ARRAY_BUFFER_BINDING =           34964
		#GL_ELEMENT_ARRAY_BUFFER_BINDING =   34965
		#GL_STREAM_DRAW =                    35040
		#GL_STATIC_DRAW =                    35044
		#GL_DYNAMIC_DRAW =                   35048
		#GL_BUFFER_SIZE =                    34660
		#GL_BUFFER_USAGE =                   34661
		#GL_CURRENT_VERTEX_ATTRIB =          34342
		#GL_FRONT =                          1028
		#GL_BACK =                           1029
		#GL_FRONT_AND_BACK =                 1032
		#GL_TEXTURE_2D =                     3553
		#GL_CULL_FACE =                      2884
		#GL_BLEND =                          3042
		#GL_DITHER =                         3024
		#GL_STENCIL_TEST =                   2960
		#GL_DEPTH_TEST =                     2929
		#GL_SCISSOR_TEST =                   3089
		#GL_POLYGON_OFFSET_FILL =            32823
		#GL_SAMPLE_ALPHA_TO_COVERAGE =       32926
		#GL_SAMPLE_COVERAGE =                32928

		#GL_NO_ERROR =                       0
		#GL_INVALID_ENUM =                   1280
		#GL_INVALID_VALUE =                  1281
		#GL_INVALID_OPERATION =              1282
		#GL_OUT_OF_MEMORY =                  1285

		#GL_CW =                             2304
		#GL_CCW =                            2305
		#GL_LINE_WIDTH =                     2849
		#GL_ALIASED_POINT_SIZE_RANGE =       33901
		#GL_ALIASED_LINE_WIDTH_RANGE =       33902
		#GL_CULL_FACE_MODE =                 2885
		#GL_FRONT_FACE =                     2886
		#GL_DEPTH_RANGE =                    2928
		#GL_DEPTH_WRITEMASK =                2930
		#GL_DEPTH_CLEAR_VALUE =              2931
		#GL_DEPTH_FUNC =                     2932
		#GL_STENCIL_CLEAR_VALUE =            2961
		#GL_STENCIL_FUNC =                   2962
		#GL_STENCIL_FAIL =                   2964
		#GL_STENCIL_PASS_DEPTH_FAIL =        2965
		#GL_STENCIL_PASS_DEPTH_PASS =        2966
		#GL_STENCIL_REF =                    2967
		#GL_STENCIL_VALUE_MASK =             2963
		#GL_STENCIL_WRITEMASK =              2968
		#GL_STENCIL_BACK_FUNC =              34816
		#GL_STENCIL_BACK_FAIL =              34817
		#GL_STENCIL_BACK_PASS_DEPTH_FAIL =   34818
		#GL_STENCIL_BACK_PASS_DEPTH_PASS =   34819
		#GL_STENCIL_BACK_REF =               36003
		#GL_STENCIL_BACK_VALUE_MASK =        36004
		#GL_STENCIL_BACK_WRITEMASK =         36005
		#GL_VIEWPORT =                       2978
		#GL_SCISSOR_BOX =                    3088
		#GL_COLOR_CLEAR_VALUE =              3106
		#GL_COLOR_WRITEMASK =                3107
		#GL_UNPACK_ALIGNMENT =               3317
		#GL_PACK_ALIGNMENT =                 3333
		#GL_MAX_TEXTURE_SIZE =               3379
		#GL_MAX_VIEWPORT_DIMS =              3386
		#GL_SUBPIXEL_BITS =                  3408
		#GL_RED_BITS =                       3410
		#GL_GREEN_BITS =                     3411
		#GL_BLUE_BITS =                      3412
		#GL_ALPHA_BITS =                     3413
		#GL_DEPTH_BITS =                     3414
		#GL_STENCIL_BITS =                   3415
		#GL_POLYGON_OFFSET_UNITS =           10752
		#GL_POLYGON_OFFSET_FACTOR =          32824
		#GL_TEXTURE_BINDING_2D =             32873
		#GL_SAMPLE_BUFFERS =                 32936
		#GL_SAMPLES =                        32937
		#GL_SAMPLE_COVERAGE_VALUE =          32938
		#GL_SAMPLE_COVERAGE_INVERT =         32939
		#GL_NUM_COMPRESSED_TEXTURE_FORMATS = 34466
		#GL_COMPRESSED_TEXTURE_FORMATS =     34467
		#GL_DONT_CARE =                      4352
		#GL_FASTEST =                        4353
		#GL_NICEST =                         4354
		#GL_GENERATE_MIPMAP_HINT =           33170
		#GL_BYTE =                           5120
		#GL_UNSIGNED_BYTE =                  5121
		#GL_SHORT =                          5122
		#GL_UNSIGNED_SHORT =                 5123
		#GL_INT =                            5124
		#GL_UNSIGNED_INT =                   5125
		#GL_FLOAT =                          5126
		#GL_FIXED =                          5132
		#GL_DEPTH_COMPONENT =                6402
		#GL_ALPHA =                          6406
		#GL_RGB =                            6407
		#GL_RGBA =                           6408
		#GL_LUMINANCE =                      6409
		#GL_LUMINANCE_ALPHA =                6410
		#GL_UNSIGNED_SHORT_4_4_4_4 =         32819
		#GL_UNSIGNED_SHORT_5_5_5_1 =         32820
		#GL_UNSIGNED_SHORT_5_6_5 =           33635
		#GL_FRAGMENT_SHADER =                35632
		#GL_VERTEX_SHADER =                  35633
		#GL_MAX_VERTEX_ATTRIBS =             34921
		#GL_MAX_VERTEX_UNIFORM_VECTORS =     36347
		#GL_MAX_VARYING_VECTORS =            36348
		#GL_MAX_COMBINED_TEXTURE_IMAGE_UNITS = 35661
		#GL_MAX_VERTEX_TEXTURE_IMAGE_UNITS = 35660
		#GL_MAX_TEXTURE_IMAGE_UNITS =        34930
		#GL_MAX_FRAGMENT_UNIFORM_VECTORS =   36349
		#GL_SHADER_TYPE =                    35663
		#GL_DELETE_STATUS =                  35712
		#GL_LINK_STATUS =                    35714
		#GL_VALIDATE_STATUS =                35715
		#GL_ATTACHED_SHADERS =               35717
		#GL_ACTIVE_UNIFORMS =                35718
		#GL_ACTIVE_UNIFORM_MAX_LENGTH =      35719
		#GL_ACTIVE_ATTRIBUTES =              35721
		#GL_ACTIVE_ATTRIBUTE_MAX_LENGTH =    35722
		#GL_SHADING_LANGUAGE_VERSION =       35724
		#GL_CURRENT_PROGRAM =                35725
		#GL_NEVER =                          512
		#GL_LESS =                           513
		#GL_EQUAL =                          514
		#GL_LEQUAL =                         515
		#GL_GREATER =                        516
		#GL_NOTEQUAL =                       517
		#GL_GEQUAL =                         518
		#GL_ALWAYS =                         519
		#GL_KEEP =                           7680
		#GL_REPLACE =                        7681
		#GL_INCR =                           7682
		#GL_DECR =                           7683
		#GL_INVERT =                         5386
		#GL_INCR_WRAP =                      34055
		#GL_DECR_WRAP =                      34056
		#GL_VENDOR =                         7936
		#GL_RENDERER =                       7937
		#GL_VERSION =                        7938
		#GL_EXTENSIONS =                     7939
		#GL_NEAREST =                        9728
		#GL_LINEAR =                         9729
		#GL_NEAREST_MIPMAP_NEAREST =         9984
		#GL_LINEAR_MIPMAP_NEAREST =          9985
		#GL_NEAREST_MIPMAP_LINEAR =          9986
		#GL_LINEAR_MIPMAP_LINEAR =           9987
		#GL_TEXTURE_MAG_FILTER =             10240
		#GL_TEXTURE_MIN_FILTER =             10241
		#GL_TEXTURE_WRAP_S =                 10242
		#GL_TEXTURE_WRAP_T =                 10243
		#GL_TEXTURE =                        5890
		#GL_TEXTURE_CUBE_MAP =               34067
		#GL_TEXTURE_BINDING_CUBE_MAP =       34068
		#GL_TEXTURE_CUBE_MAP_POSITIVE_X =    34069
		#GL_TEXTURE_CUBE_MAP_NEGATIVE_X =    34070
		#GL_TEXTURE_CUBE_MAP_POSITIVE_Y =    34071
		#GL_TEXTURE_CUBE_MAP_NEGATIVE_Y =    34072
		#GL_TEXTURE_CUBE_MAP_POSITIVE_Z =    34073
		#GL_TEXTURE_CUBE_MAP_NEGATIVE_Z =    34074
		#GL_MAX_CUBE_MAP_TEXTURE_SIZE =      34076
		#GL_TEXTURE0 =                       33984
		#GL_TEXTURE1 =                       33985
		#GL_TEXTURE2 =                       33986
		#GL_TEXTURE3 =                       33987
		#GL_TEXTURE4 =                       33988
		#GL_TEXTURE5 =                       33989
		#GL_TEXTURE6 =                       33990
		#GL_TEXTURE7 =                       33991
		#GL_TEXTURE8 =                       33992
		#GL_TEXTURE9 =                       33993
		#GL_TEXTURE10 =                      33994
		#GL_TEXTURE11 =                      33995
		#GL_TEXTURE12 =                      33996
		#GL_TEXTURE13 =                      33997
		#GL_TEXTURE14 =                      33998
		#GL_TEXTURE15 =                      33999
		#GL_TEXTURE16 =                      34000
		#GL_TEXTURE17 =                      34001
		#GL_TEXTURE18 =                      34002
		#GL_TEXTURE19 =                      34003
		#GL_TEXTURE20 =                      34004
		#GL_TEXTURE21 =                      34005
		#GL_TEXTURE22 =                      34006
		#GL_TEXTURE23 =                      34007
		#GL_TEXTURE24 =                      34008
		#GL_TEXTURE25 =                      34009
		#GL_TEXTURE26 =                      34010
		#GL_TEXTURE27 =                      34011
		#GL_TEXTURE28 =                      34012
		#GL_TEXTURE29 =                      34013
		#GL_TEXTURE30 =                      34014
		#GL_TEXTURE31 =                      34015
		#GL_ACTIVE_TEXTURE =                 34016
		#GL_REPEAT =                         10497
		#GL_CLAMP_TO_EDGE =                  33071
		#GL_MIRRORED_REPEAT =                33648
		#GL_FLOAT_VEC2 =                     35664
		#GL_FLOAT_VEC3 =                     35665
		#GL_FLOAT_VEC4 =                     35666
		#GL_INT_VEC2 =                       35667
		#GL_INT_VEC3 =                       35668
		#GL_INT_VEC4 =                       35669
		#GL_BOOL =                           35670
		#GL_BOOL_VEC2 =                      35671
		#GL_BOOL_VEC3 =                      35672
		#GL_BOOL_VEC4 =                      35673
		#GL_FLOAT_MAT2 =                     35674
		#GL_FLOAT_MAT3 =                     35675
		#GL_FLOAT_MAT4 =                     35676
		#GL_SAMPLER_2D =                     35678
		#GL_SAMPLER_CUBE =                   35680
		#GL_VERTEX_ATTRIB_ARRAY_ENABLED =    34338
		#GL_VERTEX_ATTRIB_ARRAY_SIZE =       34339
		#GL_VERTEX_ATTRIB_ARRAY_STRIDE =     34340
		#GL_VERTEX_ATTRIB_ARRAY_TYPE =       34341
		#GL_VERTEX_ATTRIB_ARRAY_NORMALIZED = 34922
		#GL_VERTEX_ATTRIB_ARRAY_POINTER =    34373
		#GL_VERTEX_ATTRIB_ARRAY_BUFFER_BINDING = 34975
		#GL_IMPLEMENTATION_COLOR_READ_TYPE = 35738
		#GL_IMPLEMENTATION_COLOR_READ_FORMAT = 35739
		#GL_COMPILE_STATUS =                 35713
		#GL_INFO_LOG_LENGTH =                35716
		#GL_SHADER_SOURCE_LENGTH =           35720
		#GL_SHADER_COMPILER =                36346
		#GL_SHADER_BINARY_FORMATS =          36344
		#GL_NUM_SHADER_BINARY_FORMATS =      36345
		#GL_LOW_FLOAT =                      36336
		#GL_MEDIUM_FLOAT =                   36337
		#GL_HIGH_FLOAT =                     36338
		#GL_LOW_INT =                        36339
		#GL_MEDIUM_INT =                     36340
		#GL_HIGH_INT =                       36341
		#GL_FRAMEBUFFER =                    36160
		#GL_RENDERBUFFER =                   36161
		#GL_RGBA4 =                          32854
		#GL_RGB5_A1 =                        32855
		#GL_RGB565 =                         36194
		#GL_DEPTH_COMPONENT16 =              33189
		#GL_STENCIL_INDEX8 =                 36168
		#GL_RENDERBUFFER_WIDTH =             36162
		#GL_RENDERBUFFER_HEIGHT =            36163
		#GL_RENDERBUFFER_INTERNAL_FORMAT =   36164
		#GL_RENDERBUFFER_RED_SIZE =          36176
		#GL_RENDERBUFFER_GREEN_SIZE =        36177
		#GL_RENDERBUFFER_BLUE_SIZE =         36178
		#GL_RENDERBUFFER_ALPHA_SIZE =        36179
		#GL_RENDERBUFFER_DEPTH_SIZE =        36180
		#GL_RENDERBUFFER_STENCIL_SIZE =      36181
		#GL_FRAMEBUFFER_ATTACHMENT_OBJECT_TYPE = 36048
		#GL_FRAMEBUFFER_ATTACHMENT_OBJECT_NAME = 36049
		#GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_LEVEL = 36050
		#GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_CUBE_MAP_FACE = 36051
		#GL_COLOR_ATTACHMENT0 =              36064
		#GL_DEPTH_ATTACHMENT =               36096
		#GL_STENCIL_ATTACHMENT =             36128
		#GL_NONE =                           0
		#GL_FRAMEBUFFER_COMPLETE =           36053
		#GL_FRAMEBUFFER_INCOMPLETE_ATTACHMENT = 36054
		#GL_FRAMEBUFFER_INCOMPLETE_MISSING_ATTACHMENT = 36055
		#GL_FRAMEBUFFER_INCOMPLETE_DIMENSIONS = 36057
		#GL_FRAMEBUFFER_UNSUPPORTED =        36061
		#GL_FRAMEBUFFER_BINDING =            36006
		#GL_RENDERBUFFER_BINDING =           36007
		#GL_MAX_RENDERBUFFER_SIZE =          34024

		#GL_INVALID_FRAMEBUFFER_OPERATION =  1286
	;}
	;{ GLES 2.0 PROTOTYPES
		routine(#LibGLES,l,glActiveTexture,( texture.l))
		routine(#LibGLES,l,glAttachShader,( program.l, shader.l))
		routine(#LibGLES,l,glBindAttribLocation,( program.l, index.l, name.p-ascii))
		routine(#LibGLES,l,glBindBuffer,( target.l, buffer.l))
		routine(#LibGLES,l,glBindFramebuffer,( target.l, framebuffer.l))
		routine(#LibGLES,l,glBindRenderbuffer,( target.l, renderbuffer.l))
		routine(#LibGLES,l,glBindTexture,( target.l, texture.l))
		routine(#LibGLES,l,glBlendColor,( red.f, green.f, blue.f, alpha.f))
		routine(#LibGLES,l,glBlendEquation,( mode.l))
		routine(#LibGLES,l,glBlendEquationSeparate,( modeRGB.l, modeAlpha.l))
		routine(#LibGLES,l,glBlendFunc,( sfactor.l, dfactor.l))
		routine(#LibGLES,l,glBlendFuncSeparate,( sfactorRGB.l, dfactorRGB.l, sfactorAlpha.l, dfactorAlpha.l))
		routine(#LibGLES,l,glBufferData,( target.l, size.l, data_.i, usage.l))
		routine(#LibGLES,l,glBufferSubData,( target.l, offset.i, size.l, data_.i))
		routine(#LibGLES,l,glCheckFramebufferStatus,( target.l))
		routine(#LibGLES,l,glClear,( mask.l ))
		routine(#LibGLES,l,glClearColor,( red.f, green.f, blue.f, alpha.f))
		routine(#LibGLES,l,glClearDepthf,( d.f))
		routine(#LibGLES,l,glClearStencil,( s.l))
		routine(#LibGLES,l,glColorMask,( red.b, green.b, blue.b, alpha.b))
		routine(#LibGLES,l,glCompileShader,( shader.l))
		routine(#LibGLES,l,glCompressedTexImage2D,( target.l, level.l, internalformat.l, width.l, height.l, border.l, imageSize.l, data_.i))
		routine(#LibGLES,l,glCompressedTexSubImage2D,( target.l, level.l, xoffset.l, yoffset.l, width.l, height.l, format.l, imageSize.l, data_.i))
		routine(#LibGLES,l,glCopyTexImage2D,( target.l, level.l, internalformat.l, x.l, y.l, width.l, height.l, border.l))
		routine(#LibGLES,l,glCopyTexSubImage2D,( target.l, level.l, xoffset.l, yoffset.l, x.l, y.l, width.l, height.l))
		routine(#LibGLES,l,glCreateProgram,( ))
		routine(#LibGLES,l,glCreateShader,( type.l))
		routine(#LibGLES,l,glCullFace,( mode.l))
		routine(#LibGLES,l,glDeleteBuffers,( n.l, buffers.i ))
		routine(#LibGLES,l,glDeleteFramebuffers,( n.l, framebuffers.i))
		routine(#LibGLES,l,glDeleteProgram,( program.l))
		routine(#LibGLES,l,glDeleteRenderbuffers,( n.l, renderbuffers.i))
		routine(#LibGLES,l,glDeleteShader,( shader.l))
		routine(#LibGLES,l,glDeleteTextures,( n.l, textures.i))
		routine(#LibGLES,l,glDepthFunc,( func.l))
		routine(#LibGLES,l,glDepthMask,( flag.b))
		routine(#LibGLES,l,glDepthRangef,( n.f, f.f))
		routine(#LibGLES,l,glDetachShader,( program.l, shader.l))
		routine(#LibGLES,l,glDisable,( cap.l))
		routine(#LibGLES,l,glDisableVertexAttribArray,( index.l))
		routine(#LibGLES,l,glDrawArrays,( mode.l, first.l, count.l))
		routine(#LibGLES,l,glDrawElements,( mode.l, count.l, type.l, indices.i))
		routine(#LibGLES,l,glEnable,( cap.l))
		routine(#LibGLES,l,glEnableVertexAttribArray,( index.l))
		routine(#LibGLES,l,glFinish,( ))
		routine(#LibGLES,l,glFlush,( ))
		routine(#LibGLES,l,glFramebufferRenderbuffer,( target.l, attachment.l, renderbuffertarget.l, renderbuffer.l))
		routine(#LibGLES,l,glFramebufferTexture2D,( target.l, attachment.l, textarget.l, texture.l, level.l))
		routine(#LibGLES,l,glFrontFace,( mode.l))
		routine(#LibGLES,l,glGenBuffers,( n.l, buffers.i))
		routine(#LibGLES,l,glGenerateMipmap,( target.l))
		routine(#LibGLES,l,glGenFramebuffers,( n.l, framebuffers.i))
		routine(#LibGLES,l,glGenRenderbuffers,( n.l, renderbuffers.i))
		routine(#LibGLES,l,glGenTextures,( n.l, textures.i))
		routine(#LibGLES,l,glGetActiveAttrib,( program.l, index.l, bufSize.l, length.i, size.i, type.i, name.i))
		routine(#LibGLES,l,glGetActiveUniform,( program.l, index.l, bufSize.l, length.i, size.i, type.i, name.p-ascii))
		routine(#LibGLES,l,glGetAttachedShaders,( program.l, maxCount.l, count.i, shaders.i))
		routine(#LibGLES,l,glGetAttribLocation,( program.l, name.p-ascii))
		routine(#LibGLES,l,glGetBooleanv,( pname.l, data_.i))
		routine(#LibGLES,l,glGetBufferParameteriv,( target.l, pname.l, params.i))
		routine(#LibGLES,l,glGetError,( ))
		routine(#LibGLES,l,glGetFloatv,( pname.l, data_.i))
		routine(#LibGLES,l,glGetFramebufferAttachmentParameteriv,( target.l, attachment.l, pname.l, params.i))
		routine(#LibGLES,l,glGetIntegerv,( pname.l, data_.i))
		routine(#LibGLES,l,glGetProgramiv,( program.l, pname.l, params.i))
		routine(#LibGLES,l,glGetProgramInfoLog,( program.l, bufSize.l, length.i, infoLog.i))
		routine(#LibGLES,l,glGetRenderbufferParameteriv,( target.l, pname.l, params.i))
		routine(#LibGLES,l,glGetShaderiv,( shader.l, pname.l, params.i))
		routine(#LibGLES,l,glGetShaderInfoLog,( shader.l, bufSize.l, length.i, infoLog.i))
		routine(#LibGLES,l,glGetShaderPrecisionFormat,( shadertype.l, precisiontype.l, range.i, precision.i))
		routine(#LibGLES,l,glGetShaderSource,( shader.l, bufSize.l, length.i, source.i))
		routine_s(#LibGLES,l,glGetString,( name.l))
		routine(#LibGLES,l,glGetTexParameterfv,( target.l, pname.l, params.i))
		routine(#LibGLES,l,glGetTexParameteriv,( target.l, pname.l, params.i))
		routine(#LibGLES,l,glGetUniformfv,( program.l, location.l, params.i))
		routine(#LibGLES,l,glGetUniformiv,( program.l, location.l, params.i))
		routine(#LibGLES,l,glGetUniformLocation,( program.l, name.p-ascii))
		routine(#LibGLES,l,glGetVertexAttribfv,( index.l, pname.l, params.i))
		routine(#LibGLES,l,glGetVertexAttribiv,( index.l, pname.l, params.i))
		routine(#LibGLES,l,glGetVertexAttribPointerv,( index.l, pname.l, pointer.i))
		routine(#LibGLES,l,glHint,( target.l, mode.l))
		routine(#LibGLES,b,glIsBuffer,( buffer.l))
		routine(#LibGLES,b,glIsEnabled,( cap.l))
		routine(#LibGLES,b,glIsFramebuffer,( framebuffer.l))
		routine(#LibGLES,b,glIsProgram,( program.l))
		routine(#LibGLES,b,glIsRenderbuffer,( renderbuffer.l))
		routine(#LibGLES,b,glIsShader,( shader.l))
		routine(#LibGLES,b,glIsTexture,( texture.l))
		routine(#LibGLES,l,glLineWidth,( width.f))
		routine(#LibGLES,l,glLinkProgram,( program.l))
		routine(#LibGLES,l,glPixelStorei,( pname.l, param.l))
		routine(#LibGLES,l,glPolygonOffset,( factor.f, units.f))
		routine(#LibGLES,l,glReadPixels,( x.l, y.l, width.l, height.l, format.l, type.l, pixels.i ))
		routine(#LibGLES,l,glReleaseShaderCompiler,( ))
		routine(#LibGLES,l,glRenderbufferStorage,( target.l, internalformat.l, width.l, height.l))
		routine(#LibGLES,l,glSampleCoverage,( value.f, invert.b))
		routine(#LibGLES,l,glScissor,( x.l, y.l, width.l, height.l))
		routine(#LibGLES,l,glShaderBinary,( count.l, shaders.i, binaryformat.l, binary.i, length.l))
		routine(#LibGLES,l,glShaderSource,( shader.l, count.l, string.i, length.i))
		routine(#LibGLES,l,glStencilFunc,( func.l, ref.l, mask.l))
		routine(#LibGLES,l,glStencilFuncSeparate,( face.l, func.l, ref.l, mask.l))
		routine(#LibGLES,l,glStencilMask,( mask.l))
		routine(#LibGLES,l,glStencilMaskSeparate,( face.l, mask.l))
		routine(#LibGLES,l,glStencilOp,( fail.l, zfail.l, zpass.l))
		routine(#LibGLES,l,glStencilOpSeparate,( face.l, sfail.l, dpfail.l, dppass.l))
		routine(#LibGLES,l,glTexImage2D,( target.l, level.l, internalformat.l, width.l, height.l, border.l, format.l, type.l, pixels.i))
		routine(#LibGLES,l,glTexParameterf,( target.l, pname.l, param.f))
		routine(#LibGLES,l,glTexParameterfv,( target.l, pname.l, params.i))
		routine(#LibGLES,l,glTexParameteri,( target.l, pname.l, param.l))
		routine(#LibGLES,l,glTexParameteriv,( target.l, pname.l, params.i))
		routine(#LibGLES,l,glTexSubImage2D,( target.l, level.l, xoffset.l, yoffset.l, width.l, height.l, format.l, type.l, pixels.i))
		routine(#LibGLES,l,glUniform1f,( location.l, v0.f))
		routine(#LibGLES,l,glUniform1fv,( location.l, count.l, value.i))
		routine(#LibGLES,l,glUniform1i,( location.l, v0.l))
		routine(#LibGLES,l,glUniform1iv,( location.l, count.l, value.i))
		routine(#LibGLES,l,glUniform2f,( location.l, v0.f, v1.f))
		routine(#LibGLES,l,glUniform2fv,( location.l, count.l, value.i))
		routine(#LibGLES,l,glUniform2i,( location.l, v0.l, v1.l))
		routine(#LibGLES,l,glUniform2iv,( location.l, count.l, value.i))
		routine(#LibGLES,l,glUniform3f,( location.l, v0.f, v1.f, v2.f))
		routine(#LibGLES,l,glUniform3fv,( location.l, count.l, value.i))
		routine(#LibGLES,l,glUniform3i,( location.l, v0.l, v1.l, v2.l))
		routine(#LibGLES,l,glUniform3iv,( location.l, count.l, value.i))
		routine(#LibGLES,l,glUniform4f,( location.l, v0.f, v1.f, v2.f, v3.f))
		routine(#LibGLES,l,glUniform4fv,( location.l, count.l, value.i))
		routine(#LibGLES,l,glUniform4i,( location.l, v0.l, v1.l, v2.l, v3.l))
		routine(#LibGLES,l,glUniform4iv,( location.l, count.l, value.i))
		routine(#LibGLES,l,glUniformMatrix2fv,( location.l, count.l, transpose.b, value.i))
		routine(#LibGLES,l,glUniformMatrix3fv,( location.l, count.l, transpose.b, value.i))
		routine(#LibGLES,l,glUniformMatrix4fv,( location.l, count.l, transpose.b, value.i))
		routine(#LibGLES,l,glUseProgram,( program.l))
		routine(#LibGLES,l,glValidateProgram,( program.l))
		routine(#LibGLES,l,glVertexAttrib1f,( index.l, x.f))
		routine(#LibGLES,l,glVertexAttrib1fv,( index.l, v.i))
		routine(#LibGLES,l,glVertexAttrib2f,( index.l, x.f, y.f))
		routine(#LibGLES,l,glVertexAttrib2fv,( index.l, v.i))
		routine(#LibGLES,l,glVertexAttrib3f,( index.l, x.f, y.f, z.f))
		routine(#LibGLES,l,glVertexAttrib3fv,( index.l, v.i))
		routine(#LibGLES,l,glVertexAttrib4f,( index.l, x.f, y.f, z.f, w.f))
		routine(#LibGLES,l,glVertexAttrib4fv,( index.l, v.i))
		routine(#LibGLES,l,glVertexAttribPointer,( index.l, size.l, type.l, normalized.b, stride.l, pointer.i))
		routine(#LibGLES,l,glViewport,( x.l, y.l, width.l, height.l))
	;}
	;{ GLES 3.0 defines
		#GL_READ_BUFFER =                    3074
		#GL_UNPACK_ROW_LENGTH =              3314
		#GL_UNPACK_SKIP_ROWS =               3315
		#GL_UNPACK_SKIP_PIXELS =             3316
		#GL_PACK_ROW_LENGTH =                3330
		#GL_PACK_SKIP_ROWS =                 3331
		#GL_PACK_SKIP_PIXELS =               3332
		#GL_COLOR =                          6144
		#GL_DEPTH =                          6145
		#GL_STENCIL =                        6146
		#GL_RED =                            6403
		#GL_RGB8 =                           32849
		#GL_RGBA8 =                          32856
		#GL_RGB10_A2 =                       32857
		#GL_TEXTURE_BINDING_3D =             32874
		#GL_UNPACK_SKIP_IMAGES =             32877
		#GL_UNPACK_IMAGE_HEIGHT =            32878
		#GL_TEXTURE_3D =                     32879
		#GL_TEXTURE_WRAP_R =                 32882
		#GL_MAX_3D_TEXTURE_SIZE =            32883
		#GL_UNSIGNED_INT_2_10_10_10_REV =    33640
		#GL_MAX_ELEMENTS_VERTICES =          33000
		#GL_MAX_ELEMENTS_INDICES =           33001
		#GL_TEXTURE_MIN_LOD =                33082
		#GL_TEXTURE_MAX_LOD =                33083
		#GL_TEXTURE_BASE_LEVEL =             33084
		#GL_TEXTURE_MAX_LEVEL =              33085
		#GL_MIN =                            32775
		#GL_MAX =                            32776
		#GL_DEPTH_COMPONENT24 =              33190
		#GL_MAX_TEXTURE_LOD_BIAS =           34045
		#GL_TEXTURE_COMPARE_MODE =           34892
		#GL_TEXTURE_COMPARE_FUNC =           34893
		#GL_CURRENT_QUERY =                  34917
		#GL_QUERY_RESULT =                   34918
		#GL_QUERY_RESULT_AVAILABLE =         34919
		#GL_BUFFER_MAPPED =                  35004
		#GL_BUFFER_MAP_POINTER =             35005
		#GL_STREAM_READ =                    35041
		#GL_STREAM_COPY =                    35042
		#GL_STATIC_READ =                    35045
		#GL_STATIC_COPY =                    35046
		#GL_DYNAMIC_READ =                   35049
		#GL_DYNAMIC_COPY =                   35050
		#GL_MAX_DRAW_BUFFERS =               34852
		#GL_DRAW_BUFFER0 =                   34853
		#GL_DRAW_BUFFER1 =                   34854
		#GL_DRAW_BUFFER2 =                   34855
		#GL_DRAW_BUFFER3 =                   34856
		#GL_DRAW_BUFFER4 =                   34857
		#GL_DRAW_BUFFER5 =                   34858
		#GL_DRAW_BUFFER6 =                   34859
		#GL_DRAW_BUFFER7 =                   34860
		#GL_DRAW_BUFFER8 =                   34861
		#GL_DRAW_BUFFER9 =                   34862
		#GL_DRAW_BUFFER10 =                  34863
		#GL_DRAW_BUFFER11 =                  34864
		#GL_DRAW_BUFFER12 =                  34865
		#GL_DRAW_BUFFER13 =                  34866
		#GL_DRAW_BUFFER14 =                  34867
		#GL_DRAW_BUFFER15 =                  34868
		#GL_MAX_FRAGMENT_UNIFORM_COMPONENTS = 35657
		#GL_MAX_VERTEX_UNIFORM_COMPONENTS =  35658
		#GL_SAMPLER_3D =                     35679
		#GL_SAMPLER_2D_SHADOW =              35682
		#GL_FRAGMENT_SHADER_DERIVATIVE_HINT = 35723
		#GL_PIXEL_PACK_BUFFER =              35051
		#GL_PIXEL_UNPACK_BUFFER =            35052
		#GL_PIXEL_PACK_BUFFER_BINDING =      35053
		#GL_PIXEL_UNPACK_BUFFER_BINDING =    35055
		#GL_FLOAT_MAT2x3 =                   35685
		#GL_FLOAT_MAT2x4 =                   35686
		#GL_FLOAT_MAT3x2 =                   35687
		#GL_FLOAT_MAT3x4 =                   35688
		#GL_FLOAT_MAT4x2 =                   35689
		#GL_FLOAT_MAT4x3 =                   35690
		#GL_SRGB =                           35904
		#GL_SRGB8 =                          35905
		#GL_SRGB8_ALPHA8 =                   35907
		#GL_COMPARE_REF_TO_TEXTURE =         34894
		#GL_MAJOR_VERSION =                  33307
		#GL_MINOR_VERSION =                  33308
		#GL_NUM_EXTENSIONS =                 33309
		#GL_RGBA32F =                        34836
		#GL_RGB32F =                         34837
		#GL_RGBA16F =                        34842
		#GL_RGB16F =                         34843
		#GL_VERTEX_ATTRIB_ARRAY_INTEGER =    35069
		#GL_MAX_ARRAY_TEXTURE_LAYERS =       35071
		#GL_MIN_PROGRAM_TEXEL_OFFSET =       35076
		#GL_MAX_PROGRAM_TEXEL_OFFSET =       35077
		#GL_MAX_VARYING_COMPONENTS =         35659
		#GL_TEXTURE_2D_ARRAY =               35866
		#GL_TEXTURE_BINDING_2D_ARRAY =       35869
		#GL_R11F_G11F_B10F =                 35898
		#GL_UNSIGNED_INT_10F_11F_11F_REV =   35899
		#GL_RGB9_E5 =                        35901
		#GL_UNSIGNED_INT_5_9_9_9_REV =       35902
		#GL_TRANSFORM_FEEDBACK_VARYING_MAX_LENGTH = 35958
		#GL_TRANSFORM_FEEDBACK_BUFFER_MODE = 35967
		#GL_MAX_TRANSFORM_FEEDBACK_SEPARATE_COMPONENTS = 35968
		#GL_TRANSFORM_FEEDBACK_VARYINGS =    35971
		#GL_TRANSFORM_FEEDBACK_BUFFER_START = 35972
		#GL_TRANSFORM_FEEDBACK_BUFFER_SIZE = 35973
		#GL_TRANSFORM_FEEDBACK_PRIMITIVES_WRITTEN = 35976
		#GL_RASTERIZER_DISCARD =             35977
		#GL_MAX_TRANSFORM_FEEDBACK_INTERLEAVED_COMPONENTS = 35978
		#GL_MAX_TRANSFORM_FEEDBACK_SEPARATE_ATTRIBS = 35979
		#GL_INTERLEAVED_ATTRIBS =            35980
		#GL_SEPARATE_ATTRIBS =               35981
		#GL_TRANSFORM_FEEDBACK_BUFFER =      35982
		#GL_TRANSFORM_FEEDBACK_BUFFER_BINDING = 35983
		#GL_RGBA32UI =                       36208
		#GL_RGB32UI =                        36209
		#GL_RGBA16UI =                       36214
		#GL_RGB16UI =                        36215
		#GL_RGBA8UI =                        36220
		#GL_RGB8UI =                         36221
		#GL_RGBA32I =                        36226
		#GL_RGB32I =                         36227
		#GL_RGBA16I =                        36232
		#GL_RGB16I =                         36233
		#GL_RGBA8I =                         36238
		#GL_RGB8I =                          36239
		#GL_RED_INTEGER =                    36244
		#GL_RGB_INTEGER =                    36248
		#GL_RGBA_INTEGER =                   36249
		#GL_SAMPLER_2D_ARRAY =               36289
		#GL_SAMPLER_2D_ARRAY_SHADOW =        36292
		#GL_SAMPLER_CUBE_SHADOW =            36293
		#GL_UNSIGNED_INT_VEC2 =              36294
		#GL_UNSIGNED_INT_VEC3 =              36295
		#GL_UNSIGNED_INT_VEC4 =              36296
		#GL_INT_SAMPLER_2D =                 36298
		#GL_INT_SAMPLER_3D =                 36299
		#GL_INT_SAMPLER_CUBE =               36300
		#GL_INT_SAMPLER_2D_ARRAY =           36303
		#GL_UNSIGNED_INT_SAMPLER_2D =        36306
		#GL_UNSIGNED_INT_SAMPLER_3D =        36307
		#GL_UNSIGNED_INT_SAMPLER_CUBE =      36308
		#GL_UNSIGNED_INT_SAMPLER_2D_ARRAY =  36311
		#GL_BUFFER_ACCESS_FLAGS =            37151
		#GL_BUFFER_MAP_LENGTH =              37152
		#GL_BUFFER_MAP_OFFSET =              37153
		#GL_DEPTH_COMPONENT32F =             36012
		#GL_DEPTH32F_STENCIL8 =              36013
		#GL_FLOAT_32_UNSIGNED_INT_24_8_REV = 36269
		#GL_FRAMEBUFFER_ATTACHMENT_COLOR_ENCODING = 33296
		#GL_FRAMEBUFFER_ATTACHMENT_COMPONENT_TYPE = 33297
		#GL_FRAMEBUFFER_ATTACHMENT_RED_SIZE = 33298
		#GL_FRAMEBUFFER_ATTACHMENT_GREEN_SIZE = 33299
		#GL_FRAMEBUFFER_ATTACHMENT_BLUE_SIZE = 33300
		#GL_FRAMEBUFFER_ATTACHMENT_ALPHA_SIZE = 33301
		#GL_FRAMEBUFFER_ATTACHMENT_DEPTH_SIZE = 33302
		#GL_FRAMEBUFFER_ATTACHMENT_STENCIL_SIZE = 33303
		#GL_FRAMEBUFFER_DEFAULT =            33304
		#GL_FRAMEBUFFER_UNDEFINED =          33305
		#GL_DEPTH_STENCIL_ATTACHMENT =       33306
		#GL_DEPTH_STENCIL =                  34041
		#GL_UNSIGNED_INT_24_8 =              34042
		#GL_DEPTH24_STENCIL8 =               35056
		#GL_UNSIGNED_NORMALIZED =            35863
		#GL_DRAW_FRAMEBUFFER_BINDING =       36006
		#GL_READ_FRAMEBUFFER =               36008
		#GL_DRAW_FRAMEBUFFER =               36009
		#GL_READ_FRAMEBUFFER_BINDING =       36010
		#GL_RENDERBUFFER_SAMPLES =           36011
		#GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_LAYER = 36052
		#GL_MAX_COLOR_ATTACHMENTS =          36063
		#GL_COLOR_ATTACHMENT1 =              36065
		#GL_COLOR_ATTACHMENT2 =              36066
		#GL_COLOR_ATTACHMENT3 =              36067
		#GL_COLOR_ATTACHMENT4 =              36068
		#GL_COLOR_ATTACHMENT5 =              36069
		#GL_COLOR_ATTACHMENT6 =              36070
		#GL_COLOR_ATTACHMENT7 =              36071
		#GL_COLOR_ATTACHMENT8 =              36072
		#GL_COLOR_ATTACHMENT9 =              36073
		#GL_COLOR_ATTACHMENT10 =             36074
		#GL_COLOR_ATTACHMENT11 =             36075
		#GL_COLOR_ATTACHMENT12 =             36076
		#GL_COLOR_ATTACHMENT13 =             36077
		#GL_COLOR_ATTACHMENT14 =             36078
		#GL_COLOR_ATTACHMENT15 =             36079
		#GL_COLOR_ATTACHMENT16 =             36080
		#GL_COLOR_ATTACHMENT17 =             36081
		#GL_COLOR_ATTACHMENT18 =             36082
		#GL_COLOR_ATTACHMENT19 =             36083
		#GL_COLOR_ATTACHMENT20 =             36084
		#GL_COLOR_ATTACHMENT21 =             36085
		#GL_COLOR_ATTACHMENT22 =             36086
		#GL_COLOR_ATTACHMENT23 =             36087
		#GL_COLOR_ATTACHMENT24 =             36088
		#GL_COLOR_ATTACHMENT25 =             36089
		#GL_COLOR_ATTACHMENT26 =             36090
		#GL_COLOR_ATTACHMENT27 =             36091
		#GL_COLOR_ATTACHMENT28 =             36092
		#GL_COLOR_ATTACHMENT29 =             36093
		#GL_COLOR_ATTACHMENT30 =             36094
		#GL_COLOR_ATTACHMENT31 =             36095
		#GL_FRAMEBUFFER_INCOMPLETE_MULTISAMPLE = 36182
		#GL_MAX_SAMPLES =                    36183
		#GL_HALF_FLOAT =                     5131
		#GL_MAP_READ_BIT =                   1
		#GL_MAP_WRITE_BIT =                  2
		#GL_MAP_INVALIDATE_RANGE_BIT =       4
		#GL_MAP_INVALIDATE_BUFFER_BIT =      8
		#GL_MAP_FLUSH_EXPLICIT_BIT =         16
		#GL_MAP_UNSYNCHRONIZED_BIT =         32
		#GL_RG =                             33319
		#GL_RG_INTEGER =                     33320
		#GL_R8 =                             33321
		#GL_RG8 =                            33323
		#GL_R16F =                           33325
		#GL_R32F =                           33326
		#GL_RG16F =                          33327
		#GL_RG32F =                          33328
		#GL_R8I =                            33329
		#GL_R8UI =                           33330
		#GL_R16I =                           33331
		#GL_R16UI =                          33332
		#GL_R32I =                           33333
		#GL_R32UI =                          33334
		#GL_RG8I =                           33335
		#GL_RG8UI =                          33336
		#GL_RG16I =                          33337
		#GL_RG16UI =                         33338
		#GL_RG32I =                          33339
		#GL_RG32UI =                         33340
		#GL_VERTEX_ARRAY_BINDING =           34229
		#GL_R8_SNORM =                       36756
		#GL_RG8_SNORM =                      36757
		#GL_RGB8_SNORM =                     36758
		#GL_RGBA8_SNORM =                    36759
		#GL_SIGNED_NORMALIZED =              36764
		#GL_PRIMITIVE_RESTART_FIXED_INDEX =  36201
		#GL_COPY_READ_BUFFER =               36662
		#GL_COPY_WRITE_BUFFER =              36663
		#GL_COPY_READ_BUFFER_BINDING =       36662
		#GL_COPY_WRITE_BUFFER_BINDING =      36663
		#GL_UNIFORM_BUFFER =                 35345
		#GL_UNIFORM_BUFFER_BINDING =         35368
		#GL_UNIFORM_BUFFER_START =           35369
		#GL_UNIFORM_BUFFER_SIZE =            35370
		#GL_MAX_VERTEX_UNIFORM_BLOCKS =      35371
		#GL_MAX_FRAGMENT_UNIFORM_BLOCKS =    35373
		#GL_MAX_COMBINED_UNIFORM_BLOCKS =    35374
		#GL_MAX_UNIFORM_BUFFER_BINDINGS =    35375
		#GL_MAX_UNIFORM_BLOCK_SIZE =         35376
		#GL_MAX_COMBINED_VERTEX_UNIFORM_COMPONENTS = 35377
		#GL_MAX_COMBINED_FRAGMENT_UNIFORM_COMPONENTS = 35379
		#GL_UNIFORM_BUFFER_OFFSET_ALIGNMENT = 35380
		#GL_ACTIVE_UNIFORM_BLOCK_MAX_NAME_LENGTH = 35381
		#GL_ACTIVE_UNIFORM_BLOCKS =          35382
		#GL_UNIFORM_TYPE =                   35383
		#GL_UNIFORM_SIZE =                   35384
		#GL_UNIFORM_NAME_LENGTH =            35385
		#GL_UNIFORM_BLOCK_INDEX =            35386
		#GL_UNIFORM_OFFSET =                 35387
		#GL_UNIFORM_ARRAY_STRIDE =           35388
		#GL_UNIFORM_MATRIX_STRIDE =          35389
		#GL_UNIFORM_IS_ROW_MAJOR =           35390
		#GL_UNIFORM_BLOCK_BINDING =          35391
		#GL_UNIFORM_BLOCK_DATA_SIZE =        35392
		#GL_UNIFORM_BLOCK_NAME_LENGTH =      35393
		#GL_UNIFORM_BLOCK_ACTIVE_UNIFORMS =  35394
		#GL_UNIFORM_BLOCK_ACTIVE_UNIFORM_INDICES = 35395
		#GL_UNIFORM_BLOCK_REFERENCED_BY_VERTEX_SHADER = 35396
		#GL_UNIFORM_BLOCK_REFERENCED_BY_FRAGMENT_SHADER = 35398
		#GL_INVALID_INDEX =                  -1
		#GL_MAX_VERTEX_OUTPUT_COMPONENTS =   37154
		#GL_MAX_FRAGMENT_INPUT_COMPONENTS =  37157
		#GL_MAX_SERVER_WAIT_TIMEOUT =        37137
		#GL_OBJECT_TYPE =                    37138
		#GL_SYNC_CONDITION =                 37139
		#GL_SYNC_STATUS =                    37140
		#GL_SYNC_FLAGS =                     37141
		#GL_SYNC_FENCE =                     37142
		#GL_SYNC_GPU_COMMANDS_COMPLETE =     37143
		#GL_UNSIGNALED =                     37144
		#GL_SIGNALED =                       37145
		#GL_ALREADY_SIGNALED =               37146
		#GL_TIMEOUT_EXPIRED =                37147
		#GL_CONDITION_SATISFIED =            37148
		#GL_WAIT_FAILED =                    37149
		#GL_SYNC_FLUSH_COMMANDS_BIT =        1
		;#define GL_TIMEOUT_IGNORED                0xFFFFFFFFFFFFFFFFull
		#GL_VERTEX_ATTRIB_ARRAY_DIVISOR =    35070
		#GL_ANY_SAMPLES_PASSED =             35887
		#GL_ANY_SAMPLES_PASSED_CONSERVATIVE = 36202
		#GL_SAMPLER_BINDING =                35097
		#GL_RGB10_A2UI =                     36975
		#GL_TEXTURE_SWIZZLE_R =              36418
		#GL_TEXTURE_SWIZZLE_G =              36419
		#GL_TEXTURE_SWIZZLE_B =              36420
		#GL_TEXTURE_SWIZZLE_A =              36421
		#GL_GREEN =                          6404
		#GL_BLUE =                           6405
		#GL_INT_2_10_10_10_REV =             36255
		#GL_TRANSFORM_FEEDBACK =             36386
		#GL_TRANSFORM_FEEDBACK_PAUSED =      36387
		#GL_TRANSFORM_FEEDBACK_ACTIVE =      36388
		#GL_TRANSFORM_FEEDBACK_BINDING =     36389
		#GL_PROGRAM_BINARY_RETRIEVABLE_HINT = 33367
		#GL_PROGRAM_BINARY_LENGTH =          34625
		#GL_NUM_PROGRAM_BINARY_FORMATS =     34814
		#GL_PROGRAM_BINARY_FORMATS =         34815
		#GL_COMPRESSED_R11_EAC =             37488
		#GL_COMPRESSED_SIGNED_R11_EAC =      37489
		#GL_COMPRESSED_RG11_EAC =            37490
		#GL_COMPRESSED_SIGNED_RG11_EAC =     37491
		#GL_COMPRESSED_RGB8_ETC2 =           37492
		#GL_COMPRESSED_SRGB8_ETC2 =          37493
		#GL_COMPRESSED_RGB8_PUNCHTHROUGH_ALPHA1_ETC2 = 37494
		#GL_COMPRESSED_SRGB8_PUNCHTHROUGH_ALPHA1_ETC2 = 37495
		#GL_COMPRESSED_RGBA8_ETC2_EAC =      37496
		#GL_COMPRESSED_SRGB8_ALPHA8_ETC2_EAC = 37497
		#GL_TEXTURE_IMMUTABLE_FORMAT =       37167
		#GL_MAX_ELEMENT_INDEX =              36203
		#GL_NUM_SAMPLE_COUNTS =              37760
		#GL_TEXTURE_IMMUTABLE_LEVELS =       33503
	;}
	;{ GLES 3.0 PROTOTYPES
		routine(#LibGLES,l,glReadBuffer,( src.l))
		routine(#LibGLES,l,glDrawRangeElements,( mode.l, start.l, end_.l, count.l, type.l, indices.i))
		routine(#LibGLES,l,glTexImage3D,( target.l, level.l, internalformat.l, width.l, height.l, depth.l, border.l, format.l, type.l, pixels.i))
		routine(#LibGLES,l,glTexSubImage3D,( target.l, level.l, xoffset.l, yoffset.l, zoffset.l, width.l, height.l, depth.l, format.l, type.l, pixels.i))
		routine(#LibGLES,l,glCopyTexSubImage3D,( target.l, level.l, xoffset.l, yoffset.l, zoffset.l, x.l, y.l, width.l, height.l))
		routine(#LibGLES,l,glCompressedTexImage3D,( target.l, level.l, internalformat.l, width.l, height.l, depth.l, border.l, imageSize.l, data_.i))
		routine(#LibGLES,l,glCompressedTexSubImage3D,( target.l, level.l, xoffset.l, yoffset.l, zoffset.l, width.l, height.l, depth.l, format.l, imageSize.l, data_.i))
		routine(#LibGLES,l,glGenQueries,( n.l, ids.i))
		routine(#LibGLES,l,glDeleteQueries,( n.l, ids.i))
		routine(#LibGLES,b,glIsQuery,( id.l))
		routine(#LibGLES,l,glBeginQuery,( target.l, id.l))
		routine(#LibGLES,l,glEndQuery,( target.l))
		routine(#LibGLES,l,glGetQueryiv,( target.l, pname.l, params.i))
		routine(#LibGLES,l,glGetQueryObjectuiv,( id.l, pname.l, params.i))
		routine(#LibGLES,b,glUnmapBuffer,( target.l))
		routine(#LibGLES,l,glGetBufferPointerv,( target.l, pname.l, params.i))
		routine(#LibGLES,l,glDrawBuffers,( n.l, bufs.i))
		routine(#LibGLES,l,glUniformMatrix2x3fv,( location.l, count.l, transpose.b, value.i))
		routine(#LibGLES,l,glUniformMatrix3x2fv,( location.l, count.l, transpose.b, value.i))
		routine(#LibGLES,l,glUniformMatrix2x4fv,( location.l, count.l, transpose.b, value.i))
		routine(#LibGLES,l,glUniformMatrix4x2fv,( location.l, count.l, transpose.b, value.i))
		routine(#LibGLES,l,glUniformMatrix3x4fv,( location.l, count.l, transpose.b, value.i))
		routine(#LibGLES,l,glUniformMatrix4x3fv,( location.l, count.l, transpose.b, value.i))
		routine(#LibGLES,l,glBlitFramebuffer,( srcX0.l, srcY0.l, srcX1.l, srcY1.l, dstX0.l, dstY0.l, dstX1.l, dstY1.l, mask.l, filter.l))
		routine(#LibGLES,l,glRenderbufferStorageMultisample,( target.l, samples.l, internalformat.l, width.l, height.l))
		routine(#LibGLES,l,glFramebufferTextureLayer,( target.l, attachment.l, texture.l, level.l, layer.l))
		routine(#LibGLES,i,glMapBufferRange,( target.l, offset.l, length.l, access.l))
		routine(#LibGLES,l,glFlushMappedBufferRange,( target.l, offset.l, length.l))
		routine(#LibGLES,l,glBindVertexArray,( array_.l))
		routine(#LibGLES,l,glDeleteVertexArrays,( n.l, arrays.i))
		; better avoid using this ? At least with Firefox32bit ?
		;routine(#LibGLES,l,glGenVertexArrays,( n.l, arrays.i))
		;
		routine(#LibGLES,b,glIsVertexArray,( array_.l))
		routine(#LibGLES,l,glGetIntegeri_v,( target.l, index.l, data_.i))
		routine(#LibGLES,l,glBeginTransformFeedback,( primitiveMode.l))
		routine(#LibGLES,l,glEndTransformFeedback,( ))
		routine(#LibGLES,l,glBindBufferRange,( target.l, index.l, buffer.l, offset.l, size.l))
		routine(#LibGLES,l,glBindBufferBase,( target.l, index.l, buffer.l))
		routine(#LibGLES,l,glTransformFeedbackVaryings,( program.l, count.l, varyings.i, bufferMode.l))
		routine(#LibGLES,l,glGetTransformFeedbackVarying,( program.l, index.l, bufSize.l, length.i, size.i, type.i, name.i))
		routine(#LibGLES,l,glVertexAttribIPointer,( index.l, size.l, type.l, stride.l, pointer.i))
		routine(#LibGLES,l,glGetVertexAttribIiv,( index.l, pname.l, params.i))
		routine(#LibGLES,l,glGetVertexAttribIuiv,( index.l, pname.l, params.i))
		routine(#LibGLES,l,glVertexAttribI4i,( index.l, x.l, y.l, z.l, w.l))
		routine(#LibGLES,l,glVertexAttribI4ui,( index.l, x.l, y.l, z.l, w.l))
		routine(#LibGLES,l,glVertexAttribI4iv,( index.l, v.i))
		routine(#LibGLES,l,glVertexAttribI4uiv,( index.l, v.i))
		routine(#LibGLES,l,glGetUniformuiv,( program.l, location.l, params.i))
		routine(#LibGLES,l,glGetFragDataLocation,( program.l, name.p-ascii))
		routine(#LibGLES,l,glUniform1ui,( location.l, v0.l))
		routine(#LibGLES,l,glUniform2ui,( location.l, v0.l, v1.l))
		routine(#LibGLES,l,glUniform3ui,( location.l, v0.l, v1.l, v2.l))
		routine(#LibGLES,l,glUniform4ui,( location.l, v0.l, v1.l, v2.l, v3.l))
		routine(#LibGLES,l,glUniform1uiv,( location.l, count.l, value.i))
		routine(#LibGLES,l,glUniform2uiv,( location.l, count.l, value.i))
		routine(#LibGLES,l,glUniform3uiv,( location.l, count.l, value.i))
		routine(#LibGLES,l,glUniform4uiv,( location.l, count.l, value.i))
		routine(#LibGLES,l,glClearBufferiv,( buffer.l, drawbuffer.l, value.i))
		routine(#LibGLES,l,glClearBufferuiv,( buffer.l, drawbuffer.l, value.i))
		routine(#LibGLES,l,glClearBufferfv,( buffer.l, drawbuffer.l, value.i))
		routine(#LibGLES,l,glClearBufferfi,( buffer.l, drawbuffer.l, depth.f, stencil.l))
		routine_s(#LibGLES,l,glGetStringi,( name.l, index.l))
		routine(#LibGLES,l,glCopyBufferSubData,( readTarget.l, writeTarget.l, readOffset.l, writeOffset.l, size.l))
		routine(#LibGLES,l,glGetUniformIndices,( program.l, uniformCount.l, uniformNames.i, uniformIndices.i))
		routine(#LibGLES,l,glGetActiveUniformsiv,( program.l, uniformCount.l, uniformIndices.i, pname.l, params.i))
		routine(#LibGLES,l,glGetUniformBlockIndex,( program.l, uniformBlockName.i))
		routine(#LibGLES,l,glGetActiveUniformBlockiv,( program.l, uniformBlockIndex.l, pname.l, params.i)) 
		routine(#LibGLES,l,glGetActiveUniformBlockName,( program.l, uniformBlockIndex.l, bufSize.l, length.i, uniformBlockName.i))
		routine(#LibGLES,l,glUniformBlockBinding,( program.l, uniformBlockIndex.l, uniformBlockBinding.l))
		routine(#LibGLES,l,glDrawArraysInstanced,( mode.l, first.l, count.l, instancecount.l))
		routine(#LibGLES,l,glDrawElementsInstanced,( mode.l, count.l, type.l, indices.i, instancecount.l))
		routine(#LibGLES,i,glFenceSync,( condition.l, flags.l))
		routine(#LibGLES,b,glIsSync,( sync.i))
		routine(#LibGLES,l,glDeleteSync,( sync.i))
		routine(#LibGLES,l,glClientWaitSync,( sync.i, flags.l, timeout.d))
		routine(#LibGLES,l,glWaitSync,( sync.i, flags.l, timeout.d))
		routine(#LibGLES,l,glGetInteger64v,( pname.l, data_.i))
		routine(#LibGLES,l,glGetSynciv,( sync.i, pname.l, bufSize.l, length.i, values.i))
		routine(#LibGLES,l,glGetInteger64i_v,( target.l, index.l, data_.i))
		routine(#LibGLES,l,glGetBufferParameteri64v,( target.l, pname.l, params.i))
		routine(#LibGLES,l,glGenSamplers,( count.l, samplers.i))
		routine(#LibGLES,l,glDeleteSamplers,( count.l, samplers.i))
		routine(#LibGLES,b,glIsSampler,( sampler.l))
		routine(#LibGLES,l,glBindSampler,( unit.l, sampler.l))
		routine(#LibGLES,l,glSamplerParameteri,( sampler.l, pname.l, param.l))
		routine(#LibGLES,l,glSamplerParameteriv,( sampler.l, pname.l, param.i))
		routine(#LibGLES,l,glSamplerParameterf,( sampler.l, pname.l, param.f))
		routine(#LibGLES,l,glSamplerParameterfv,( sampler.l, pname.l, param.i))
		routine(#LibGLES,l,glGetSamplerParameteriv,( sampler.l, pname.l, params.i))
		routine(#LibGLES,l,glGetSamplerParameterfv,( sampler.l, pname.l, params.i))
		routine(#LibGLES,l,glVertexAttribDivisor,( index.l, divisor.l))
		routine(#LibGLES,l,glBindTransformFeedback,( target.l, id.l))
		routine(#LibGLES,l,glDeleteTransformFeedbacks,( n.l, ids.i))
		routine(#LibGLES,l,glGenTransformFeedbacks,( n.l, ids.i))
		routine(#LibGLES,b,glIsTransformFeedback,( id.l))
		routine(#LibGLES,l,glPauseTransformFeedback,( ))
		routine(#LibGLES,l,glResumeTransformFeedback,( ))
		routine(#LibGLES,l,glGetProgramBinary,( program.l, bufSize.l, length.i, binaryFormat.i, binary.i))
		routine(#LibGLES,l,glProgramBinary,( program.l, binaryFormat.l, binary.i, length.l))
		routine(#LibGLES,l,glProgramParameteri,( program.l, pname.l, value.l))
		routine(#LibGLES,l,glInvalidateFramebuffer,( target.l, numAttachments.l, attachments.i))
		routine(#LibGLES,l,glInvalidateSubFramebuffer,( target.l, numAttachments.l, attachments.i, x.l, y.l, width.l, height.l))
		routine(#LibGLES,l,glTexStorage2D,( target.l, levels.l, internalformat.l, width.l, height.l))
		routine(#LibGLES,l,glTexStorage3D,( target.l, levels.l, internalformat.l, width.l, height.l, depth.l))
		routine(#LibGLES,l,glGetInternalformativ,( target.l, internalformat.l, pname.l, bufSize.l, params.i))
	;}
	;{ GLES 3.1 defines
		#GL_COMPUTE_SHADER =                 37305
		#GL_MAX_COMPUTE_UNIFORM_BLOCKS =     37307
		#GL_MAX_COMPUTE_TEXTURE_IMAGE_UNITS = 37308
		#GL_MAX_COMPUTE_IMAGE_UNIFORMS =     37309
		#GL_MAX_COMPUTE_SHARED_MEMORY_SIZE = 33378
		#GL_MAX_COMPUTE_UNIFORM_COMPONENTS = 33379
		#GL_MAX_COMPUTE_ATOMIC_COUNTER_BUFFERS = 33380
		#GL_MAX_COMPUTE_ATOMIC_COUNTERS =    33381
		#GL_MAX_COMBINED_COMPUTE_UNIFORM_COMPONENTS = 33382
		#GL_MAX_COMPUTE_WORK_GROUP_INVOCATIONS = 37099
		#GL_MAX_COMPUTE_WORK_GROUP_COUNT =   37310
		#GL_MAX_COMPUTE_WORK_GROUP_SIZE =    37311
		#GL_COMPUTE_WORK_GROUP_SIZE =        33383
		#GL_DISPATCH_INDIRECT_BUFFER =       37102
		#GL_DISPATCH_INDIRECT_BUFFER_BINDING = 37103
		#GL_COMPUTE_SHADER_BIT =             32
		#GL_DRAW_INDIRECT_BUFFER =           36671
		#GL_DRAW_INDIRECT_BUFFER_BINDING =   36675
		#GL_MAX_UNIFORM_LOCATIONS =          33390
		#GL_FRAMEBUFFER_DEFAULT_WIDTH =      37648
		#GL_FRAMEBUFFER_DEFAULT_HEIGHT =     37649
		#GL_FRAMEBUFFER_DEFAULT_SAMPLES =    37651
		#GL_FRAMEBUFFER_DEFAULT_FIXED_SAMPLE_LOCATIONS = 37652
		#GL_MAX_FRAMEBUFFER_WIDTH =          37653
		#GL_MAX_FRAMEBUFFER_HEIGHT =         37654
		#GL_MAX_FRAMEBUFFER_SAMPLES =        37656
		#GL_UNIFORM =                        37601
		#GL_UNIFORM_BLOCK =                  37602
		#GL_PROGRAM_INPUT =                  37603
		#GL_PROGRAM_OUTPUT =                 37604
		#GL_BUFFER_VARIABLE =                37605
		#GL_SHADER_STORAGE_BLOCK =           37606
		#GL_ATOMIC_COUNTER_BUFFER =          37568
		#GL_TRANSFORM_FEEDBACK_VARYING =     37620
		#GL_ACTIVE_RESOURCES =               37621
		#GL_MAX_NAME_LENGTH =                37622
		#GL_MAX_NUM_ACTIVE_VARIABLES =       37623
		#GL_NAME_LENGTH =                    37625
		#GL_TYPE =                           37626
		#GL_ARRAY_SIZE =                     37627
		#GL_OFFSET =                         37628
		#GL_BLOCK_INDEX =                    37629
		#GL_ARRAY_STRIDE =                   37630
		#GL_MATRIX_STRIDE =                  37631
		#GL_IS_ROW_MAJOR =                   37632
		#GL_ATOMIC_COUNTER_BUFFER_INDEX =    37633
		#GL_BUFFER_BINDING =                 37634
		#GL_BUFFER_DATA_SIZE =               37635
		#GL_NUM_ACTIVE_VARIABLES =           37636
		#GL_ACTIVE_VARIABLES =               37637
		#GL_REFERENCED_BY_VERTEX_SHADER =    37638
		#GL_REFERENCED_BY_FRAGMENT_SHADER =  37642
		#GL_REFERENCED_BY_COMPUTE_SHADER =   37643
		#GL_TOP_LEVEL_ARRAY_SIZE =           37644
		#GL_TOP_LEVEL_ARRAY_STRIDE =         37645
		#GL_LOCATION =                       37646
		#GL_VERTEX_SHADER_BIT =              1
		#GL_FRAGMENT_SHADER_BIT =            2
		#GL_ALL_SHADER_BITS =                -1
		#GL_PROGRAM_SEPARABLE =              33368
		#GL_ACTIVE_PROGRAM =                 33369
		#GL_PROGRAM_PIPELINE_BINDING =       33370
		#GL_ATOMIC_COUNTER_BUFFER_BINDING =  37569
		#GL_ATOMIC_COUNTER_BUFFER_START =    37570
		#GL_ATOMIC_COUNTER_BUFFER_SIZE =     37571
		#GL_MAX_VERTEX_ATOMIC_COUNTER_BUFFERS = 37580
		#GL_MAX_FRAGMENT_ATOMIC_COUNTER_BUFFERS = 37584
		#GL_MAX_COMBINED_ATOMIC_COUNTER_BUFFERS = 37585
		#GL_MAX_VERTEX_ATOMIC_COUNTERS =     37586
		#GL_MAX_FRAGMENT_ATOMIC_COUNTERS =   37590
		#GL_MAX_COMBINED_ATOMIC_COUNTERS =   37591
		#GL_MAX_ATOMIC_COUNTER_BUFFER_SIZE = 37592
		#GL_MAX_ATOMIC_COUNTER_BUFFER_BINDINGS = 37596
		#GL_ACTIVE_ATOMIC_COUNTER_BUFFERS =  37593
		#GL_UNSIGNED_INT_ATOMIC_COUNTER =    37595
		#GL_MAX_IMAGE_UNITS =                36664
		#GL_MAX_VERTEX_IMAGE_UNIFORMS =      37066
		#GL_MAX_FRAGMENT_IMAGE_UNIFORMS =    37070
		#GL_MAX_COMBINED_IMAGE_UNIFORMS =    37071
		#GL_IMAGE_BINDING_NAME =             36666
		#GL_IMAGE_BINDING_LEVEL =            36667
		#GL_IMAGE_BINDING_LAYERED =          36668
		#GL_IMAGE_BINDING_LAYER =            36669
		#GL_IMAGE_BINDING_ACCESS =           36670
		#GL_IMAGE_BINDING_FORMAT =           36974
		#GL_VERTEX_ATTRIB_ARRAY_BARRIER_BIT = 1
		#GL_ELEMENT_ARRAY_BARRIER_BIT =      2
		#GL_UNIFORM_BARRIER_BIT =            4
		#GL_TEXTURE_FETCH_BARRIER_BIT =      8
		#GL_SHADER_IMAGE_ACCESS_BARRIER_BIT = 32
		#GL_COMMAND_BARRIER_BIT =            64
		#GL_PIXEL_BUFFER_BARRIER_BIT =       128
		#GL_TEXTURE_UPDATE_BARRIER_BIT =     256
		#GL_BUFFER_UPDATE_BARRIER_BIT =      512
		#GL_FRAMEBUFFER_BARRIER_BIT =        1024
		#GL_TRANSFORM_FEEDBACK_BARRIER_BIT = 2048
		#GL_ATOMIC_COUNTER_BARRIER_BIT =     4096
		#GL_ALL_BARRIER_BITS =               -1
		#GL_IMAGE_2D =                       36941
		#GL_IMAGE_3D =                       36942
		#GL_IMAGE_CUBE =                     36944
		#GL_IMAGE_2D_ARRAY =                 36947
		#GL_INT_IMAGE_2D =                   36952
		#GL_INT_IMAGE_3D =                   36953
		#GL_INT_IMAGE_CUBE =                 36955
		#GL_INT_IMAGE_2D_ARRAY =             36958
		#GL_UNSIGNED_INT_IMAGE_2D =          36963
		#GL_UNSIGNED_INT_IMAGE_3D =          36964
		#GL_UNSIGNED_INT_IMAGE_CUBE =        36966
		#GL_UNSIGNED_INT_IMAGE_2D_ARRAY =    36969
		#GL_IMAGE_FORMAT_COMPATIBILITY_TYPE = 37063
		#GL_IMAGE_FORMAT_COMPATIBILITY_BY_SIZE = 37064
		#GL_IMAGE_FORMAT_COMPATIBILITY_BY_CLASS = 37065
		#GL_READ_ONLY =                      35000
		#GL_WRITE_ONLY =                     35001
		#GL_READ_WRITE =                     35002
		#GL_SHADER_STORAGE_BUFFER =          37074
		#GL_SHADER_STORAGE_BUFFER_BINDING =  37075
		#GL_SHADER_STORAGE_BUFFER_START =    37076
		#GL_SHADER_STORAGE_BUFFER_SIZE =     37077
		#GL_MAX_VERTEX_SHADER_STORAGE_BLOCKS = 37078
		#GL_MAX_FRAGMENT_SHADER_STORAGE_BLOCKS = 37082
		#GL_MAX_COMPUTE_SHADER_STORAGE_BLOCKS = 37083
		#GL_MAX_COMBINED_SHADER_STORAGE_BLOCKS = 37084
		#GL_MAX_SHADER_STORAGE_BUFFER_BINDINGS = 37085
		#GL_MAX_SHADER_STORAGE_BLOCK_SIZE =  37086
		#GL_SHADER_STORAGE_BUFFER_OFFSET_ALIGNMENT = 37087
		#GL_SHADER_STORAGE_BARRIER_BIT =     8192
		#GL_MAX_COMBINED_SHADER_OUTPUT_RESOURCES = 36665
		#GL_DEPTH_STENCIL_TEXTURE_MODE =     37098
		#GL_STENCIL_INDEX =                  6401
		#GL_MIN_PROGRAM_TEXTURE_GATHER_OFFSET = 36446
		#GL_MAX_PROGRAM_TEXTURE_GATHER_OFFSET = 36447
		#GL_SAMPLE_POSITION =                36432
		#GL_SAMPLE_MASK =                    36433
		#GL_SAMPLE_MASK_VALUE =              36434
		#GL_TEXTURE_2D_MULTISAMPLE =         37120
		#GL_MAX_SAMPLE_MASK_WORDS =          36441
		#GL_MAX_COLOR_TEXTURE_SAMPLES =      37134
		#GL_MAX_DEPTH_TEXTURE_SAMPLES =      37135
		#GL_MAX_INTEGER_SAMPLES =            37136
		#GL_TEXTURE_BINDING_2D_MULTISAMPLE = 37124
		#GL_TEXTURE_SAMPLES =                37126
		#GL_TEXTURE_FIXED_SAMPLE_LOCATIONS = 37127
		#GL_TEXTURE_WIDTH =                  4096
		#GL_TEXTURE_HEIGHT =                 4097
		#GL_TEXTURE_DEPTH =                  32881
		#GL_TEXTURE_INTERNAL_FORMAT =        4099
		#GL_TEXTURE_RED_SIZE =               32860
		#GL_TEXTURE_GREEN_SIZE =             32861
		#GL_TEXTURE_BLUE_SIZE =              32862
		#GL_TEXTURE_ALPHA_SIZE =             32863
		#GL_TEXTURE_DEPTH_SIZE =             34890
		#GL_TEXTURE_STENCIL_SIZE =           35057
		#GL_TEXTURE_SHARED_SIZE =            35903
		#GL_TEXTURE_RED_TYPE =               35856
		#GL_TEXTURE_GREEN_TYPE =             35857
		#GL_TEXTURE_BLUE_TYPE =              35858
		#GL_TEXTURE_ALPHA_TYPE =             35859
		#GL_TEXTURE_DEPTH_TYPE =             35862
		#GL_TEXTURE_COMPRESSED =             34465
		#GL_SAMPLER_2D_MULTISAMPLE =         37128
		#GL_INT_SAMPLER_2D_MULTISAMPLE =     37129
		#GL_UNSIGNED_INT_SAMPLER_2D_MULTISAMPLE = 37130
		#GL_VERTEX_ATTRIB_BINDING =          33492
		#GL_VERTEX_ATTRIB_RELATIVE_OFFSET =  33493
		#GL_VERTEX_BINDING_DIVISOR =         33494
		#GL_VERTEX_BINDING_OFFSET =          33495
		#GL_VERTEX_BINDING_STRIDE =          33496
		#GL_VERTEX_BINDING_BUFFER =          36687
		#GL_MAX_VERTEX_ATTRIB_RELATIVE_OFFSET = 33497
		#GL_MAX_VERTEX_ATTRIB_BINDINGS =     33498
		#GL_MAX_VERTEX_ATTRIB_STRIDE =       33509
	;}
	;{ GLES 3.1 PROTOTYPES
		routine(#LibGLES,l,glDispatchCompute,( num_groups_x.l, num_groups_y.l, num_groups_z.l))
		routine(#LibGLES,l,glDispatchComputeIndirect,( indirect.l))
		routine(#LibGLES,l,glDrawArraysIndirect,( mode.l, indirect.i))
		routine(#LibGLES,l,glDrawElementsIndirect,( mode.l, type.l, indirect.i))
		routine(#LibGLES,l,glFramebufferParameteri,( target.l, pname.l, param.l))
		routine(#LibGLES,l,glGetFramebufferParameteriv,( target.l, pname.l, params.i))
		routine(#LibGLES,l,glGetProgramInterfaceiv,( program.l, programInterface.l, pname.l, params.i))
		routine(#LibGLES,l,glGetProgramResourceIndex,( program.l, programInterface.l, name.p-ascii))
		routine(#LibGLES,l,glGetProgramResourceName,( program.l, programInterface.l, index.l, bufSize.l, length.i, name.p-ascii))
		routine(#LibGLES,l,glGetProgramResourceiv,( program.l, programInterface.l, index.l, propCount.l, props.i, bufSize.l, length.i, params.i))
		routine(#LibGLES,l,glGetProgramResourceLocation,( program.l, programInterface.l, name.p-ascii))
		routine(#LibGLES,l,glUseProgramStages,( pipeline.l, stages.l, program.l))
		routine(#LibGLES,l,glActiveShaderProgram,( pipeline.l, program.l))
		routine(#LibGLES,l,glCreateShaderProgramv,( type.l, count.l, strings.i))
		routine(#LibGLES,l,glBindProgramPipeline,( pipeline.l))
		routine(#LibGLES,l,glDeleteProgramPipelines,( n.l, pipelines.i))
		routine(#LibGLES,l,glGenProgramPipelines,( n.l, pipelines.i))
		routine(#LibGLES,b,glIsProgramPipeline,( pipeline.l))
		routine(#LibGLES,l,glGetProgramPipelineiv,( pipeline.l, pname.l, params.i))
		routine(#LibGLES,l,glProgramUniform1i,( program.l, location.l, v0.l))
		routine(#LibGLES,l,glProgramUniform2i,( program.l, location.l, v0.l, v1.l))
		routine(#LibGLES,l,glProgramUniform3i,( program.l, location.l, v0.l, v1.l, v2.l))
		routine(#LibGLES,l,glProgramUniform4i,( program.l, location.l, v0.l, v1.l, v2.l, v3.l))
		routine(#LibGLES,l,glProgramUniform1ui,( program.l, location.l, v0.l))
		routine(#LibGLES,l,glProgramUniform2ui,( program.l, location.l, v0.l, v1.l))
		routine(#LibGLES,l,glProgramUniform3ui,( program.l, location.l, v0.l, v1.l, v2.l))
		routine(#LibGLES,l,glProgramUniform4ui,( program.l, location.l, v0.l, v1.l, v2.l, v3.l))
		routine(#LibGLES,l,glProgramUniform1f,( program.l, location.l, v0.f))
		routine(#LibGLES,l,glProgramUniform2f,( program.l, location.l, v0.f, v1.f))
		routine(#LibGLES,l,glProgramUniform3f,( program.l, location.l, v0.f, v1.f, v2.f))
		routine(#LibGLES,l,glProgramUniform4f,( program.l, location.l, v0.f, v1.f, v2.f, v3.f))
		routine(#LibGLES,l,glProgramUniform1iv,( program.l, location.l, count.l, value.i))
		routine(#LibGLES,l,glProgramUniform2iv,( program.l, location.l, count.l, value.i))
		routine(#LibGLES,l,glProgramUniform3iv,( program.l, location.l, count.l, value.i))
		routine(#LibGLES,l,glProgramUniform4iv,( program.l, location.l, count.l, value.i))
		routine(#LibGLES,l,glProgramUniform1uiv,( program.l, location.l, count.l, value.i))
		routine(#LibGLES,l,glProgramUniform2uiv,( program.l, location.l, count.l, value.i))
		routine(#LibGLES,l,glProgramUniform3uiv,( program.l, location.l, count.l, value.i))
		routine(#LibGLES,l,glProgramUniform4uiv,( program.l, location.l, count.l, value.i))
		routine(#LibGLES,l,glProgramUniform1fv,( program.l, location.l, count.l, value.i))
		routine(#LibGLES,l,glProgramUniform2fv,( program.l, location.l, count.l, value.i))
		routine(#LibGLES,l,glProgramUniform3fv,( program.l, location.l, count.l, value.i))
		routine(#LibGLES,l,glProgramUniform4fv,( program.l, location.l, count.l, value.i))
		routine(#LibGLES,l,glProgramUniformMatrix2fv,( program.l, location.l, count.l, transpose.b, value.i))
		routine(#LibGLES,l,glProgramUniformMatrix3fv,( program.l, location.l, count.l, transpose.b, value.i))
		routine(#LibGLES,l,glProgramUniformMatrix4fv,( program.l, location.l, count.l, transpose.b, value.i))
		routine(#LibGLES,l,glProgramUniformMatrix2x3fv,( program.l, location.l, count.l, transpose.b, value.i))
		routine(#LibGLES,l,glProgramUniformMatrix3x2fv,( program.l, location.l, count.l, transpose.b, value.i))
		routine(#LibGLES,l,glProgramUniformMatrix2x4fv,( program.l, location.l, count.l, transpose.b, value.i))
		routine(#LibGLES,l,glProgramUniformMatrix4x2fv,( program.l, location.l, count.l, transpose.b, value.i))
		routine(#LibGLES,l,glProgramUniformMatrix3x4fv,( program.l, location.l, count.l, transpose.b, value.i))
		routine(#LibGLES,l,glProgramUniformMatrix4x3fv,( program.l, location.l, count.l, transpose.b, value.i))
		routine(#LibGLES,l,glValidateProgramPipeline,( pipeline.l))
		routine(#LibGLES,l,glGetProgramPipelineInfoLog,( pipeline.l, bufSize.l, length.i, infoLog.i))
		routine(#LibGLES,l,glBindImageTexture,( unit.l, texture.l, level.l, layered.b, layer.l, access.l, format.l))
		routine(#LibGLES,l,glGetBooleani_v,( target.l, index.l, data_.i))
		routine(#LibGLES,l,glMemoryBarrier,( barriers.l))
		routine(#LibGLES,l,glMemoryBarrierByRegion,( barriers.l))
		routine(#LibGLES,l,glTexStorage2DMultisample,( target.l, samples.l, internalformat.l, width.l, height.l, fixedsamplelocations.b))
		routine(#LibGLES,l,glGetMultisamplefv,( pname.l, index.l, val.i))
		routine(#LibGLES,l,glSampleMaski,( maskNumber.l, mask.l))
		routine(#LibGLES,l,glGetTexLevelParameteriv,( target.l, level.l, pname.l, params.i))
		routine(#LibGLES,l,glGetTexLevelParameterfv,( target.l, level.l, pname.l, params.i))
		routine(#LibGLES,l,glBindVertexBuffer,( bindingindex.l, buffer.l, offset.l, stride.l))
		routine(#LibGLES,l,glVertexAttribFormat,( attribindex.l, size.l, type.l, normalized.b, relativeoffset.l))
		routine(#LibGLES,l,glVertexAttribIFormat,( attribindex.l, size.l, type.l, relativeoffset.l))
		routine(#LibGLES,l,glVertexAttribBinding,( attribindex.l, bindingindex.l))
		routine(#LibGLES,l,glVertexBindingDivisor,( bindingindex.l, divisor.l))
	;}
	;{ GLES 3.2 defines
		#GL_MULTISAMPLE_LINE_WIDTH_RANGE =   37761
		#GL_MULTISAMPLE_LINE_WIDTH_GRANULARITY = 37762
		#GL_MULTIPLY =                       37524
		#GL_SCREEN =                         37525
		#GL_OVERLAY =                        37526
		#GL_DARKEN =                         37527
		#GL_LIGHTEN =                        37528
		#GL_COLORDODGE =                     37529
		#GL_COLORBURN =                      37530
		#GL_HARDLIGHT =                      37531
		#GL_SOFTLIGHT =                      37532
		#GL_DIFFERENCE =                     37534
		#GL_EXCLUSION =                      37536
		#GL_HSL_HUE =                        37549
		#GL_HSL_SATURATION =                 37550
		#GL_HSL_COLOR =                      37551
		#GL_HSL_LUMINOSITY =                 37552
		#GL_DEBUG_OUTPUT_SYNCHRONOUS =       33346
		#GL_DEBUG_NEXT_LOGGED_MESSAGE_LENGTH = 33347
		#GL_DEBUG_CALLBACK_FUNCTION =        33348
		#GL_DEBUG_CALLBACK_USER_PARAM =      33349
		#GL_DEBUG_SOURCE_API =               33350
		#GL_DEBUG_SOURCE_WINDOW_SYSTEM =     33351
		#GL_DEBUG_SOURCE_SHADER_COMPILER =   33352
		#GL_DEBUG_SOURCE_THIRD_PARTY =       33353
		#GL_DEBUG_SOURCE_APPLICATION =       33354
		#GL_DEBUG_SOURCE_OTHER =             33355
		#GL_DEBUG_TYPE_ERROR =               33356
		#GL_DEBUG_TYPE_DEPRECATED_BEHAVIOR = 33357
		#GL_DEBUG_TYPE_UNDEFINED_BEHAVIOR =  33358
		#GL_DEBUG_TYPE_PORTABILITY =         33359
		#GL_DEBUG_TYPE_PERFORMANCE =         33360
		#GL_DEBUG_TYPE_OTHER =               33361
		#GL_DEBUG_TYPE_MARKER =              33384
		#GL_DEBUG_TYPE_PUSH_GROUP =          33385
		#GL_DEBUG_TYPE_POP_GROUP =           33386
		#GL_DEBUG_SEVERITY_NOTIFICATION =    33387
		#GL_MAX_DEBUG_GROUP_STACK_DEPTH =    33388
		#GL_DEBUG_GROUP_STACK_DEPTH =        33389
		#GL_BUFFER =                         33504
		#GL_SHADER =                         33505
		#GL_PROGRAM =                        33506
		#GL_VERTEX_ARRAY =                   32884
		#GL_QUERY =                          33507
		#GL_PROGRAM_PIPELINE =               33508
		#GL_SAMPLER =                        33510
		#GL_MAX_LABEL_LENGTH =               33512
		#GL_MAX_DEBUG_MESSAGE_LENGTH =       37187
		#GL_MAX_DEBUG_LOGGED_MESSAGES =      37188
		#GL_DEBUG_LOGGED_MESSAGES =          37189
		#GL_DEBUG_SEVERITY_HIGH =            37190
		#GL_DEBUG_SEVERITY_MEDIUM =          37191
		#GL_DEBUG_SEVERITY_LOW =             37192
		#GL_DEBUG_OUTPUT =                   37600
		#GL_CONTEXT_FLAG_DEBUG_BIT =         2

		#GL_STACK_OVERFLOW =                 1283
		#GL_STACK_UNDERFLOW =                1284

		#GL_GEOMETRY_SHADER =                36313
		#GL_GEOMETRY_SHADER_BIT =            4
		#GL_GEOMETRY_VERTICES_OUT =          35094
		#GL_GEOMETRY_INPUT_TYPE =            35095
		#GL_GEOMETRY_OUTPUT_TYPE =           35096
		#GL_GEOMETRY_SHADER_INVOCATIONS =    34943
		#GL_LAYER_PROVOKING_VERTEX =         33374
		#GL_LINES_ADJACENCY =                10
		#GL_LINE_STRIP_ADJACENCY =           11
		#GL_TRIANGLES_ADJACENCY =            12
		#GL_TRIANGLE_STRIP_ADJACENCY =       13
		#GL_MAX_GEOMETRY_UNIFORM_COMPONENTS = 36319
		#GL_MAX_GEOMETRY_UNIFORM_BLOCKS =    35372
		#GL_MAX_COMBINED_GEOMETRY_UNIFORM_COMPONENTS = 35378
		#GL_MAX_GEOMETRY_INPUT_COMPONENTS =  37155
		#GL_MAX_GEOMETRY_OUTPUT_COMPONENTS = 37156
		#GL_MAX_GEOMETRY_OUTPUT_VERTICES =   36320
		#GL_MAX_GEOMETRY_TOTAL_OUTPUT_COMPONENTS = 36321
		#GL_MAX_GEOMETRY_SHADER_INVOCATIONS = 36442
		#GL_MAX_GEOMETRY_TEXTURE_IMAGE_UNITS = 35881
		#GL_MAX_GEOMETRY_ATOMIC_COUNTER_BUFFERS = 37583
		#GL_MAX_GEOMETRY_ATOMIC_COUNTERS =   37589
		#GL_MAX_GEOMETRY_IMAGE_UNIFORMS =    37069
		#GL_MAX_GEOMETRY_SHADER_STORAGE_BLOCKS = 37079
		#GL_FIRST_VERTEX_CONVENTION =        36429
		#GL_LAST_VERTEX_CONVENTION =         36430
		#GL_UNDEFINED_VERTEX =               33376
		#GL_PRIMITIVES_GENERATED =           35975
		#GL_FRAMEBUFFER_DEFAULT_LAYERS =     37650
		#GL_MAX_FRAMEBUFFER_LAYERS =         37655
		#GL_FRAMEBUFFER_INCOMPLETE_LAYER_TARGETS = 36264
		#GL_FRAMEBUFFER_ATTACHMENT_LAYERED = 36263
		#GL_REFERENCED_BY_GEOMETRY_SHADER =  37641
		#GL_PRIMITIVE_BOUNDING_BOX =         37566
		#GL_CONTEXT_FLAG_ROBUST_ACCESS_BIT = 4
		#GL_CONTEXT_FLAGS =                  33310
		#GL_LOSE_CONTEXT_ON_RESET =          33362
		#GL_GUILTY_CONTEXT_RESET =           33363
		#GL_INNOCENT_CONTEXT_RESET =         33364
		#GL_UNKNOWN_CONTEXT_RESET =          33365
		#GL_RESET_NOTIFICATION_STRATEGY =    33366
		#GL_NO_RESET_NOTIFICATION =          33377
		#GL_CONTEXT_LOST =                   1287
		#GL_SAMPLE_SHADING =                 35894
		#GL_MIN_SAMPLE_SHADING_VALUE =       35895
		#GL_MIN_FRAGMENT_INTERPOLATION_OFFSET = 36443
		#GL_MAX_FRAGMENT_INTERPOLATION_OFFSET = 36444
		#GL_FRAGMENT_INTERPOLATION_OFFSET_BITS = 36445
		#GL_PATCHES =                        14
		#GL_PATCH_VERTICES =                 36466
		#GL_TESS_CONTROL_OUTPUT_VERTICES =   36469
		#GL_TESS_GEN_MODE =                  36470
		#GL_TESS_GEN_SPACING =               36471
		#GL_TESS_GEN_VERTEX_ORDER =          36472
		#GL_TESS_GEN_POINT_MODE =            36473
		#GL_ISOLINES =                       36474
		#GL_QUADS =                          7
		#GL_FRACTIONAL_ODD =                 36475
		#GL_FRACTIONAL_EVEN =                36476
		#GL_MAX_PATCH_VERTICES =             36477
		#GL_MAX_TESS_GEN_LEVEL =             36478
		#GL_MAX_TESS_CONTROL_UNIFORM_COMPONENTS = 36479
		#GL_MAX_TESS_EVALUATION_UNIFORM_COMPONENTS = 36480
		#GL_MAX_TESS_CONTROL_TEXTURE_IMAGE_UNITS = 36481
		#GL_MAX_TESS_EVALUATION_TEXTURE_IMAGE_UNITS = 36482
		#GL_MAX_TESS_CONTROL_OUTPUT_COMPONENTS = 36483
		#GL_MAX_TESS_PATCH_COMPONENTS =      36484
		#GL_MAX_TESS_CONTROL_TOTAL_OUTPUT_COMPONENTS = 36485
		#GL_MAX_TESS_EVALUATION_OUTPUT_COMPONENTS = 36486
		#GL_MAX_TESS_CONTROL_UNIFORM_BLOCKS = 36489
		#GL_MAX_TESS_EVALUATION_UNIFORM_BLOCKS = 36490
		#GL_MAX_TESS_CONTROL_INPUT_COMPONENTS = 34924
		#GL_MAX_TESS_EVALUATION_INPUT_COMPONENTS = 34925
		#GL_MAX_COMBINED_TESS_CONTROL_UNIFORM_COMPONENTS = 36382
		#GL_MAX_COMBINED_TESS_EVALUATION_UNIFORM_COMPONENTS = 36383
		#GL_MAX_TESS_CONTROL_ATOMIC_COUNTER_BUFFERS = 37581
		#GL_MAX_TESS_EVALUATION_ATOMIC_COUNTER_BUFFERS = 37582
		#GL_MAX_TESS_CONTROL_ATOMIC_COUNTERS = 37587
		#GL_MAX_TESS_EVALUATION_ATOMIC_COUNTERS = 37588
		#GL_MAX_TESS_CONTROL_IMAGE_UNIFORMS = 37067
		#GL_MAX_TESS_EVALUATION_IMAGE_UNIFORMS = 37068
		#GL_MAX_TESS_CONTROL_SHADER_STORAGE_BLOCKS = 37080
		#GL_MAX_TESS_EVALUATION_SHADER_STORAGE_BLOCKS = 37081
		#GL_PRIMITIVE_RESTART_FOR_PATCHES_SUPPORTED = 33313
		#GL_IS_PER_PATCH =                   37607
		#GL_REFERENCED_BY_TESS_CONTROL_SHADER = 37639
		#GL_REFERENCED_BY_TESS_EVALUATION_SHADER = 37640
		#GL_TESS_CONTROL_SHADER =            36488
		#GL_TESS_EVALUATION_SHADER =         36487
		#GL_TESS_CONTROL_SHADER_BIT =        8
		#GL_TESS_EVALUATION_SHADER_BIT =     16
		#GL_TEXTURE_BORDER_COLOR =           4100
		#GL_CLAMP_TO_BORDER =                33069
		#GL_TEXTURE_BUFFER =                 35882
		#GL_TEXTURE_BUFFER_BINDING =         35882
		#GL_MAX_TEXTURE_BUFFER_SIZE =        35883
		#GL_TEXTURE_BINDING_BUFFER =         35884
		#GL_TEXTURE_BUFFER_DATA_STORE_BINDING = 35885
		#GL_TEXTURE_BUFFER_OFFSET_ALIGNMENT = 37279
		#GL_SAMPLER_BUFFER =                 36290
		#GL_INT_SAMPLER_BUFFER =             36304
		#GL_UNSIGNED_INT_SAMPLER_BUFFER =    36312
		#GL_IMAGE_BUFFER =                   36945
		#GL_INT_IMAGE_BUFFER =               36956
		#GL_UNSIGNED_INT_IMAGE_BUFFER =      36967
		#GL_TEXTURE_BUFFER_OFFSET =          37277
		#GL_TEXTURE_BUFFER_SIZE =            37278
		#GL_COMPRESSED_RGBA_ASTC_4x4 =       37808
		#GL_COMPRESSED_RGBA_ASTC_5x4 =       37809
		#GL_COMPRESSED_RGBA_ASTC_5x5 =       37810
		#GL_COMPRESSED_RGBA_ASTC_6x5 =       37811
		#GL_COMPRESSED_RGBA_ASTC_6x6 =       37812
		#GL_COMPRESSED_RGBA_ASTC_8x5 =       37813
		#GL_COMPRESSED_RGBA_ASTC_8x6 =       37814
		#GL_COMPRESSED_RGBA_ASTC_8x8 =       37815
		#GL_COMPRESSED_RGBA_ASTC_15 =      37816
		#GL_COMPRESSED_RGBA_ASTC_16 =      37817
		#GL_COMPRESSED_RGBA_ASTC_18 =      37818
		#GL_COMPRESSED_RGBA_ASTC_116 =     37819
		#GL_COMPRESSED_RGBA_ASTC_12x10 =     37820
		#GL_COMPRESSED_RGBA_ASTC_12x12 =     37821
		#GL_COMPRESSED_SRGB8_ALPHA8_ASTC_4x4 = 37840
		#GL_COMPRESSED_SRGB8_ALPHA8_ASTC_5x4 = 37841
		#GL_COMPRESSED_SRGB8_ALPHA8_ASTC_5x5 = 37842
		#GL_COMPRESSED_SRGB8_ALPHA8_ASTC_6x5 = 37843
		#GL_COMPRESSED_SRGB8_ALPHA8_ASTC_6x6 = 37844
		#GL_COMPRESSED_SRGB8_ALPHA8_ASTC_8x5 = 37845
		#GL_COMPRESSED_SRGB8_ALPHA8_ASTC_8x6 = 37846
		#GL_COMPRESSED_SRGB8_ALPHA8_ASTC_8x8 = 37847
		#GL_COMPRESSED_SRGB8_ALPHA8_ASTC_15 = 37848
		#GL_COMPRESSED_SRGB8_ALPHA8_ASTC_16 = 37849
		#GL_COMPRESSED_SRGB8_ALPHA8_ASTC_18 = 37850
		#GL_COMPRESSED_SRGB8_ALPHA8_ASTC_116 = 37851
		#GL_COMPRESSED_SRGB8_ALPHA8_ASTC_12x10 = 37852
		#GL_COMPRESSED_SRGB8_ALPHA8_ASTC_12x12 = 37853
		#GL_TEXTURE_CUBE_MAP_ARRAY =         36873
		#GL_TEXTURE_BINDING_CUBE_MAP_ARRAY = 36874
		#GL_SAMPLER_CUBE_MAP_ARRAY =         36876
		#GL_SAMPLER_CUBE_MAP_ARRAY_SHADOW =  36877
		#GL_INT_SAMPLER_CUBE_MAP_ARRAY =     36878
		#GL_UNSIGNED_INT_SAMPLER_CUBE_MAP_ARRAY = 36879
		#GL_IMAGE_CUBE_MAP_ARRAY =           36948
		#GL_INT_IMAGE_CUBE_MAP_ARRAY =       36959
		#GL_UNSIGNED_INT_IMAGE_CUBE_MAP_ARRAY = 36970
		#GL_TEXTURE_2D_MULTISAMPLE_ARRAY =   37122
		#GL_TEXTURE_BINDING_2D_MULTISAMPLE_ARRAY = 37125
		#GL_SAMPLER_2D_MULTISAMPLE_ARRAY =   37131
		#GL_INT_SAMPLER_2D_MULTISAMPLE_ARRAY = 37132
		#GL_UNSIGNED_INT_SAMPLER_2D_MULTISAMPLE_ARRAY = 37133
	;}
	;{ GLES 3.2 PROTOTYPES
		routine(#LibGLES,l,glBlendBarrier,( ))
		routine(#LibGLES,l,glCopyImageSubData,( srcName.l, srcTarget.l, srcLevel.l, srcX.l, srcY.l, srcZ.l, dstName.l, dstTarget.l, dstLevel.l, dstX.l, dstY.l, dstZ.l, srcWidth.l, srcHeight.l, srcDepth.l))
		routine(#LibGLES,l,glDebugMessageControl,( source.l, type.l, severity.l, count.l, ids.i, enabled.b))
		routine(#LibGLES,l,glDebugMessageInsert,( source.l, type.l, id.l, severity.l, length.l, buf.i))
		routine(#LibGLES,l,glDebugMessageCallback,( callback.i, userParam.i))
		routine(#LibGLES,l,glGetDebugMessageLog,( count.l, bufSize.l, sources.i, types.i, ids.i, severities.i, lengths.i, messageLog.i))
		routine(#LibGLES,l,glPushDebugGroup,( source.l, id.l, length.l, message.i))
		routine(#LibGLES,l,glPopDebugGroup,( ))
		routine(#LibGLES,l,glObjectLabel,( identifier.l, name.l, length.l, label.i))
		routine(#LibGLES,l,glGetObjectLabel,( identifier.l, name.l, bufSize.l, length.i, label.i))
		routine(#LibGLES,l,glObjectPtrLabel,( ptr.i, length.l, label.i))
		routine(#LibGLES,l,glGetObjectPtrLabel,( ptr.i, bufSize.l, length.i, label.i))
		routine(#LibGLES,l,glGetPointerv,( pname.l, params.i))
		routine(#LibGLES,l,glEnablei,( target.l, index.l))
		routine(#LibGLES,l,glDisablei,( target.l, index.l))
		routine(#LibGLES,l,glBlendEquationi,( buf.l, mode.l))
		routine(#LibGLES,l,glBlendEquationSeparatei,( buf.l, modeRGB.l, modeAlpha.l))
		routine(#LibGLES,l,glBlendFunci,( buf.l, src.l, dst.l))
		routine(#LibGLES,l,glBlendFuncSeparatei,( buf.l, srcRGB.l, dstRGB.l, srcAlpha.l, dstAlpha.l))
		routine(#LibGLES,l,glColorMaski,( index.l, r.b, g.b, b.b, a.b))
		routine(#LibGLES,b,glIsEnabledi,( target.l, index.l))
		routine(#LibGLES,l,glDrawElementsBaseVertex,( mode.l, count.l, type.l, indices.i, basevertex.l))
		routine(#LibGLES,l,glDrawRangeElementsBaseVertex,( mode.l, start.l, end_.l, count.l, type.l, indices.i, basevertex.l))
		routine(#LibGLES,l,glDrawElementsInstancedBaseVertex,( mode.l, count.l, type.l, indices.i, instancecount.l, basevertex.l))
		routine(#LibGLES,l,glFramebufferTexture,( target.l, attachment.l, texture.l, level.l))
		routine(#LibGLES,l,glPrimitiveBoundingBox,( minX.f, minY.f, minZ.f, minW.f, maxX.f, maxY.f, maxZ.f, maxW.f))
		routine(#LibGLES,l,glGetGraphicsResetStatus,( ))
		routine(#LibGLES,l,glReadnPixels,( x.l, y.l, width.l, height.l, format.l, type.l, bufSize.l, data_.i))
		routine(#LibGLES,l,glGetnUniformfv,( program.l, location.l, bufSize.l, params.i))
		routine(#LibGLES,l,glGetnUniformiv,( program.l, location.l, bufSize.l, params.i))
		routine(#LibGLES,l,glGetnUniformuiv,( program.l, location.l, bufSize.l, params.i))
		routine(#LibGLES,l,glMinSampleShading,( value.f))
		routine(#LibGLES,l,glPatchParameteri,( pname.l, value.l))
		routine(#LibGLES,l,glTexParameterIiv,( target.l, pname.l, params.i))
		routine(#LibGLES,l,glTexParameterIuiv,( target.l, pname.l, params.i))
		routine(#LibGLES,l,glGetTexParameterIiv,( target.l, pname.l, params.i))
		routine(#LibGLES,l,glGetTexParameterIuiv,( target.l, pname.l, params.i))
		routine(#LibGLES,l,glSamplerParameterIiv,( sampler.l, pname.l, param.i))
		routine(#LibGLES,l,glSamplerParameterIuiv,( sampler.l, pname.l, param.i))
		routine(#LibGLES,l,glGetSamplerParameterIiv,( sampler.l, pname.l, params.i))
		routine(#LibGLES,l,glGetSamplerParameterIuiv,( sampler.l, pname.l, params.i))
		routine(#LibGLES,l,glTexBuffer,( target.l, internalformat.l, buffer.l))
		routine(#LibGLES,l,glTexBufferRange,( target.l, internalformat.l, buffer.l, offset.l, size.l ))
		routine(#LibGLES,l,glTexStorage3DMultisample,( target.l, samples.l, internalformat.l, width.l, height.l, depth.l, fixedsamplelocations.b))
	;}



		Declare.s GetErrorString(error.l)
		Declare throw_error(msg.s)
		
		Declare make_shader(type.l, source_type.s = "string", source.s = "")
		Declare make_program(vertex_shader.l, fragment_shader.l, validate.l = #False)
		Declare make_buffer(type.l, usage.l, data_size.l, data_.i, bo.i)
		Declare set_vertex_attribute(program.l, varname.s, buffer.i, size.l, stride.l = 0, start.l = 0,no_checks = #False) 
		
		Declare.i Gadget(GNum.i, X.i, Y.i, Width.i, Height.i, Flags.i=#False, WindowNum.i=#PB_Default)
		Declare Gadget_SwapBuffers(GNum.i)
	EndDeclareModule
	
	Module gles
	
		routine_proc_s(glGetString,(name.l))
		routine_proc_s(glGetStringi,( name.l, index.l))
	
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

		;"Constructs and returns a shader"
		Procedure make_shader(type.l, ; "GL_VERTEX_SHADER or GL_FRAGMENT_SHADER"
			 source_type.s = "string", ; "string" or "file"
			 source.s = "") ; Shader source string

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
				glGetProgramInfoLog (program, InfoLogLength,  @InfoLogLength, @msg)
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
		
		Procedure set_vertex_attribute(program.l, ;"Value returned by make_program or glCreateProgram"
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


		; some code below is "inspired by" (AKA stolen from) Thorsten Hoeppner 
	
		Structure GLES_Canvas_Window_Structure  ; GLES_Canvas()\Window\...
			Num.i
			Width.f
			Height.f
		EndStructure ;
	
		Structure GLES_Canvas_Size_Structure    ; GLES_Canvas()\Size\...
			X.f
			Y.f
			Width.f
			Height.f
			Flags.i
		EndStructure ;
	
		Structure GLES_Canvas_Structure         ; GLES_Canvas()\...
			CanvasNum.i
			ID.s
	    State.i
			Hide.i
	
			Flags.i
	
			Window.GLES_Canvas_Window_Structure
			Size.GLES_Canvas_Size_Structure
			
			imagenum.i
			
		EndStructure ;
		
		Global NewMap GLES_Canvas.GLES_Canvas_Structure()
	
		Procedure.i Gadget(GNum.i, X.i, Y.i, Width.i, Height.i, Flags.i=#False, WindowNum.i=#PB_Default)
			Define DummyNum, Result.i
			
			
			If #False ; FIX ME: Flags & #UseExistingCanvas ; Use an existing CanvasGadget
	      If IsGadget(GNum)
	        Result = #True
	      Else
	        ProcedureReturn #False
	      EndIf
	      ;
	    Else
	      Result = CanvasGadget(GNum, X, Y, Width, Height)
	    EndIf
			
			If Result
	
				If GNum = #PB_Any : GNum = Result : EndIf
	
				If AddMapElement(GLES_Canvas(), Str(GNum))
	
					GLES_Canvas()\CanvasNum = GNum
	
					If WindowNum = #PB_Default
						GLES_Canvas()\Window\Num = GetActiveWindow()
					Else
						GLES_Canvas()\Window\Num = WindowNum
					EndIf
						
					GLES_Canvas()\Size\X = X
					GLES_Canvas()\Size\Y = Y
					GLES_Canvas()\Size\Width  = Width
					GLES_Canvas()\Size\Height = Height
	
					GLES_Canvas()\imagenum = CreateImage(#PB_Any, Width, Height, 32)
					ProcedureReturn GNum
				EndIf
	
			EndIf
	
		EndProcedure
		
		; copy content of framebuffer to our CanvasGadget
		Procedure Gadget_SwapBuffers(GNum.i)
			If FindMapElement(GLES_Canvas(), Str(GNum))
				If StartDrawing(ImageOutput(GLES_Canvas()\imagenum))
					glReadPixels (0, 0, GLES_Canvas()\Size\Width, GLES_Canvas()\Size\Height, #GL_BGRA, #GL_UNSIGNED_BYTE, DrawingBuffer())
					StopDrawing()
				EndIf
				If StartDrawing(CanvasOutput(GLES_Canvas()\CanvasNum))
					DrawImage(ImageID(GLES_Canvas()\imagenum),0,0)
					StopDrawing()
				EndIf
			EndIf
		EndProcedure
		
	EndModule
	

; IDE Options = PureBasic 5.73 LTS (Windows - x64)
; CursorPosition = 1488
; FirstLine = 118
; Folding = EwBAAE5
; EnableXP