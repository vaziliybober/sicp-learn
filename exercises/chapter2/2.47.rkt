 #lang sicp
(#%require rackunit)

(define (make-frame1 origin edge1 edge2)
  (list origin edge1 edge2))

(define (origin-frame1 frame)
  (car frame))

(define (edge1-frame1 frame)
  (cadr frame))

(define (edge2-frame1 frame)
  (caddr frame))

(define (make-frame2 origin edge1 edge2)
  (cons origin (cons edge1 edge2)))

(define (origin-frame2 frame)
  (car frame))

(define (edge1-frame2 frame)
  (cadr frame))

(define (edge2-frame2 frame)
  (cddr frame))

(define frame1 (make-frame1 1 2 3))
(check-equal? (origin-frame1 frame1) 1)
(check-equal? (edge1-frame1 frame1) 2)
(check-equal? (edge2-frame1 frame1) 3)

(define frame2 (make-frame2 1 2 3))
(check-equal? (origin-frame2 frame2) 1)
(check-equal? (edge1-frame2 frame2) 2)
(check-equal? (edge2-frame2 frame2) 3)
