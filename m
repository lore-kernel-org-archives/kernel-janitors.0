From: Richard <h.vanberkum@chello.nl>
Date: Mon, 31 Jul 2006 00:22:38 +0000
Subject: [KJ] [PATCH] drivers/block/acsi.c: Add KERN_* to printk statements
Message-Id: <20060731002238.GA10973@chello.nl>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Add KERN_*  to printk statements

Signed-off-by: Richard van Berkum <h.vanberkum@chello.nl> 
---


--- linux-2.6/drivers/block/acsi.c	2006-07-06 16:58:04.824452120 +0200
+++ mytree/drivers/block/acsi.c	2006-07-31 01:40:48.074139664 +0200
@@ -480,7 +480,7 @@
 
 #ifdef NO_WRITE
 	if (rwflag || *cmd = 0x0a) {
-		printk( "ACSI: Write commands disabled!\n" );
+		printk( KERN_INFO "ACSI: Write commands disabled!\n" );
 		return( 0 );
 	}
 #endif
@@ -622,7 +622,7 @@
 		status = dma_wd.fdc_acces_seccount;
 		if (status != 0xff) break;
 #ifdef DEBUG
-		printk("ACSI: skipping 0xff status byte\n" );
+		printk( KERN_DEBUG "ACSI: skipping 0xff status byte\n" );
 #endif
 		udelay(40);
 		acsi_wait_for_noIRQ( 20 );
@@ -972,7 +972,7 @@
 	block = CURRENT->sector;
 	if (block+CURRENT->nr_sectors >= get_capacity(disk)) {
 #ifdef DEBUG
-		printk( "%s: attempted access for blocks %d...%ld past end of device at block %ld.\n",
+		printk( KERN_DEBUG "%s: attempted access for blocks %d...%ld past end of device at block %ld.\n",
 		       disk->disk_name,
 		       block, block + CURRENT->nr_sectors - 1,
 		       get_capacity(disk));
@@ -1305,7 +1305,7 @@
 
 #ifdef DEBUG
 		{	int i;
-		printk( "Mode sense data for ACSI target %d, lun %d seem not valid:",
+		printk( KERN_DEBUG "Mode sense data for ACSI target %d, lun %d seem not valid:",
 				target, lun );
 		for( i = 0; i < sizeof(SENSE_DATA); ++i )
 			printk( "%02x ", (unsigned char)acsi_buffer[i] );
@@ -1423,7 +1423,7 @@
 	if (!acsicmd_nodma(tur_cmd, 0)) {
 		/* timed out -> no device here */
 #ifdef DEBUG_DETECT
-		printk("target %d lun %d: timeout\n", aip->target, aip->lun);
+		printk( KERN_DEBUG "target %d lun %d: timeout\n", aip->target, aip->lun);
 #endif
 		return DEV_NONE;
 	}
@@ -1470,7 +1470,7 @@
 			if (extsense != UNIT_ATTENTION &&
 			    extsense != NOT_READY) {
 #ifdef DEBUG_DETECT
-				printk("target %d lun %d: extended sense %d\n",
+				printk( KERN_DEBUG "target %d lun %d: extended sense %d\n",
 				       aip->target, aip->lun, extsense);
 #endif
 				return DEV_UNKNOWN;
@@ -1479,7 +1479,7 @@
 		else {
 			if (reqsense & 0x7f) {
 #ifdef DEBUG_DETECT
-				printk("target %d lun %d: sense %d\n",
+				printk( KERN_DEBUG "target %d lun %d: sense %d\n",
 				       aip->target, aip->lun, reqsense);
 #endif
 				return DEV_UNKNOWN;
@@ -1489,7 +1489,7 @@
 	else 
 		if (reqsense = 0x4) {	/* SH204 Bug workaround */
 #ifdef DEBUG_DETECT
-			printk("target %d lun %d status=0 sense=4\n",
+			printk( KERN_DEBUG "target %d lun %d status=0 sense=4\n",
 			       aip->target, aip->lun);
 #endif
 			return DEV_UNKNOWN;
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
