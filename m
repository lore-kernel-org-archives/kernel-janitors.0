From: Domen Puncer <domen@coderock.org>
Date: Sat, 08 May 2004 23:38:16 +0000
Subject: [Kernel-janitors] [patch 2.6.6-rc3 2/16] ifdefs:
Message-Id: <20040508233816.GA4088@masina>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============57095291013943417=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============57095291013943417==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

--- c/drivers/block/cpqarray.c	2004-04-04 05:36:24.000000000 +0200
+++ a/drivers/block/cpqarray.c	2004-05-09 00:17:11.000000000 +0200
@@ -731,7 +731,6 @@
 }
 
 #ifndef MODULE
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,3,13)
 /*
  * Config string is a comma separated set of i/o addresses of EISA cards.
  */
@@ -748,18 +747,6 @@
 
 __setup("smart2=", cpqarray_setup);
 
-#else
-
-/*
- * Copy the contents of the ints[] array passed to us by init.
- */
-void cpqarray_setup(char *str, int *ints)
-{
-	int i;
-	for(i=0; i<ints[0] && i<8; i++)
-		eisa[i] = ints[i+1];
-}
-#endif
 #endif
 
 /*

--===============57095291013943417==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============57095291013943417==--
