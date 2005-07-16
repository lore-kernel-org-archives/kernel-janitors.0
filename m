From: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>
Date: Sat, 16 Jul 2005 07:24:48 +0000
Subject: [KJ] [PATCH] drivers/scsi/u14-34f.c : Use of the time_before() macro
Message-Id: <42D8B640.4030705@feitoza.com.br>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------010506070607070501070307"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------010506070607070501070307
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit


--------------010506070607070501070307
Content-Type: text/x-patch;
 name="u14-34f.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="u14-34f.patch"

Use of the time_before() macro, defined at linux/jiffies.h, which deal
with wrapping correctly and are nicer to read.

Signed-off-by: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>

--- linux/drivers/scsi/u14-34f.c	2005-07-13 17:52:25.000000000 -0300
+++ linux-kj/drivers/scsi/u14-34f.c	2005-07-16 01:11:52.217178840 -0300
@@ -421,6 +421,7 @@
 #include <linux/init.h>
 #include <linux/ctype.h>
 #include <linux/spinlock.h>
+#include <linux/jiffies.h>
 #include <asm/dma.h>
 #include <asm/irq.h>
 
@@ -746,7 +747,8 @@
 static int board_inquiry(unsigned int j) {
    struct mscp *cpp;
    dma_addr_t id_dma_addr;
-   unsigned int time, limit = 0;
+   unsigned int limit = 0;
+   unsigned long time;
 
    id_dma_addr = pci_map_single(HD(j)->pdev, HD(j)->board_id,
                     sizeof(HD(j)->board_id), PCI_DMA_BIDIRECTIONAL);
@@ -779,7 +781,7 @@
 
    spin_unlock_irq(&driver_lock);
    time = jiffies;
-   while ((jiffies - time) < HZ && limit++ < 20000) udelay(100L);
+   while (time_before(jiffies, time + HZ) && limit++ < 20000) udelay(100L);
    spin_lock_irq(&driver_lock);
 
    if (cpp->adapter_status || HD(j)->cp_stat[0] != FREE) {
@@ -1409,7 +1411,8 @@
 }
 
 static int u14_34f_eh_host_reset(struct scsi_cmnd *SCarg) {
-   unsigned int i, j, time, k, c, limit = 0;
+   unsigned int i, j, k, c, limit = 0;
+   unsigned long time;
    int arg_done = FALSE;
    struct scsi_cmnd *SCpnt;
 
@@ -1496,7 +1499,8 @@
 
    spin_unlock_irq(sh[j]->host_lock);
    time = jiffies;
-   while ((jiffies - time) < (10 * HZ) && limit++ < 200000) udelay(100L);
+   while (time_before(jiffies, time + (10 * HZ))
+		   && limit++ < 200000) udelay(100L);
    spin_lock_irq(sh[j]->host_lock);
 
    printk("%s: reset, interrupts disabled, loops %d.\n", BN(j), limit);

--------------010506070607070501070307
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------010506070607070501070307--
