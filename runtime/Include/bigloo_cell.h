/*=====================================================================*/
/*    serrano/prgm/project/bigloo/runtime/Include/bigloo_cell.h        */
/*    -------------------------------------------------------------    */
/*    Author      :  Manuel Serrano                                    */
/*    Creation    :  Sat Mar  5 08:05:01 2016                          */
/*    Last change :  Wed Mar 16 11:01:31 2016 (serrano)                */
/*    Copyright   :  2016 Manuel Serrano                               */
/*    -------------------------------------------------------------    */
/*    Bigloo CELLs                                                     */
/*=====================================================================*/
#ifndef BIGLOO_CELL_H 
#define BIGLOO_CELL_H

/*---------------------------------------------------------------------*/
/*    Does someone really wants C++ here?                              */
/*---------------------------------------------------------------------*/
#ifdef __cplusplus
extern "C" {
#endif
#ifdef __cplusplus_just_for_emacs_indent
}
#endif

/*---------------------------------------------------------------------*/
/*    extern                                                           */
/*---------------------------------------------------------------------*/
BGL_RUNTIME_DECL obj_t make_cell( obj_t );

#if( BGL_SAW == 1 ) 
BGL_RUNTIME_DECL obj_t bgl_saw_make_cell( obj_t );
BGL_RUNTIME_DECL obj_t bgl_saw_make_old_cell( obj_t );
#endif

/*---------------------------------------------------------------------*/
/*    bgl_cell                                                         */
/*---------------------------------------------------------------------*/
struct bgl_cell {
#if( !defined( TAG_CELL ) )
    header_t header;
#endif
    /* the value pointed to by the cell */
    obj_t val;        
};

#define CELL( o ) CCELL( o )->cell_t

#define CELL_SIZE (sizeof( struct bgl_cell ))

/*---------------------------------------------------------------------*/
/*    tagging                                                          */
/*---------------------------------------------------------------------*/
#if( defined( TAG_CELL ) )
#   define BCELL( p ) ((obj_t)((long)p + TAG_CELL))
#   define CCELL( p ) ((obj_t)((long)p - TAG_CELL))
#   define CELLP( c ) ((c && ((((long)c)&TAG_MASK) == TAG_CELL)))
#else
#   define BCELL( p ) BREF( p )
#   define CCELL( p ) CREF( p )
#   define CELLP( c ) (POINTERP( c ) && (TYPE( c ) == CELL_TYPE))
#endif

/*---------------------------------------------------------------------*/
/*    alloc                                                            */
/*---------------------------------------------------------------------*/
#if( !defined( TAG_CELL ) )
#  define IFN_CELL_TAG( expr ) expr
#else
#  define IFN_CELL_TAG( expr )
#endif   

#define BGL_INIT_CELL( an_object, v ) \
   IFN_CELL_TAG( (an_object)->cell_t.header = MAKE_HEADER( CELL_TYPE, CELL_SIZE ) ); \
   (an_object)->cell_t.val = v; \

/* boehm allocation */
#if( BGL_GC == BGL_BOEHM_GC )
#  if( BGL_GC_CUSTOM || !defined( __GNUC__ ) )
#     define MAKE_CELL( v ) make_cell( v )
#  else
#     define MAKE_CELL( v ) \
         ({ obj_t an_object = GC_MALLOC( CELL_SIZE ); \
	    BGL_INIT_CELL( an_object, v );
	    BCELL( an_object ); })
#  endif

#  define MAKE_YOUNG_CELL( v ) MAKE_CELL( v )
#endif

/* saw allocation */
#if( BGL_GC == BGL_SAW_GC )
#  define MAKE_YOUNG_CELL( v ) bgl_saw_make_cell( v )
#  define MAKE_CELL( v ) bgl_saw_make_old_cell( v )
#endif

/*---------------------------------------------------------------------*/
/*    api                                                              */
/*---------------------------------------------------------------------*/
#define CELL_REF( c ) ((CCELL( c )->cell_t).val)
#define CELL_SET( c, v ) BASSIGN( CELL_REF( c ), v, c )

/*---------------------------------------------------------------------*/
/*    C++                                                              */
/*---------------------------------------------------------------------*/
#ifdef __cplusplus
}
#endif
#endif