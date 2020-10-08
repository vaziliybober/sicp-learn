#lang sicp
(#%require rackunit)

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define (make-segment p1 p2) (cons p1 p2))

(define (start-segment segment) (car segment))
(define (end-segment segment) (cdr segment))

(define (make-point x y) (cons x y))

(define (x-point point) (car point))
(define (y-point point) (cdr point))

(define (midpoint-segment segment)
  (let ((p1 (start-segment segment))
        (p2 (end-segment segment)))
    (let ((x1 (x-point p1))
          (y1 (y-point p1))
          (x2 (x-point p2))
          (y2 (y-point p2)))
      (make-point (/ (+ x1 x2) 2)
                  (/ (+ y1 y2) 2)))))

(define s1 (make-segment (make-point 2 4)
                         (make-point 0 6)))

(check-equal? (midpoint-segment s1) (make-point 1 5))
