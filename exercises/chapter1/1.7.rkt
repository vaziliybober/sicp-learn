 #lang sicp
(#%require rackunit)


(define (square x)
  (* x x))

(define (average x y)
  (/ (+ x y) 2))

(define (improve guess x)
  (average guess (/ x guess)))

(define (good-enough? guess x)
  (< (abs (- (square guess)
             x))
     0.001))


(define (sqrt-iter guess x)
  (if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x)
                     x)))

(sqrt-iter 1 0.000001) ; works wrong
(sqrt-iter 1 10000000) ; works slow

(define (good-enough-alt? guess prev-guess)
  (< (abs (/ (abs (- prev-guess guess))
                 guess))
          0.001))
  

(define (sqrt-iter-alt guess prev-guess x)
  (if (good-enough-alt? guess prev-guess)
          guess
          (sqrt-iter-alt (improve guess x)
                     guess
                     x)))

(sqrt-iter-alt 1 2 0.000001) ;works good
(sqrt-iter-alt 1 2 10000000) ;works good

; yes, it does