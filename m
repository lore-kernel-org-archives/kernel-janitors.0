From: Domen Puncer <domen@coderock.org>
Date: Sat, 08 May 2004 23:38:22 +0000
Subject: [Kernel-janitors] [patch 2.6.6-rc3 13/16] ifdefs:
Message-Id: <20040508233822.GA4154@masina>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============65364024878499793=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============65364024878499793==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

--- c/drivers/scsi/dc390.h	2004-04-04 05:36:26.000000000 +0200
+++ a/drivers/scsi/dc390.h	2004-05-08 23:59:26.000000000 +0200
@@ -14,9 +14,6 @@
 #define DC390_H
 
 #include <linux/version.h>
-#ifndef KERNEL_VERSION
-# define KERNEL_VERSION(a,b,c) (((a) << 16) + ((b) << 8) + (c))
-#endif
 
 #define DC390_BANNER "Tekram DC390/AM53C974"
 #define DC390_VERSION "2.0f 2000-12-20"
@@ -26,7 +23,7 @@
  * So long: Use old exception handling :-( */
 #define OLD_EH
 
-#if LINUX_VERSION_CODE < KERNEL_VERSION (2,1,70) || defined (OLD_EH)
+#ifdef OLD_EH
 # define NEW_EH
 #else
 # define NEW_EH use_new_eh_code: 1,

--===============65364024878499793==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============65364024878499793==--
