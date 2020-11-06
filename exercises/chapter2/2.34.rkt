 #lang sicp
(#%require rackunit) 

(define (accumulate op init sequence)
  (if (null? sequence)
      init
      (op (car sequence)
          (accumulate op init (cdr sequence)))))

(define (horner-eval x coefficient-sequence)
  (accumulate (lambda (this-coeff higher-terms)
                (+ (* higher-terms x)
                   this-coeff))
              0
              coefficient-sequence))

(check-equal? (horner-eval 2 (list 1 3 0 5 0 1)) 79)