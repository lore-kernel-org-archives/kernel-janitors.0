From: Timmy Yee <shoujun@masterofpi.org>
Date: Mon, 26 Jan 2004 01:00:43 +0000
Subject: [Kernel-janitors] [PATCH] fix logic bugs in ps2esdi.c
Message-Id: <20040126010043.GA4317@masterofpi.org>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi,

This patch adds missing ampersands.

--- linux-2.6.2-rc1/drivers/block/ps2esdi.c	2003-12-03 17:03:19.000000000 -0800
+++ linux-2.6.2-rc1-mpi/drivers/block/ps2esdi.c	2004-01-24 01:53:01.000000000 -0800
@@ -743,7 +743,7 @@
 	drive_num = int_ret_code >> 5;
 	switch (int_ret_code & 0xf) {
 	case INT_CMD_COMPLETE:
-		for (i = ESDI_TIMEOUT; i & !(inb(ESDI_STATUS) & STATUS_STAT_AVAIL); i--);
+		for (i = ESDI_TIMEOUT; i && !(inb(ESDI_STATUS) & STATUS_STAT_AVAIL); i--);
 		if (!(inb(ESDI_STATUS) & STATUS_STAT_AVAIL)) {
 			printk("%s: timeout reading status word\n", DEVICE_NAME);
 			outb((int_ret_code & 0xe0) | ATT_EOI, ESDI_ATTN);
@@ -879,7 +879,7 @@
 		break;
 
 	case INT_CMD_COMPLETE:
-		for (i = ESDI_TIMEOUT; i & !(inb(ESDI_STATUS) & STATUS_STAT_AVAIL); i--);
+		for (i = ESDI_TIMEOUT; i && !(inb(ESDI_STATUS) & STATUS_STAT_AVAIL); i--);
 		if (!(inb(ESDI_STATUS) & STATUS_STAT_AVAIL)) {
 			printk("%s: timeout reading status word\n", DEVICE_NAME);
 			outb((int_ret_code & 0xe0) | ATT_EOI, ESDI_ATTN);
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
