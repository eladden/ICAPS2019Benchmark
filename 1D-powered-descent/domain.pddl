(define (domain powland)
(:requirements :typing :durative-actions :fluents :time :negative-preconditions :duration-inequalities )
(:predicates (landed) (falling) (thrusting))
(:functions (M) (q) (d) (g) (v) (M_min) (ISP) (d_final) (v_margin) (d_margin))

(:durative-action falling
:parameters ()
:duration (<= ?duration 100)
:condition (and
                (at start (not (falling)))
                (over all (<= (d) (d_final)))
                (over all (>= (d) 0))
                (at end (<= (v) (v_margin)))
                (at end (>= (d) (- (d_final) (d_margin))))
                (at end (not (thrusting)))
            )
:effect (and
                (at start (falling))
                (increase (d) (* #t (v)))
                (increase (v) (* #t (g)))
                (at end (not (falling)))
                (at end (landed))
        )

)

(:durative-action thrust
:parameters ()
:duration (<= ?duration 50)
:condition (and (at start (falling))
                (over all (<= (d) (d_final)))
                (over all (>= (M) (M_min)))

           )
:effect (and
             (at start (thrusting))
             (decrease (v) (* #t (* (* (ISP) (g)) (/ (q) (M)))))
             (decrease (M) (* #t (q)))
             (at end (not (thrusting)))
        )
)


)
