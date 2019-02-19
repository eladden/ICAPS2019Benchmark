#!/bin/bash

# This is a script that runs experiments. Place this file in the build folder

#This is the optic command
OPTICcmd="./apond"
#OPTICopt="-v"

#Edit this for the domain you wish to test (do not use ~ for home, use full pathname)
Domains="domain.pddl"
d=$(basename -s .pddl $Domain)

#Edit this for the list of probelm files you wish to test (seperated by a space or an end of line)
Problems="prob_earth01.pddl prob_earth02.pddl prob_earth03.pddl prob_earth04.pddl prob_earth05.pddl prob_earth06.pddl prob_earth07.pddl prob_earth08.pddl prob_earth09.pddl prob_earth10.pddl prob_earth11.pddl prob_earth12.pddl prob_earth13.pddl prob_earth14.pddl prob_earth15.pddl prob_earth16.pddl prob_earth17.pddl prob_earth18.pddl prob_earth19.pddl prob_earth20.pddl" #

#edit this for the number of times you wish to test each problem
nums=10

echo "starting domain loop"
for domain in $Domains 
do

	d=$(basename -s .pddl $domain)

	echo "starting problem loop"
	for problem in $Problems 
	do
		p=$(basename -s .pddl $problem)
		
		echo "$domain $problem"
		( $OPTICcmd $domain $problem >> "apond$d$p" ) & pid=$!
		( sleep 5000 && kill -HUP $pid ) 2>/dev/null & watcher=$!
		if wait $pid 2>/dev/null; then
		    echo "apond finished - continuing the loop"
		    pkill -HUP -P $watcher
		    wait $watcher
		    for (( i=1; i < $nums; i++ ))
		    do
			$OPTICcmd $domain $problem  >> "apond$d$p"
		    done
		else
		    echo "apond timedout "
		    echo "apond timedout " >> "apond$d$p"
		    break
		fi
	done	
done


