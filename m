From: Roel Kluin <12o3l@tiscali.nl>
Date: Sun, 21 Oct 2007 17:41:54 +0000
Subject: [PATCH] ide-floppy debugging
Message-Id: <471B8F62.2050407@tiscali.nl>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

    ide-floppy debugging
    
    Signed-off-by: Roel Kluin <12o3l@tiscali.nl>
---
diff --git a/drivers/ide/Kconfig b/drivers/ide/Kconfig
index 6eaece9..02eca66 100644
--- a/drivers/ide/Kconfig
+++ b/drivers/ide/Kconfig
@@ -220,6 +220,11 @@ config BLK_DEV_IDETAPE
 	  To compile this driver as a module, choose M here: the
 	  module will be called ide-tape.
 
+config BLK_DEV_IDETAPE_DEBUG
+	bool "Include IDE_ATAPI TAPE support (EXPERIMENTAL) debugging"
+	depends on BLK_DEV_IDETAPE
+	default n
+
 config BLK_DEV_IDEFLOPPY
 	tristate "Include IDE/ATAPI FLOPPY support"
 	---help---
diff --git a/drivers/ide/ide-floppy.c b/drivers/ide/ide-floppy.c
index 04a3578..c428c74 100644
--- a/drivers/ide/ide-floppy.c
+++ b/drivers/ide/ide-floppy.c
@@ -85,7 +85,6 @@
 #include <linux/module.h>
 #include <linux/types.h>
 #include <linux/string.h>
-#include <linux/kernel.h>
 #include <linux/delay.h>
 #include <linux/timer.h>
 #include <linux/mm.h>
@@ -107,21 +106,19 @@
 #include <asm/io.h>
 #include <asm/unaligned.h>
 
+#ifdef BLK_DEV_IDETAPE_DEBUG
+	#define DEBUG 1
+#endif
+#include <linux/kernel.h>
 /*
  *	The following are used to debug the driver.
  */
-#define IDEFLOPPY_DEBUG_LOG		0
 #define IDEFLOPPY_DEBUG_INFO		0
 #define IDEFLOPPY_DEBUG_BUGS		1
 
 /* #define IDEFLOPPY_DEBUG(fmt, args...) printk(KERN_INFO fmt, ## args) */
 #define IDEFLOPPY_DEBUG( fmt, args... )
 
-#if IDEFLOPPY_DEBUG_LOG
-#define debug_log printk
-#else
-#define debug_log(fmt, args... ) do {} while(0)
-#endif
 
 
 /*
@@ -579,7 +576,7 @@ static int idefloppy_do_end_request(ide_drive_t *drive, int uptodate, int nsecs)
 	struct request *rq = HWGROUP(drive)->rq;
 	int error;
 
-	debug_log(KERN_INFO "Reached idefloppy_end_request\n");
+	printk(KERN_INFO "Reached idefloppy_end_request\n");
 
 	switch (uptodate) {
 		case 0: error = IDEFLOPPY_ERROR_GENERAL; break;
@@ -725,11 +722,11 @@ static void idefloppy_analyze_error (ide_drive_t *drive,idefloppy_request_sense_
 	floppy->progress_indication = result->sksv[0] & 0x80 ?
 		(u16)get_unaligned((u16 *)(result->sksv+1)):0x10000;
 	if (floppy->failed_pc)
-		debug_log(KERN_INFO "ide-floppy: pc = %x, sense key = %x, "
+		printk(KERN_INFO "ide-floppy: pc = %x, sense key = %x, "
 			"asc = %x, ascq = %x\n", floppy->failed_pc->c[0],
 			result->sense_key, result->asc, result->ascq);
 	else
-		debug_log(KERN_INFO "ide-floppy: sense key = %x, asc = %x, "
+		printk(KERN_INFO "ide-floppy: sense key = %x, asc = %x, "
 			"ascq = %x\n", result->sense_key,
 			result->asc, result->ascq);
 }
@@ -738,7 +735,7 @@ static void idefloppy_request_sense_callback (ide_drive_t *drive)
 {
 	idefloppy_floppy_t *floppy = drive->driver_data;
 
-	debug_log(KERN_INFO "ide-floppy: Reached %s\n", __FUNCTION__);
+	printk(KERN_INFO "ide-floppy: Reached %s\n", __FUNCTION__);
 	
 	if (!floppy->pc->error) {
 		idefloppy_analyze_error(drive,(idefloppy_request_sense_result_t *) floppy->pc->buffer);
@@ -756,7 +753,7 @@ static void idefloppy_pc_callback (ide_drive_t *drive)
 {
 	idefloppy_floppy_t *floppy = drive->driver_data;
 	
-	debug_log(KERN_INFO "ide-floppy: Reached %s\n", __FUNCTION__);
+	printk(KERN_INFO "ide-floppy: Reached %s\n", __FUNCTION__);
 
 	idefloppy_do_end_request(drive, floppy->pc->error ? 0 : 1, 0);
 }
@@ -816,7 +813,7 @@ static ide_startstop_t idefloppy_pc_intr (ide_drive_t *drive)
 	struct request *rq = pc->rq;
 	unsigned int temp;
 
-	debug_log(KERN_INFO "ide-floppy: Reached %s interrupt handler\n",
+	printk(KERN_INFO "ide-floppy: Reached %s interrupt handler\n",
 		__FUNCTION__);
 
 	if (test_bit(PC_DMA_IN_PROGRESS, &pc->flags)) {
@@ -826,14 +823,14 @@ static ide_startstop_t idefloppy_pc_intr (ide_drive_t *drive)
 			pc->actually_transferred = pc->request_transfer;
 			idefloppy_update_buffers(drive, pc);
 		}
-		debug_log(KERN_INFO "ide-floppy: DMA finished\n");
+		printk(KERN_INFO "ide-floppy: DMA finished\n");
 	}
 
 	/* Clear the interrupt */
 	status.all = HWIF(drive)->INB(IDE_STATUS_REG);
 
 	if (!status.b.drq) {			/* No more interrupts */
-		debug_log(KERN_INFO "Packet command completed, %d bytes "
+		printk(KERN_INFO "Packet command completed, %d bytes "
 			"transferred\n", pc->actually_transferred);
 		clear_bit(PC_DMA_IN_PROGRESS, &pc->flags);
 
@@ -841,7 +838,7 @@ static ide_startstop_t idefloppy_pc_intr (ide_drive_t *drive)
 
 		if (status.b.check || test_bit(PC_DMA_ERROR, &pc->flags)) {
 			/* Error detected */
-			debug_log(KERN_INFO "ide-floppy: %s: I/O error\n",
+			printk(KERN_INFO "ide-floppy: %s: I/O error\n",
 				drive->name);
 			rq->errors++;
 			if (pc->c[0] = IDEFLOPPY_REQUEST_SENSE_CMD) {
@@ -903,7 +900,7 @@ static ide_startstop_t idefloppy_pc_intr (ide_drive_t *drive)
 						NULL);
 				return ide_started;
 			}
-			debug_log(KERN_NOTICE "ide-floppy: The floppy wants to "
+			printk(KERN_NOTICE "ide-floppy: The floppy wants to "
 				"send us more data than expected - "
 				"allowing transfer\n");
 		}
@@ -1087,7 +1084,7 @@ static ide_startstop_t idefloppy_issue_pc (ide_drive_t *drive, idefloppy_pc_t *p
 		return ide_stopped;
 	}
 
-	debug_log(KERN_INFO "Retry number - %d\n",pc->retries);
+	printk(KERN_INFO "Retry number - %d\n", pc->retries);
 
 	pc->retries++;
 	/* We haven't transferred any data yet */
@@ -1141,7 +1138,7 @@ static ide_startstop_t idefloppy_issue_pc (ide_drive_t *drive, idefloppy_pc_t *p
 
 static void idefloppy_rw_callback (ide_drive_t *drive)
 {
-	debug_log(KERN_INFO "ide-floppy: Reached idefloppy_rw_callback\n");
+	printk(KERN_INFO "ide-floppy: Reached idefloppy_rw_callback\n");
 
 	idefloppy_do_end_request(drive, 1, 0);
 	return;
@@ -1149,7 +1146,7 @@ static void idefloppy_rw_callback (ide_drive_t *drive)
 
 static void idefloppy_create_prevent_cmd (idefloppy_pc_t *pc, int prevent)
 {
-	debug_log(KERN_INFO "ide-floppy: creating prevent removal command, "
+	printk(KERN_INFO "ide-floppy: creating prevent removal command, "
 		"prevent = %d\n", prevent);
 
 	idefloppy_init_pc(pc);
@@ -1233,7 +1230,7 @@ static void idefloppy_create_rw_cmd (idefloppy_floppy_t *floppy, idefloppy_pc_t
 	int blocks = rq->nr_sectors / floppy->bs_factor;
 	int cmd = rq_data_dir(rq);
 
-	debug_log("create_rw1%d_cmd: block = %d, blocks = %d\n",
+	printk(KERN_DEBUG "create_rw1%d_cmd: block = %d, blocks = %d\n",
 		2 * test_bit (IDEFLOPPY_USE_READ12, &floppy->flags),
 		block, blocks);
 
@@ -1286,10 +1283,10 @@ static ide_startstop_t idefloppy_do_request (ide_drive_t *drive, struct request
 	idefloppy_pc_t *pc;
 	unsigned long block = (unsigned long)block_s;
 
-	debug_log(KERN_INFO "dev: %s, flags: %lx, errors: %d\n",
+	printk(KERN_INFO "dev: %s, flags: %lx, errors: %d\n",
 			rq->rq_disk ? rq->rq_disk->disk_name : "?",
 			rq->flags, rq->errors);
-	debug_log(KERN_INFO "sector: %ld, nr_sectors: %ld, "
+	printk(KERN_INFO "sector: %ld, nr_sectors: %ld, "
 			"current_nr_sectors: %d\n", (long)rq->sector,
 			rq->nr_sectors, rq->current_nr_sectors);
 
@@ -1498,10 +1495,10 @@ static int idefloppy_get_capacity (ide_drive_t *drive)
 		}
 		}
 		if (!i) {
-			debug_log( "Descriptor 0 Code: %d\n",
+			printk(KERN_DEBUG "Descriptor 0 Code: %d\n",
 				descriptor->dc);
 		}
-		debug_log( "Descriptor %d: %dkB, %d blocks, %d "
+		printk(KERN_DEBUG "Descriptor %d: %dkB, %d blocks, %d "
 			"sector size\n", i, blocks * length / 1024, blocks,
 			length);
 	}
@@ -1945,7 +1942,7 @@ static int idefloppy_open(struct inode *inode, struct file *filp)
 	idefloppy_pc_t pc;
 	int ret = 0;
 
-	debug_log(KERN_INFO "Reached idefloppy_open\n");
+	printk(KERN_INFO "Reached idefloppy_open\n");
 
 	if (!(floppy = ide_floppy_get(disk)))
 		return -ENXIO;
@@ -2006,7 +2003,7 @@ static int idefloppy_release(struct inode *inode, struct file *filp)
 	ide_drive_t *drive = floppy->drive;
 	idefloppy_pc_t pc;
 	
-	debug_log(KERN_INFO "Reached idefloppy_release\n");
+	printk(KERN_INFO "Reached idefloppy_release\n");
 
 	if (floppy->openers = 1) {
 		/* IOMEGA Clik! drives do not support lock/unlock commands */
