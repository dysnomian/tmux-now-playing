#!/bin/sh
#
# Little marquee-text script
# Written by Claudio M. Alessi
#

# Interval between permutation in the current marquee
INTERVAL=.5

# Interval between marquees
PAUSE=3

LENGTH=10
PRINT="echo -ne"

#
# Marquee text from right to the left
#
marquee_left()
{
	string="$*"
	let eidx=${#string}+4

	for i in $(seq 1 $eidx)
	do
		let j=i-1
		strout="$(echo "$string   " |cut -b $i-)"
		[ $j -ne 0 ] && strout="$strout$(echo "$string" |cut -b -$j)"
		echo "$strout\r"
		sleep $INTERVAL
	done
}

#
# The main function
#
main()
{
	# Empty the title on exit
	for SIG in INT TERM
		do trap "echo -ne '' && exit" $SIG
	done

	n=0
	while true
	do
		let "$n"
		n=$?

		marquee_left "$*"
		sleep $PAUSE
	done
}

main "$@"