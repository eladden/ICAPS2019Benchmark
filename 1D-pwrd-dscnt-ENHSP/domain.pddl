(define (domain powland)
;(:requirements :typing :durative-actions :fluents :time :negative-preconditions :duration-inequalities )
(:predicates (landed) (falling) (thrusting));(not_crashed)
(:functions (M) (q) (d) (g) (v) (M_min) (ISP) (d_final) (v_margin) (d_margin) (fall_t) (thrust_t))

(:constraint falling_duration
    :parameters ()
    :condition (<= (fall_t) 100)
)

(:constraint dont_touch_ground
    :parameters ()
    :condition (<= (d) (d_final) )
)

(:constraint dont_go_up
    :parameters ()
    :condition (>= (d) 0)
)

(:action start_falling
    :parameters ()
    :precondition (not (falling))
    :effect (and
                (falling)
                (assign (fall_t) 0.0)
            )
)

(:process fall_durative_effect
    :parameters ()
    :precondition (falling)
    :effect (and
                (increase (d) (* #t (v)))
                (increase (v) (* #t (g)))
                (increase (fall_t) (* #t 1))
             )
)

(:action land
    :parameters ()
    :precondition (and
                    (falling)
                    (<= (v) (v_margin))
                    (>= (d) (- (d_final) (d_margin)))
                    (not (thrusting))
                    )
    :effect(and
                (not (falling))
                (landed)
            )
)


(:constraint thrust_duration
    :parameters ()
    :condition (<= (thrust_t) 50)
)

(:constraint thrust_overall1
    :parameters ()
    :condition (<= (d) (d_final))
)

(:constraint thrust_overall2
    :parameters ()
    :condition (>= (M) (M_min))
)

(:action start_thrusting
    :parameters ()
    :precondition (falling)
    :effect (and
            (thrusting)
            (assign (thrust_t) 0.0)
        )
)

(:process thrust
    :parameters ()
    :precondition (and (thrusting) (<= (thrust_t) 50))
    :effect (and
                (decrease (v) (* #t (* (* (ISP) (g)) (/ (q) (M)))))
                (decrease (M) (* #t (q)))
                (increase (thrust_t) (* #t 1.0) )
            )
)

(:action stop_thrusting
    :parameters()
    :precondition (thrusting)
    :effect (not (thrusting) )
)

)
