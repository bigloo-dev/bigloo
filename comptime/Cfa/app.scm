;*=====================================================================*/
;*    serrano/prgm/project/bigloo/comptime/Cfa/app.scm                 */
;*    -------------------------------------------------------------    */
;*    Author      :  Manuel Serrano                                    */
;*    Creation    :  Mon Jun 24 17:36:29 1996                          */
;*    Last change :  Sun Apr 10 06:58:37 2011 (serrano)                */
;*    Copyright   :  1996-2011 Manuel Serrano, see LICENSE file        */
;*    -------------------------------------------------------------    */
;*    The cfa on `app' node                                            */
;*=====================================================================*/

;*---------------------------------------------------------------------*/
;*    The module                                                       */
;*---------------------------------------------------------------------*/
(module cfa_app
   (include "Tools/trace.sch")
   (import  tools_shape
	    tools_error
	    type_type
	    type_cache
	    ast_var
	    ast_node
	    cfa_info
	    cfa_info2
	    cfa_cfa
	    cfa_iterate
	    cfa_loose
	    cfa_approx)
   (export  (generic app!::approx ::fun ::var approx)))

;*---------------------------------------------------------------------*/
;*    cfa! ::app ...                                                   */
;*---------------------------------------------------------------------*/
(define-method (cfa!::approx node::app)
   (with-access::app node (fun args)
      (trace (cfa 2) ">>> app " (shape fun) ": " (shape node) #\Newline)
      (app! (variable-value (var-variable fun)) fun (map cfa! args))))

;*---------------------------------------------------------------------*/
;*    app! ...                                                         */
;*---------------------------------------------------------------------*/
(define-generic (app!::approx fun::fun var::var args-approx)
   (internal-error "app!" "No method for this function" (cons fun (shape var))))

;*---------------------------------------------------------------------*/
;*    app! ::intern-sfun/Cinfo ...                                     */
;*---------------------------------------------------------------------*/
(define-method (app! fun::intern-sfun/Cinfo var::var args-approx)
   (with-access::intern-sfun/Cinfo fun (args polymorphic?)
      (trace (cfa 3)
	 ">>>   app(intern-sfun/Cinfo)!"
	 " polymorphic?=" polymorphic?
	 " args=" (map shape args-approx)
	 #\Newline)
      ;; we set the new formals approximation
      (for-each (lambda (formal approx)
		   (union-approx! (svar/Cinfo-approx (local-value formal))
		      approx))
	 args
	 args-approx)
      ;; and we jump to the function body
      (if (or (not (global? (var-variable var)))
	      (and (global? (var-variable var))
		   (eq? (global-import (var-variable var)) 'static)))
	  ;; this is a unexported function 
	  (let ((a (cfa-intern-sfun! fun (var-variable var))))
	     (trace (cfa 3)
		"<<< app " (shape var) " <- (intern) " (shape a) "\n")
	     a)
	  ;; this is an exported function
	  (let ((a (cfa-export-var! fun (var-variable var))))
	     (trace (cfa 3)
		"<<< app " (shape var) " <- (export) " (shape a) "\n")
	     a))))

;*---------------------------------------------------------------------*/
;*    app! ::extern-sfun ...                                           */
;*---------------------------------------------------------------------*/
(define-method (app! fun::extern-sfun/Cinfo var::var args-approx)
   (with-access::extern-sfun/Cinfo fun (top? approx polymorphic?)
      (trace (cfa 3) ">>>   app(extern-sfun/Cinfo)!"
	 " polymorphic?=" polymorphic?
	 " args=" (shape args-approx)
	 #\Newline)
      ;; we set the new formals approximation
      (when top?
	 (for-each (lambda (a) (loose! a 'all)) args-approx))
      (when polymorphic?
	 (with-access::approx approx (type)
	    (set! type (get-bigloo-type (approx-type approx)))))
      ;; and we return the global approximation
      (trace (cfa 3) "<<< app " (shape var) " <- (extern) " (shape approx)
	 #\Newline)
      approx))
   
;*---------------------------------------------------------------------*/
;*    app! ::cfun/Cinfo ...                                            */
;*---------------------------------------------------------------------*/
(define-method (app! fun::cfun/Cinfo var::var args-approx)
   (trace (cfa 3) ">>>   app(cfun)!"
      " args=" (shape args-approx)
      #\Newline)
   (with-access::cfun/Cinfo fun (top? approx)
      ;; we set the new formals approximation
      (when top?
	 (for-each (lambda (a) (loose! a 'all)) args-approx))
      (trace (cfa 3) "<<< app " (shape var) " <- (foreign) " (shape approx)
	 #\Newline)
      ;; and we return the global approximation
      approx))
