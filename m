From: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>
Date: Sat, 16 Jul 2005 07:12:35 +0000
Subject: [KJ] [PATCH] drivers/net/wan/farsync.c : Use of the time_before()
Message-Id: <42D8B363.7000507@feitoza.com.br>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------080307030502070306000603"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------080307030502070306000603
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



--------------080307030502070306000603
Content-Type: text/x-patch;
 name="farsync.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="farsync.patch"

Use of the time_before() macro, defined at linux/jiffies.h, which deal
with wrapping correctly and are nicer to read.

Signed-off-by: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>

--- linux/drivers/net/wan/farsync.c	2005-07-13 17:53:31.000000000 -0300
+++ linux-kj/drivers/net/wan/farsync.c	2005-07-16 00:55:48.299716568 -0300
@@ -23,6 +23,7 @@
 #include <linux/init.h>
 #include <linux/if.h>
 #include <linux/hdlc.h>
+#include <linux/jiffies.h>
 #include <asm/io.h>
 #include <asm/uaccess.h>
 
@@ -697,14 +698,14 @@
 		 * We are delaying here to allow the 9054 to reset itself
 		 */
 		j = jiffies + 1;
-		while (jiffies < j)
+		while (time_before(jiffies, j))
 			/* Do nothing */ ;
 		outw(0x240f, card->pci_conf + CNTRL_9054 + 2);
 		/*
 		 * We are delaying here to allow the 9054 to reload its eeprom
 		 */
 		j = jiffies + 1;
-		while (jiffies < j)
+		while (time_before(jiffies, j))
 			/* Do nothing */ ;
 		outw(0x040f, card->pci_conf + CNTRL_9054 + 2);
 

--------------080307030502070306000603
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------080307030502070306000603--
