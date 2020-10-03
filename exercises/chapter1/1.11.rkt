#lang sicp
(#%require rackunit)

(define (f-rec n)
  (if (< n 3)
      n
      (+ (f-rec (- n 1))
         (* 2
            (f-rec (- n 2)))
         (* 3
            (f-rec (- n 3))))))

(define (f-iter n)
  (define (iter a b c count)
    (if (= count 0)
        c
        (iter (+ a
                 (* 2 b)
                 (* 3 c))
              a
              b
              (- count 1))))
  (iter 2 1 0 n))

(check-equal? (f-rec 2) 2)

(f-rec 6)
(f-iter 6)