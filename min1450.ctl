(define bandg1 1450)

(define-param z 0.28)
(define-param hy 0.653)
(define-param hx 0.28)


(define gap1 0)
(define gap2 0)


(define (first-te-gap z hx hy)
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
(print "gap: " (retrieve-gap 1) "\n")
(set! gap1 (list-ref (list-ref gap-list 0) 1))
(set! gap2 (list-ref (list-ref gap-list 0) 2))
(set! gap1 (/ (/ 220 z) gap1)) 
(set! gap2 (/ (/ 220 z) gap2)) 
(abs (- gap1 bandg1))
)

(set! num-bands 2)
(set! mesh-size 7) ; increase from default value of 3
(define result (minimize first-te-gap 10 0.59 0.671 0.511))
(print "z hx hy at minimum: " (max-arg result) "\n")
(print "value of minimum: " (max-val result) "\n")
