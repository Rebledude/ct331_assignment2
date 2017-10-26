#lang racket

(require (file "assignment_q2.rkt"))

;
;Don't worry about this file unless you are doing the extra credit tests. 
;

;This structure allows a single function call
;to run every test in sequence, rather than
;calling each function separately. 

(define (runTests)
  (begin
    (display "Running tests...\n")
    ;begin calling test functions
	
    (printf "Testing ins_beg correctly: ~a\n" (test_ins_beg1t))
    (printf "Testing ins_beg correctly: ~a\n" (test_ins_beg2t))	
    (printf "Testing ins_beg incorrectly: ~a\n" (test_ins_beg1f))
    (printf "Testing ins_beg incorrectly: ~a\n" (test_ins_beg2f))
    (printf "Testing ins_end correctly: ~a\n" (test_ins_end1t))
    (printf "Testing ins_end correctly: ~a\n" (test_ins_end2t))
    (printf "Testing ins_end incorrectly: ~a\n" (test_ins_end1f))
    (printf "Testing ins_end incorrectly: ~a\n" (test_ins_end2f))
    (printf "Testing cout_top_level correctly: ~a\n" (test_cout_top_levelt))
    (printf "Testing cout_top_level incorrectly: ~a\n" (test_cout_top_levelf))
    (printf "Testing count_instances correctly: ~a\n" (test_count_instancest))
    (printf "Testing count_instances incorrectly: ~a\n" (test_count_instancesf))
    (printf "Testing count_instances_tr correctly: ~a\n" (test_count_instances_trt))
    (printf "Testing count_instances_tr incorrectly: ~a\n" (test_count_instances_trf))
    (printf "Testing count_instances_deep correctly: ~a\n" (test_count_instances_deept))
    (printf "Testing count_instances_deep incorrectly: ~a\n" (test_count_instances_deepf))
	
	
    ;end calling test functions
    (display "\nTests complete!\n")))

;Begin test functions
  ;ins_beg true
(define (test_ins_beg1t)
  (equal? (ins_beg 'a '(b c d)) '(a b c d)))
  
(define (test_ins_beg2t)
  (equal? (ins_beg '(a b) '(b c d)) '((a b) b c d)))
  
  ;ins_beg false
(define (test_ins_beg1f)
  (equal? (ins_beg 'f '(b c d)) '(a b c d)))
  
(define (test_ins_beg2f)
  (equal? (ins_beg '(f b) '(b c d)) '((a b) b c d)))

  ;ins_end true
(define (test_ins_end1t)
  (equal? (ins_end 'a '(b c d)) '(b c d a)))
  
(define (test_ins_end2t)
  (equal? (ins_end '(a b) '(b c d)) '(b c d (a b))))

  ;ins_end false
(define (test_ins_end1f)
  (equal? (ins_end 'f '(b c d)) '(b c d a)))
  
(define (test_ins_end2f)
  (equal? (ins_end '(f b) '(b c d)) '(b c d (a b))))

  ;cout_top_level true
(define (test_cout_top_levelt)
  (equal? (cout_top_level '(a b c d)) 4))

  ;cout_top_level false
(define (test_cout_top_levelf)
  (equal? (cout_top_level '(a b c d)) 6))

  ;count_instances true
(define (test_count_instancest)
  (equal? (count_instances 'z '(p i z z a)) 2))

  ;count_instances false
(define (test_count_instancesf)
  (equal? (count_instances 'z '(p i z z a)) 4))
  
  ;count_instances_tr true
(define (test_count_instances_trt)
  (equal? (count_instances_tr 'z '(p i z z a) 0) 2))

  ;count_instances_tr false
(define (test_count_instances_trf)
  (equal? (count_instances_tr 'z '(p i z z a) 0) 4))
  
  ;count_instances_deep true
(define (test_count_instances_deept)
  (equal? (count_instances_deep 'd '((a n d r o i d s) (d o n t) (d r e a m))) 4))

  ;count_instances_deep false
(define (test_count_instances_deepf)
  (equal? (count_instances_deep 'd '((a n d r o i d s) (d o n t) (d r e a m))) 2))
  
;End test functions

;Run the tests
(runTests)