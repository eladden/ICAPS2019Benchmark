(define (problem run-generator2)
(:domain generator_linear_mt)
(:objects gen1 - generator tank1 tank2 tank3 - tank)
(:init
    (= (generator_duration) 1000.0)
    (= (refuel_duration) 100.0)
    (= (gen_fuel_level gen1) 701.0)
    (= ( capacity gen1) 701.0)
    (= (generator_running gen1) 0.0)
    (= (last-used gen1) 0.0)

    (= (refuel_running gen1 tank1) 0.0)
    (= (tank_fuel_level tank1 ) 100.0)
    (= (tank_fuel_rate tank1 ) 0.0)
    (= (tanknum tank1) 1.0)
    (= (tank_feul_rate_start tank1) 0.0)
    
    (= (refuel_running gen1 tank2) 0.0)
    (= (tank_fuel_level tank2 ) 100.0)
    (= (tank_fuel_rate tank2 ) 0.0)
    (= (tanknum tank2) 2.0)
    (= (tank_feul_rate_start tank2) 0.0)

    (= (refuel_running gen1 tank3) 0.0)
    (= (tank_fuel_level tank3 ) 100.0)
    (= (tank_fuel_rate tank3 ) 0.0)
    (= (tanknum tank3) 3.0)
    (= (tank_feul_rate_start tank3) 0.0)
    
)
(:goal (generator_ran gen1))
;(:goal (= (generator_running gen1) (generator_duration)))
;(:metric minimize ( total-time ))
)
