From: Michael Veeck <michael.veeck@gmx.net>
Date: Thu, 26 Feb 2004 21:17:25 +0000
Subject: [Kernel-janitors] [PATCH] drivers/ide IDE_MIN/IDE_MAX removal
Message-Id: <403E6265.6080200@gmx.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------020200060101030508080706"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------020200060101030508080706
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Patch (against 2.6.3) removes unnecessary min/max macros and changes
calls to use kernel.h macros instead.

Best Regards
Michael



--------------020200060101030508080706
Content-Type: text/plain;
 name="minmax_ide_min.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="minmax_ide_min.patch"

diff -Naur linux-2.6.3.org/include/linux/ide.h linux-2.6.3.test/include/linux/ide.h
--- linux-2.6.3.org/include/linux/ide.h	2004-02-18 04:57:28.000000000 +0100
+++ linux-2.6.3.test/include/linux/ide.h	2004-02-26 21:28:26.000000000 +0100
@@ -237,8 +237,6 @@
 #define SECTOR_SIZE	512
 #define SECTOR_WORDS	(SECTOR_SIZE / 4)	/* number of 32bit words per sector */
 #define IDE_LARGE_SEEK(b1,b2,t)	(((b1) > (b2) + (t)) || ((b2) > (b1) + (t)))
-#define IDE_MIN(a,b)	((a)<(b) ? (a):(b))
-#define IDE_MAX(a,b)	((a)>(b) ? (a):(b))

 /*
  * Timeouts for various operations:
diff -Naur linux-2.6.3.org/drivers/ide/legacy/qd65xx.c linux-2.6.3.test/drivers/ide/legacy/qd65xx.c
--- linux-2.6.3.org/drivers/ide/legacy/qd65xx.c	2004-02-18 04:57:17.000000000 +0100
+++ linux-2.6.3.test/drivers/ide/legacy/qd65xx.c	2004-02-26 21:34:17.000000000 +0100
@@ -262,7 +262,7 @@

 	if (drive->id && !qd_find_disk_type(drive, &active_time, &recovery_time)) {
 		pio = ide_get_best_pio_mode(drive, pio, 255, &d);
-		pio = IDE_MIN(pio,4);
+		pio = min_t(u8, pio,4);

 		switch (pio) {
 			case 0: break;
diff -Naur linux-2.6.3.org/drivers/ide/pci/cmd64x.c linux-2.6.3.test/drivers/ide/pci/cmd64x.c
--- linux-2.6.3.org/drivers/ide/pci/cmd64x.c	2004-02-18 04:59:22.000000000 +0100
+++ linux-2.6.3.test/drivers/ide/pci/cmd64x.c	2004-02-26 21:30:18.000000000 +0100
@@ -200,7 +200,7 @@
 	 */
 	if (channel) {
 		drive->drive_data = setup_count;
-		setup_count = IDE_MAX(drives[0].drive_data,
+		setup_count = max(drives[0].drive_data,
 					drives[1].drive_data);
 		cmdprintk("Secondary interface, setup_count = %d\n",
 					setup_count);
diff -Naur linux-2.6.3.org/drivers/ide/pci/via82cxxx.c linux-2.6.3.test/drivers/ide/pci/via82cxxx.c
--- linux-2.6.3.org/drivers/ide/pci/via82cxxx.c	2004-02-18 04:57:11.000000000 +0100
+++ linux-2.6.3.test/drivers/ide/pci/via82cxxx.c	2004-02-26 21:34:25.000000000 +0100
@@ -375,7 +375,7 @@
 		return;
 	}

-	via_set_drive(drive, XFER_PIO_0 + MIN(pio, 5));
+	via_set_drive(drive, XFER_PIO_0 + min_t(u8, pio, 5));
 }
 
 /**
diff -Naur linux-2.6.3.org/drivers/ide/ide-io.c linux-2.6.3.test/drivers/ide/ide-io.c
--- linux-2.6.3.org/drivers/ide/ide-io.c	2004-02-18 04:59:13.000000000 +0100
+++ linux-2.6.3.test/drivers/ide/ide-io.c	2004-02-26 21:36:06.000000000 +0100
@@ -743,7 +743,7 @@
 				 && 0 < (signed long)(WAKEUP(drive) - (jiffies - best->service_time))
 				 && 0 < (signed long)((jiffies + t) - WAKEUP(drive)))
 				{
-					ide_stall_queue(best, IDE_MIN(t, 10 * WAIT_MIN_SLEEP));
+					ide_stall_queue(best, min_t(long, t, 10 * WAIT_MIN_SLEEP));
 					goto repeat;
 				}
 			} while ((drive = drive->next) != best);
diff -Naur linux-2.6.3.org/drivers/ide/ide-proc.c linux-2.6.3.test/drivers/ide/ide-proc.c
--- linux-2.6.3.org/drivers/ide/ide-proc.c	2004-02-18 04:58:06.000000000 +0100
+++ linux-2.6.3.test/drivers/ide/ide-proc.c	2004-02-26 21:51:48.765949264 +0100
@@ -523,8 +523,8 @@
 			}
 			if (*p != ':')
 				goto parse_error;
-			len = IDE_MIN(p - start, MAX_LEN);
-			strncpy(name, start, IDE_MIN(len, MAX_LEN));
+			len = min(p - start, MAX_LEN);
+			strncpy(name, start, min(len, MAX_LEN));
 			name[len] = 0;

 			if (n > 0) {
diff -Naur linux-2.6.3.org/drivers/scsi/ide-scsi.c linux-2.6.3.test/drivers/scsi/ide-scsi.c
--- linux-2.6.3.org/drivers/scsi/ide-scsi.c	2004-02-18 04:58:35.000000000 +0100
+++ linux-2.6.3.test/drivers/scsi/ide-scsi.c	2004-02-26 21:39:37.000000000 +0100
@@ -145,7 +145,7 @@
 			idescsi_discard_data (drive, bcount);
 			return;
 		}
-		count = IDE_MIN (pc->sg->length - pc->b_count, bcount);
+		count = min(pc->sg->length - pc->b_count, bcount);
 		buf = page_address(pc->sg->page) + pc->sg->offset;
 		atapi_input_bytes (drive, buf + pc->b_count, count);
 		bcount -= count; pc->b_count += count;
@@ -167,7 +167,7 @@
 			idescsi_output_zeros (drive, bcount);
 			return;
 		}
-		count = IDE_MIN (pc->sg->length - pc->b_count, bcount);
+		count = min(pc->sg->length - pc->b_count, bcount);
 		buf = page_address(pc->sg->page) + pc->sg->offset;
 		atapi_output_bytes (drive, buf + pc->b_count, count);
 		bcount -= count; pc->b_count += count;
@@ -354,7 +354,7 @@
 			if (!test_bit(PC_WRITING, &pc->flags) && pc->actually_transferred && pc->actually_transferred <= 1024 && pc->buffer) {
 				printk(", rst = ");
 				scsi_buf = pc->scsi_cmd->request_buffer;
-				hexdump(scsi_buf, IDE_MIN(16, pc->scsi_cmd->request_bufflen));
+				hexdump(scsi_buf, min_t(int, 16, pc->scsi_cmd->request_bufflen));
 			} else printk("\n");
 		}
 	}
@@ -371,7 +371,7 @@
 
 static inline unsigned long get_timeout(idescsi_pc_t *pc)
 {
-	return IDE_MAX(WAIT_CMD, pc->timeout - jiffies);
+	return max_t(long, WAIT_CMD, pc->timeout - jiffies);
 }
 
 /*
@@ -515,7 +515,7 @@
 	scsi->pc=pc;							/* Set the current packet command */
 	pc->actually_transferred=0;					/* We haven't transferred any data yet */
 	pc->current_position=pc->buffer;
-	bcount.all = IDE_MIN(pc->request_transfer, 63 * 1024);		/* Request to transfer the entire buffer at once */
+	bcount.all = min(pc->request_transfer, 63 * 1024);		/* Request to transfer the entire buffer at once */
 
 	feature.all = 0;
 	if (drive->using_dma && rq->bio) {

--------------020200060101030508080706
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------020200060101030508080706--
