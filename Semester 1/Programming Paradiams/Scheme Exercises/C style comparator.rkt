#lang racket
; C_Style_Compare(x, y)
; Negative if x < y (-1)
; 0 if x is considered equal to y
; Positive if x is considered larger than y (1)


(define (make-c-style-compare-ft lt)
  (lambda (x y)
    (cond ((lt x y) -1)
          ((lt y x) 1)
          (else 0))))

((make-c-style-compare-ft <) 2 2)
((make-c-style-compare-ft <) 1 2)
((make-c-style-compare-ft <) 3 2)

((make-c-style-compare-ft =) 1 1)

(define (cfn (make-c-style-compare-ft))

((cfn (<) 1 2))

;(define (make-lt-gt-eq c-compare-fn)
