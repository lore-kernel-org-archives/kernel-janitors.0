From: Eugene Teo <eugene.teo@eugeneteo.net>
Date: Wed, 21 Jan 2004 18:37:52 +0000
Subject: [PATCH] /drivers/isdn/pcbit/layer2.{c,h} - debug cleanups
Message-Id: <20040121183752.GB17474@eugeneteo.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Patch compiles, and tested. Straight-forward. 

 layer2.c |   30 ++++++------------------------
 layer2.h |   10 +++-------
 2 files changed, 9 insertions(+), 31 deletions(-)

diff -Naur -X /home/amnesia/w/dontdiff 2.6.2-rc1-orig/drivers/isdn/pcbit/layer2.c 2.6.2-rc1-fix/drivers/isdn/pcbit/layer2.c
--- 2.6.2-rc1-orig/drivers/isdn/pcbit/layer2.c	2004-01-22 02:19:08.000000000 +0800
+++ 2.6.2-rc1-fix/drivers/isdn/pcbit/layer2.c	2004-01-22 02:20:14.000000000 +0800
@@ -19,11 +19,6 @@
  *        - "Interface com bus do PC para o PCBIT e PCBIT-D", Inesc, Jan 93
  */
 
-/*
- *        TODO: better handling of errors
- *              re-write/remove debug printks
- */
-
 #include <linux/sched.h>
 #include <linux/string.h>
 #include <linux/kernel.h>
@@ -289,11 +284,9 @@
 		restore_flags(flags);
 	} else {
 		restore_flags(flags);
-#ifdef DEBUG
-		printk(KERN_DEBUG "unacked %d free %d write_queue %s\n",
+		pr_debug("unacked %d free %d write_queue %s\n",
 		     unacked, dev->free, dev->write_queue ? "not empty" :
 		       "empty");
-#endif
 	}
 }
 
@@ -409,20 +402,16 @@
 
 		if (frame->hdr_len = 0) {
 			kfree(frame);
-#ifdef DEBUG
-			printk(KERN_DEBUG "0 sized frame\n");
-#endif
+			pr_debug("0 sized frame\n");
 			pcbit_firmware_bug(dev);
 			return;
 		}
 		/* sanity check the length values */
 		if (frame->hdr_len > 1024 || frame->dt_len > 2048) {
-#ifdef DEBUG
-			printk(KERN_DEBUG "length problem: ");
-			printk(KERN_DEBUG "TH=%04x TD=%04x\n",
+			pr_debug("length problem: ");
+			pr_debug("TH=%04x TD=%04x\n",
 			       frame->hdr_len,
 			       frame->dt_len);
-#endif
 			pcbit_l2_error(dev);
 			kfree(frame);
 			return;
@@ -552,9 +541,7 @@
 		return IRQ_HANDLED;
 	}
 	if (info & 0x40U) {     /* E bit set */
-#ifdef DEBUG
-		printk(KERN_DEBUG "pcbit_irq_handler: E bit on\n");
-#endif
+		pr_debug("pcbit_irq_handler: E bit on\n");
 		pcbit_l2_error(dev);
 		dev->interrupt = 0;
 		return IRQ_HANDLED;
@@ -593,10 +580,7 @@
 
 	state = dev->l2_state;
 
-#ifdef DEBUG
-	printk(KERN_DEBUG "layer2_active_confirm\n");
-#endif
-
+	pr_debug("layer2_active_confirm\n");
 
 	if (info & 0x80U) {
 		dev->rcv_seq = info & 0x07U;
@@ -672,9 +656,7 @@
 
 		printk(KERN_INFO "pcbit: layer 2 error\n");
 
-#ifdef DEBUG
 		log_state(dev);
-#endif
 
 		dev->l2_state = L2_DOWN;
 
diff -Naur -X /home/amnesia/w/dontdiff 2.6.2-rc1-orig/drivers/isdn/pcbit/layer2.h 2.6.2-rc1-fix/drivers/isdn/pcbit/layer2.h
--- 2.6.2-rc1-orig/drivers/isdn/pcbit/layer2.h	2004-01-22 02:19:08.000000000 +0800
+++ 2.6.2-rc1-fix/drivers/isdn/pcbit/layer2.h	2004-01-22 02:20:14.000000000 +0800
@@ -128,16 +128,12 @@
 
 extern struct pcbit_dev * dev_pcbit[MAX_PCBIT_CARDS];
 
-#ifdef DEBUG
 static __inline__ void log_state(struct pcbit_dev *dev) {
-        printk(KERN_DEBUG "writeptr = %ld\n", 
-	       (ulong) (dev->writeptr - dev->sh_mem));
-        printk(KERN_DEBUG "readptr  = %ld\n", 
-	       (ulong) (dev->readptr - (dev->sh_mem + BANK2)));
-        printk(KERN_DEBUG "{rcv_seq=%01x, send_seq=%01x, unack_seq=%01x}\n", 
+        pr_debug("writeptr = %ld\n", (ulong) (dev->writeptr - dev->sh_mem));
+        pr_debug("readptr  = %ld\n", (ulong) (dev->readptr - (dev->sh_mem + BANK2)));
+        pr_debug("{rcv_seq=%01x, send_seq=%01x, unack_seq=%01x}\n", 
 	       dev->rcv_seq, dev->send_seq, dev->unack_seq);
 }
-#endif
 
 static __inline__ struct pcbit_dev * chan2dev(struct pcbit_chan * chan) 
 {

-- 
Eugene TEO   <eugeneteo@eugeneteo.net>   <http://www.anomalistic.org/>
1024D/14A0DDE5 print D851 4574 E357 469C D308  A01E 7321 A38A 14A0 DDE5
main(i) { putchar(182623909 >> (i-1) * 5&31|!!(i<7)<<6) && main(++i); }



-------------------------------------------------------
The SF.Net email is sponsored by EclipseCon 2004
Premiere Conference on Open Tools Development and Integration
See the breadth of Eclipse activity. February 3-5 in Anaheim, CA.
http://www.eclipsecon.org/osdn
_______________________________________________
Kernel-janitor-discuss mailing list
Kernel-janitor-discuss@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kernel-janitor-discuss
