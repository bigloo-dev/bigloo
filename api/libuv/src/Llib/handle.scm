;*=====================================================================*/
;*    serrano/prgm/project/bigloo/api/libuv/src/Llib/handle.scm        */
;*    -------------------------------------------------------------    */
;*    Author      :  Manuel Serrano                                    */
;*    Creation    :  Tue May  6 11:51:22 2014                          */
;*    Last change :  Mon Jul 28 14:13:33 2014 (serrano)                */
;*    Copyright   :  2014 Manuel Serrano                               */
;*    -------------------------------------------------------------    */
;*    LIBUV handles                                                    */
;*=====================================================================*/

;*---------------------------------------------------------------------*/
;*    The module                                                       */
;*---------------------------------------------------------------------*/
(module __libuv_handle

   (include "uv.sch")

   (import __libuv_types)
   
   (export (uv-ref ::UvHandle)
	   (uv-unref ::UvHandle)
	   (uv-close ::UvHandle)))

;*---------------------------------------------------------------------*/
;*    uv-ref ::UvHandle ...                                            */
;*---------------------------------------------------------------------*/
(define (uv-ref o::UvHandle)
   (with-access::UvHandle o ($builtin)
      ($uv-handle-ref $builtin)))

;*---------------------------------------------------------------------*/
;*    uv-unref ::UvHandle ...                                          */
;*---------------------------------------------------------------------*/
(define (uv-unref o::UvHandle)
   (with-access::UvHandle o ($builtin)
      ($uv-handle-unref $builtin)))

;*---------------------------------------------------------------------*/
;*    uv-close ...                                                     */
;*---------------------------------------------------------------------*/
(define (uv-close o::UvHandle)
   ;; force Bigloo to add the extern clause for bgl_uv_timer_cb
   (with-access::UvHandle o ($builtin)
      (when ($uv_handle_nilp $builtin) ($bgl_uv_close_cb $builtin))
      ($uv-handle-close $builtin $BGL_UV_CLOSE_CB)))
