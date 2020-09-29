(set! num-bands 2)
(define w 1.0744) 
(define z 0.3029)
(set! geometry-lattice (make lattice (size 1 9 9) ))
(set! geometry (list (make block (center 0 0 0) 
                                  (size 1 w z)
                                  (material (make dielectric (epsilon 12)))) ))
(set! geometry (append geometry 
                      (list (make ellipsoid (center 0 0 0) (material air)
		      (size 0.5917 0.6291 30))
                                  
)))
(set! k-points (list (vector3 0 0 0)          ; Gamma
                     (vector3 0.5 0 0)        ; M
                     ))        ; Gamma

(set! k-points (interpolate 32 k-points))
(set! resolution 32)
(run-te)
(retrieve-gap 1)
