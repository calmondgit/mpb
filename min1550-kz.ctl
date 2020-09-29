(define bandg1 1550)

(define z (/ 220 330))
(define h (/ 0 437.5))
(define r (/ 133 330))
(define w (/ 600 330))

(define gap1 0)
(define gap2 0)


(define (first-te-gap z r w)
(set! geometry-lattice (make lattice (size 1 9 9) ))
(set! geometry (list (make block (center 0 0 0) 
                                  (size 1 w z)
                                  (material (make dielectric (epsilon 12)))) ))
(set! geometry (append geometry 
                      (list   (make cylinder 
                       (center 0 0 h) (radius r) (height z)
                       (material air)))))

(set! k-points (list          ; Gamma
			(vector3 0.48 0 2.0)
                     (vector3 0.48 0 2.0)        ; M
                     ))        ; Gamma
;(vector3 0.36 0 1.5) 
;(set! k-points (interpolate 15 k-points))

(set! resolution 32)
(run)
(print "gap: " (retrieve-gap 1) "\n")
(set! gap1 (list-ref (list-ref gap-list 0) 1))
(set! gap2 (list-ref (list-ref gap-list 0) 2))
(set! gap1 (/ (/ 220 z) gap1)) 
(set! gap2 (/ (/ 220 z) gap2)) 
(abs (- gap1 bandg1))
)

(set! num-bands 2)
(set! mesh-size 7) ; increase from default value of 3
(define result (minimize-multiple first-te-gap 1 0.67 0.7 1.5))
(print "z hx hy at minimum: " (max-arg result) "\n")
(print "value of minimum: " (max-val result) "\n")
