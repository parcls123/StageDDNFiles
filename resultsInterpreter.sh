for f in $1/*.darshan
do
	darshan-parser $f > $f.out
	echo $f "runtime :"
	cat $f.out | grep 'run time'
	rm $f.out
done
