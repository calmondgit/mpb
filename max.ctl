(define bandg 1450)



(define (first-te-gap r)
(set! geometry-lattice (make lattice (size 1 9 9) ))
(set! geometry (list (make block (center 0 0 0) 
                                  (size 1 (* z 2.27) z)
                                  (material (make dielectric (epsilon 12)))) ))
(set! geometry (append geometry 
                      (list   (make ellipsoid (center 0 0 0) (material air)
		      (size hx hy 30))
)))
(set! k-points (list (vector3 0.4 0 0)          ; Gamma
                     (vector3 0.5 0 0)        ; M
                     ))        ; Gamma
(set! resolution 32)
(run-te)
(retrieve-gap 1)

(abs (- band bandg))
)

(set! num-bands 2)
(set! mesh-size 7) ; increase from default value of 3
(define result (manimize first-te-gap 0.1 0.6 1.5))
(print "radius at maximum: " (max-arg result) "\n")
(print "gap size at maximum: " (max-val result) "\n")
