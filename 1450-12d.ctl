(set! num-bands 2)
(define gap1 0)
(define gap2 0)
(define z 0.261869)
(define hx -0.117999)
(define hy 1.6102774)
(define w 1.553290)
(set! geometry-lattice (make lattice (size 1 9 no-size) ))
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

;(set! k-points (interpolate 32 k-points))
(set! resolution 32)
(run-te)

