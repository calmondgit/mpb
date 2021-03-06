(set! num-bands 2)

(define z (/ 220 437.5))
(define hx (/ 259 437.5))
(define hy (/ 275.2 437.5))
(define w (/ 470 437.5))
(set! geometry-lattice (make lattice (size 1 9 9) ))
(set! geometry (list (make block (center 0 0 0) 
                                  (size 1 w z)
                                  (material (make dielectric (epsilon 12)))) ))
(set! geometry (append geometry 
                      (list   (make ellipsoid (center 0 0 0) (material air)
		      (size hx hy 30))
)))
(set! k-points (list (vector3 0.0 0 0)          ; Gamma
                     (vector3 0.5 0 0)        ; M
                     ))        ; Gamma

(set! k-points (interpolate 31 k-points))

(set! resolution 32)
(run-te)
(print "band-range-data " band-range-data "\n")
;find band2 range point
(define b1 (car (car (list-ref band-range-data 1))))
(define k1 (vector-ref (cdr (car (list-ref band-range-data 1))) 0)  )  
(define b2 (car (cdr (list-ref band-range-data 1))))
(define k2 (vector-ref (cdr (cdr (list-ref band-range-data 1))) 0)  )
;[ list of ((min .  kpoint) . (max . kpoint)) ]
(define lamtoneff (/ (- b2 b1)  (- (* b2 k1) (* b1 k2)  ) )
)
;caculate lamda/neff 
(print "lamtoneff: " lamtoneff "\n")

