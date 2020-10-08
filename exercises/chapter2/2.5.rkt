#lang sicp
(#%require rackunit)

(define (pow a n)
  (if (= n 0)
      1
      (* a (pow a (- n 1)))))

(define (cons a b)
  (* (pow 2 a)
     (pow 3 b)))

(define (car z)
  (define (iter z a)
    (if (= (remainder z 2) 0)
        (iter (/ z 2) (+ a 1))
        a))
  (iter z 0))

(define (cdr z)
  (define (iter z b)
    (if (= (remainder z 3) 0)
        (iter (/ z 3) (+ b 1))
        b))
  (iter z 0))

(define z (cons 5 15))

(check-equal? (car z) 5)
(check-equal? (cdr z) 15)
 
