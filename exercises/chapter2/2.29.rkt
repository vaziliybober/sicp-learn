#lang sicp
(#%require rackunit)

(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (car (cdr mobile)))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (car (cdr branch)))

(define (total-weight mobile)
  (if (not (pair? mobile))
      mobile
      (let ((l-struct (branch-structure (left-branch mobile)))
            (r-struct (branch-structure (right-branch mobile))))
        (+ (total-weight l-struct)
           (total-weight r-struct)))))

(define (balanced? mobile)
  (if (not (pair? mobile))
      #t
      (let ((l-branch (left-branch mobile))
            (r-branch (right-branch mobile)))
        (let ((l-struct (branch-structure l-branch))
              (r-struct (branch-structure r-branch))
              (l-length (branch-length l-branch))
              (r-length (branch-length r-branch)))
          (and (= (* (total-weight l-struct)
                     l-length)
                  (* (total-weight r-struct)
                     r-length))
               (balanced? l-struct)
               (balanced? r-struct))))))


(define l0 (make-branch 9 2))
(define r0 (make-branch 6 3))
(define m0 (make-branch l0 r0))
(define l (make-branch 5 2))
(define r (make-branch 6 m0))
(define m (make-mobile l r))

(check-equal? (total-weight m) 7)
(check-equal? (balanced? m) #f)
(check-equal? (balanced? m0) #t)
