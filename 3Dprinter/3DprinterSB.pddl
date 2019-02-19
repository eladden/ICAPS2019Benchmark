(define (domain generator2 )
(:requirements :fluents :durative-actions :typing :negative-preconditions :duration-inequalities)
(:types gen tank )
(:predicates ( refueling ?g - gen ?t - tank) ( generator_ran ?g - gen ) (generating ?g - gen) )
(:functions ( tank_fuel_level ?t - tank )
            ( gen_fuel_level ?g - gen )
	    ( gen_fuel_rate ?g - gen )
            ( tank_feul_rate ?t - tank)
            ( tank_feul_rate_start ?t - tank)
            ( capacity ?g - gen )
            (last-used ?g - gen)
            (tanknum ?t - tank)
)


(:durative-action generate
 :parameters (? g - gen )
 :duration (= ?duration 1000)
 :condition (and (over all (>= ( gen_fuel_level ?g) 0) )
                 (at start (not (generating ?g)))
            )

 :effect (and   (at start (generating ?g))
		(at start (assign (gen_fuel_rate ?g) 0))
                (at end (not (generating ?g)))
		(decrease (gen_fuel_level ?g) (* #t (gen_fuel_rate ?g)))
                (increase (gen_fuel_rate ?g) (* #t 0.002))
                (at end ( generator_ran ?g)) )
)

(:durative-action refuel
 :parameters (? g - gen ?t - tank )
 :duration (<= ?duration 100)


 :condition (and (at start (= (last-used ?g) (- (tanknum ?t) 1) ))
                 (at start (not (refueling ?g ?t )) )
                 (over all (<= ( gen_fuel_level ?g) (capacity ?g)))
                 (over all (>= ( tank_fuel_level ?t) 0 ))
                 (at end (not ( generator_ran ?g)) )
                 (at start (generating ?g))
                 )
		
 :effect (and
             (at start (refueling ?g ?t) )
             (at start (assign (tank_feul_rate ?t) (tank_feul_rate_start ?t)))
             (increase (tank_feul_rate ?t) (* #t 0.04))
             (increase (gen_fuel_level ?g)  (* #t (tank_feul_rate ?t) ) )
             (decrease (tank_fuel_level ?t) (* #t (tank_feul_rate ?t) ) )
             (at end (not (refueling ?g ?t)) )
             (at end (assign (last-used ?g) (tanknum ?t)))
             )
)

)
