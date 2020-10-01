(define w 0.28)
(define z 0.28)
(define hy 0.653)
(define hx 0.28)
(define n 3)
(define gap1 0)
(define gap2 0)
(define w0 470)


(do ((i 0 (+ i 1)))  ;int step
    ((> i n))  ;stop

(set! hx (+ (/ (* i (- 0.5917 0.671)) n) 0.671))
(set! hy (+ (/ (* i (- 0.6291 0.511)) n) 0.511))
(set! w (+ (/ (* i (- (/ (* w0 0.5029) 220) (/ (* w0 0.59) 220))) n) 1.261))
(set! z (+ (/ (* i (- 0.5029 0.59)) n) 0.59))

(set! num-bands 2)

(set! geometry-lattice (make lattice (size 1 9 9) ))
(set! geometry (list (make block (center 0 0 0) 
                                  (size 1 w z)
                                  (material (make dielectric (epsilon 12)))) ))
(set! geometry (append geometry 
                      (list (make ellipsoid (center 0 0 0) (material air)
                           (size hx hy 30))
                                  
)))
(set! k-points (list (vector3 0.4 0 0)          ; Gamma
                     (vector3 0.5 0 0)        ; M
                     ))        ; Gamma

;(set! k-points (interpolate 12 k-points))
(set! resolution 32)
(set! mesh-size 7) ; increase from default value of 3

(run-te)


(print "gap: " (retrieve-gap 1) "\n")
(set! gap1 (list-ref (list-ref gap-list 0) 1))
(set! gap2 (list-ref (list-ref gap-list 0) 2))
(set! gap1 (/ (/ 220 z) gap1)) 
(set! gap2 (/ (/ 220 z) gap2)) 
(print "gap-1: " gap1 "\n")
(print "gap-2: " gap2 "\n")
(print  "\n\n")
)     ;循环



