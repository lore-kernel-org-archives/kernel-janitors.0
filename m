From: Michael Veeck <michael.veeck@gmx.net>
Date: Thu, 26 Feb 2004 21:16:35 +0000
Subject: [Kernel-janitors] [PATCH] drivers/ide/ MIN/MAX removal
Message-Id: <403E6233.8080601@gmx.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------080605040802060903050508"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------080605040802060903050508
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Patch (against 2.6.3) removes unnecessary min/max macros and changes
calls to use kernel.h macros instead.

Regards
Michael



--------------080605040802060903050508
Content-Type: text/plain;
 name="minmax_drivers_ide.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="minmax_drivers_ide.patch"

diff -Nau linux-2.6.3.org/drivers/ide/ide-cd.c linux-2.6.3.test/drivers/ide/ide-cd.c
--- linux-2.6.3.org/drivers/ide/ide-cd.c	2004-02-18 04:57:46.000000000 +0100
+++ linux-2.6.3.test/drivers/ide/ide-cd.c	2004-02-20 15:45:14.000000000 +0100
@@ -1012,7 +1012,7 @@
 	struct cdrom_info *info = drive->driver_data;
 
 	/* Number of sectors to read into the buffer. */
-	int sectors_to_buffer = MIN (sectors_to_transfer,
+	int sectors_to_buffer = min_t(int, sectors_to_transfer,
 				     (SECTOR_BUFFER_SIZE >> SECTOR_BITS) -
 				       info->nsectors_buffered);
 
@@ -1161,7 +1161,7 @@
 
 	/* First, figure out if we need to bit-bucket
 	   any of the leading sectors. */
-	nskip = MIN((int)(rq->current_nr_sectors - bio_cur_sectors(rq->bio)), sectors_to_transfer);
+	nskip = min_t(int, (rq->current_nr_sectors - bio_cur_sectors(rq->bio)), sectors_to_transfer);
 
 	while (nskip > 0) {
 		/* We need to throw away a sector. */
@@ -1191,7 +1191,7 @@
 			/* Transfer data to the buffers.
 			   Figure out how many sectors we can transfer
 			   to the current buffer. */
-			this_transfer = MIN (sectors_to_transfer,
+			this_transfer = min_t(int, sectors_to_transfer,
 					     rq->current_nr_sectors);
 
 			/* Read this_transfer sectors
@@ -1907,7 +1907,7 @@
 		/*
 		 * Figure out how many sectors we can transfer
 		 */
-		this_transfer = MIN(sectors_to_transfer,rq->current_nr_sectors);
+		this_transfer = min_t(int, sectors_to_transfer,rq->current_nr_sectors);
 
 		while (this_transfer > 0) {
 			HWIF(drive)->atapi_output_bytes(drive, rq->buffer, SECTOR_SIZE);
diff -Nau linux-2.6.3.org/drivers/ide/ide-cd.h linux-2.6.3.test/drivers/ide/ide-cd.h
--- linux-2.6.3.org/drivers/ide/ide-cd.h	2004-02-18 04:59:56.000000000 +0100
+++ linux-2.6.3.test/drivers/ide/ide-cd.h	2004-02-20 15:42:16.000000000 +0100
@@ -54,8 +54,6 @@
 
 #define BLOCKS_PER_FRAME	(CD_FRAMESIZE / BLOCK_SIZE)
 
-#define MIN(a,b) ((a) < (b) ? (a) : (b))
-
 /* special command codes for strategy routine. */
 #define PACKET_COMMAND        4315
 #define REQUEST_SENSE_COMMAND 4316
diff -Nau linux-2.6.3.org/drivers/ide/ide-proc.c linux-2.6.3.test/drivers/ide/ide-proc.c
--- linux-2.6.3.org/drivers/ide/ide-proc.c	2004-02-18 04:58:06.000000000 +0100
+++ linux-2.6.3.test/drivers/ide/ide-proc.c	2004-02-20 15:41:41.000000000 +0100
@@ -74,10 +74,6 @@
 
 #include <asm/io.h>
 
-#ifndef MIN
-#define MIN(a,b) (((a) < (b)) ? (a) : (b))
-#endif
-
 static int ide_getxdigit(char c)
 {
 	int digit;
diff -Nau linux-2.6.3.org/drivers/ide/ide-tape.c linux-2.6.3.test/drivers/ide/ide-tape.c
--- linux-2.6.3.org/drivers/ide/ide-tape.c	2004-02-18 04:57:22.000000000 +0100
+++ linux-2.6.3.test/drivers/ide/ide-tape.c	2004-02-20 15:39:29.000000000 +0100
@@ -6298,7 +6298,7 @@
 	 *	Ensure that the number we got makes sense; limit
 	 *	it within IDETAPE_DSC_RW_MIN and IDETAPE_DSC_RW_MAX.
 	 */
-	tape->best_dsc_rw_frequency = max((unsigned long) min(t, (unsigned long) IDETAPE_DSC_RW_MAX), (unsigned long) IDETAPE_DSC_RW_MIN);
+	tape->best_dsc_rw_frequency = max_t(unsigned long, min_t(unsigned long, t, IDETAPE_DSC_RW_MAX), IDETAPE_DSC_RW_MIN);
 	printk(KERN_INFO "ide-tape: %s <-> %s: %dKBps, %d*%dkB buffer, "
 		"%dkB pipeline, %lums tDSC%s\n",
 		drive->name, tape->name, tape->capabilities.speed,
Common subdirectories: linux-2.6.3.org/drivers/ide/legacy and linux-2.6.3.test/drivers/ide/legacy
Common subdirectories: linux-2.6.3.org/drivers/ide/pci and linux-2.6.3.test/drivers/ide/pci
Common subdirectories: linux-2.6.3.org/drivers/ide/ppc and linux-2.6.3.test/drivers/ide/ppc

--------------080605040802060903050508
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------080605040802060903050508--
