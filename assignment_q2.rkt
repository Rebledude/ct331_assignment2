#lang racket

(provide ins_beg)
(provide ins_end)
(provide cout_top_level)
(provide count_instances)
(provide count_instances_tr)
(provide count_instances_deep)

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
