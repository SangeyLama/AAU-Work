#lang racket
(define (method-lookup object selector)
  (cond ((procedure? object)
         (let ((result (object selector)))
           (if (procedure? result)
               result
               (error "Did not find any method")))
         )
        (else
         (error "Inappropriate object in method-lookup: "
                object))))

(define (send message object . args)
  (let ((method (method-lookup object message)))
    (apply method args)))

(define (new-instance class . parameters)
  (apply class parameters))

(define (student student-id name sex ethnicity age)
  (let ((student-id student-id)
        (name name)
        (sex sex)
        (ethnicity ethnicity)
        (age age)
        )
    (define (getstudent-id) student-id)
    (define (getname) name)
    (define (getsex) sex)
    (define (getethnicity) ethnicity)
    (define (getage) age)

    (define (student-info)
      (list (send 'getstudent-id self) (send 'getname self) (send 'getsex self) (send 'getethnicity self) (send 'getage self)))

    (define (self message)
      (cond ((eqv? message 'getstudent-id) getstudent-id)
            ((eqv? message 'getname) getname)
            ((eqv? message 'getsex) getsex)
            ((eqv? message 'getethnicity) getethnicity)
            ((eqv? message 'getage) getage)
            ((eqv? message 'student-info) student-info)
            (else (error "Message not understood" message))))
    self))

(define students (file->string "students.txt"))
(define student-list (regexp-match* #rx"[*A-Za-z0-9 ]+" students))
(define (parse lst result)
  (cond
  [(null? lst) result]
  [(eqv? (car lst) '()) result]
  [(eqv? " " (car lst)) (parse (cdr lst) result)]
  [else (parse (cdr lst) (cons (car lst) result))]
))



      

