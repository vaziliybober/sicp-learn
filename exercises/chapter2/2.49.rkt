 
 #lang sicp
(#%require rackunit)

(define (make-vect x y)
  (cons x y))

(define (xcor-vect vect)
  (car vect))

(define (ycor-vect vect)
  (cdr vect))

(define (add-vect v1 v2)
  (make-vect (+ (xcor-vect v1) (xcor-vect v2))
             (+ (ycor-vect v1) (ycor-vect v2))))

(define (sub-vect v1 v2)
  (add-vect v1 (make-vect (- 0 (xcor-vect v2))
                          (- 0 (ycor-vect v2)))))

(define (scale-vect v s)
  (make-vect (* s (xcor-vect v))
             (* s (ycor-vect v))))

(define (make-frame origin edge1 edge2)
  (list origin edge1 edge2))

(define (frame-origin frame)
  (car frame))

(define (frame-edge1 frame)
  (cadr frame))

(define (frame-edge2 frame)
  (caddr frame))

(define (draw-line p1 p2)
  nil)

(define (frame-coord-map frame)
  (lambda (v)
    (add-vect
     (frame-origin frame))))

(define (make-segment start-vect end-vect)
  (cons start-vect end-vect))

(define (start-segment segment)
  (car segment))

(define (end-segment segment)
  (cdr segment))

(define (segments->painter segment-list)
  (lambda (frame)
    (for-each
     (lambda (segment)
       (draw-line
        ((frame-coord-map frame)
         (start-segment segment))
        ((frame-coord-map frame)
         (end-segment segment))))
     segment-list)))

;a

(define (painter-outline frame)
  (segments->painter
   (let ((origin (frame-origin frame))
         (edge1 (frame-edge1 frame))
         (edge2 (frame-edge2 frame)))
     (let ((p1 origin)
           (p2 (add-vect origin edge1))
           (p3 (add-vect (add-vect origin edge1) edge2))
           (p4 (add-vect origin edge2)))
       (list (make-segment p1 p2)
             (make-segment p2 p3)
             (make-segment p3 p4)
             (make-segment p4 p1))))))

;b
(define (painter-x frame)
  (segments->painter
   (list (make-segment (make-vect 0 0) (make-vect 1 1))
         (make-segment (make-vect 1 0) (make-vect (0 1))))))

;c, d - vpadlu
  