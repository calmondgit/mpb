(set! num-bands 2)
(define gap1 0)
(define gap2 0)
(define z 0.6457)
(define hx 0.7128)
(define hy 0.5322)
(set! geometry-lattice (make lattice (size 1 9 9) ))
(set! geometry (list (make block (center 0 0 0) 
                                  (size 1 (* z 2.27) z)
                                  (material (make dielectric (epsilon 12)))) ))
(set! geometry (append geometry 
                      (list   (make ellipsoid (center 0 0 0) (material air)
		      (size hx hy 30))
)))
(set! k-points (list (vector3 0 0 0)          ; Gamma
                     (vector3 0.5 0 0)        ; M
                     ))        ; Gamma

(set! k-points (interpolate 32 k-points))
(set! resolution 32)
(run-te)
(print "gap: " (retrieve-gap 1) "\n")
(set! gap1 (list-ref (list-ref gap-list 0) 1))
(set! gap2 (list-ref (list-ref gap-list 0) 2))
(set! gap1 (/ (/ 220 z) gap1)) 
(set! gap2 (/ (/ 220 z) gap2)) 
(print "gap1: " gap1 "\n")
(print "gap2: " gap2 "\n")
