;*=====================================================================*/
;*    serrano/prgm/project/bigloo/runtime/Ieee/vector.scm              */
;*    -------------------------------------------------------------    */
;*    Author      :  Manuel Serrano                                    */
;*    Creation    :  Mon Jul  6 14:18:49 1992                          */
;*    Last change :  Mon Dec 15 09:32:16 2008 (serrano)                */
;*    -------------------------------------------------------------    */
;*    6.8. Vectors (page 26, r4)                                       */
;*    -------------------------------------------------------------    */
;*    Source documentation:                                            */
;*       @path ../../manuals/body.texi@                                */
;*       @node Vectors@                                                */
;*=====================================================================*/

;*---------------------------------------------------------------------*/
;*    Le module                                                        */
;*---------------------------------------------------------------------*/
(module __r4_vectors_6_8
   
   (import  __error)
   
   (use     __type
	    __bigloo
	    __tvector
	    __bignum
	    __r4_numbers_6_5_fixnum
	    __r4_numbers_6_5_flonum
	    __r4_equivalence_6_2
	    __r4_strings_6_7
	    __r4_booleans_6_1
	    __r4_symbols_6_4
	    __r4_pairs_and_lists_6_3
	    __r4_control_features_6_9
	    
	    __evenv)
   
   (extern  (macro c-vector?::bool (::obj) "VECTORP")
	    (c-make-vector::vector (::int ::obj) "make_vector")
	    (c-create-vector::vector (::int) "create_vector")
	    (c-vector-fill!::obj (::vector ::int ::obj) "fill_vector")
	    (macro c-vector-length::int (::vector) "VECTOR_LENGTH")
	    (macro c-vector-ref::obj (::vector ::int) "VECTOR_REF")
	    (macro c-vector-set!::obj (::vector ::int ::obj) "VECTOR_SET")
	    (macro vector-bound-check?::bool (::int ::int) "BOUND_CHECK")
	    (macro c-vector-tag-set!::obj (::vector ::int) "VECTOR_TAG_SET")
	    (macro c-vector-tag::int (::vector) "VECTOR_TAG")
	    (c-sort-vector::vector (::vector ::procedure) "sort_vector"))
   
   (java    (class foreign
	       (method static c-vector?::bool (::obj)
		       "VECTORP")
	       (method static c-make-vector::vector (::int ::obj)
		       "make_vector")
	       (method static c-create-vector::vector (::int)
		       "create_vector")
	       (method static c-vector-fill!::obj (::vector ::int ::obj)
		       "fill_vector")
	       (method static c-vector-length::int (::vector)
		       "VECTOR_LENGTH")
	       (method static c-vector-ref::obj (::vector ::int)
		       "VECTOR_REF")
	       (method static c-vector-set!::obj (::vector ::int ::obj)
		       "VECTOR_SET")
	       (method static vector-bound-check?::bool (::int ::int)
		       "BOUND_CHECK")
	       (method static c-vector-tag-set!::obj (::vector ::int)
		       "VECTOR_TAG_SET")
	       (method static c-sort-vector::vector (::vector ::procedure)
		       "sort_vector")
	       (method static c-vector-tag::int (::vector)
		       "VECTOR_TAG")))
   
   (export  (inline vector?::bool obj)
	    (inline make-vector::vector ::int #!optional (fill #unspecified))
	    (inline vector::vector . args)
	    (inline vector-length::int ::vector)
	    (inline vector-ref ::vector ::int)
	    (inline vector-set! ::vector ::int obj) 
	    (inline vector-ref-ur ::vector ::int) 
	    (inline vector-set-ur! ::vector ::int obj)
	    (vector->list::pair-nil ::vector)
	    (list->vector::vector ::pair-nil)
	    (vector-fill! ::vector fill)
	    (inline vector-tag::int ::vector)
	    (inline vector-tag-set! ::vector ::int)
	    (copy-vector::vector ::vector ::int)
	    (vector-copy::vector ::vector . args)
	    (vector-copy! target tstart source #!optional (sstart 0) (send (vector-length source)))
	    (vector-append::vector ::vector . args)
	    (sort ::obj ::obj))
   
   (pragma  (c-make-vector no-cfa-top nesting)
	    (c-create-vector no-cfa-top nesting)
	    (c-vector? (predicate-of vector) no-cfa-top nesting)
	    (vector? (predicate-of vector) nesting)
	    (c-vector-length side-effect-free no-cfa-top nesting args-safe)
	    (vector-length side-effect-free no-cfa-top nesting)
	    (c-vector-ref side-effect-free no-cfa-top nesting args-safe)
	    (vector-ref side-effect-free nesting)
	    (vector-ref-ur side-effect-free nesting)
	    (vector-tag side-effect-free no-cfa-top)))

;*---------------------------------------------------------------------*/
;*    vector? ...                                                      */
;*---------------------------------------------------------------------*/
(define-inline (vector? obj)
   (c-vector? obj))

;*---------------------------------------------------------------------*/
;*    make-vector ...                                                  */
;*---------------------------------------------------------------------*/
(define-inline (make-vector int #!optional (fill #unspecified))
   (c-make-vector int fill))

;*---------------------------------------------------------------------*/
;*    vector . args ...                                                */
;*---------------------------------------------------------------------*/
(define-inline (vector . args)
   (list->vector args))

;*---------------------------------------------------------------------*/
;*    vector-length ...                                                */
;*---------------------------------------------------------------------*/
(define-inline (vector-length vector)
   (c-vector-length vector))

;*---------------------------------------------------------------------*/
;*    vector-ref ...                                                   */
;*---------------------------------------------------------------------*/
(define-inline (vector-ref vector k)
   (if (vector-bound-check? k (vector-length vector))
       (c-vector-ref vector k)
       (error 'vector-ref
	      (string-append "index out of range [0.."
			     (integer->string (-fx (vector-length vector) 1))
			     "]")
	      k)))

;*---------------------------------------------------------------------*/
;*    vector-set! ...                                                  */
;*---------------------------------------------------------------------*/
(define-inline (vector-set! vector k obj)
   (if (vector-bound-check? k (vector-length vector))
       (c-vector-set! vector k obj)
       (error 'vector-set!
	      (string-append "index out of range [0.."
			     (integer->string (-fx (vector-length vector) 1))
			     "]")
	      k)))

;*---------------------------------------------------------------------*/
;*    vector-ref-ur ...                                                */
;*---------------------------------------------------------------------*/
(define-inline (vector-ref-ur vector k)
   (c-vector-ref vector k))

;*---------------------------------------------------------------------*/
;*    vector-set-ur! ...                                               */
;*---------------------------------------------------------------------*/
(define-inline (vector-set-ur! vector k obj)
   (c-vector-set! vector k obj))

;*---------------------------------------------------------------------*/
;*    vector->list ...                                                 */
;*---------------------------------------------------------------------*/
(define (vector->list vector)
   (let ((vlen (vector-length vector)))
      (if (=fx vlen 0)
	  '()
	  (let loop ((i (-fx vlen 1))
		     (acc '()))
	     (if (=fx i 0)
		 (cons (vector-ref-ur vector i) acc)
		 (loop (-fx i 1) (cons (vector-ref-ur vector i) acc)))))))

;*---------------------------------------------------------------------*/
;*    list->vector ...                                                 */
;*---------------------------------------------------------------------*/
(define (list->vector list)
   (let* ((len (length list))
	  (vec (c-create-vector len)))
      (let loop ((i 0)
		 (l list))
	 (if (=fx i len)
	     vec
	     (begin
		(vector-set-ur! vec i (car l))
		(loop (+fx i 1) (cdr l)))))))

;*---------------------------------------------------------------------*/
;*    vector-fill! ...                                                 */
;*---------------------------------------------------------------------*/
(define (vector-fill! vector fill)
   (c-vector-fill! vector (vector-length vector) fill))

;*---------------------------------------------------------------------*/
;*    vector-tag ...                                                   */
;*---------------------------------------------------------------------*/
(define-inline (vector-tag vector)
   (c-vector-tag vector))

;*---------------------------------------------------------------------*/
;*    vector-tag-set! ...                                              */
;*---------------------------------------------------------------------*/
(define-inline (vector-tag-set! vector tag)
   (c-vector-tag-set! vector tag))

;*---------------------------------------------------------------------*/
;*    copy-vector ...                                                  */
;*---------------------------------------------------------------------*/
(define (copy-vector::vector old-vec::vector new-len::int)
   (let* ((old-len (vector-length old-vec))
	  (new-vec (make-vector new-len))
	  (min     (if (<fx new-len old-len)
		       new-len
		       old-len)))
      (let loop ((i 0))
	 (if (=fx i min)
	     new-vec
	     (begin
		(vector-set! new-vec i (vector-ref old-vec i))
		(loop (+fx i 1)))))))

;*---------------------------------------------------------------------*/
;*    vector-copy ...                                                  */
;*---------------------------------------------------------------------*/
(define (vector-copy::vector old-vec::vector . args)
   (let* ((old-len (vector-length old-vec))
	  (start (if (pair? args)
		     (if (fixnum? (car args))
			 (car args)
			 (error "vector-copy" "Illegal argument" (car args)))
		     0))
	  (stop (if (and (pair? args) (pair? (cdr args)))
		    (if (or (pair? (cddr args))
			    (not (fixnum? (cadr args))))
			(error "vector-copy" "Illegal argument" (cdr args))
			(cadr args))
		    old-len))
	  (new-len (-fx stop start))
	  (new-vec (make-vector new-len))
	  (min (if (<fx new-len old-len)
		   new-len
		   old-len)))
      (if (or (<fx new-len 0)
	      (>fx start old-len)
	      (>fx stop old-len))
	  (error "vector-copy" "Illegal indexes" args)
	  (let loop ((r start)
		     (w 0))
	     (if (=fx r stop)
		 new-vec
		 (begin
		    (vector-set! new-vec w (vector-ref old-vec r))
		    (loop (+fx r 1) (+fx w 1))))))))

;*---------------------------------------------------------------------*/
;*    vector-copy! ...                                                 */
;*---------------------------------------------------------------------*/
(define (vector-copy! target tstart source
		      #!optional (sstart 0) (send (vector-length source)))
   (let loop ((i sstart)
	      (j tstart))
      (when (<fx i send)
	 (vector-set! target j (vector-ref source i))
	 (loop (+fx i 1) (+fx j 1)))))

;*---------------------------------------------------------------------*/
;*    vector-append ...                                                */
;*---------------------------------------------------------------------*/
(define (vector-append::vector vec::vector . args)
   (let loop ((len (vector-length vec))
	      (vects args))
      (if (null? vects)
	  (let ((res (make-vector len)))
	     (vector-copy! res 0 vec)
	     (let loop ((i (vector-length vec))
			(vects args))
		(if (null? vects)
		    res
		    (let ((vec (car vects)))
		       (vector-copy! res i vec)
		       (loop (+fx i (vector-length vec)) (cdr vects))))))
	  (loop (+fx (vector-length (car vects)) len) (cdr vects)))))

;*---------------------------------------------------------------------*/
;*    @deffn sort@ ...                                                 */
;*---------------------------------------------------------------------*/
(define (sort o1 o2)
   (if (procedure? o1)
       (inner-sort o2 o1)
       (inner-sort o1 o2)))

;*---------------------------------------------------------------------*/
;*    inner-sort ...                                                   */
;*---------------------------------------------------------------------*/
(define (inner-sort obj proc::procedure)
   (cond
      ((null? obj)
       obj)
      ((and (pair? obj) (null? (cdr obj)))
       obj)
      (else
       (let ((vec (cond
		     ((vector? obj)
		      (let* ((len (vector-length obj))
			     (new (make-vector len)))
			 (let loop ((i 0))
			    (if (<fx i len)
				(begin
				   (vector-set! new i (vector-ref obj i))
				   (loop (+fx i 1)))))
			 new))
		     ((pair? obj)
		      (list->vector obj))
		     (else
		      (error "sort"
			     "Object must be a list or a vector"
			     obj)))))
	  (let ((res (c-sort-vector vec proc)))
	     (if (pair? obj)
		 (vector->list res)
		 res))))))
