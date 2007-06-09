From: Oleg Verych <olecom@flower.upol.cz>
Date: Sat, 09 Jun 2007 03:13:36 +0000
Subject: [KJ] [patch] scripts: clean-whitespace.sh
Message-Id: <20070609031336.GA7266@flower.upol.cz>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

If somebody have problems with whitespace damage: can't see it, don't
know how to deal with it, please see my proposition.

----- Forwarded message -----

Date: Fri, 8 Jun 2007 08:40:42 +0200
From: Oleg Verych

After running this script with filename as parameter,
look (with diff) for, what can be corrected.

Only "*.diff" and "*.patch" files are handled as patches.

Signed-off-by: Oleg Verych <olecom@flower.upol.cz>
--
 Two clean rules added, that can change look of damaged lines.
 Yet script still fits one ordinary screen, so read the code!

 test cases: include/linux/ipv6.h, arch/x86_64/lib/{copy_user, memcpy}.S

 It's like lguest -- just for fun.

 clean-whitespace.sh |   28 ++++++++++++++++++++++++++++
  1 file changed, 28 insertions(+)

--- /dev/null	2007-04-04 10:55:19.204075250 +0200
+++ linux-just-for-fun/scripts/clean-whitespace.sh	2007-06-08 07:53:21.000000000 +0200
@@ -0,0 +1,28 @@
+#!/bin/sh -e
+# clean whitespace damage; i/o = $1/$1.clean
+
+IFS='' ; t="`printf '\t'`" ; s=' ' ; s4="$s$s$s$s" ; w79y ;
+i="$1" ; o="$1.clean"
+strip_file_end='/^$/{N;s_^\n$_&_;T e;:n;N;s_^.*\n\n$_&_;t n;:e;};'
+not_patch_line='/^+[^+]/'
+
+case $1 in *[.]diff | *[.]patch)
+	file=patch ; sp='+[!+]' ; p='+' ; addr="$not_patch_line";;
+esac
+
+sed -n "${addr:-$strip_file_end} {
+s|[$t$s]*$||;	# trailing whitespace
+:next;		# x*8 spaces on the line start -> x*tabs
+s|^\([\n]*\)$p\($t*\)$s4$s4|\1$p\2$t|;t next;	# \n is needed after N command
+s|^\([\n]*\)$p\($t*\)$s*$t|\1$p\2$t|g;		# strip spaces between tabs
+s|$s4$s4$s$s*|$t$t|g				# more than 8 spaces -> 2 tabs
+s|$s*$t|$t|g	# strip spaces before tab; tradeoff: may break some alignment !
+};p" -- "$i" >"$o" && echo "
+please, see clean ${file:=source} file: $o
+"
+exec expand $i | while read -r line # check for long line
+do   [ ${#line} -gt $w79 ] && case "$line" in $sp*) echo \
+"at least one line wider than $w79 chars, found
+check your $file, please
+" 1>&2 ; exit ;; esac
+done

----- End forwarded message -----
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
