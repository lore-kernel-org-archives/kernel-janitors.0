From: "Randy.Dunlap" <rddunlap@osdl.org>
Date: Thu, 05 Feb 2004 23:14:14 +0000
Subject: Re: [Kernel-janitors]  New guy here, and patch for kj.pl ( forget
Message-Id: <20040205151414.372b4ca5.rddunlap@osdl.org>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sun, 25 Jan 2004 13:38:28 +0100 JOUANNE Mickael <grigouze@noos.fr> wrote:


--- kj.pl	2004-01-05 21:04:37.000000000 +0100
+++ kj-new.pl	2004-01-25 11:38:08.000000000 +0100
@@ -109,7 +109,7 @@
 			print "$filename:$linenr:$line\n\n";
 		}
 
-		if ($line=~/MOD_{INC,DEC}_USE_COUNT/) {
+		if ($line=~/MOD_(INC|DEC)_USE_COUNT/) {
 			print "Net drivers should call SET_MODULE_OWNER instead of MOD_{INC,DEC}_USE_COUNT\n";
 			print "$filename:$linenr:$line\n\n";

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

I updated the kj.pl and kj-devel.pl scripts to use the
regex syntax above and to change the message:
MOD_(INC|DEC)_USE_COUNT is deprecated, see the module-init-tool FAQ...

I also added SET_MODULE_ONWER, with a message that it is now
useless in Linux 2.6.

Thanks,
--
~Randy
kernel-janitors project:  http://janitor.kernelnewbies.org/
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
