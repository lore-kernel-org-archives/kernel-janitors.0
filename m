From: Thomas Petazzoni <thomas.petazzoni@enix.org>
Date: Fri, 22 Sep 2006 22:35:03 +0000
Subject: [KJ] [PATCH] Prevent multiple inclusion of linux/sysrq.h
Message-Id: <E1GQtbr-0005Or-LP@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


Prevent multiple inclusions of include/linux/sysrq.h using traditional
#ifndef..#endif.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@enix.org>

Index: linux-2.6/include/linux/sysrq.h
=================================--- linux-2.6.orig/include/linux/sysrq.h	2006-09-23 00:04:05.000000000 +0200
+++ linux-2.6/include/linux/sysrq.h	2006-09-23 00:05:27.000000000 +0200
@@ -11,6 +11,8 @@
  *	based upon discusions in irc://irc.openprojects.net/#kernelnewbies
  */
 
+#ifndef _LINUX_SYSRQ_H
+#define _LINUX_SYSRQ_H
 
 struct pt_regs;
 struct tty_struct;
@@ -57,3 +59,5 @@
 #define unregister_sysrq_key(ig,nore) __reterr()
 
 #endif
+
+#endif /* _LINUX_SYSRQ_H */
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
