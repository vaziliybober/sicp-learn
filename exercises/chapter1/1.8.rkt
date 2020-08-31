 
 #lang sicp
(#%require rackunit)


(define (square x)
  (* x x))


(define (improve guess x)
  (/ (+ (/ x (square guess))
        (* 2 guess))
     3))

(define (good-enough? guess prev-guess)
  (< (abs (/ (abs (- prev-guess guess))
                 guess))
          0.001))

(define (cube-sqrt-iter guess prev-guess x)
  (if (good-enough? guess prev-guess)
          guess
          (cube-sqrt-iter (improve guess x)
                     guess
                     x)))
  



(cube-sqrt-iter 1 2 0.001)
(cube-sqrt-iter 3 1 100)
