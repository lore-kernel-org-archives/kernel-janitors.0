From: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>
Date: Sat, 09 Apr 2005 22:03:56 +0000
Subject: [KJ] [PATCH] drivers/net/ne2.c : Use of time_after() macro
Message-Id: <4258514C.3@feitoza.com.br>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------040001030302000709000807"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------040001030302000709000807
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Use of time_after() macro, defined at linux/jiffies.h, which deal with
wrapping correctly and are nicer to read.

-- 

Marcelo Feitoza Parisi            
marcelo at feitoza.com.br
http://marcelo.feitoza.com.br/


--------------040001030302000709000807
Content-Type: text/x-patch;
 name="ne2.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="ne2.patch"

--- linux/drivers/net/ne2.c	2005-03-02 04:38:33.000000000 -0300
+++ development/drivers/net/ne2.c	2005-04-09 18:32:24.000000000 -0300
@@ -75,6 +75,7 @@ static const char *version = "ne2.c:v0.9
 #include <linux/etherdevice.h>
 #include <linux/skbuff.h>
 #include <linux/bitops.h>
+#include <linux/jiffies.h>
 
 #include <asm/system.h>
 #include <asm/io.h>
@@ -408,7 +409,7 @@ static int __init ne2_probe1(struct net_
 		outb(inb(base_addr + NE_RESET), base_addr + NE_RESET);
 
 		while ((inb_p(base_addr + EN0_ISR) & ENISR_RESET) == 0)
-			if (jiffies - reset_start_time > 2*HZ/100) {
+			if (time_after(jiffies, reset_start_time + 2*HZ/100)) {
 				printk(" not found (no reset ack).\n");
 				retval = -ENODEV;
 				goto out;
@@ -554,7 +555,7 @@ static void ne_reset_8390(struct net_dev
 
 	/* This check _should_not_ be necessary, omit eventually. */
 	while ((inb_p(NE_BASE+EN0_ISR) & ENISR_RESET) == 0)
-		if (jiffies - reset_start_time > 2*HZ/100) {
+		if (time_after(jiffies, reset_start_time + 2*HZ/100)) {
 			printk("%s: ne_reset_8390() did not complete.\n", 
 					dev->name);
 			break;
@@ -755,7 +756,7 @@ retry:
 #endif
 
 	while ((inb_p(nic_base + EN0_ISR) & ENISR_RDC) == 0)
-		if (jiffies - dma_start > 2*HZ/100) {		/* 20ms */
+		if (time_after(jiffies, dma_start + 2*HZ/100)) {		/* 20ms */
 			printk("%s: timeout waiting for Tx RDC.\n", dev->name);
 			ne_reset_8390(dev);
 			NS8390_init(dev,1);

--------------040001030302000709000807
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------040001030302000709000807--
