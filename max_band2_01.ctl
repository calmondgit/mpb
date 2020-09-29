
(define z 0.5748)
(define hx 0.1355)
(define hy 0.9789)
(define w 1.7)
(define b1 1)
(define k1 0)
(define b2 0)
(define k2 0)
(define lamtoneff 0)

(define (lamtoneff z hx hy w)
(set! geometry-lattice (make lattice (size 1 9 9) ))
(set! geometry (list (make block (center 0 0 0) 
                                  (size 1 w z)
                                  (material (make dielectric (epsilon 12)))) ))
(set! geometry (append geometry 
                      (list   (make ellipsoid (center 0 0 0) (material air)
		      (size hx hy 30))
)))
(set! k-points (list (vector3 0.3 0 0)          ; Gamma
                     (vector3 0.5 0 0)        ; M
                     ))        ; Gamma

(set! k-points (interpolate 3 k-points))

(set! resolution 32)
(run-te)
(print "band-range-data " band-range-data "\n")
;find band2 range point
(set! b1 (car (car (list-ref band-range-data 1))))
(set! k1 (vector-ref (cdr (car (list-ref band-range-data 1))) 0)  )  
(set! b2 (car (cdr (list-ref band-range-data 1))))
(set! k2 (vector-ref (cdr (cdr (list-ref band-range-data 1))) 0)  )
;[ list of ((min .  kpoint) . (max . kpoint)) ]
(set! lamtoneff (/ (- b2 b1) (- (* b2 k1) (* b1 k2))))
(print "lamtoneff: " lamtoneff "\n")
(/ (- b2 b1) (- (* b2 k1) (* b1 k2)))
;caculate lamda/neff 
)

(set! num-bands 2)
(set! mesh-size 7) ; increase from default value of 3
(define result (maximize-multiple lamtoneff 0.1 0.5748 0.1355 0.9789 1.3))
(print "z hx hy w at max: " (max-arg result) "\n")
(print "value of max lamdtoneff: " (max-val result) "\n")
