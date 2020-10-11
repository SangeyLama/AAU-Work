#lang racket

(define (send message obj . par)
  (let ((method (obj message)))
    (apply method par)))

(define (point x y)
  (let ((x x)
        (y y)
        )

    (define (getx) x)

    (define (gety) y)

    (define (add p)
      (point
       (+ x (send 'getx p))
       (+ y (send 'gety p))))
    
    (define (move)  ;; Move function
      (lambda (dx dy)
        (point
         (+ x dx)
         (+ y dy))))

    (define (move!)
      (lambda(dx dy)
        (set! x (+ x dx))
        (set! y (+ y dy))))

    (define (type-of) 'point)

    (define (self message)
      (cond ((eqv? message 'getx) getx)
            ((eqv? message 'gety) gety)
            ((eqv? message 'add) add)
            ((eqv? message 'move) move)
            ((eqv? message 'move!) move!)
            ((eqv? message 'type-of) type-of)
            (else (error "Message not understood" message))))
    self))

(define (rectangle upper-left-corner-point lower-right-corner-point)
  (letrec ((move
            (lambda (dx dy)
              (rectangle
               (send 'move upper-left-corner-point dx dy)
               (send 'move lower-right-corner-point dx dy))))
           (area
            (lambda ()
              (let ((width (- (send 'getx lower-right-corner-point)
                              (send 'getx upper-left-corner-point)))
                    (height (- (send 'gety lower-right-corner-point)
                               (send 'gety upper-left-corner-point))))
                (abs (* width height)))))
           (info (lambda ()
                   (list (send 'getx upper-left-corner-point)
                         (send 'gety upper-left-corner-point)
                         (send 'getx lower-right-corner-point)
                         (send 'gety lower-right-corner-point))))
           )
    (lambda (message)
      (cond ((eq? message 'move) move)
            ((eq? message 'area) area)
            ((eq? message 'info) info)
            (else (error "Message not understood"))))))