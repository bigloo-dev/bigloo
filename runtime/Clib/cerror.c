/*=====================================================================*/
/*    serrano/prgm/project/bigloo/runtime/Clib/cerror.c                */
/*    -------------------------------------------------------------    */
/*    Author      :  Manuel Serrano                                    */
/*    Creation    :  Fri Jul 17 09:58:06 1992                          */
/*    Last change :  Sat Dec 27 09:55:01 2008 (serrano)                */
/*    Copyright   :  2002-08 Manuel Serrano                            */
/*    -------------------------------------------------------------    */
/*    Error messages                                                   */
/*=====================================================================*/
#if (defined( _MSC_VER ) || defined( _MINGW_VER ))
#  include <windows.h>
#endif
#include <bigloo.h>

/*---------------------------------------------------------------------*/
/*    Les recuperations externes                                       */
/*---------------------------------------------------------------------*/
#ifndef _MSC_VER
extern void perror();
extern char *strerror( int );
extern void exit( int );
extern int errno;
#endif

/*---------------------------------------------------------------------*/
/*    c_error ...                                                      */
/*---------------------------------------------------------------------*/
void
c_error( char *mes1, char *mes2, int err_no ) {
   fflush( stderr );
   if( errno )
      fprintf( stderr,
	       "*** INTERNAL ERROR(%s): %s -- %s\n",
	       strerror( errno ),mes1, mes2 );
   else
      fprintf( stderr, "*** INTERNAL ERROR: %s -- %s\n", mes1, mes2 );
   exit( err_no );
}

/*---------------------------------------------------------------------*/
/*    char *                                                           */
/*    bgl_typeof ...                                                   */
/*    -------------------------------------------------------------    */
/*    This function is only used for debugging purposes. It takes      */
/*    a Bigloo object as argument and try to find out a C string       */
/*    representation of its type. (This function is intended to        */
/*    be used under GDB or so.)                                        */
/*    -------------------------------------------------------------    */
/*    See also bgl_show_type (aka c-debugging-show-type) in            */
/*    runtime/Llib/error.scm                                           */
/*---------------------------------------------------------------------*/
char *
bgl_typeof( obj_t obj ) {
   if( INTEGERP( obj ) ) return "bint";
   if( REALP( obj ) ) return "breal";
   if( STRINGP( obj ) ) return "bstring";
   if( SYMBOLP( obj ) ) return "symbol";
   if( KEYWORDP( obj ) ) return "keyword";
   if( CHARP( obj ) ) return "bchar";
   if( BOOLEANP( obj ) ) return "bbool";
   if( NULLP( obj ) ) return "bnil";
   if( EXTENDED_PAIRP( obj ) ) return "epair";
   if( PAIRP( obj ) ) return "pair";
   if( VECTORP( obj ) ) return "vector";
   if( TVECTORP( obj ) ) return "tvector";
   if( STRUCTP( obj ) ) return "struct";
   if( PROCEDUREP( obj ) ) return "procedure";
   if( INPUT_PORTP( obj ) ) return "input-port";
   if( OUTPUT_PORTP( obj ) ) return "output-port";
   if( BINARY_PORTP( obj ) ) return "binary-port";
   if( CELLP( obj ) ) return "cell";
   if( CNSTP( obj ) ) return "bcnst";
   if( SOCKETP( obj ) ) return "socket";
   if( PROCESSP( obj ) ) return "process";
   if( CUSTOMP( obj ) ) return "custom";
   if( OPAQUEP( obj ) ) return "opaque";
   if( UCS2_STRINGP( obj ) ) return "ucs2_string";
   if( UCS2P( obj ) ) return "ucs2";
   			   
   if( BGL_OBJECTP( obj ) ) return "object";

   return "_";
}

/*---------------------------------------------------------------------*/
/*    obj_t                                                            */
/*    bgl_debug_header ...                                             */
/*    -------------------------------------------------------------    */
/*    Show the internal representation of Bigloo obj_t headers.        */
/*---------------------------------------------------------------------*/
obj_t
bgl_debug_header( obj_t obj ) {
   fprintf( stderr, "obj=%p\n", obj );
   fprintf( stderr, "  TAG_MASK=%d ", (((long)obj) & TAG_MASK) );
   switch( (((long)obj) & TAG_MASK) ) {
      case TAG_STRUCT: fprintf( stderr, "(TAG_STRUCT)\n" ); break;
      case TAG_INT: fprintf( stderr, "(TAG_INT)\n" ); break;
      case TAG_CNST: fprintf( stderr, "(TAG_CNST)\n" ); break;
#if( !defined( KEEP_BACK_PTRS ) && !defined( GC_DEBUG ) )
      case TAG_PAIR: fprintf( stderr, "(TAG_PAIR)\n" ); break;
#endif	 
#if( (PTR_ALIGNMENT >= 3) && \
     !(defined( KEEP_BACK_PTRS )) && !(defined( GC_DEBUG )) )
#  if defined( TAG_VECTOR )
      case TAG_VECTOR: fprintf( stderr, "(TAG_VECTOR)\n" ); break;
#  endif	 
#  if defined( TAG_CELL )
      case TAG_CELL: fprintf( stderr, "(TAG_CELL)\n" ); break;
#  endif	 
#  if defined( TAG_REAL )
      case TAG_REAL: fprintf( stderr, "(TAG_REAL)\n" ); break;
#  endif	 
#  if defined( TAG_STRING )
      case TAG_STRING: fprintf( stderr, "(TAG_STRING)\n" ); break;
#  endif	 
#endif
      default: fprintf( stderr, "(unknown tag)\n" ); break;
   }

   if( POINTERP( obj ) ) {
      fprintf( stderr, "  TYPE=%d ", TYPE( obj ) );
      switch( TYPE( obj ) ) {
	 case 0: fprintf( stderr, "(PAIR_TYPE) " ); break;
	 case 1: fprintf( stderr, "(STRING_TYPE) " ); break;
	 case 2: fprintf( stderr, "(VECTOR_TYPE) " ); break;
	 case 3: fprintf( stderr, "(PROCEDURE_TYPE) " ); break;
	 case 4: fprintf( stderr, "(UCS2_STRING_TYPE) " ); break;
	 case 5: fprintf( stderr, "(OPAQUE_TYPE) " ); break;
	 case 6: fprintf( stderr, "(CUSTOM_TYPE) " ); break;
	 case 7: fprintf( stderr, "(KEYWORD_TYPE) " ); break;
	 case 8: fprintf( stderr, "(SYMBOL_TYPE) " ); break;
	 case 9: fprintf( stderr, "(STACK_TYPE) " ); break;
	 case 10: fprintf( stderr, "(INPUT_PORT_TYPE) " ); break;
	 case 11: fprintf( stderr, "(OUTPUT_PORT_TYPE) " ); break;
	 case 12: fprintf( stderr, "(DATE_TYPE) " ); break;
	 case 13: fprintf( stderr, "(CELL_TYPE) " ); break;
	 case 14: fprintf( stderr, "(SOCKET_TYPE) " ); break;
	 case 15: fprintf( stderr, "(STRUCT_TYPE) " ); break;
	 case 16: fprintf( stderr, "(REAL_TYPE) " ); break;
	 case 17: fprintf( stderr, "(PROCESS_TYPE) " ); break;
	 case 18: fprintf( stderr, "(FOREIGN_TYPE) " ); break;
	 case 19: fprintf( stderr, "(OUTPUT_STRING_PORT_TYPE) " ); break;
	 case 20: fprintf( stderr, "(BINARY_PORT_TYPE) " ); break;
	 case 21: fprintf( stderr, "(EXTENDED_PAIR_TYPE) " ); break;
	 case 22: fprintf( stderr, "(TVECTOR_TYPE) " ); break;
	 case 23: fprintf( stderr, "(TSTRUCT_TYPE) " ); break;
	 case 24: fprintf( stderr, "(PROCEDURE_LIGHT_TYPE) " ); break;
	 case 25: fprintf( stderr, "(ELONG_TYPE) " ); break;
	 case 26: fprintf( stderr, "(LLONG_TYPE) " ); break;
	 case 43: fprintf( stderr, "(BIGNUM_TYPE) " ); break;
	 default:
	    if( TYPE( obj ) > OBJECT_TYPE )
	       fprintf( stderr, "(a CLASS) " );
	    else
	       fprintf( stderr, "(unknown type) " );
      }
      fprintf( stderr, "HEADER_SIZE=%d\n", HEADER_SIZE( CREF( obj )->header ) );
   }

   return obj;
}

/*---------------------------------------------------------------------*/
/*    char *                                                           */
/*    bgl_get_last_error_message ...                                   */
/*---------------------------------------------------------------------*/
#if (defined( _MSC_VER ) || defined( _MINGW_VER ))
BGL_RUNTIME_DEF char *
bgl_get_last_error_message( char *default_message ) {
   char *result = default_message;

   if( FormatMessage( FORMAT_MESSAGE_ALLOCATE_BUFFER
		      | FORMAT_MESSAGE_FROM_SYSTEM,
		      NULL,
		      GetLastError(),
		      0,
		      (LPTSTR)&result,
		      0,
		      NULL ) > 0 ) {
      /* error message properly retrieved:     */
      /* converting it to a GC allocated stack */
      char *gc_result = (char *)GC_MALLOC( strlen( result ) + 1 );
      strcpy( gc_result, result );
      LocalFree( result );
      result= gc_result;
   }

   return result;
}
#endif
