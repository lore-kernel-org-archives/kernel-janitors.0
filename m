From: Tony Breeds <tony@bakeyournoodle.com>
Date: Tue, 24 Feb 2004 23:56:16 +0000
Subject: [Kernel-janitors] drivers/char/rio ioctl return fixes.
Message-Id: <20040224235616.GN17371@bakeyournoodle.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello all,
	This is a patch that I've been floating past lkml since 2.5.10
(or there abouts).  It fixes 3 places where the ioctl returns positives
instead of negatives.  I've gotten feedback from the maintainer (Rogier
Wolfe (sp?) and he has no objections.

Feedback more than welcome.
-----
diff -X dontdiff -urN 2.6.3.clean/drivers/char/rio/rioctrl.c 2.6.3.rio/drivers/char/rio/rioctrl.c
--- 2.6.3.clean/drivers/char/rio/rioctrl.c	2004-01-15 16:57:57.000000000 +1100
+++ 2.6.3.rio/drivers/char/rio/rioctrl.c	2004-02-25 10:52:05.000000000 +1100
@@ -522,7 +522,7 @@
 					else {
 		 				rio_dprintk (RIO_DEBUG_CTRL, "p->RIOBindTab full! - Rta %x not added\n",
 		  					(int) arg);
-		 				return 1;
+		 				return -ENOMEM;
 					}
 					return 0;
 				}
@@ -1593,12 +1593,12 @@
 			case RIO_NO_MESG:
 				if ( su )
 					 p->RIONoMessage = 1;
-				return su ? 0 : EPERM;
+				return su ? 0 : -EPERM;
 
 			case RIO_MESG:
 				if ( su )
 					p->RIONoMessage = 0;
-				return su ? 0 : EPERM;
+				return su ? 0 : -EPERM;
 
 			case RIO_WHAT_MESG:
 				if ( copyout( (caddr_t)&p->RIONoMessage, (int)arg, 
-----

Yours Tony

        linux.conf.au       http://lca2005.linux.org.au/
	Apr 18-23 2005      The Australian Linux Technical Conference!

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
