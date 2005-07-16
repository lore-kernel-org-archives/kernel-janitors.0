From: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>
Date: Sat, 16 Jul 2005 07:17:15 +0000
Subject: [KJ] [PATCH] drivers/net/ne2k-pci.c : Use of the time_after() macro
Message-Id: <42D8B47B.3050304@feitoza.com.br>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------090109080206060807070208"
List-Id: <kernel-janitors.vger.kernel.org>
References: <425F030B.5000008@feitoza.com.br>
In-Reply-To: <425F030B.5000008@feitoza.com.br>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------090109080206060807070208
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit


--------------090109080206060807070208
Content-Type: text/x-patch;
 name="ne2k-pci.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="ne2k-pci.patch"

Use of the time_after() macro, defined at linux/jiffies.h, which deal
with wrapping correctly and are nicer to read.

Signed-off-by: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>

--- linux/drivers/net/ne2k-pci.c	2005-07-13 17:53:29.000000000 -0300
+++ linux-kj/drivers/net/ne2k-pci.c	2005-07-15 22:21:44.302017824 -0300
@@ -280,7 +280,7 @@
 		*/
 		while ((inb(ioaddr + EN0_ISR) & ENISR_RESET) == 0)
 			/* Limit wait: '2' avoids jiffy roll-over. */
-			if (jiffies - reset_start_time > 2) {
+			if (time_after(jiffies, reset_start_time + 2)) {
 				printk(KERN_ERR PFX "Card failure (no reset ack).\n");
 				goto err_out_free_netdev;
 			}
@@ -453,7 +453,7 @@
 
 	/* This check _should_not_ be necessary, omit eventually. */
 	while ((inb(NE_BASE+EN0_ISR) & ENISR_RESET) == 0)
-		if (jiffies - reset_start_time > 2) {
+		if (time_after(jiffies, reset_start_time + 2)) {
 			printk("%s: ne2k_pci_reset_8390() did not complete.\n", dev->name);
 			break;
 		}
@@ -610,7 +610,7 @@
 	dma_start = jiffies;
 
 	while ((inb(nic_base + EN0_ISR) & ENISR_RDC) == 0)
-		if (jiffies - dma_start > 2) {			/* Avoid clock roll-over. */
+		if (time_after(jiffies, dma_start + 2)) {	/* Avoid clock roll-over. */
 			printk(KERN_WARNING "%s: timeout waiting for Tx RDC.\n", dev->name);
 			ne2k_pci_reset_8390(dev);
 			NS8390_init(dev,1);

--------------090109080206060807070208
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------090109080206060807070208--
