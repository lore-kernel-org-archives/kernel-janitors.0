From: Eric Sesterhenn / snakebyte <snakebyte@gmx.de>
Date: Wed, 01 Feb 2006 00:28:03 +0000
Subject: [KJ] [Patch] BUG_ON() Conversion in drivers/ide/
Message-Id: <1138753683.9742.11.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============87682997259657136=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1138753677.9742.10.camel@alice>
In-Reply-To: <1138753677.9742.10.camel@alice>
To: kernel-janitors@vger.kernel.org

--===============87682997259657136==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

this changes if() BUG(); constructs to BUG_ON() which is
cleaner, contains unlikely() and can better optimized away.

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.16-rc1-git4/drivers/ide/ide.c.orig	2006-01-31 21:09:17.000000000 +0100
+++ linux-2.6.16-rc1-git4/drivers/ide/ide.c	2006-01-31 21:10:49.000000000 +0100
@@ -1367,8 +1367,7 @@ int generic_ide_ioctl(ide_drive_t *drive
 
 			ide_abort(drive, "drive reset");
 
-			if(HWGROUP(drive)->handler)
-				BUG();
+			BUG_ON(HWGROUP(drive)->handler);
 				
 			/* Ensure nothing gets queued after we
 			   drop the lock. Reset will clear the busy */
--- linux-2.6.16-rc1-git4/drivers/ide/ide-cd.c.orig	2006-01-31 21:13:27.000000000 +0100
+++ linux-2.6.16-rc1-git4/drivers/ide/ide-cd.c	2006-01-31 21:13:39.000000000 +0100
@@ -1721,8 +1721,7 @@ static ide_startstop_t cdrom_newpc_intr(
 		}
 	}
 
-	if (HWGROUP(drive)->handler != NULL)
-		BUG();
+	BUG_ON(HWGROUP(drive)->handler != NULL);
 
 	ide_set_handler(drive, cdrom_newpc_intr, rq->timeout, NULL);
 	return ide_started;
--- linux-2.6.16-rc1-git4/drivers/ide/ide-dma.c.orig	2006-01-31 21:11:13.000000000 +0100
+++ linux-2.6.16-rc1-git4/drivers/ide/ide-dma.c	2006-01-31 21:11:35.000000000 +0100
@@ -206,8 +206,7 @@ int ide_build_sglist(ide_drive_t *drive,
 	ide_hwif_t *hwif = HWIF(drive);
 	struct scatterlist *sg = hwif->sg_table;
 
-	if ((rq->flags & REQ_DRIVE_TASKFILE) && rq->nr_sectors > 256)
-		BUG();
+	BUG_ON((rq->flags & REQ_DRIVE_TASKFILE) && rq->nr_sectors > 256);
 
 	ide_map_sg(drive, rq);
 
@@ -947,8 +946,7 @@ void ide_setup_dma (ide_hwif_t *hwif, un
 	}
 	printk("\n");
 
-	if (!(hwif->dma_master))
-		BUG();
+	BUG_ON(!(hwif->dma_master));
 }
 
 EXPORT_SYMBOL_GPL(ide_setup_dma);
--- linux-2.6.16-rc1-git4/drivers/ide/ide-floppy.c.orig	2006-01-31 21:12:15.000000000 +0100
+++ linux-2.6.16-rc1-git4/drivers/ide/ide-floppy.c	2006-01-31 21:13:19.000000000 +0100
@@ -897,8 +897,7 @@ static ide_startstop_t idefloppy_pc_intr
 					"to send us more data than expected "
 					"- discarding data\n");
 				idefloppy_discard_data(drive,bcount.all);
-				if (HWGROUP(drive)->handler != NULL)
-					BUG();
+				BUG_ON(HWGROUP(drive)->handler != NULL);
 				ide_set_handler(drive,
 						&idefloppy_pc_intr,
 						IDEFLOPPY_WAIT_CMD,
@@ -931,8 +930,7 @@ static ide_startstop_t idefloppy_pc_intr
 	pc->actually_transferred += bcount.all;
 	pc->current_position += bcount.all;
 
-	if (HWGROUP(drive)->handler != NULL)
-		BUG();
+	BUG_ON(HWGROUP(drive)->handler != NULL);
 	ide_set_handler(drive, &idefloppy_pc_intr, IDEFLOPPY_WAIT_CMD, NULL);		/* And set the interrupt handler again */
 	return ide_started;
 }
@@ -959,8 +957,7 @@ static ide_startstop_t idefloppy_transfe
 				"issuing a packet command\n");
 		return ide_do_reset(drive);
 	}
-	if (HWGROUP(drive)->handler != NULL)
-		BUG();
+	BUG_ON(HWGROUP(drive)->handler != NULL);
 	/* Set the interrupt routine */
 	ide_set_handler(drive, &idefloppy_pc_intr, IDEFLOPPY_WAIT_CMD, NULL);
 	/* Send the actual packet */
@@ -1016,8 +1013,7 @@ static ide_startstop_t idefloppy_transfe
 	 * 40 and 50msec work well. idefloppy_pc_intr will not be actually
 	 * used until after the packet is moved in about 50 msec.
 	 */
-	if (HWGROUP(drive)->handler != NULL)
-		BUG();
+	BUG_ON(HWGROUP(drive)->handler != NULL);
 	ide_set_handler(drive, 
 	  &idefloppy_pc_intr, 		/* service routine for packet command */
 	  floppy->ticks,		/* wait this long before "failing" */
--- linux-2.6.16-rc1-git4/drivers/ide/ide-iops.c.orig	2006-01-31 21:13:48.000000000 +0100
+++ linux-2.6.16-rc1-git4/drivers/ide/ide-iops.c	2006-01-31 21:14:28.000000000 +0100
@@ -939,8 +939,7 @@ void ide_execute_command(ide_drive_t *dr
 	
 	spin_lock_irqsave(&ide_lock, flags);
 	
-	if(hwgroup->handler)
-		BUG();
+	BUG_ON(hwgroup->handler);
 	hwgroup->handler	= handler;
 	hwgroup->expiry		= expiry;
 	hwgroup->timer.expires	= jiffies + timeout;
@@ -981,8 +980,7 @@ static ide_startstop_t atapi_reset_pollf
 		printk("%s: ATAPI reset complete\n", drive->name);
 	} else {
 		if (time_before(jiffies, hwgroup->poll_timeout)) {
-			if (HWGROUP(drive)->handler != NULL)
-				BUG();
+			BUG_ON(HWGROUP(drive)->handler != NULL);
 			ide_set_handler(drive, &atapi_reset_pollfunc, HZ/20, NULL);
 			/* continue polling */
 			return ide_started;
@@ -1021,8 +1019,7 @@ static ide_startstop_t reset_pollfunc (i
 
 	if (!OK_STAT(tmp = hwif->INB(IDE_STATUS_REG), 0, BUSY_STAT)) {
 		if (time_before(jiffies, hwgroup->poll_timeout)) {
-			if (HWGROUP(drive)->handler != NULL)
-				BUG();
+			BUG_ON(HWGROUP(drive)->handler != NULL);
 			ide_set_handler(drive, &reset_pollfunc, HZ/20, NULL);
 			/* continue polling */
 			return ide_started;
@@ -1138,8 +1135,7 @@ static ide_startstop_t do_reset1 (ide_dr
 	hwgroup = HWGROUP(drive);
 
 	/* We must not reset with running handlers */
-	if(hwgroup->handler != NULL)
-		BUG();
+	BUG_ON(hwgroup->handler != NULL);
 
 	/* For an ATAPI device, first try an ATAPI SRST. */
 	if (drive->media != ide_disk && !do_not_try_atapi) {
--- linux-2.6.16-rc1-git4/drivers/ide/ide-lib.c.orig	2006-01-31 21:14:38.000000000 +0100
+++ linux-2.6.16-rc1-git4/drivers/ide/ide-lib.c	2006-01-31 21:14:48.000000000 +0100
@@ -164,8 +164,7 @@ u8 ide_rate_filter (u8 mode, u8 speed) 
 //	printk("%s: mode 0x%02x, speed 0x%02x\n", __FUNCTION__, mode, speed);
 
 	/* So that we remember to update this if new modes appear */
-	if (mode > 4)
-		BUG();
+	BUG_ON(mode > 4);
 	return min(speed, speed_max[mode]);
 #else /* !CONFIG_BLK_DEV_IDEDMA */
 	return min(speed, (u8)XFER_PIO_4);
--- linux-2.6.16-rc1-git4/drivers/ide/ide-taskfile.c.orig	2006-01-31 21:11:48.000000000 +0100
+++ linux-2.6.16-rc1-git4/drivers/ide/ide-taskfile.c	2006-01-31 21:12:04.000000000 +0100
@@ -195,8 +195,7 @@ ide_startstop_t set_geometry_intr (ide_d
 	if (stat & (ERR_STAT|DRQ_STAT))
 		return ide_error(drive, "set_geometry_intr", stat);
 
-	if (HWGROUP(drive)->handler != NULL)
-		BUG();
+	BUG_ON(HWGROUP(drive)->handler != NULL);
 	ide_set_handler(drive, &set_geometry_intr, WAIT_WORSTCASE, NULL);
 	return ide_started;
 }
--- linux-2.6.16-rc1-git4/drivers/ide/pci/trm290.c.orig	2006-01-31 21:15:10.000000000 +0100
+++ linux-2.6.16-rc1-git4/drivers/ide/pci/trm290.c	2006-01-31 21:15:27.000000000 +0100
@@ -183,8 +183,7 @@ static void trm290_ide_dma_exec_cmd(ide_
 {
 	ide_hwif_t *hwif	= HWIF(drive);
 
-	if (HWGROUP(drive)->handler != NULL)	/* paranoia check */
-		BUG();
+	BUG_ON(HWGROUP(drive)->handler != NULL);	/* paranoia check */
 	ide_set_handler(drive, &ide_dma_intr, WAIT_CMD, NULL);
 	/* issue cmd to drive */
 	hwif->OUTB(command, IDE_COMMAND_REG);



--===============87682997259657136==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============87682997259657136==--
