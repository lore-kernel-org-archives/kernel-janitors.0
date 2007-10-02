From: Roel Kluin <12o3l@tiscali.nl>
Date: Tue, 02 Oct 2007 00:04:18 +0000
Subject: bash script to parse DPRINTKs etc.
Message-Id: <47018B02.5000906@tiscali.nl>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

I wrote this bash script to change DPRINTK and other non-standard debugging to a form that can be added as a menu option.
it does not add the kconfig options, I'm not sure how to put that in this script. It appends to a file ../kcs what Kconfig file it thinks that should be edited, and the CONFIG_*_DEBUG option to add there, and the source file in which changes were made.
---
query="^[ \t]*#[ \t]*define[ \t]*[A-Za-z0-9_]*([ \t]*\([A-Za-z0-9_]*\)[\.]*[ \t]*)[ \t]*printk([ \t]*\1[ \t]*)[ \t]*$"


m0[0]="^[ \t]*#[ \t]*if[ \t]0[ \t]*$"
m0[1]="^[ \t]*#[ \t]*ifdef[ \t]*[a-zA-Z0-9_]*[ \t]*$"
m0[2]="^[ \t]*#[ \t]*if[ \t]*[a-zA-Z0-9_]*[ \t]*$"
m0[3]="^[ \t]*#[ \t]*ifndef[ \t]*[a-zA-Z0-9_]*[ \t]*$"
m[1]="^[ \t]*#[ \t]*define[ \t]*[A-Za-z0-9_]*([ \t]*\([A-Za-z0-9_]*\)[\.]*[ \t]*)[ \t]*printk([ \t]*\1[ \t]*)[ \t]*$"
m[2]="^[ \t]*#[ \t]*else[ \t]*$"
m[3]="^[ \t]*#[ \t]*define[ \t]*[a-zA-Z0-9_]*([a-zA-Z0-9_]*[\.]*)[ \t]*$"
m[4]="^[ \t]*#[ \t]*endif[ \t]*$"

# TODO: also for .h files (and files that include them)

#$dbg="echo"

for f in `find -name *.[c]`; do
	grep -q "${m[1]}" $f
	if [ $? -eq 0 ]; then
		echo $f
		match=`grep -B1 -A3 "${m[1]}" $f`;
		let i=0
		ret=$( echo "${match}" | while read line; do
			if [ $i -ne 0 ]; then
				if [ -z "`echo "$line" | grep "${m[$i]}"`" ]; then
					echo fail;
					break;
				fi
			else
				tmp=$( for w in ${#m0[@]}; do
					if [ "`echo "$line" | grep "${m0[$w]}"`" ]; then
						echo $w;
					fi
				done )
				if [ -z "$tmp" ]; then
					echo fail;
					break;
				else
					echo $w;
				fi
			fi
			let i++
		done )

		if [ "$ret" = "fail" ]; then
			echo sorry, failed:
			grep -B1 -A3 "${m[1]}" $f
			echo "------------------"
			continue;
		fi
		head -n60 $f;
		echo "${match}";
		echo "enter a CONFIG string for file $f (omit CONFIG_ and _DEBUG; end with ctrl+D; \"q\" will exit script)"
		test=$(cat)
		[ "$test" = "q" ] && exit 0;
		test="CONFIG_${test#CONFIG_}"
		test="${test%CONFIG_}_DEBUG"
		echo string entered was $test
		echo -n "$test " >> ../kcs

		# TODO Kconfig edit
		dir=`dirname $f`
		while [ ! -f "$dir/Kconfig" ]; do
			dir="${dir%/*}"
			if [ "$dir" = "." ]; then
				echo could not find Kconfig for $f
				continue;
			fi
		done
		echo -n "$dir/Kconfig " >> ../kcs
		echo "$f" >> ../kcs
		linenr=`grep -n "${m[1]}" $f | cut -d ":" -f1`;

		qr=`echo "$match" | sed -n "/^[ \t]*#[ \t]*define[ \t]*\([A-Za-z0-9_]*\)(.*printk.*/ s/^[ \t]*#[ \t]*define[ \t]*\([A-Za-z0-9_]*\)(.*printk.*/\1/p"`
		$dbg sed -i "/$qr/ s/$qr/pr_debug/g" $f
		sed -n "/$qr/ s/$qr/pr_debug/p" $f

			
		if [ "$ret" = "0" ]; then
			continue;
		elif [ "$ret" = "1" ]; then
			qr2=`echo "$match" | sed -n "/^[ \t]*#[ \t]*ifdef[ \t]*\([a-zA-Z0-9_]*\)[ \t]*$/ s/^[ \t]*#[ \t]*ifdef[ \t]*\([a-zA-Z0-9_]*\)[ \t]*$/\1/p"`
		elif [ "$ret" = "2" ]; then
			qr2=`echo "$match" | sed -n "/^[ \t]*#[ \t]*if[ \t]*\([a-zA-Z0-9_]*\)[ \t]*$/ s/^[ \t]*#[ \t]*if[ \t]*\([a-zA-Z0-9_]*\)[ \t]*$/\1/p"`
		elif [ "$ret" = "3" ]; then
			qr2=`echo "$match" | sed -n "/^[ \t]*#[ \t]*ifndef[ \t]*\([a-zA-Z0-9_]*\)[ \t]*$/ s/^[ \t]*#[ \t]*ifndef[ \t]*\([a-zA-Z0-9_]*\)[ \t]*$/\1/p"`
		fi
		$dbg sed -i "/[ \t]*#[ \t]*undef[ \t]*$qr2[ \t]*$/d" $f
		sed -n "/[ \t]*#[ \t]*undef[ \t]*$qr2[ \t]*$/p" $f
		$dbg sed -i "/[ \t]*#[ \t]*define[ \t]*$qr2[ \t]*$/d" $f
		sed -n "/[ \t]*#[ \t]*define[ \t]*$qr2[ \t]*$/p" $f

		$dbg sed -i "`expr $linenr - 1` s/.*/#ifdef $test/" $f
		sed -n "`expr $linenr - 1` s/.*/#ifdef $test/p" $f
		$dbg sed -i "`expr $linenr` s/.*/#\tdefine DEBUG 1/" $f
		sed -n "`expr $linenr` s/.*/#\tdefine DEBUG 1/p" $f
		$dbg sed -i "`expr $linenr + 1` s/.*/#endif/" $f
		sed -n "`expr $linenr + 1` s/.*/#endif/p" $f
		$dbg sed -i "`expr $linenr + 2` s/.*/#include <linux\/kernel\.h>/" $f
		sed -n "`expr $linenr + 2` s/.*/#include <linux\/kernel\.h>/p" $f
		$dbg sed -i "`expr $linenr + 3`d" $f
	fi
done
