(module example
   (import (bis foreign2 "foreign2.scm"))
   (export (fib::long ::long))
   (extern (include "el.h")
	   (export fib "fib")
	   (hux::string (::string) "hux")
	   (var::int "var")
	   (type el (struct (key::int "key") (next::el* "next")) "struct el")
	   (type tab (pointer int) "int *")
	   (sum-el::int (::el*) "sum_el")
	   (define-el::el* (::int) "define_el")
	   (sum-tab::double (::tab ::int) "sum_tab")
	   (make-dummy-el::el* () "make_dummy_el")
	   (macro printf::int (::string ::long) "printf")))

(define (fib x)
   (if (< x 2) 
       1
       (+ (fib (- x 1)) (fib (- x 2)))))

(define (foo x)
   (bar x))
                        
(define (boo s)
   (hux s))

(define (test-struct n)
   (printf #"I'm goind to test struc el: %d\n" n)
   (let ((head (make-el*)))
      (el*-key-set! head 0)
      (let loop ((n  n)
		 (c  head))
	 (if (= n 0)
	     (sum-el c)
	     (let ((new (make-el*)))
		(el*-key-set!  new n)
		(el*-next-set! new c)
		(loop (- n 1) new))))))

(define (test-array n)
   (printf #"I'm goind to test array tab: %d\n" n)
   (let ((tab (make-tab (* 2 n))))
      (let loop ((i (- n)))
	 (if (> i n)
	     (sum-tab tab 21)
	     (begin
		(tab-set! tab (+ i 10) i)
		(loop (+ i 1)))))))

(define (test-foreign)
   (print (el*? (make-el*)))
   (print var)
   (print (begin (set! var (+ 1 var)) var))
   (print (foo 4))
   (print (boo "toto is not happy"))
   (print (bis 5))
   (print (test-struct 10))
   (print (inexact->exact (test-array 10)))
   (print "Tests completed, it's ok."))

(test-foreign)
