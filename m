From: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>
Date: Sat, 16 Jul 2005 07:06:58 +0000
Subject: [KJ] [PATCH] drivers/net/hamradio/dmascc.c : Use of the
Message-Id: <42D8B212.4060902@feitoza.com.br>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------040705020905060008030600"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------040705020905060008030600
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



--------------040705020905060008030600
Content-Type: text/x-patch;
 name="dmascc.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="dmascc.patch"

Use of the time_before() macro, defined at linux/jiffies.h, which deal
with wrapping correctly and are nicer to read.

Signed-off-by: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>

--- linux/drivers/net/hamradio/dmascc.c	2005-06-17 16:48:29.000000000 -0300
+++ linux-kj/drivers/net/hamradio/dmascc.c	2005-07-16 03:52:00.470502312 -0300
@@ -34,6 +34,7 @@
 #include <linux/rtnetlink.h>
 #include <linux/sockios.h>
 #include <linux/workqueue.h>
+#include <linux/jiffies.h>
 #include <asm/atomic.h>
 #include <asm/bitops.h>
 #include <asm/dma.h>
@@ -405,7 +406,7 @@
 		udelay(2000000 / TMR_0_HZ);
 
 		/* Timing loop */
-		while (jiffies - time < 13) {
+		while (time_before(jiffies, time + 13)) {
 			for (i = 0; i < hw[h].num_devs; i++)
 				if (base[i] && counting[i]) {
 					/* Read back Timer 1: latch; read LSB; read MSB */
@@ -548,7 +549,7 @@
 
 	/* Wait and detect IRQ */
 	time = jiffies;
-	while (jiffies - time < 2 + HZ / TMR_0_HZ);
+	while (time_before(jiffies, time + 2 + HZ / TMR_0_HZ));
 	irq = probe_irq_off(irqs);
 
 	/* Clear pending interrupt, disable interrupts */
@@ -1395,7 +1396,8 @@
 		/* Switch state */
 		write_scc(priv, R15, 0);
 		if (priv->tx_count &&
-		    (jiffies - priv->tx_start) < priv->param.txtimeout) {
+		    time_before(jiffies, priv->tx_start 
+			    + priv->param.txtimeout)) {
 			priv->state = TX_PAUSE;
 			start_timer(priv, priv->param.txpause, 0);
 		} else {

--------------040705020905060008030600
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------040705020905060008030600--
