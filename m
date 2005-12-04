From: Marcin Slusarz <marcin.slusarz@gmail.com>
Date: Sun, 04 Dec 2005 00:13:20 +0000
Subject: [KJ] [PATCH 2/21] polling loops: change exit condition to
Message-Id: <439234A0.3030602@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

ATM
P:	Chas Williams
M:	chas@cmf.nrl.navy.mil

Signed-off-by: Marcin Slusarz <marcin.slusarz@gmail.com>
diff -upr -X linux-2.6.15-rc4/Documentation/dontdiff linux-2.6.15-rc4-orig/drivers/atm/firestream.c linux-2.6.15-rc4/drivers/atm/firestream.c
--- linux-2.6.15-rc4-orig/drivers/atm/firestream.c	2005-11-20 16:53:15.000000000 +0100
+++ linux-2.6.15-rc4/drivers/atm/firestream.c	2005-12-03 16:53:10.000000000 +0100
@@ -1651,8 +1651,9 @@ static void fs_poll (unsigned long data)
 static int __devinit fs_init (struct fs_dev *dev)
 {
 	struct pci_dev  *pci_dev;
-	int isr, to;
+	int isr;
 	int i;
+	unsigned long end_time;
 
 	func_enter ();
 	pci_dev = dev->pci_dev;
@@ -1690,8 +1691,8 @@ static int __devinit fs_init (struct fs_
 
 	/* 10ms * 100 is 1 second. That should be enough, as AN3:9 says it takes
 	   1ms. */
-	to = 100;
-	while (--to) {
+	end_time = jiffies + msecs_to_jiffies(1000);
+	while (time_before(jiffies, end_time)) {
 		isr = read_fs (dev, ISR);
 
 		/* This bit is documented as "RESERVED" */
@@ -1708,7 +1709,7 @@ static int __devinit fs_init (struct fs_
 		msleep(10);
 	}
 
-	if (!to) {
+	if (time_after_eq(jiffies, end_time)) {
 		printk (KERN_ERR "timeout initializing the FS... \n");
 		return 1;
 	}
diff -upr -X linux-2.6.15-rc4/Documentation/dontdiff linux-2.6.15-rc4-orig/drivers/atm/he.c linux-2.6.15-rc4/drivers/atm/he.c
--- linux-2.6.15-rc4-orig/drivers/atm/he.c	2005-11-20 16:53:15.000000000 +0100
+++ linux-2.6.15-rc4/drivers/atm/he.c	2005-12-03 16:53:10.000000000 +0100
@@ -2550,8 +2550,9 @@ he_close(struct atm_vcc *vcc)
 	struct he_tpd *tpd;
 	unsigned cid;
 	struct he_vcc *he_vcc = HE_VCC(vcc);
-#define MAX_RETRY 30
-	int retry = 0, sleep = 1, tx_inuse;
+#define MAX_TIMEOUT 6000
+	int sleep = 1, tx_inuse;
+	unsigned long end_time;
 
 	HPRINTK("close vcc %p %d.%d\n", vcc, vcc->vpi, vcc->vci);
 
@@ -2607,14 +2608,12 @@ he_close(struct atm_vcc *vcc)
 		 * TBRQ. When the last packet on the connection arrives in the
 		 * TBRQ, the host issues the close command to the adapter.
 		 */
-
+		end_time = jiffies + msecs_to_jiffies(MAX_TIMEOUT);
 		while (((tx_inuse = atomic_read(&sk_atm(vcc)->sk_wmem_alloc)) > 0) &&
-		       (retry < MAX_RETRY)) {
+		       time_before(jiffies, end_time)) {
 			msleep(sleep);
 			if (sleep < 250)
 				sleep = sleep * 2;
-
-			++retry;
 		}
 
 		if (tx_inuse)
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
