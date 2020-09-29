(set! num-bands 2)
(define gap1 0)
(define gap2 0)
(define z 1)
(define hx 0)
(define hy 0.9789)
(set! geometry-lattice (make lattice (size 1 9 9) ))
(set! geometry (list (make block (center 0 0 0) 
                                  (size 1 (* z 2.27) z)
                                  (material (make dielectric (epsilon 12)))) ))

(set! k-points (list (vector3 0 0 0)          ; Gamma
                     (vector3 0.5 0 0)        ; M
                     ))        ; Gamma

(set! k-points (interpolate 31 k-points))
(set! resolution 32)
(run-te)
(print "gap: " (retrieve-gap 1) "\n")

