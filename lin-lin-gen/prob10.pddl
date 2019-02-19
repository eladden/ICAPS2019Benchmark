(define (problem run-generator2)
(:domain generator)
(:objects generator - gen tank1 tank2 tank3 tank4 tank5 tank6 tank7 tank8 tank9 tank10 - tank)
;(:objects generator - gen tank1 - tank )
(:init
(= ( gen_fuel_level generator) 900)
(= ( capacity generator) 900.01)
(= (last-used generator) 0)
(= ( tank_fuel_level tank1 ) 10)
(= (tanknum tank1) 1)
(= ( tank_fuel_level tank2 ) 10)
(= (tanknum tank2) 2)
(= ( tank_fuel_level tank3 ) 10)
(= (tanknum tank3) 3)
(= ( tank_fuel_level tank4 ) 10)
(= (tanknum tank4) 4)
(= ( tank_fuel_level tank5 ) 10)
(= (tanknum tank5) 5)
(= ( tank_fuel_level tank6 ) 10)
(= (tanknum tank6) 6)
(= ( tank_fuel_level tank7 ) 10)
(= (tanknum tank7) 7)
(= ( tank_fuel_level tank8 ) 10)
(= (tanknum tank8) 8)
(= ( tank_fuel_level tank9 ) 10)
(= (tanknum tank9) 9)
(= ( tank_fuel_level tank10 ) 10)
(= (tanknum tank10) 10)
)
(:goal (generator_ran generator))
;(:metric minimize ( total-time ))
)
