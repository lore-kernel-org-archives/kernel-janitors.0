From: james4765@verizon.net
Date: Thu, 16 Dec 2004 23:07:46 +0000
Subject: [KJ] [PATCH] computone: replace cli()/sti() with
Message-Id: <20041216230808.7471.60670.97852@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============76708319068510078=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============76708319068510078==

This is an attempt to make the ip2 driver SMP-correct.

Compile tested.

Signed-off-by: James Nelson <james4765@gmail.com>

diff -urN --exclude='*~' linux-2.6.10-rc3-original/drivers/char/ip2main.c linux-2.6.10-rc3/drivers/char/ip2main.c
--- linux-2.6.10-rc3-original/drivers/char/ip2main.c	2004-12-03 16:55:03.000000000 -0500
+++ linux-2.6.10-rc3/drivers/char/ip2main.c	2004-12-16 17:51:34.366933489 -0500
@@ -221,6 +221,8 @@
 /* Static Data */
 /***************/
 
+static spinlock_t ip2_lock = SPIN_LOCK_UNLOCKED;
+
 static struct tty_driver *ip2_tty_driver;
 
 /* Here, then is a table of board pointers which the interrupt routine should
@@ -2206,9 +2208,9 @@
 	 * for masking). Caller should use TIOCGICOUNT to see which one it was
 	 */
 	case TIOCMIWAIT:
-		save_flags(flags);cli();
+		spin_lock_irqsave(&ip2_lock, flags);
 		cprev = pCh->icount;	 /* note the counters on entry */
-		restore_flags(flags);
+		spin_unlock_irqrestore(&ip2_lock, flags);
 		i2QueueCommands(PTYPE_BYPASS, pCh, 100, 4, 
 						CMD_DCD_REP, CMD_CTS_REP, CMD_DSR_REP, CMD_RI_REP);
 		init_waitqueue_entry(&wait, current);
@@ -2228,9 +2230,9 @@
 				rc = -ERESTARTSYS;
 				break;
 			}
-			save_flags(flags);cli();
+			spin_lock_irqsave(&ip2_lock, flags);
 			cnow = pCh->icount; /* atomic copy */
-			restore_flags(flags);
+			spin_unlock_irqrestore(&ip2_lock, flags);
 			if (cnow.rng == cprev.rng && cnow.dsr == cprev.dsr &&
 				cnow.dcd == cprev.dcd && cnow.cts == cprev.cts) {
 				rc =  -EIO; /* no change => rc */
@@ -2268,9 +2270,9 @@
 	case TIOCGICOUNT:
 		ip2trace (CHANN, ITRC_IOCTL, 11, 1, rc );
 
-		save_flags(flags);cli();
+		spin_lock_irqsave(&ip2_lock, flags);
 		cnow = pCh->icount;
-		restore_flags(flags);
+		spin_unlock_irqrestore(&ip2_lock, flags);
 		p_cuser = argp;
 		rc = put_user(cnow.cts, &p_cuser->cts);
 		rc = put_user(cnow.dsr, &p_cuser->dsr);
diff -urN --exclude='*~' linux-2.6.10-rc3-original/drivers/char/Kconfig linux-2.6.10-rc3/drivers/char/Kconfig
--- linux-2.6.10-rc3-original/drivers/char/Kconfig	2004-12-03 16:52:14.000000000 -0500
+++ linux-2.6.10-rc3/drivers/char/Kconfig	2004-12-16 18:01:58.973609355 -0500
@@ -80,7 +80,7 @@
 
 config COMPUTONE
 	tristate "Computone IntelliPort Plus serial support"
-	depends on SERIAL_NONSTANDARD && BROKEN_ON_SMP
+	depends on SERIAL_NONSTANDARD
 	---help---
 	  This driver supports the entire family of Intelliport II/Plus
 	  controllers with the exception of the MicroChannel controllers and

--===============76708319068510078==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============76708319068510078==--
