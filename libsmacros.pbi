;
; Some macros to simplify binding of shared libraries
;
; This code is placed in the Public Domain
;
DeclareModule libsmacros
	Macro Unicode(Mem, Type = #PB_Ascii)
		PeekS(Mem, -1, Type)
	EndMacro
	
	Macro DoubleQuote
		"
	EndMacro
	
	Macro routine(lib,type,name,params)
		Prototype.type proto_#name params
		Global name.proto_#name = GetFunction(lib, DoubleQuote#name#DoubleQuote)
		If name = 0
			MessageRequester("ERROR",DoubleQuote#name#DoubleQuote+ " doesn't exist" ,#PB_MessageRequester_Error)
			End
		EndIf
	EndMacro
	
	Macro routine_s(lib,type,name,params)
		Prototype.type proto_#name#params
		Global name#_s.proto_#name = GetFunction(lib, DoubleQuote#name#DoubleQuote)
		If name#_s = 0
			MessageRequester("ERROR",DoubleQuote#name#DoubleQuote+ " doesn't exist" ,#PB_MessageRequester_Error)
			End
		EndIf
		Declare.s name#params
	EndMacro
	
	Macro routine_proc_s(name,params)
		Procedure.s name#params
			ProcedureReturn Unicode(name#_s params)
		EndProcedure
	EndMacro
		
	Declare.i OpenLib(num.i,name.s, path.s)

EndDeclareModule

Module libsmacros

	Procedure OpenLib(num.i,libname.s,libpath.s)
		Protected libfullname.s
		libfullname = libpath+libname
		If OpenLibrary(num, libfullname) = 0
			; FIX ME: better use "Debug" and continue ?
			MessageRequester("ERROR","Can not find or open "+libfullname ,#PB_MessageRequester_Error)
			End 1
		EndIf
	EndProcedure

EndModule
; IDE Options = PureBasic 5.73 LTS (Windows - x64)
; CursorPosition = 3
; FirstLine = 22
; Folding = --
; EnableXP