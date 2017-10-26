#lang racket

[define (ins_beg num list)
  (append (cons num empty) list)
]

[define (ins_end num list)
  (append list (cons num empty))
]

[define (cout_top_level list)
  (cond [(empty? list) 0]
        [else (+ 1 (cout_top_level (cdr list)))])
]

[define (count_instances num list)
  (cond
    [(empty? list) 0]
    [(equal? num (car list)) (+ 1 (count_instances num (cdr list)))]
    [else (count_instances num (cdr list))])
]

[define (count_instances_tr num list total)
  (cond
    [(empty? list) total]
    [(equal? num (car list)) (count_instances_tr num (cdr list) (+ 1 total))]
    [else (count_instances_tr num (cdr list) total)])
]

[define (count_instances_deep num list)
  (cond
    [(empty? list) 0]
    [(equal? num (car list)) (+ 1 (count_instances num (cdr list)))]
    [(list? (car list)) (+ (count_instances_deep num (car list)) (count_instances_deep num (cdr list)))]
    [else (count_instances num (cdr list))])
]

(printf "Q2 A.(a): ~a\n" (ins_beg 'a '(b c d)))
(printf "Q2 A.(b): ~a\n" (ins_beg '(a b) '(b c d)))
(printf "Q2 B.(a): ~a\n" (ins_end 'a '(b c d)))
(printf "Q2 B.(b): ~a\n" (ins_end '(a b) '(b c d)))
(printf "Q2 C.: ans(4)=~a\n" (cout_top_level '(a b c d)))
(printf "Q2 D.: ans(2)=~a\n" (count_instances 'z '(p i z z a)))
(printf "Q2 E.: ans(2)=~a\n" (count_instances_tr 'z '(p i z z a) 0))
(printf "Q2 F.: ans(4)=~a\n" (count_instances_deep 'd '((a n d r o i d s) (d o n t) (d r e a m))))
