;; ==========================================================
;; Class accessors
;; Bigloo (4.3b)
;; Inria -- Sophia Antipolis     Wed Jul 26 09:27:50 CEST 2017 
;; (bigloo -classgen SawMill/bbv-types.scm)
;; ==========================================================

;; The directives
(directives

;; blockV
(cond-expand ((and bigloo-class-sans (not bigloo-class-generate))
  (export
    (inline make-blockV::blockV label1226::int preds1227::pair-nil succs1228::pair-nil first1229::pair versions1230::pair-nil %mark1231::long)
    (inline blockV?::bool ::obj)
    (blockV-nil::blockV)
    (inline blockV-%mark::long ::blockV)
    (inline blockV-%mark-set! ::blockV ::long)
    (inline blockV-versions::pair-nil ::blockV)
    (inline blockV-versions-set! ::blockV ::pair-nil)
    (inline blockV-first::pair ::blockV)
    (inline blockV-first-set! ::blockV ::pair)
    (inline blockV-succs::pair-nil ::blockV)
    (inline blockV-succs-set! ::blockV ::pair-nil)
    (inline blockV-preds::pair-nil ::blockV)
    (inline blockV-preds-set! ::blockV ::pair-nil)
    (inline blockV-label::int ::blockV)
    (inline blockV-label-set! ::blockV ::int))))

;; blockS
(cond-expand ((and bigloo-class-sans (not bigloo-class-generate))
  (export
    (inline make-blockS::blockS label1215::int preds1216::pair-nil succs1217::pair-nil first1218::pair ictx1219::pair-nil octxs1220::pair-nil %mark1221::long %parent1222::obj %hash1223::obj %blacklist1224::obj)
    (inline blockS?::bool ::obj)
    (blockS-nil::blockS)
    (inline blockS-%blacklist::obj ::blockS)
    (inline blockS-%blacklist-set! ::blockS ::obj)
    (inline blockS-%hash::obj ::blockS)
    (inline blockS-%hash-set! ::blockS ::obj)
    (inline blockS-%parent::obj ::blockS)
    (inline blockS-%mark::long ::blockS)
    (inline blockS-%mark-set! ::blockS ::long)
    (inline blockS-octxs::pair-nil ::blockS)
    (inline blockS-octxs-set! ::blockS ::pair-nil)
    (inline blockS-ictx::pair-nil ::blockS)
    (inline blockS-ictx-set! ::blockS ::pair-nil)
    (inline blockS-first::pair ::blockS)
    (inline blockS-first-set! ::blockS ::pair)
    (inline blockS-succs::pair-nil ::blockS)
    (inline blockS-succs-set! ::blockS ::pair-nil)
    (inline blockS-preds::pair-nil ::blockS)
    (inline blockS-preds-set! ::blockS ::pair-nil)
    (inline blockS-label::int ::blockS)
    (inline blockS-label-set! ::blockS ::int))))

;; rtl_ins/bbv
(cond-expand ((and bigloo-class-sans (not bigloo-class-generate))
  (export
    (inline make-rtl_ins/bbv::rtl_ins/bbv loc1205::obj %spill1206::pair-nil dest1207::obj fun1208::rtl_fun args1209::pair-nil def1210::obj out1211::obj in1212::obj %hash1213::obj)
    (inline rtl_ins/bbv?::bool ::obj)
    (rtl_ins/bbv-nil::rtl_ins/bbv)
    (inline rtl_ins/bbv-%hash::obj ::rtl_ins/bbv)
    (inline rtl_ins/bbv-%hash-set! ::rtl_ins/bbv ::obj)
    (inline rtl_ins/bbv-in::obj ::rtl_ins/bbv)
    (inline rtl_ins/bbv-in-set! ::rtl_ins/bbv ::obj)
    (inline rtl_ins/bbv-out::obj ::rtl_ins/bbv)
    (inline rtl_ins/bbv-out-set! ::rtl_ins/bbv ::obj)
    (inline rtl_ins/bbv-def::obj ::rtl_ins/bbv)
    (inline rtl_ins/bbv-def-set! ::rtl_ins/bbv ::obj)
    (inline rtl_ins/bbv-args::pair-nil ::rtl_ins/bbv)
    (inline rtl_ins/bbv-args-set! ::rtl_ins/bbv ::pair-nil)
    (inline rtl_ins/bbv-fun::rtl_fun ::rtl_ins/bbv)
    (inline rtl_ins/bbv-fun-set! ::rtl_ins/bbv ::rtl_fun)
    (inline rtl_ins/bbv-dest::obj ::rtl_ins/bbv)
    (inline rtl_ins/bbv-dest-set! ::rtl_ins/bbv ::obj)
    (inline rtl_ins/bbv-%spill::pair-nil ::rtl_ins/bbv)
    (inline rtl_ins/bbv-%spill-set! ::rtl_ins/bbv ::pair-nil)
    (inline rtl_ins/bbv-loc::obj ::rtl_ins/bbv)
    (inline rtl_ins/bbv-loc-set! ::rtl_ins/bbv ::obj))))

;; bbv-ctxentry
(cond-expand ((and bigloo-class-sans (not bigloo-class-generate))
  (export
    (inline make-bbv-ctxentry::bbv-ctxentry reg1199::rtl_reg typ1200::type flag1201::bool value1202::obj aliases1203::pair-nil)
    (inline bbv-ctxentry?::bool ::obj)
    (bbv-ctxentry-nil::bbv-ctxentry)
    (inline bbv-ctxentry-aliases::pair-nil ::bbv-ctxentry)
    (inline bbv-ctxentry-aliases-set! ::bbv-ctxentry ::pair-nil)
    (inline bbv-ctxentry-value::obj ::bbv-ctxentry)
    (inline bbv-ctxentry-flag::bool ::bbv-ctxentry)
    (inline bbv-ctxentry-typ::type ::bbv-ctxentry)
    (inline bbv-ctxentry-reg::rtl_reg ::bbv-ctxentry)))))

;; The definitions
(cond-expand (bigloo-class-sans
;; blockV
(define-inline (make-blockV::blockV label1226::int preds1227::pair-nil succs1228::pair-nil first1229::pair versions1230::pair-nil %mark1231::long) (instantiate::blockV (label label1226) (preds preds1227) (succs succs1228) (first first1229) (versions versions1230) (%mark %mark1231)))
(define-inline (blockV?::bool obj::obj) ((@ isa? __object) obj (@ blockV saw_bbv-types)))
(define (blockV-nil::blockV) (class-nil (@ blockV saw_bbv-types)))
(define-inline (blockV-%mark::long o::blockV) (-> |#!bigloo_wallow| o %mark))
(define-inline (blockV-%mark-set! o::blockV v::long) (set! (-> |#!bigloo_wallow| o %mark) v))
(define-inline (blockV-versions::pair-nil o::blockV) (-> |#!bigloo_wallow| o versions))
(define-inline (blockV-versions-set! o::blockV v::pair-nil) (set! (-> |#!bigloo_wallow| o versions) v))
(define-inline (blockV-first::pair o::blockV) (-> |#!bigloo_wallow| o first))
(define-inline (blockV-first-set! o::blockV v::pair) (set! (-> |#!bigloo_wallow| o first) v))
(define-inline (blockV-succs::pair-nil o::blockV) (-> |#!bigloo_wallow| o succs))
(define-inline (blockV-succs-set! o::blockV v::pair-nil) (set! (-> |#!bigloo_wallow| o succs) v))
(define-inline (blockV-preds::pair-nil o::blockV) (-> |#!bigloo_wallow| o preds))
(define-inline (blockV-preds-set! o::blockV v::pair-nil) (set! (-> |#!bigloo_wallow| o preds) v))
(define-inline (blockV-label::int o::blockV) (-> |#!bigloo_wallow| o label))
(define-inline (blockV-label-set! o::blockV v::int) (set! (-> |#!bigloo_wallow| o label) v))

;; blockS
(define-inline (make-blockS::blockS label1215::int preds1216::pair-nil succs1217::pair-nil first1218::pair ictx1219::pair-nil octxs1220::pair-nil %mark1221::long %parent1222::obj %hash1223::obj %blacklist1224::obj) (instantiate::blockS (label label1215) (preds preds1216) (succs succs1217) (first first1218) (ictx ictx1219) (octxs octxs1220) (%mark %mark1221) (%parent %parent1222) (%hash %hash1223) (%blacklist %blacklist1224)))
(define-inline (blockS?::bool obj::obj) ((@ isa? __object) obj (@ blockS saw_bbv-types)))
(define (blockS-nil::blockS) (class-nil (@ blockS saw_bbv-types)))
(define-inline (blockS-%blacklist::obj o::blockS) (-> |#!bigloo_wallow| o %blacklist))
(define-inline (blockS-%blacklist-set! o::blockS v::obj) (set! (-> |#!bigloo_wallow| o %blacklist) v))
(define-inline (blockS-%hash::obj o::blockS) (-> |#!bigloo_wallow| o %hash))
(define-inline (blockS-%hash-set! o::blockS v::obj) (set! (-> |#!bigloo_wallow| o %hash) v))
(define-inline (blockS-%parent::obj o::blockS) (-> |#!bigloo_wallow| o %parent))
(define-inline (blockS-%parent-set! o::blockS v::obj) (set! (-> |#!bigloo_wallow| o %parent) v))
(define-inline (blockS-%mark::long o::blockS) (-> |#!bigloo_wallow| o %mark))
(define-inline (blockS-%mark-set! o::blockS v::long) (set! (-> |#!bigloo_wallow| o %mark) v))
(define-inline (blockS-octxs::pair-nil o::blockS) (-> |#!bigloo_wallow| o octxs))
(define-inline (blockS-octxs-set! o::blockS v::pair-nil) (set! (-> |#!bigloo_wallow| o octxs) v))
(define-inline (blockS-ictx::pair-nil o::blockS) (-> |#!bigloo_wallow| o ictx))
(define-inline (blockS-ictx-set! o::blockS v::pair-nil) (set! (-> |#!bigloo_wallow| o ictx) v))
(define-inline (blockS-first::pair o::blockS) (-> |#!bigloo_wallow| o first))
(define-inline (blockS-first-set! o::blockS v::pair) (set! (-> |#!bigloo_wallow| o first) v))
(define-inline (blockS-succs::pair-nil o::blockS) (-> |#!bigloo_wallow| o succs))
(define-inline (blockS-succs-set! o::blockS v::pair-nil) (set! (-> |#!bigloo_wallow| o succs) v))
(define-inline (blockS-preds::pair-nil o::blockS) (-> |#!bigloo_wallow| o preds))
(define-inline (blockS-preds-set! o::blockS v::pair-nil) (set! (-> |#!bigloo_wallow| o preds) v))
(define-inline (blockS-label::int o::blockS) (-> |#!bigloo_wallow| o label))
(define-inline (blockS-label-set! o::blockS v::int) (set! (-> |#!bigloo_wallow| o label) v))

;; rtl_ins/bbv
(define-inline (make-rtl_ins/bbv::rtl_ins/bbv loc1205::obj %spill1206::pair-nil dest1207::obj fun1208::rtl_fun args1209::pair-nil def1210::obj out1211::obj in1212::obj %hash1213::obj) (instantiate::rtl_ins/bbv (loc loc1205) (%spill %spill1206) (dest dest1207) (fun fun1208) (args args1209) (def def1210) (out out1211) (in in1212) (%hash %hash1213)))
(define-inline (rtl_ins/bbv?::bool obj::obj) ((@ isa? __object) obj (@ rtl_ins/bbv saw_bbv-types)))
(define (rtl_ins/bbv-nil::rtl_ins/bbv) (class-nil (@ rtl_ins/bbv saw_bbv-types)))
(define-inline (rtl_ins/bbv-%hash::obj o::rtl_ins/bbv) (-> |#!bigloo_wallow| o %hash))
(define-inline (rtl_ins/bbv-%hash-set! o::rtl_ins/bbv v::obj) (set! (-> |#!bigloo_wallow| o %hash) v))
(define-inline (rtl_ins/bbv-in::obj o::rtl_ins/bbv) (-> |#!bigloo_wallow| o in))
(define-inline (rtl_ins/bbv-in-set! o::rtl_ins/bbv v::obj) (set! (-> |#!bigloo_wallow| o in) v))
(define-inline (rtl_ins/bbv-out::obj o::rtl_ins/bbv) (-> |#!bigloo_wallow| o out))
(define-inline (rtl_ins/bbv-out-set! o::rtl_ins/bbv v::obj) (set! (-> |#!bigloo_wallow| o out) v))
(define-inline (rtl_ins/bbv-def::obj o::rtl_ins/bbv) (-> |#!bigloo_wallow| o def))
(define-inline (rtl_ins/bbv-def-set! o::rtl_ins/bbv v::obj) (set! (-> |#!bigloo_wallow| o def) v))
(define-inline (rtl_ins/bbv-args::pair-nil o::rtl_ins/bbv) (-> |#!bigloo_wallow| o args))
(define-inline (rtl_ins/bbv-args-set! o::rtl_ins/bbv v::pair-nil) (set! (-> |#!bigloo_wallow| o args) v))
(define-inline (rtl_ins/bbv-fun::rtl_fun o::rtl_ins/bbv) (-> |#!bigloo_wallow| o fun))
(define-inline (rtl_ins/bbv-fun-set! o::rtl_ins/bbv v::rtl_fun) (set! (-> |#!bigloo_wallow| o fun) v))
(define-inline (rtl_ins/bbv-dest::obj o::rtl_ins/bbv) (-> |#!bigloo_wallow| o dest))
(define-inline (rtl_ins/bbv-dest-set! o::rtl_ins/bbv v::obj) (set! (-> |#!bigloo_wallow| o dest) v))
(define-inline (rtl_ins/bbv-%spill::pair-nil o::rtl_ins/bbv) (-> |#!bigloo_wallow| o %spill))
(define-inline (rtl_ins/bbv-%spill-set! o::rtl_ins/bbv v::pair-nil) (set! (-> |#!bigloo_wallow| o %spill) v))
(define-inline (rtl_ins/bbv-loc::obj o::rtl_ins/bbv) (-> |#!bigloo_wallow| o loc))
(define-inline (rtl_ins/bbv-loc-set! o::rtl_ins/bbv v::obj) (set! (-> |#!bigloo_wallow| o loc) v))

;; bbv-ctxentry
(define-inline (make-bbv-ctxentry::bbv-ctxentry reg1199::rtl_reg typ1200::type flag1201::bool value1202::obj aliases1203::pair-nil) (instantiate::bbv-ctxentry (reg reg1199) (typ typ1200) (flag flag1201) (value value1202) (aliases aliases1203)))
(define-inline (bbv-ctxentry?::bool obj::obj) ((@ isa? __object) obj (@ bbv-ctxentry saw_bbv-types)))
(define (bbv-ctxentry-nil::bbv-ctxentry) (class-nil (@ bbv-ctxentry saw_bbv-types)))
(define-inline (bbv-ctxentry-aliases::pair-nil o::bbv-ctxentry) (-> |#!bigloo_wallow| o aliases))
(define-inline (bbv-ctxentry-aliases-set! o::bbv-ctxentry v::pair-nil) (set! (-> |#!bigloo_wallow| o aliases) v))
(define-inline (bbv-ctxentry-value::obj o::bbv-ctxentry) (-> |#!bigloo_wallow| o value))
(define-inline (bbv-ctxentry-value-set! o::bbv-ctxentry v::obj) (set! (-> |#!bigloo_wallow| o value) v))
(define-inline (bbv-ctxentry-flag::bool o::bbv-ctxentry) (-> |#!bigloo_wallow| o flag))
(define-inline (bbv-ctxentry-flag-set! o::bbv-ctxentry v::bool) (set! (-> |#!bigloo_wallow| o flag) v))
(define-inline (bbv-ctxentry-typ::type o::bbv-ctxentry) (-> |#!bigloo_wallow| o typ))
(define-inline (bbv-ctxentry-typ-set! o::bbv-ctxentry v::type) (set! (-> |#!bigloo_wallow| o typ) v))
(define-inline (bbv-ctxentry-reg::rtl_reg o::bbv-ctxentry) (-> |#!bigloo_wallow| o reg))
(define-inline (bbv-ctxentry-reg-set! o::bbv-ctxentry v::rtl_reg) (set! (-> |#!bigloo_wallow| o reg) v))
))
