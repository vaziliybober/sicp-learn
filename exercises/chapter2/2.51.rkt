 
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

(define (transform-painter painter origin corner1 corner2)
  (lambda (frame)
    (let ((m (frame-coord-map frame)))
      (let ((new-origin (m origin)))
        (painter (make-frame
                  new-origin
                  (sub-vect (m corner1) new-origin)
                  (sub-vect (m corner2) new-origin)))))))

(define (beside painter1 painter2)
  (lambda (frame)
    (let ((mid-point (make-vect 0.5 0)))
      (let ((new-painter1 (transform-painter painter1
                                             (make-vect 0 0)
                                             mid-point
                                             (make-vect 0 1)))
            (new-painter2 (transform-painter painter2
                                             mid-point
                                             (make-vect 1 0)
                                             (make-vect 0.5 1))))
        (painter1 frame)
        (painter2 frame)))))

(define (rotate90 painter)
  (transform-painter painter
                     (make-vect 1 0)
                     (make-vect 1 1)
                     (make-vect 0 0)))

(define (rotate180 painter)
  (rotate90 (rotate90 painter)))

(define (rotate270 painter)
  (rotate90 (rotate180 painter)))

(define (below painter1 painter2)
  (lambda (frame)
    (let ((mid-point (make-vect 0 0.5)))
      (let ((new-painter1 (transform-painter painter1
                                             (make-vect 0 0)
                                             (make-vect 1 0)
                                             mid-point))
            (new-painter2 (transform-painter painter2
                                             mid-point
                                             (make-vect 1 0.5)
                                             (make-vect 0 1))))
        (painter1 frame)
        (painter2 frame)))))

(define (below2 painter1 painter2)
  (rotate90 (beside (rotate270 painter1)
                    (rotate270 painter2))))



















 
