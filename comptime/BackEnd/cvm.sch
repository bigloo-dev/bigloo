;; ==========================================================
;; Class accessors
;; Bigloo (3.7b)
;; Inria -- Sophia Antipolis     Mon Nov 14 17:23:21 CET 2011 
;; (bigloo.new -classgen BackEnd/cvm.scm)
;; ==========================================================

;; The directives
(directives

;; cvm
(cond-expand ((and bigloo-class-sans (not bigloo-class-generate))
  (export
    (inline cvm?::bool ::obj)
    (cvm-nil::cvm)
    (inline cvm-typed-funcall::bool ::cvm)
    (inline cvm-typed-funcall-set! ::cvm ::bool)
    (inline cvm-type-check::bool ::cvm)
    (inline cvm-type-check-set! ::cvm ::bool)
    (inline cvm-bound-check::bool ::cvm)
    (inline cvm-bound-check-set! ::cvm ::bool)
    (inline cvm-pregisters::pair-nil ::cvm)
    (inline cvm-pregisters-set! ::cvm ::pair-nil)
    (inline cvm-registers::pair-nil ::cvm)
    (inline cvm-registers-set! ::cvm ::pair-nil)
    (inline cvm-require-tailc::bool ::cvm)
    (inline cvm-require-tailc-set! ::cvm ::bool)
    (inline cvm-tvector-descr-support::bool ::cvm)
    (inline cvm-tvector-descr-support-set! ::cvm ::bool)
    (inline cvm-pragma-support::bool ::cvm)
    (inline cvm-pragma-support-set! ::cvm ::bool)
    (inline cvm-debug-support::pair-nil ::cvm)
    (inline cvm-debug-support-set! ::cvm ::pair-nil)
    (inline cvm-foreign-clause-support::pair-nil ::cvm)
    (inline cvm-foreign-clause-support-set! ::cvm ::pair-nil)
    (inline cvm-trace-support::bool ::cvm)
    (inline cvm-trace-support-set! ::cvm ::bool)
    (inline cvm-typed-eq::bool ::cvm)
    (inline cvm-typed-eq-set! ::cvm ::bool)
    (inline cvm-foreign-closure::bool ::cvm)
    (inline cvm-foreign-closure-set! ::cvm ::bool)
    (inline cvm-remove-empty-let::bool ::cvm)
    (inline cvm-remove-empty-let-set! ::cvm ::bool)
    (inline cvm-effect+::bool ::cvm)
    (inline cvm-effect+-set! ::cvm ::bool)
    (inline cvm-qualified-types::bool ::cvm)
    (inline cvm-qualified-types-set! ::cvm ::bool)
    (inline cvm-callcc::bool ::cvm)
    (inline cvm-callcc-set! ::cvm ::bool)
    (inline cvm-heap-compatible::symbol ::cvm)
    (inline cvm-heap-compatible-set! ::cvm ::symbol)
    (inline cvm-heap-suffix::bstring ::cvm)
    (inline cvm-heap-suffix-set! ::cvm ::bstring)
    (inline cvm-typed::bool ::cvm)
    (inline cvm-typed-set! ::cvm ::bool)
    (inline cvm-types::obj ::cvm)
    (inline cvm-types-set! ::cvm ::obj)
    (inline cvm-functions::obj ::cvm)
    (inline cvm-functions-set! ::cvm ::obj)
    (inline cvm-variables::obj ::cvm)
    (inline cvm-variables-set! ::cvm ::obj)
    (inline cvm-extern-types::obj ::cvm)
    (inline cvm-extern-types-set! ::cvm ::obj)
    (inline cvm-extern-functions::obj ::cvm)
    (inline cvm-extern-functions-set! ::cvm ::obj)
    (inline cvm-extern-variables::obj ::cvm)
    (inline cvm-extern-variables-set! ::cvm ::obj)
    (inline cvm-name::bstring ::cvm)
    (inline cvm-name-set! ::cvm ::bstring)
    (inline cvm-srfi0::symbol ::cvm)
    (inline cvm-srfi0-set! ::cvm ::symbol)
    (inline cvm-language::symbol ::cvm)
    (inline cvm-language-set! ::cvm ::symbol))))

;; sawc
(cond-expand ((and bigloo-class-sans (not bigloo-class-generate))
  (export
    (inline make-sawc::sawc language1194::symbol srfi01195::symbol name1196::bstring extern-variables1197::obj extern-functions1198::obj extern-types1199::obj variables1200::obj functions1201::obj types1202::obj typed1203::bool heap-suffix1204::bstring heap-compatible1205::symbol callcc1206::bool qualified-types1207::bool effect+1208::bool remove-empty-let1209::bool foreign-closure1210::bool typed-eq1211::bool trace-support1212::bool foreign-clause-suppo1213::pair-nil debug-support1214::pair-nil pragma-support1215::bool tvector-descr-suppor1216::bool require-tailc1217::bool registers1218::pair-nil pregisters1219::pair-nil bound-check1220::bool type-check1221::bool typed-funcall1222::bool)
    (inline sawc?::bool ::obj)
    (sawc-nil::sawc)
    (inline sawc-typed-funcall::bool ::sawc)
    (inline sawc-typed-funcall-set! ::sawc ::bool)
    (inline sawc-type-check::bool ::sawc)
    (inline sawc-type-check-set! ::sawc ::bool)
    (inline sawc-bound-check::bool ::sawc)
    (inline sawc-bound-check-set! ::sawc ::bool)
    (inline sawc-pregisters::pair-nil ::sawc)
    (inline sawc-pregisters-set! ::sawc ::pair-nil)
    (inline sawc-registers::pair-nil ::sawc)
    (inline sawc-registers-set! ::sawc ::pair-nil)
    (inline sawc-require-tailc::bool ::sawc)
    (inline sawc-require-tailc-set! ::sawc ::bool)
    (inline sawc-tvector-descr-support::bool ::sawc)
    (inline sawc-tvector-descr-support-set! ::sawc ::bool)
    (inline sawc-pragma-support::bool ::sawc)
    (inline sawc-pragma-support-set! ::sawc ::bool)
    (inline sawc-debug-support::pair-nil ::sawc)
    (inline sawc-debug-support-set! ::sawc ::pair-nil)
    (inline sawc-foreign-clause-support::pair-nil ::sawc)
    (inline sawc-foreign-clause-support-set! ::sawc ::pair-nil)
    (inline sawc-trace-support::bool ::sawc)
    (inline sawc-trace-support-set! ::sawc ::bool)
    (inline sawc-typed-eq::bool ::sawc)
    (inline sawc-typed-eq-set! ::sawc ::bool)
    (inline sawc-foreign-closure::bool ::sawc)
    (inline sawc-foreign-closure-set! ::sawc ::bool)
    (inline sawc-remove-empty-let::bool ::sawc)
    (inline sawc-remove-empty-let-set! ::sawc ::bool)
    (inline sawc-effect+::bool ::sawc)
    (inline sawc-effect+-set! ::sawc ::bool)
    (inline sawc-qualified-types::bool ::sawc)
    (inline sawc-qualified-types-set! ::sawc ::bool)
    (inline sawc-callcc::bool ::sawc)
    (inline sawc-callcc-set! ::sawc ::bool)
    (inline sawc-heap-compatible::symbol ::sawc)
    (inline sawc-heap-compatible-set! ::sawc ::symbol)
    (inline sawc-heap-suffix::bstring ::sawc)
    (inline sawc-heap-suffix-set! ::sawc ::bstring)
    (inline sawc-typed::bool ::sawc)
    (inline sawc-typed-set! ::sawc ::bool)
    (inline sawc-types::obj ::sawc)
    (inline sawc-types-set! ::sawc ::obj)
    (inline sawc-functions::obj ::sawc)
    (inline sawc-functions-set! ::sawc ::obj)
    (inline sawc-variables::obj ::sawc)
    (inline sawc-variables-set! ::sawc ::obj)
    (inline sawc-extern-types::obj ::sawc)
    (inline sawc-extern-types-set! ::sawc ::obj)
    (inline sawc-extern-functions::obj ::sawc)
    (inline sawc-extern-functions-set! ::sawc ::obj)
    (inline sawc-extern-variables::obj ::sawc)
    (inline sawc-extern-variables-set! ::sawc ::obj)
    (inline sawc-name::bstring ::sawc)
    (inline sawc-name-set! ::sawc ::bstring)
    (inline sawc-srfi0::symbol ::sawc)
    (inline sawc-srfi0-set! ::sawc ::symbol)
    (inline sawc-language::symbol ::sawc)
    (inline sawc-language-set! ::sawc ::symbol))))

;; cgen
(cond-expand ((and bigloo-class-sans (not bigloo-class-generate))
  (export
    (inline make-cgen::cgen language1164::symbol srfi01165::symbol name1166::bstring extern-variables1167::obj extern-functions1168::obj extern-types1169::obj variables1170::obj functions1171::obj types1172::obj typed1173::bool heap-suffix1174::bstring heap-compatible1175::symbol callcc1176::bool qualified-types1177::bool effect+1178::bool remove-empty-let1179::bool foreign-closure1180::bool typed-eq1181::bool trace-support1182::bool foreign-clause-suppo1183::pair-nil debug-support1184::pair-nil pragma-support1185::bool tvector-descr-suppor1186::bool require-tailc1187::bool registers1188::pair-nil pregisters1189::pair-nil bound-check1190::bool type-check1191::bool typed-funcall1192::bool)
    (inline cgen?::bool ::obj)
    (cgen-nil::cgen)
    (inline cgen-typed-funcall::bool ::cgen)
    (inline cgen-typed-funcall-set! ::cgen ::bool)
    (inline cgen-type-check::bool ::cgen)
    (inline cgen-type-check-set! ::cgen ::bool)
    (inline cgen-bound-check::bool ::cgen)
    (inline cgen-bound-check-set! ::cgen ::bool)
    (inline cgen-pregisters::pair-nil ::cgen)
    (inline cgen-pregisters-set! ::cgen ::pair-nil)
    (inline cgen-registers::pair-nil ::cgen)
    (inline cgen-registers-set! ::cgen ::pair-nil)
    (inline cgen-require-tailc::bool ::cgen)
    (inline cgen-require-tailc-set! ::cgen ::bool)
    (inline cgen-tvector-descr-support::bool ::cgen)
    (inline cgen-tvector-descr-support-set! ::cgen ::bool)
    (inline cgen-pragma-support::bool ::cgen)
    (inline cgen-pragma-support-set! ::cgen ::bool)
    (inline cgen-debug-support::pair-nil ::cgen)
    (inline cgen-debug-support-set! ::cgen ::pair-nil)
    (inline cgen-foreign-clause-support::pair-nil ::cgen)
    (inline cgen-foreign-clause-support-set! ::cgen ::pair-nil)
    (inline cgen-trace-support::bool ::cgen)
    (inline cgen-trace-support-set! ::cgen ::bool)
    (inline cgen-typed-eq::bool ::cgen)
    (inline cgen-typed-eq-set! ::cgen ::bool)
    (inline cgen-foreign-closure::bool ::cgen)
    (inline cgen-foreign-closure-set! ::cgen ::bool)
    (inline cgen-remove-empty-let::bool ::cgen)
    (inline cgen-remove-empty-let-set! ::cgen ::bool)
    (inline cgen-effect+::bool ::cgen)
    (inline cgen-effect+-set! ::cgen ::bool)
    (inline cgen-qualified-types::bool ::cgen)
    (inline cgen-qualified-types-set! ::cgen ::bool)
    (inline cgen-callcc::bool ::cgen)
    (inline cgen-callcc-set! ::cgen ::bool)
    (inline cgen-heap-compatible::symbol ::cgen)
    (inline cgen-heap-compatible-set! ::cgen ::symbol)
    (inline cgen-heap-suffix::bstring ::cgen)
    (inline cgen-heap-suffix-set! ::cgen ::bstring)
    (inline cgen-typed::bool ::cgen)
    (inline cgen-typed-set! ::cgen ::bool)
    (inline cgen-types::obj ::cgen)
    (inline cgen-types-set! ::cgen ::obj)
    (inline cgen-functions::obj ::cgen)
    (inline cgen-functions-set! ::cgen ::obj)
    (inline cgen-variables::obj ::cgen)
    (inline cgen-variables-set! ::cgen ::obj)
    (inline cgen-extern-types::obj ::cgen)
    (inline cgen-extern-types-set! ::cgen ::obj)
    (inline cgen-extern-functions::obj ::cgen)
    (inline cgen-extern-functions-set! ::cgen ::obj)
    (inline cgen-extern-variables::obj ::cgen)
    (inline cgen-extern-variables-set! ::cgen ::obj)
    (inline cgen-name::bstring ::cgen)
    (inline cgen-name-set! ::cgen ::bstring)
    (inline cgen-srfi0::symbol ::cgen)
    (inline cgen-srfi0-set! ::cgen ::symbol)
    (inline cgen-language::symbol ::cgen)
    (inline cgen-language-set! ::cgen ::symbol)))))

;; The definitions
(cond-expand (bigloo-class-sans
;; cvm
(define-inline (cvm?::bool obj::obj) ((@ isa? __object) obj (@ cvm backend_cvm)))
(define (cvm-nil::cvm) (class-nil (@ cvm backend_cvm)))
(define-inline (cvm-typed-funcall::bool o::cvm) (with-access::cvm o (typed-funcall) typed-funcall))
(define-inline (cvm-typed-funcall-set! o::cvm v::bool) (with-access::cvm o (typed-funcall) (set! typed-funcall v)))
(define-inline (cvm-type-check::bool o::cvm) (with-access::cvm o (type-check) type-check))
(define-inline (cvm-type-check-set! o::cvm v::bool) (with-access::cvm o (type-check) (set! type-check v)))
(define-inline (cvm-bound-check::bool o::cvm) (with-access::cvm o (bound-check) bound-check))
(define-inline (cvm-bound-check-set! o::cvm v::bool) (with-access::cvm o (bound-check) (set! bound-check v)))
(define-inline (cvm-pregisters::pair-nil o::cvm) (with-access::cvm o (pregisters) pregisters))
(define-inline (cvm-pregisters-set! o::cvm v::pair-nil) (with-access::cvm o (pregisters) (set! pregisters v)))
(define-inline (cvm-registers::pair-nil o::cvm) (with-access::cvm o (registers) registers))
(define-inline (cvm-registers-set! o::cvm v::pair-nil) (with-access::cvm o (registers) (set! registers v)))
(define-inline (cvm-require-tailc::bool o::cvm) (with-access::cvm o (require-tailc) require-tailc))
(define-inline (cvm-require-tailc-set! o::cvm v::bool) (with-access::cvm o (require-tailc) (set! require-tailc v)))
(define-inline (cvm-tvector-descr-support::bool o::cvm) (with-access::cvm o (tvector-descr-support) tvector-descr-support))
(define-inline (cvm-tvector-descr-support-set! o::cvm v::bool) (with-access::cvm o (tvector-descr-support) (set! tvector-descr-support v)))
(define-inline (cvm-pragma-support::bool o::cvm) (with-access::cvm o (pragma-support) pragma-support))
(define-inline (cvm-pragma-support-set! o::cvm v::bool) (with-access::cvm o (pragma-support) (set! pragma-support v)))
(define-inline (cvm-debug-support::pair-nil o::cvm) (with-access::cvm o (debug-support) debug-support))
(define-inline (cvm-debug-support-set! o::cvm v::pair-nil) (with-access::cvm o (debug-support) (set! debug-support v)))
(define-inline (cvm-foreign-clause-support::pair-nil o::cvm) (with-access::cvm o (foreign-clause-support) foreign-clause-support))
(define-inline (cvm-foreign-clause-support-set! o::cvm v::pair-nil) (with-access::cvm o (foreign-clause-support) (set! foreign-clause-support v)))
(define-inline (cvm-trace-support::bool o::cvm) (with-access::cvm o (trace-support) trace-support))
(define-inline (cvm-trace-support-set! o::cvm v::bool) (with-access::cvm o (trace-support) (set! trace-support v)))
(define-inline (cvm-typed-eq::bool o::cvm) (with-access::cvm o (typed-eq) typed-eq))
(define-inline (cvm-typed-eq-set! o::cvm v::bool) (with-access::cvm o (typed-eq) (set! typed-eq v)))
(define-inline (cvm-foreign-closure::bool o::cvm) (with-access::cvm o (foreign-closure) foreign-closure))
(define-inline (cvm-foreign-closure-set! o::cvm v::bool) (with-access::cvm o (foreign-closure) (set! foreign-closure v)))
(define-inline (cvm-remove-empty-let::bool o::cvm) (with-access::cvm o (remove-empty-let) remove-empty-let))
(define-inline (cvm-remove-empty-let-set! o::cvm v::bool) (with-access::cvm o (remove-empty-let) (set! remove-empty-let v)))
(define-inline (cvm-effect+::bool o::cvm) (with-access::cvm o (effect+) effect+))
(define-inline (cvm-effect+-set! o::cvm v::bool) (with-access::cvm o (effect+) (set! effect+ v)))
(define-inline (cvm-qualified-types::bool o::cvm) (with-access::cvm o (qualified-types) qualified-types))
(define-inline (cvm-qualified-types-set! o::cvm v::bool) (with-access::cvm o (qualified-types) (set! qualified-types v)))
(define-inline (cvm-callcc::bool o::cvm) (with-access::cvm o (callcc) callcc))
(define-inline (cvm-callcc-set! o::cvm v::bool) (with-access::cvm o (callcc) (set! callcc v)))
(define-inline (cvm-heap-compatible::symbol o::cvm) (with-access::cvm o (heap-compatible) heap-compatible))
(define-inline (cvm-heap-compatible-set! o::cvm v::symbol) (with-access::cvm o (heap-compatible) (set! heap-compatible v)))
(define-inline (cvm-heap-suffix::bstring o::cvm) (with-access::cvm o (heap-suffix) heap-suffix))
(define-inline (cvm-heap-suffix-set! o::cvm v::bstring) (with-access::cvm o (heap-suffix) (set! heap-suffix v)))
(define-inline (cvm-typed::bool o::cvm) (with-access::cvm o (typed) typed))
(define-inline (cvm-typed-set! o::cvm v::bool) (with-access::cvm o (typed) (set! typed v)))
(define-inline (cvm-types::obj o::cvm) (with-access::cvm o (types) types))
(define-inline (cvm-types-set! o::cvm v::obj) (with-access::cvm o (types) (set! types v)))
(define-inline (cvm-functions::obj o::cvm) (with-access::cvm o (functions) functions))
(define-inline (cvm-functions-set! o::cvm v::obj) (with-access::cvm o (functions) (set! functions v)))
(define-inline (cvm-variables::obj o::cvm) (with-access::cvm o (variables) variables))
(define-inline (cvm-variables-set! o::cvm v::obj) (with-access::cvm o (variables) (set! variables v)))
(define-inline (cvm-extern-types::obj o::cvm) (with-access::cvm o (extern-types) extern-types))
(define-inline (cvm-extern-types-set! o::cvm v::obj) (with-access::cvm o (extern-types) (set! extern-types v)))
(define-inline (cvm-extern-functions::obj o::cvm) (with-access::cvm o (extern-functions) extern-functions))
(define-inline (cvm-extern-functions-set! o::cvm v::obj) (with-access::cvm o (extern-functions) (set! extern-functions v)))
(define-inline (cvm-extern-variables::obj o::cvm) (with-access::cvm o (extern-variables) extern-variables))
(define-inline (cvm-extern-variables-set! o::cvm v::obj) (with-access::cvm o (extern-variables) (set! extern-variables v)))
(define-inline (cvm-name::bstring o::cvm) (with-access::cvm o (name) name))
(define-inline (cvm-name-set! o::cvm v::bstring) (with-access::cvm o (name) (set! name v)))
(define-inline (cvm-srfi0::symbol o::cvm) (with-access::cvm o (srfi0) srfi0))
(define-inline (cvm-srfi0-set! o::cvm v::symbol) (with-access::cvm o (srfi0) (set! srfi0 v)))
(define-inline (cvm-language::symbol o::cvm) (with-access::cvm o (language) language))
(define-inline (cvm-language-set! o::cvm v::symbol) (with-access::cvm o (language) (set! language v)))

;; sawc
(define-inline (make-sawc::sawc language1194::symbol srfi01195::symbol name1196::bstring extern-variables1197::obj extern-functions1198::obj extern-types1199::obj variables1200::obj functions1201::obj types1202::obj typed1203::bool heap-suffix1204::bstring heap-compatible1205::symbol callcc1206::bool qualified-types1207::bool effect+1208::bool remove-empty-let1209::bool foreign-closure1210::bool typed-eq1211::bool trace-support1212::bool foreign-clause-suppo1213::pair-nil debug-support1214::pair-nil pragma-support1215::bool tvector-descr-suppor1216::bool require-tailc1217::bool registers1218::pair-nil pregisters1219::pair-nil bound-check1220::bool type-check1221::bool typed-funcall1222::bool) (instantiate::sawc (language language1194) (srfi0 srfi01195) (name name1196) (extern-variables extern-variables1197) (extern-functions extern-functions1198) (extern-types extern-types1199) (variables variables1200) (functions functions1201) (types types1202) (typed typed1203) (heap-suffix heap-suffix1204) (heap-compatible heap-compatible1205) (callcc callcc1206) (qualified-types qualified-types1207) (effect+ effect+1208) (remove-empty-let remove-empty-let1209) (foreign-closure foreign-closure1210) (typed-eq typed-eq1211) (trace-support trace-support1212) (foreign-clause-support foreign-clause-suppo1213) (debug-support debug-support1214) (pragma-support pragma-support1215) (tvector-descr-support tvector-descr-suppor1216) (require-tailc require-tailc1217) (registers registers1218) (pregisters pregisters1219) (bound-check bound-check1220) (type-check type-check1221) (typed-funcall typed-funcall1222)))
(define-inline (sawc?::bool obj::obj) ((@ isa? __object) obj (@ sawc backend_cvm)))
(define (sawc-nil::sawc) (class-nil (@ sawc backend_cvm)))
(define-inline (sawc-typed-funcall::bool o::sawc) (with-access::sawc o (typed-funcall) typed-funcall))
(define-inline (sawc-typed-funcall-set! o::sawc v::bool) (with-access::sawc o (typed-funcall) (set! typed-funcall v)))
(define-inline (sawc-type-check::bool o::sawc) (with-access::sawc o (type-check) type-check))
(define-inline (sawc-type-check-set! o::sawc v::bool) (with-access::sawc o (type-check) (set! type-check v)))
(define-inline (sawc-bound-check::bool o::sawc) (with-access::sawc o (bound-check) bound-check))
(define-inline (sawc-bound-check-set! o::sawc v::bool) (with-access::sawc o (bound-check) (set! bound-check v)))
(define-inline (sawc-pregisters::pair-nil o::sawc) (with-access::sawc o (pregisters) pregisters))
(define-inline (sawc-pregisters-set! o::sawc v::pair-nil) (with-access::sawc o (pregisters) (set! pregisters v)))
(define-inline (sawc-registers::pair-nil o::sawc) (with-access::sawc o (registers) registers))
(define-inline (sawc-registers-set! o::sawc v::pair-nil) (with-access::sawc o (registers) (set! registers v)))
(define-inline (sawc-require-tailc::bool o::sawc) (with-access::sawc o (require-tailc) require-tailc))
(define-inline (sawc-require-tailc-set! o::sawc v::bool) (with-access::sawc o (require-tailc) (set! require-tailc v)))
(define-inline (sawc-tvector-descr-support::bool o::sawc) (with-access::sawc o (tvector-descr-support) tvector-descr-support))
(define-inline (sawc-tvector-descr-support-set! o::sawc v::bool) (with-access::sawc o (tvector-descr-support) (set! tvector-descr-support v)))
(define-inline (sawc-pragma-support::bool o::sawc) (with-access::sawc o (pragma-support) pragma-support))
(define-inline (sawc-pragma-support-set! o::sawc v::bool) (with-access::sawc o (pragma-support) (set! pragma-support v)))
(define-inline (sawc-debug-support::pair-nil o::sawc) (with-access::sawc o (debug-support) debug-support))
(define-inline (sawc-debug-support-set! o::sawc v::pair-nil) (with-access::sawc o (debug-support) (set! debug-support v)))
(define-inline (sawc-foreign-clause-support::pair-nil o::sawc) (with-access::sawc o (foreign-clause-support) foreign-clause-support))
(define-inline (sawc-foreign-clause-support-set! o::sawc v::pair-nil) (with-access::sawc o (foreign-clause-support) (set! foreign-clause-support v)))
(define-inline (sawc-trace-support::bool o::sawc) (with-access::sawc o (trace-support) trace-support))
(define-inline (sawc-trace-support-set! o::sawc v::bool) (with-access::sawc o (trace-support) (set! trace-support v)))
(define-inline (sawc-typed-eq::bool o::sawc) (with-access::sawc o (typed-eq) typed-eq))
(define-inline (sawc-typed-eq-set! o::sawc v::bool) (with-access::sawc o (typed-eq) (set! typed-eq v)))
(define-inline (sawc-foreign-closure::bool o::sawc) (with-access::sawc o (foreign-closure) foreign-closure))
(define-inline (sawc-foreign-closure-set! o::sawc v::bool) (with-access::sawc o (foreign-closure) (set! foreign-closure v)))
(define-inline (sawc-remove-empty-let::bool o::sawc) (with-access::sawc o (remove-empty-let) remove-empty-let))
(define-inline (sawc-remove-empty-let-set! o::sawc v::bool) (with-access::sawc o (remove-empty-let) (set! remove-empty-let v)))
(define-inline (sawc-effect+::bool o::sawc) (with-access::sawc o (effect+) effect+))
(define-inline (sawc-effect+-set! o::sawc v::bool) (with-access::sawc o (effect+) (set! effect+ v)))
(define-inline (sawc-qualified-types::bool o::sawc) (with-access::sawc o (qualified-types) qualified-types))
(define-inline (sawc-qualified-types-set! o::sawc v::bool) (with-access::sawc o (qualified-types) (set! qualified-types v)))
(define-inline (sawc-callcc::bool o::sawc) (with-access::sawc o (callcc) callcc))
(define-inline (sawc-callcc-set! o::sawc v::bool) (with-access::sawc o (callcc) (set! callcc v)))
(define-inline (sawc-heap-compatible::symbol o::sawc) (with-access::sawc o (heap-compatible) heap-compatible))
(define-inline (sawc-heap-compatible-set! o::sawc v::symbol) (with-access::sawc o (heap-compatible) (set! heap-compatible v)))
(define-inline (sawc-heap-suffix::bstring o::sawc) (with-access::sawc o (heap-suffix) heap-suffix))
(define-inline (sawc-heap-suffix-set! o::sawc v::bstring) (with-access::sawc o (heap-suffix) (set! heap-suffix v)))
(define-inline (sawc-typed::bool o::sawc) (with-access::sawc o (typed) typed))
(define-inline (sawc-typed-set! o::sawc v::bool) (with-access::sawc o (typed) (set! typed v)))
(define-inline (sawc-types::obj o::sawc) (with-access::sawc o (types) types))
(define-inline (sawc-types-set! o::sawc v::obj) (with-access::sawc o (types) (set! types v)))
(define-inline (sawc-functions::obj o::sawc) (with-access::sawc o (functions) functions))
(define-inline (sawc-functions-set! o::sawc v::obj) (with-access::sawc o (functions) (set! functions v)))
(define-inline (sawc-variables::obj o::sawc) (with-access::sawc o (variables) variables))
(define-inline (sawc-variables-set! o::sawc v::obj) (with-access::sawc o (variables) (set! variables v)))
(define-inline (sawc-extern-types::obj o::sawc) (with-access::sawc o (extern-types) extern-types))
(define-inline (sawc-extern-types-set! o::sawc v::obj) (with-access::sawc o (extern-types) (set! extern-types v)))
(define-inline (sawc-extern-functions::obj o::sawc) (with-access::sawc o (extern-functions) extern-functions))
(define-inline (sawc-extern-functions-set! o::sawc v::obj) (with-access::sawc o (extern-functions) (set! extern-functions v)))
(define-inline (sawc-extern-variables::obj o::sawc) (with-access::sawc o (extern-variables) extern-variables))
(define-inline (sawc-extern-variables-set! o::sawc v::obj) (with-access::sawc o (extern-variables) (set! extern-variables v)))
(define-inline (sawc-name::bstring o::sawc) (with-access::sawc o (name) name))
(define-inline (sawc-name-set! o::sawc v::bstring) (with-access::sawc o (name) (set! name v)))
(define-inline (sawc-srfi0::symbol o::sawc) (with-access::sawc o (srfi0) srfi0))
(define-inline (sawc-srfi0-set! o::sawc v::symbol) (with-access::sawc o (srfi0) (set! srfi0 v)))
(define-inline (sawc-language::symbol o::sawc) (with-access::sawc o (language) language))
(define-inline (sawc-language-set! o::sawc v::symbol) (with-access::sawc o (language) (set! language v)))

;; cgen
(define-inline (make-cgen::cgen language1164::symbol srfi01165::symbol name1166::bstring extern-variables1167::obj extern-functions1168::obj extern-types1169::obj variables1170::obj functions1171::obj types1172::obj typed1173::bool heap-suffix1174::bstring heap-compatible1175::symbol callcc1176::bool qualified-types1177::bool effect+1178::bool remove-empty-let1179::bool foreign-closure1180::bool typed-eq1181::bool trace-support1182::bool foreign-clause-suppo1183::pair-nil debug-support1184::pair-nil pragma-support1185::bool tvector-descr-suppor1186::bool require-tailc1187::bool registers1188::pair-nil pregisters1189::pair-nil bound-check1190::bool type-check1191::bool typed-funcall1192::bool) (instantiate::cgen (language language1164) (srfi0 srfi01165) (name name1166) (extern-variables extern-variables1167) (extern-functions extern-functions1168) (extern-types extern-types1169) (variables variables1170) (functions functions1171) (types types1172) (typed typed1173) (heap-suffix heap-suffix1174) (heap-compatible heap-compatible1175) (callcc callcc1176) (qualified-types qualified-types1177) (effect+ effect+1178) (remove-empty-let remove-empty-let1179) (foreign-closure foreign-closure1180) (typed-eq typed-eq1181) (trace-support trace-support1182) (foreign-clause-support foreign-clause-suppo1183) (debug-support debug-support1184) (pragma-support pragma-support1185) (tvector-descr-support tvector-descr-suppor1186) (require-tailc require-tailc1187) (registers registers1188) (pregisters pregisters1189) (bound-check bound-check1190) (type-check type-check1191) (typed-funcall typed-funcall1192)))
(define-inline (cgen?::bool obj::obj) ((@ isa? __object) obj (@ cgen backend_cvm)))
(define (cgen-nil::cgen) (class-nil (@ cgen backend_cvm)))
(define-inline (cgen-typed-funcall::bool o::cgen) (with-access::cgen o (typed-funcall) typed-funcall))
(define-inline (cgen-typed-funcall-set! o::cgen v::bool) (with-access::cgen o (typed-funcall) (set! typed-funcall v)))
(define-inline (cgen-type-check::bool o::cgen) (with-access::cgen o (type-check) type-check))
(define-inline (cgen-type-check-set! o::cgen v::bool) (with-access::cgen o (type-check) (set! type-check v)))
(define-inline (cgen-bound-check::bool o::cgen) (with-access::cgen o (bound-check) bound-check))
(define-inline (cgen-bound-check-set! o::cgen v::bool) (with-access::cgen o (bound-check) (set! bound-check v)))
(define-inline (cgen-pregisters::pair-nil o::cgen) (with-access::cgen o (pregisters) pregisters))
(define-inline (cgen-pregisters-set! o::cgen v::pair-nil) (with-access::cgen o (pregisters) (set! pregisters v)))
(define-inline (cgen-registers::pair-nil o::cgen) (with-access::cgen o (registers) registers))
(define-inline (cgen-registers-set! o::cgen v::pair-nil) (with-access::cgen o (registers) (set! registers v)))
(define-inline (cgen-require-tailc::bool o::cgen) (with-access::cgen o (require-tailc) require-tailc))
(define-inline (cgen-require-tailc-set! o::cgen v::bool) (with-access::cgen o (require-tailc) (set! require-tailc v)))
(define-inline (cgen-tvector-descr-support::bool o::cgen) (with-access::cgen o (tvector-descr-support) tvector-descr-support))
(define-inline (cgen-tvector-descr-support-set! o::cgen v::bool) (with-access::cgen o (tvector-descr-support) (set! tvector-descr-support v)))
(define-inline (cgen-pragma-support::bool o::cgen) (with-access::cgen o (pragma-support) pragma-support))
(define-inline (cgen-pragma-support-set! o::cgen v::bool) (with-access::cgen o (pragma-support) (set! pragma-support v)))
(define-inline (cgen-debug-support::pair-nil o::cgen) (with-access::cgen o (debug-support) debug-support))
(define-inline (cgen-debug-support-set! o::cgen v::pair-nil) (with-access::cgen o (debug-support) (set! debug-support v)))
(define-inline (cgen-foreign-clause-support::pair-nil o::cgen) (with-access::cgen o (foreign-clause-support) foreign-clause-support))
(define-inline (cgen-foreign-clause-support-set! o::cgen v::pair-nil) (with-access::cgen o (foreign-clause-support) (set! foreign-clause-support v)))
(define-inline (cgen-trace-support::bool o::cgen) (with-access::cgen o (trace-support) trace-support))
(define-inline (cgen-trace-support-set! o::cgen v::bool) (with-access::cgen o (trace-support) (set! trace-support v)))
(define-inline (cgen-typed-eq::bool o::cgen) (with-access::cgen o (typed-eq) typed-eq))
(define-inline (cgen-typed-eq-set! o::cgen v::bool) (with-access::cgen o (typed-eq) (set! typed-eq v)))
(define-inline (cgen-foreign-closure::bool o::cgen) (with-access::cgen o (foreign-closure) foreign-closure))
(define-inline (cgen-foreign-closure-set! o::cgen v::bool) (with-access::cgen o (foreign-closure) (set! foreign-closure v)))
(define-inline (cgen-remove-empty-let::bool o::cgen) (with-access::cgen o (remove-empty-let) remove-empty-let))
(define-inline (cgen-remove-empty-let-set! o::cgen v::bool) (with-access::cgen o (remove-empty-let) (set! remove-empty-let v)))
(define-inline (cgen-effect+::bool o::cgen) (with-access::cgen o (effect+) effect+))
(define-inline (cgen-effect+-set! o::cgen v::bool) (with-access::cgen o (effect+) (set! effect+ v)))
(define-inline (cgen-qualified-types::bool o::cgen) (with-access::cgen o (qualified-types) qualified-types))
(define-inline (cgen-qualified-types-set! o::cgen v::bool) (with-access::cgen o (qualified-types) (set! qualified-types v)))
(define-inline (cgen-callcc::bool o::cgen) (with-access::cgen o (callcc) callcc))
(define-inline (cgen-callcc-set! o::cgen v::bool) (with-access::cgen o (callcc) (set! callcc v)))
(define-inline (cgen-heap-compatible::symbol o::cgen) (with-access::cgen o (heap-compatible) heap-compatible))
(define-inline (cgen-heap-compatible-set! o::cgen v::symbol) (with-access::cgen o (heap-compatible) (set! heap-compatible v)))
(define-inline (cgen-heap-suffix::bstring o::cgen) (with-access::cgen o (heap-suffix) heap-suffix))
(define-inline (cgen-heap-suffix-set! o::cgen v::bstring) (with-access::cgen o (heap-suffix) (set! heap-suffix v)))
(define-inline (cgen-typed::bool o::cgen) (with-access::cgen o (typed) typed))
(define-inline (cgen-typed-set! o::cgen v::bool) (with-access::cgen o (typed) (set! typed v)))
(define-inline (cgen-types::obj o::cgen) (with-access::cgen o (types) types))
(define-inline (cgen-types-set! o::cgen v::obj) (with-access::cgen o (types) (set! types v)))
(define-inline (cgen-functions::obj o::cgen) (with-access::cgen o (functions) functions))
(define-inline (cgen-functions-set! o::cgen v::obj) (with-access::cgen o (functions) (set! functions v)))
(define-inline (cgen-variables::obj o::cgen) (with-access::cgen o (variables) variables))
(define-inline (cgen-variables-set! o::cgen v::obj) (with-access::cgen o (variables) (set! variables v)))
(define-inline (cgen-extern-types::obj o::cgen) (with-access::cgen o (extern-types) extern-types))
(define-inline (cgen-extern-types-set! o::cgen v::obj) (with-access::cgen o (extern-types) (set! extern-types v)))
(define-inline (cgen-extern-functions::obj o::cgen) (with-access::cgen o (extern-functions) extern-functions))
(define-inline (cgen-extern-functions-set! o::cgen v::obj) (with-access::cgen o (extern-functions) (set! extern-functions v)))
(define-inline (cgen-extern-variables::obj o::cgen) (with-access::cgen o (extern-variables) extern-variables))
(define-inline (cgen-extern-variables-set! o::cgen v::obj) (with-access::cgen o (extern-variables) (set! extern-variables v)))
(define-inline (cgen-name::bstring o::cgen) (with-access::cgen o (name) name))
(define-inline (cgen-name-set! o::cgen v::bstring) (with-access::cgen o (name) (set! name v)))
(define-inline (cgen-srfi0::symbol o::cgen) (with-access::cgen o (srfi0) srfi0))
(define-inline (cgen-srfi0-set! o::cgen v::symbol) (with-access::cgen o (srfi0) (set! srfi0 v)))
(define-inline (cgen-language::symbol o::cgen) (with-access::cgen o (language) language))
(define-inline (cgen-language-set! o::cgen v::symbol) (with-access::cgen o (language) (set! language v)))
))