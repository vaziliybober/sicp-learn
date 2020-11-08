 
 #lang sicp
(#%require rackunit)

(define (accumulate op init sequence)
  (if (null? sequence)
      init
      (op (car sequence)
          (accumulate op init (cdr sequence)))))

(define fold-right accumulate)

(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))

(check-equal? (fold-right / 1 (list 1 2 3)) (/ 3 2))

(check-equal? (fold-left / 1 (list 1 2 3)) (/ 1 6))

(check-equal? (fold-right list nil (list 1 2 3)) (list 1 (list 2 (list 3 (list)))))

(check-equal? (fold-left list nil (list 1 2 3)) (list (list (list (list) 1) 2) 3))

; assossiativeness