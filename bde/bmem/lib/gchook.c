/*=====================================================================*/
/*    serrano/prgm/project/bigloo/bde/bmem/lib/gchook.c                */
/*    -------------------------------------------------------------    */
/*    Author      :  Manuel Serrano                                    */
/*    Creation    :  Sun Apr 13 06:44:45 2003                          */
/*    Last change :  Fri Jun  5 14:52:59 2009 (serrano)                */
/*    Copyright   :  2003-09 Manuel Serrano                            */
/*    -------------------------------------------------------------    */
/*    Hook to be ran after each gc                                     */
/*=====================================================================*/
#include <stdlib.h>
#include <bmem.h>

/*---------------------------------------------------------------------*/
/*    Global variables                                                 */
/*---------------------------------------------------------------------*/
static pa_pair_t *gcs_info = 0;
static unsigned long gc_alloc_size = 0;
unsigned long gc_number = 0;

/*---------------------------------------------------------------------*/
/*    static gc_info_t *                                               */
/*    make_gc_info ...                                                 */
/*---------------------------------------------------------------------*/
static gc_info_t *
make_gc_info( long num, long asize, long hsize, long lsize ) {
   gc_info_t *info = (gc_info_t *)malloc( sizeof( gc_info_t ) );
   
   info->number = num;
   info->alloc_size = asize;
   info->heap_size = hsize;
   info->live_size = lsize;

   return info;
}
   
   
/*---------------------------------------------------------------------*/
/*    void                                                             */
/*    GC_collect_hook ...                                              */
/*---------------------------------------------------------------------*/
void
GC_collect_hook( int heapsz, long livesz ) {
   gc_info_t *info = make_gc_info( gc_number, gc_alloc_size, heapsz, livesz );

   gc_number++;
   
   fprintf( stderr, "gc %d...(alloc size=%dk, heap size=%dk, live size=%ldk)\n",
	    gc_number,
	    gc_alloc_size / 1024,
	    heapsz / 1024,
	    livesz / 1024 );
   gc_alloc_size = 0;
   
   gcs_info = pa_cons( info, gcs_info );

}

/*---------------------------------------------------------------------*/
/*    void                                                             */
/*    gc_alloc_size_add ...                                            */
/*---------------------------------------------------------------------*/
void
gc_alloc_size_add( int size ) {
   if( bmem_thread ) pthread_mutex_lock( &bmem_mutex );
   gc_alloc_size += size;
   if( bmem_thread ) pthread_mutex_unlock( &bmem_mutex );
}

/*---------------------------------------------------------------------*/
/*    static void                                                      */
/*    GC_dump_gc ...                                                   */
/*---------------------------------------------------------------------*/
static void
GC_dump_gc( gc_info_t *i, FILE *f ) {
   fprintf( f, "    (%d %d %d %d)\n",
	    i->number,
	    BMEMSIZE( i->alloc_size ),
	    BMEMSIZE( i->heap_size ),
	    BMEMSIZE( i->live_size ) );
}

/*---------------------------------------------------------------------*/
/*    void                                                             */
/*    GC_dump_statistics ...                                           */
/*---------------------------------------------------------------------*/
void
GC_dump_statistics( FILE *f ) {
   fprintf( f, "  (gc\n" );
   for_each( (void (*)(void *, void *))GC_dump_gc,
	     pa_reverse( gcs_info ),
	     (void *)f );
   fprintf( f, "    )\n" );
}

/*---------------------------------------------------------------------*/
/*    void                                                             */
/*    GC_reset_statistics ...                                          */
/*---------------------------------------------------------------------*/
void
GC_reset_statistics() {
   gcs_info = 0;
   gc_alloc_size = 0;
   gc_number = 0;

   ____GC_reset_allocated_bytes();
}
   
