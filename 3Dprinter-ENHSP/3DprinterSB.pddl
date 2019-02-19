;; Domain for Generator, This is a version that adheres to the OPTIC++ testbed. This is the non-lineaer tank, linear generator version.
;; The base domain for this was the ENHSP testbed, and the differences can be found in the comments
(define
    (domain generator_linear_mt)
;(:requirements :fluents :durative-actions :typing :negative-preconditions :duration-inequalities)    
(:types     generator
            tank )

(:predicates
        (generating ?g - generator) ;; captures whether the generator is online. Used to trigger the process
        (generator_ran ?g - generator) ;; captures the end of the generation. Used in the goal
        (refueling ?t -tank) ;; captures whether a tank is being used. Trigger the refueling process
)


(:functions
            (gen_fuel_level ?g - generator) ;; level of the fuel in the tank
            (capacity ?g - generator) ;; max capacity of the generator
            (generator_running ?g -generator) ;; timer for the generator
            (refuel_running ?g -generator ?t -tank) ;; timer for the refueling action
            (generator_duration) ;; constant that defines duration of the generator
            (refuel_duration)    ;; constant that defines duration of the refueling
            (tank_fuel_level ?t - tank) ;; tank fuel level (tanks are not infinite!)
            (tank_fuel_rate ?t - tank) ;; constant that defines the consumption rate of the tanks fuel
            (tank_feul_rate_start ?t - tank)
            (gen_fuel_rate  ?g - gen)  ;; constant that defines the consumption rate of the generators fuel
            (last-used ?g - gen) ;;the number of tank last used - for symmetry breaking
            (tanknum ?t - tank) ;; the number of tank being used - for symmetry breaking
)


;; generate generator
;---------------------

;; the following constraints replace the over all and durative constraints in the durative action
(:constraint min_generator_fuel
    :parameters (?g - generator)
    :condition (>= (gen_fuel_level ?g) 0.0)
)


(:constraint generator_duration
    :parameters (?g - generator)
    :condition (<= (generator_running ?g) (generator_duration))
)

; snap start action
(:action start_generating
    :parameters (?g - generator)
    :precondition (and (not (generating ?g)) (< (generator_running ?g) (generator_duration)))
    :effect (and (generating ?g)
                 (assign (generator_fuel_rate ?g) 0.0)
                 (assign (generator_running ?g) 0.0 )
                 (assign (last-used ?g) 0.0 )
            )
)

;durative effect
(:process generate_power
    :parameters (?g - generator)
    :precondition (and (generating ?g) (> (gen_fuel_level ?g) 0.0))
    :effect (and
                    (increase (gen_fuel_rate ?g) (* #t 0.002))
                    (decrease (gen_fuel_level ?g) (* #t gen_fuel_rate))
                    (increase (generator_running ?g) (* #t 1.0))
            )
)

;snap stop action
(:action stop_generating
    :parameters(?g - generator)
    :precondition (and (generating ?g) (= (generator_running ?g) (generator_duration)))
    :effect (and    (not (generating ?g))
                    (generator_ran ?g))
)


;;refuel using tank
;;-----------------

;constraints
(:constraint refuel_duration
    :parameters (?g - generator ?t -tank)
    :condition (<= (refuel_running ?g ?t) (refuel_duration))
)

(:constraint min_tank_fuel
    :parameters (?t - tank)
    :condition (> (tank_fuel_level ?t) 0.0)
)


(:constraint max_generator_fuel
    :parameters (?g - generator)
    :condition (<=  (gen_fuel_level ?g) (capacity ?g))
)


;start action
(:action start_refueling
    :parameters (?g - generator ?t - tank)
    :precondition (and  (= (last-used ?g) (- (tanknum ?t) 1) )
                           (not (refueling ?t ) )
                           (generating ?g)
                   )
    :effect (and        (assign (refuel_running ?g ?t) 0 )
                        (assign (tank_feul_rate ?t) (tank_feul_rate_start ?t))
                        (refueling ?t)
            )
)

;effect
(:process refuel_generator
    :parameters (?g - generator ?t -tank)
    :precondition (and (refueling ?t) (<= (refuel_running ?g ?t) (refuel_duration)))
    :effect (and
                    (increase (gen_fuel_level ?g) (* #t (tank_feul_rate ?t)) )
                    (decrease (tank_fuel_level ?t) (* #t (tank_feul_rate ?t) ) )
                    (increase (tank_feul_rate ?t) (* #t 0.04))
                    (increase (refuel_running ?g ?t) (* #t 1.0))
            )
)

;stop action
(:action stop_refueling
    :parameters(?g - generator ?t - tank)
    :precondition (and (refueling ?t) (<= (refuel_running ?g ?t) (refuel_duration)))
    :effect (and    (not (refueling ?t))
                    (assign (last-used ?g) (tanknum ?t)))

)

)
