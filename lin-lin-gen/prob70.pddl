(define (problem run-generator2)
(:domain generator)
(:objects generator - gen tank1 tank2 tank3 tank4 tank5 tank6 tank7 tank8 tank9 tank10
			  tank11 tank12 tank13 tank14 tank15 tank16 tank17 tank18 tank19 tank20
			  tank21 tank22 tank23 tank24 tank25 tank26 tank27 tank28 tank29 tank30
			  tank31 tank32 tank33 tank34 tank35 tank36 tank37 tank38 tank39 tank40
			  tank41 tank42 tank43 tank44 tank45 tank46 tank47 tank48 tank49 tank50
			  tank51 tank52 tank53 tank54 tank55 tank56 tank57 tank58 tank59 tank60
			  tank61 tank62 tank63 tank64 tank65 tank66 tank67 tank68 tank69 tank70 - tank)
;(:objects generator - gen tank1 - tank )
(:init
(= ( gen_fuel_level generator) 300.1)
(= ( capacity generator) 300.01)
(= (last-used generator) 0)
(= ( tank_fuel_level tank1 ) 10.01)
(= (tanknum tank1) 1)
(= ( tank_fuel_level tank2 ) 10.01)
(= (tanknum tank2) 2)
(= ( tank_fuel_level tank3 ) 10.01)
(= (tanknum tank3) 3)
(= ( tank_fuel_level tank4 ) 10.01)
(= (tanknum tank4) 4)
(= ( tank_fuel_level tank5 ) 10.01)
(= (tanknum tank5) 5)
(= ( tank_fuel_level tank6 ) 10.01)
(= (tanknum tank6) 6)
(= ( tank_fuel_level tank7 ) 10.01)
(= (tanknum tank7) 7)
(= ( tank_fuel_level tank8 ) 10.01)
(= (tanknum tank8) 8)
(= ( tank_fuel_level tank9 ) 10.01)
(= (tanknum tank9) 9)
(= ( tank_fuel_level tank10 ) 10.01)
(= (tanknum tank10) 10)
(= ( tank_fuel_level tank11 ) 10.01)
(= (tanknum tank11) 11)
(= ( tank_fuel_level tank12 ) 10.01)
(= (tanknum tank12) 12)
(= ( tank_fuel_level tank13 ) 10.01)
(= (tanknum tank13) 13)
(= ( tank_fuel_level tank14 ) 10.01)
(= (tanknum tank14) 14)
(= ( tank_fuel_level tank15 ) 10.01)
(= (tanknum tank15) 15)
(= ( tank_fuel_level tank16 ) 10.01)
(= (tanknum tank16) 16)
(= ( tank_fuel_level tank17 ) 10.01)
(= (tanknum tank17) 17)
(= ( tank_fuel_level tank18 ) 10.01)
(= (tanknum tank18) 18)
(= ( tank_fuel_level tank19 ) 10.01)
(= (tanknum tank19) 19)
(= ( tank_fuel_level tank20 ) 10.01)
(= (tanknum tank20) 20)
(= ( tank_fuel_level tank21 ) 10.01)
(= (tanknum tank21) 21)
(= ( tank_fuel_level tank22 ) 10.01)
(= (tanknum tank22) 22)
(= ( tank_fuel_level tank23 ) 10.01)
(= (tanknum tank23) 23)
(= ( tank_fuel_level tank24 ) 10.01)
(= (tanknum tank24) 24)
(= ( tank_fuel_level tank25 ) 10.01)
(= (tanknum tank25) 25)
(= ( tank_fuel_level tank26 ) 10.01)
(= (tanknum tank26) 26)
(= ( tank_fuel_level tank27 ) 10.01)
(= (tanknum tank27) 27)
(= ( tank_fuel_level tank28 ) 10.01)
(= (tanknum tank28) 28)
(= ( tank_fuel_level tank29 ) 10.01)
(= (tanknum tank29) 29)
(= ( tank_fuel_level tank30 ) 10.01)
(= (tanknum tank30) 30)
(= ( tank_fuel_level tank31 ) 10.01)
(= (tanknum tank31) 31)
(= ( tank_fuel_level tank32 ) 10.01)
(= (tanknum tank32) 32)
(= ( tank_fuel_level tank33 ) 10.01)
(= (tanknum tank33) 33)
(= ( tank_fuel_level tank34 ) 10.01)
(= (tanknum tank34) 34)
(= ( tank_fuel_level tank35 ) 10.01)
(= (tanknum tank35) 35)
(= ( tank_fuel_level tank36 ) 10.01)
(= (tanknum tank36) 36)
(= ( tank_fuel_level tank37 ) 10.01)
(= (tanknum tank37) 37)
(= ( tank_fuel_level tank38 ) 10.01)
(= (tanknum tank38) 38)
(= ( tank_fuel_level tank39 ) 10.01)
(= (tanknum tank39) 39)
(= ( tank_fuel_level tank40 ) 10.01)
(= (tanknum tank40) 40)
(= ( tank_fuel_level tank41 ) 10.01)
(= (tanknum tank41) 41)
(= ( tank_fuel_level tank42 ) 10.01)
(= (tanknum tank42) 42)
(= ( tank_fuel_level tank43 ) 10.01)
(= (tanknum tank43) 43)
(= ( tank_fuel_level tank44 ) 10.01)
(= (tanknum tank44) 44)
(= ( tank_fuel_level tank45 ) 10.01)
(= (tanknum tank45) 45)
(= ( tank_fuel_level tank46 ) 10.01)
(= (tanknum tank46) 46)
(= ( tank_fuel_level tank47 ) 10.01)
(= (tanknum tank47) 47)
(= ( tank_fuel_level tank48 ) 10.01)
(= (tanknum tank48) 48)
(= ( tank_fuel_level tank49 ) 10.01)
(= (tanknum tank49) 49)
(= ( tank_fuel_level tank50 ) 10.01)
(= (tanknum tank50) 50)
(= ( tank_fuel_level tank51 ) 10.01)
(= (tanknum tank51) 51)
(= ( tank_fuel_level tank52 ) 10.01)
(= (tanknum tank52) 52)
(= ( tank_fuel_level tank53 ) 10.01)
(= (tanknum tank53) 53)
(= ( tank_fuel_level tank54 ) 10.01)
(= (tanknum tank54) 54)
(= ( tank_fuel_level tank55 ) 10.01)
(= (tanknum tank55) 55)
(= ( tank_fuel_level tank56 ) 10.01)
(= (tanknum tank56) 56)
(= ( tank_fuel_level tank57 ) 10.01)
(= (tanknum tank57) 57)
(= ( tank_fuel_level tank58 ) 10.01)
(= (tanknum tank58) 58)
(= ( tank_fuel_level tank59 ) 10.01)
(= (tanknum tank59) 59)
(= ( tank_fuel_level tank60 ) 10.01)
(= (tanknum tank60) 60)
(= ( tank_fuel_level tank61 ) 10.01)
(= (tanknum tank61) 61)
(= ( tank_fuel_level tank62 ) 10.01)
(= (tanknum tank62) 62)
(= ( tank_fuel_level tank63 ) 10.01)
(= (tanknum tank63) 63)
(= ( tank_fuel_level tank64 ) 10.01)
(= (tanknum tank64) 64)
(= ( tank_fuel_level tank65 ) 10.01)
(= (tanknum tank65) 65)
(= ( tank_fuel_level tank66 ) 10.01)
(= (tanknum tank66) 66)
(= ( tank_fuel_level tank67 ) 10.01)
(= (tanknum tank67) 67)
(= ( tank_fuel_level tank68 ) 10.01)
(= (tanknum tank68) 68)
(= ( tank_fuel_level tank69 ) 10.01)
(= (tanknum tank69) 69)
(= ( tank_fuel_level tank70 ) 10.01)
(= (tanknum tank70) 70)

)
(:goal (generator_ran generator))
;(:metric minimize ( total-time ))
)