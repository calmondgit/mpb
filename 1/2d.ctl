(set! geometry-lattice (make lattice (size 1 9 9) ))
(set! geometry (list (make block (center 0 0 0) 
                                  (size (* 1 0.76) 1.05 0.51)
                                  (material (make dielectric (epsilon 12)))) ))
(set! geometry (append geometry 
                      (list (make block (center 0 0.23 0) 
                                  (size (* 0.64 0.76) 0.09 0.51)
                                      (material air)) 
                                  (make block (center 0 (* 0.23 -1) 0) 
                                  (size (* 0.64 0.76) 0.09 0.51)
                                      (material air))
                                  (make block (center 0 0 0) 
                                  (size (* 0.64 0.76) 0.09 0.51)
                                      (material air)) 
)))
(set! k-points (list (vector3 0.4 0 0)          ; Gamma
                     (vector3 0.5 0 0)        ; M
                     ))        ; Gamma
(set! resolution 32)
(set! num-bands 2)
(run-te)

