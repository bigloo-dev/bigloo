;*=====================================================================*/
;*    serrano/prgm/project/bigloo/examples/Embedded/scm-main.scm       */
;*    -------------------------------------------------------------    */
;*    Author      :  Manuel Serrano                                    */
;*    Creation    :  Wed Feb 14 09:05:59 1996                          */
;*    Last change :  Wed Feb 14 09:16:16 1996 (serrano)                */
;*    -------------------------------------------------------------    */
;*    The Bigloo initialization                                        */
;*=====================================================================*/

;*---------------------------------------------------------------------*/
;*    The module                                                       */
;*---------------------------------------------------------------------*/
(module main
   (main scm-main)
   (with (fib "fib.scm")))

;*---------------------------------------------------------------------*/
;*    scm-main ...                                                     */
;*---------------------------------------------------------------------*/
(define (scm-main argv)
   (print "In scm-main: " argv))
