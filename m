From: Eric Sesterhenn / snakebyte <snakebyte@gmx.de>
Date: Wed, 01 Feb 2006 15:13:04 +0000
Subject: [KJ] [Patch 3/4] ide cleanups - remove unneeded BUG_ON()
Message-Id: <1138806784.22662.26.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============32980545660920013=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============32980545660920013==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

this patch removes a bunch of BUG_ON() checks for
the hwgroup handler, since __ide_set_handler bugs
now if it is already set.

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.16-rc1-git4/drivers/ide/ide-cd.c.orig	2006-02-01 15:49:35.000000000 +0100
+++ linux-2.6.16-rc1-git4/drivers/ide/ide-cd.c	2006-02-01 15:49:42.000000000 +0100
@@ -1721,8 +1721,6 @@ static ide_startstop_t cdrom_newpc_intr(
 		}
 	}
 
-	BUG_ON(drive->hwif->hwgroup->handler != NULL);
-
 	ide_set_handler(drive, cdrom_newpc_intr, rq->timeout, NULL);
 	return ide_started;
 
--- linux-2.6.16-rc1-git4/drivers/ide/ide-floppy.c.orig	2006-02-01 15:49:57.000000000 +0100
+++ linux-2.6.16-rc1-git4/drivers/ide/ide-floppy.c	2006-02-01 15:50:22.000000000 +0100
@@ -897,7 +897,6 @@ static ide_startstop_t idefloppy_pc_intr
 					"to send us more data than expected "
 					"- discarding data\n");
 				idefloppy_discard_data(drive,bcount.all);
-				BUG_ON(drive->hwif->hwgroup->handler != NULL);
 				ide_set_handler(drive,
 						&idefloppy_pc_intr,
 						IDEFLOPPY_WAIT_CMD,
@@ -930,7 +929,6 @@ static ide_startstop_t idefloppy_pc_intr
 	pc->actually_transferred += bcount.all;
 	pc->current_position += bcount.all;
 
-	BUG_ON(drive->hwif->hwgroup->handler != NULL);
 	ide_set_handler(drive, &idefloppy_pc_intr, IDEFLOPPY_WAIT_CMD, NULL);		/* And set the interrupt handler again */
 	return ide_started;
 }
@@ -957,7 +955,6 @@ static ide_startstop_t idefloppy_transfe
 				"issuing a packet command\n");
 		return ide_do_reset(drive);
 	}
-	BUG_ON(drive->hwif->hwgroup->handler != NULL);
 	/* Set the interrupt routine */
 	ide_set_handler(drive, &idefloppy_pc_intr, IDEFLOPPY_WAIT_CMD, NULL);
 	/* Send the actual packet */
@@ -1013,7 +1010,6 @@ static ide_startstop_t idefloppy_transfe
 	 * 40 and 50msec work well. idefloppy_pc_intr will not be actually
 	 * used until after the packet is moved in about 50 msec.
 	 */
-	BUG_ON(drive->hwif->hwgroup->handler != NULL);
 	ide_set_handler(drive, 
 	  &idefloppy_pc_intr, 		/* service routine for packet command */
 	  floppy->ticks,		/* wait this long before "failing" */
--- linux-2.6.16-rc1-git4/drivers/ide/ide-iops.c.orig	2006-02-01 15:50:34.000000000 +0100
+++ linux-2.6.16-rc1-git4/drivers/ide/ide-iops.c	2006-02-01 15:51:07.000000000 +0100
@@ -981,7 +981,6 @@ static ide_startstop_t atapi_reset_pollf
 		printk("%s: ATAPI reset complete\n", drive->name);
 	} else {
 		if (time_before(jiffies, hwgroup->poll_timeout)) {
-			BUG_ON(drive->hwif->hwgroup->handler != NULL);
 			ide_set_handler(drive, &atapi_reset_pollfunc, HZ/20, NULL);
 			/* continue polling */
 			return ide_started;
@@ -1020,7 +1019,6 @@ static ide_startstop_t reset_pollfunc (i
 
 	if (!OK_STAT(tmp = hwif->INB(IDE_STATUS_REG), 0, BUSY_STAT)) {
 		if (time_before(jiffies, hwgroup->poll_timeout)) {
-			BUG_ON(drive->hwif->hwgroup->handler != NULL);
 			ide_set_handler(drive, &reset_pollfunc, HZ/20, NULL);
 			/* continue polling */
 			return ide_started;
--- linux-2.6.16-rc1-git4/drivers/ide/ide-taskfile.c.orig	2006-02-01 15:51:16.000000000 +0100
+++ linux-2.6.16-rc1-git4/drivers/ide/ide-taskfile.c	2006-02-01 15:51:21.000000000 +0100
@@ -195,7 +195,6 @@ ide_startstop_t set_geometry_intr (ide_d
 	if (stat & (ERR_STAT|DRQ_STAT))
 		return ide_error(drive, "set_geometry_intr", stat);
 
-	BUG_ON(drive->hwif->hwgroup->handler != NULL);
 	ide_set_handler(drive, &set_geometry_intr, WAIT_WORSTCASE, NULL);
 	return ide_started;
 }
--- linux-2.6.16-rc1-git4/drivers/ide/pci/trm290.c.orig	2006-02-01 15:51:44.000000000 +0100
+++ linux-2.6.16-rc1-git4/drivers/ide/pci/trm290.c	2006-02-01 15:51:50.000000000 +0100
@@ -183,7 +183,6 @@ static void trm290_ide_dma_exec_cmd(ide_
 {
 	ide_hwif_t *hwif	= HWIF(drive);
 
-	BUG_ON(drive->hwif->hwgroup->handler != NULL);	/* paranoia check */
 	ide_set_handler(drive, &ide_dma_intr, WAIT_CMD, NULL);
 	/* issue cmd to drive */
 	hwif->OUTB(command, IDE_COMMAND_REG);



--===============32980545660920013==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============32980545660920013==--
