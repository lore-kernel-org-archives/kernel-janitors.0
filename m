From: Don Koch <aardvark@krl.com>
Date: Mon, 12 Apr 2004 21:05:48 +0000
Subject: [Kernel-janitors] minor cyclades.c cleanup
Message-Id: <200404122105.i3CL5nGj017977@p-chan.krl.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============95320771078536515=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============95320771078536515==
Content-Type: text/plain; charset=us-ascii

This just removes some dead code and gets rid of a warning.  Not tested
(no hardware) but it compiles.

===== drivers/char/cyclades.c 1.36 vs edited =====
--- 1.36/drivers/char/cyclades.c	Sat Mar 27 00:30:45 2004
+++ edited/drivers/char/cyclades.c	Mon Apr 12 15:56:14 2004
@@ -681,16 +681,6 @@
 static void cy_throttle (struct tty_struct *tty);
 static void cy_send_xchar (struct tty_struct *tty, char ch);
 
-static unsigned long 
-cy_get_user(unsigned long *addr)
-{
-	unsigned long result = 0;
-	int error = get_user (result, addr);
-	if (error)
-		printk ("cyclades: cy_get_user: error == %d\n", error);
-	return result;
-}
-
 #ifndef MIN
 #define MIN(a,b)        ((a) < (b) ? (a) : (b))
 #endif



--===============95320771078536515==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============95320771078536515==--
