#lang racket
;replicate-to-length '(a b c) -> (a b c a b c a b)
; Implemenet using tail recursively

(define (replicate-to-length lst lgt)
  (reverse (replicate lst lst '() 0 lgt))
)

(define (replicate orig-list lst res count lgt)
  (cond ((null? lst) (replicate orig-list orig-list res count  lgt))
        ((< count lgt) (replicate orig-list (cdr lst) (cons (car lst) res) (+ count 1) lgt))
        (else res)
  )
)

(replicate-to-length '(a b c) 8)


(replicate-to-length '(1 2 3 4 5) 10)