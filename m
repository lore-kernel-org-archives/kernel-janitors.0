From: Eric Sesterhenn / snakebyte <snakebyte@gmx.de>
Date: Wed, 01 Feb 2006 15:12:49 +0000
Subject: [KJ] [Patch 1/4] ide cleanups - replace HWGROUP()
Message-Id: <1138806769.22662.24.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============90879508476659132=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============90879508476659132==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

this changes HWGROUP() usage to drive->hwif->hwgroup,
ask Bartlomiej for the reason :)

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.16-rc1-git4/drivers/ide/mips/au1xxx-ide.c.orig	2006-02-01 13:44:07.000000000 +0100
+++ linux-2.6.16-rc1-git4/drivers/ide/mips/au1xxx-ide.c	2006-02-01 13:44:38.000000000 +0100
@@ -273,7 +273,7 @@ static int auide_build_dmatable(ide_driv
 	int i, iswrite, count = 0;
 	ide_hwif_t *hwif = HWIF(drive);
 
-	struct request *rq = HWGROUP(drive)->rq;
+	struct request *rq = drive->hwif->hwgroup->rq;
 
 	_auide_hwif *ahwif = (_auide_hwif*)hwif->hwif_data;
 	struct scatterlist *sg;
@@ -379,7 +379,7 @@ static void auide_dma_exec_cmd(ide_drive
 
 static int auide_dma_setup(ide_drive_t *drive)
 {       	
-	struct request *rq = HWGROUP(drive)->rq;
+	struct request *rq = drive->hwif->hwgroup->rq;
 
 	if (!auide_build_dmatable(drive)) {
 		ide_map_sg(drive, rq);
--- linux-2.6.16-rc1-git4/drivers/ide/ide-io.c.orig	2006-02-01 13:44:51.000000000 +0100
+++ linux-2.6.16-rc1-git4/drivers/ide/ide-io.c	2006-02-01 13:46:37.000000000 +0100
@@ -78,13 +78,13 @@ int __ide_end_request(ide_drive_t *drive
 	 */
 	if (drive->state == DMA_PIO_RETRY && drive->retry_pio <= 3) {
 		drive->state = 0;
-		HWGROUP(drive)->hwif->ide_dma_on(drive);
+		drive->hwif->hwgroup->hwif->ide_dma_on(drive);
 	}
 
 	if (!end_that_request_first(rq, uptodate, nr_sectors)) {
 		add_disk_randomness(rq->rq_disk);
 		blkdev_dequeue_request(rq);
-		HWGROUP(drive)->rq = NULL;
+		drive->hwif->hwgroup->rq = NULL;
 		end_that_request_last(rq, uptodate);
 		ret = 0;
 	}
@@ -115,7 +115,7 @@ int ide_end_request (ide_drive_t *drive,
 	 * need the queue lock held at all
 	 */
 	spin_lock_irqsave(&ide_lock, flags);
-	rq = HWGROUP(drive)->rq;
+	rq = drive->hwif->hwgroup->rq;
 
 	if (!nr_sectors)
 		nr_sectors = rq->hard_cur_sectors;
@@ -244,7 +244,7 @@ static void ide_complete_pm_request (ide
 		blk_start_queue(drive->queue);
 	}
 	blkdev_dequeue_request(rq);
-	HWGROUP(drive)->rq = NULL;
+	drive->hwif->hwgroup->rq = NULL;
 	end_that_request_last(rq, 1);
 	spin_unlock_irqrestore(&ide_lock, flags);
 }
@@ -305,7 +305,7 @@ void ide_end_drive_cmd (ide_drive_t *dri
 	struct request *rq;
 
 	spin_lock_irqsave(&ide_lock, flags);
-	rq = HWGROUP(drive)->rq;
+	rq = drive->hwif->hwgroup->rq;
 	spin_unlock_irqrestore(&ide_lock, flags);
 
 	if (rq->flags & REQ_DRIVE_CMD) {
@@ -375,7 +375,7 @@ void ide_end_drive_cmd (ide_drive_t *dri
 
 	spin_lock_irqsave(&ide_lock, flags);
 	blkdev_dequeue_request(rq);
-	HWGROUP(drive)->rq = NULL;
+	drive->hwif->hwgroup->rq = NULL;
 	rq->errors = err;
 	end_that_request_last(rq, !rq->errors);
 	spin_unlock_irqrestore(&ide_lock, flags);
@@ -524,7 +524,7 @@ ide_startstop_t ide_error (ide_drive_t *
 
 	err = ide_dump_status(drive, msg, stat);
 
-	if ((rq = HWGROUP(drive)->rq) == NULL)
+	if ((rq = drive->hwif->hwgroup->rq) == NULL)
 		return ide_stopped;
 
 	/* retry only "normal" I/O: */
@@ -575,7 +575,7 @@ ide_startstop_t ide_abort(ide_drive_t *d
 {
 	struct request *rq;
 
-	if (drive == NULL || (rq = HWGROUP(drive)->rq) == NULL)
+	if (drive == NULL || (rq = drive->hwif->hwgroup->rq) == NULL)
 		return ide_stopped;
 
 	/* retry only "normal" I/O: */
@@ -628,7 +628,7 @@ static void ide_cmd (ide_drive_t *drive,
  
 static ide_startstop_t drive_cmd_intr (ide_drive_t *drive)
 {
-	struct request *rq = HWGROUP(drive)->rq;
+	struct request *rq = drive->hwif->hwgroup->rq;
 	ide_hwif_t *hwif = HWIF(drive);
 	u8 *args = (u8 *) rq->buffer;
 	u8 stat = hwif->INB(IDE_STATUS_REG);
@@ -1236,7 +1236,7 @@ void do_ide_request(request_queue_t *q)
 {
 	ide_drive_t *drive = q->queuedata;
 
-	ide_do_request(HWGROUP(drive), IDE_NO_IRQ);
+	ide_do_request(drive->hwif->hwgroup, IDE_NO_IRQ);
 }
 
 /*
@@ -1277,8 +1277,8 @@ static ide_startstop_t ide_dma_timeout_r
 	 * un-busy drive etc (hwgroup->busy is cleared on return) and
 	 * make sure request is sane
 	 */
-	rq = HWGROUP(drive)->rq;
-	HWGROUP(drive)->rq = NULL;
+	rq = drive->hwif->hwgroup->rq;
+	drive->hwif->hwgroup->rq = NULL;
 
 	rq->errors = 0;
 
@@ -1636,7 +1636,7 @@ EXPORT_SYMBOL(ide_init_drive_cmd);
 int ide_do_drive_cmd (ide_drive_t *drive, struct request *rq, ide_action_t action)
 {
 	unsigned long flags;
-	ide_hwgroup_t *hwgroup = HWGROUP(drive);
+	ide_hwgroup_t *hwgroup = drive->hwif->hwgroup;
 	DECLARE_COMPLETION(wait);
 	int where = ELEVATOR_INSERT_BACK, err;
 	int must_wait = (action == ide_wait || action == ide_head_wait);
--- linux-2.6.16-rc1-git4/drivers/ide/pci/pdc202xx_old.c.orig	2006-02-01 13:46:53.000000000 +0100
+++ linux-2.6.16-rc1-git4/drivers/ide/pci/pdc202xx_old.c	2006-02-01 13:47:02.000000000 +0100
@@ -413,7 +413,7 @@ static void pdc202xx_old_ide_dma_start(i
 	if (drive->current_speed > XFER_UDMA_2)
 		pdc_old_enable_66MHz_clock(drive->hwif);
 	if (drive->addressing == 1) {
-		struct request *rq	= HWGROUP(drive)->rq;
+		struct request *rq	= drive->hwif->hwgroup->rq;
 		ide_hwif_t *hwif	= HWIF(drive);
 //		struct pci_dev *dev	= hwif->pci_dev;
 //		unsgned long high_16	= pci_resource_start(dev, 4);
--- linux-2.6.16-rc1-git4/drivers/ide/pci/sgiioc4.c.orig	2006-02-01 13:47:17.000000000 +0100
+++ linux-2.6.16-rc1-git4/drivers/ide/pci/sgiioc4.c	2006-02-01 13:47:25.000000000 +0100
@@ -553,7 +553,7 @@ use_pio_instead:
 
 static int sgiioc4_ide_dma_setup(ide_drive_t *drive)
 {
-	struct request *rq = HWGROUP(drive)->rq;
+	struct request *rq = drive->hwif->hwgroup->rq;
 	unsigned int count = 0;
 	int ddir;
 
--- linux-2.6.16-rc1-git4/drivers/ide/pci/siimage.c.orig	2006-02-01 13:47:38.000000000 +0100
+++ linux-2.6.16-rc1-git4/drivers/ide/pci/siimage.c	2006-02-01 13:47:53.000000000 +0100
@@ -474,7 +474,7 @@ static int siimage_io_ide_dma_test_irq (
 static int siimage_mmio_ide_dma_count (ide_drive_t *drive)
 {
 #ifdef SIIMAGE_VIRTUAL_DMAPIO
-	struct request *rq	= HWGROUP(drive)->rq;
+	struct request *rq	= drive->hwif->hwgroup->rq;
 	ide_hwif_t *hwif	= HWIF(drive);
 	u32 count		= (rq->nr_sectors * SECTOR_SIZE);
 	u32 rcount		= 0;
@@ -596,7 +596,7 @@ static int siimage_reset_poll (ide_drive
 		if ((hwif->INL(SATA_STATUS_REG) & 0x03) != 0x03) {
 			printk(KERN_WARNING "%s: reset phy dead, status=0x%08x\n",
 				hwif->name, hwif->INL(SATA_STATUS_REG));
-			HWGROUP(drive)->polling = 0;
+			drive->hwif->hwgroup->polling = 0;
 			return ide_started;
 		}
 		return 0;
--- linux-2.6.16-rc1-git4/drivers/ide/pci/trm290.c.orig	2006-02-01 13:48:02.000000000 +0100
+++ linux-2.6.16-rc1-git4/drivers/ide/pci/trm290.c	2006-02-01 13:48:10.000000000 +0100
@@ -183,7 +183,7 @@ static void trm290_ide_dma_exec_cmd(ide_
 {
 	ide_hwif_t *hwif	= HWIF(drive);
 
-	BUG_ON(HWGROUP(drive)->handler != NULL);	/* paranoia check */
+	BUG_ON(drive->hwif->hwgroup->handler != NULL);	/* paranoia check */
 	ide_set_handler(drive, &ide_dma_intr, WAIT_CMD, NULL);
 	/* issue cmd to drive */
 	hwif->OUTB(command, IDE_COMMAND_REG);
--- linux-2.6.16-rc1-git4/drivers/ide/ppc/pmac.c.orig	2006-02-01 13:32:18.000000000 +0100
+++ linux-2.6.16-rc1-git4/drivers/ide/ppc/pmac.c	2006-02-01 13:32:59.000000000 +0100
@@ -1966,7 +1966,7 @@ pmac_ide_dma_setup(ide_drive_t *drive)
 {
 	ide_hwif_t *hwif = HWIF(drive);
 	pmac_ide_hwif_t* pmif = (pmac_ide_hwif_t *)hwif->hwif_data;
-	struct request *rq = HWGROUP(drive)->rq;
+	struct request *rq = drive->hwif->hwgroup->rq;
 	u8 unit = (drive->select.b.unit & 0x01);
 	u8 ata4;
 
--- linux-2.6.16-rc1-git4/drivers/ide/ide.c.orig	2006-02-01 13:33:47.000000000 +0100
+++ linux-2.6.16-rc1-git4/drivers/ide/ide.c	2006-02-01 13:34:42.000000000 +0100
@@ -1042,7 +1042,7 @@ int ide_read_setting (ide_drive_t *drive
 
 int ide_spin_wait_hwgroup (ide_drive_t *drive)
 {
-	ide_hwgroup_t *hwgroup = HWGROUP(drive);
+	ide_hwgroup_t *hwgroup = drive->hwif->hwgroup;
 	unsigned long timeout = jiffies + (3 * HZ);
 
 	spin_lock_irq(&ide_lock);
@@ -1367,12 +1367,12 @@ int generic_ide_ioctl(ide_drive_t *drive
 
 			ide_abort(drive, "drive reset");
 
-			BUG_ON(HWGROUP(drive)->handler);
+			BUG_ON(drive->hwif->hwgroup->handler);
 				
 			/* Ensure nothing gets queued after we
 			   drop the lock. Reset will clear the busy */
 		   
-			HWGROUP(drive)->busy = 1;
+			drive->hwif->hwgroup->busy = 1;
 			spin_unlock_irqrestore(&ide_lock, flags);
 			(void) ide_do_reset(drive);
 
--- linux-2.6.16-rc1-git4/drivers/ide/ide-tape.c.orig	2006-02-01 13:34:49.000000000 +0100
+++ linux-2.6.16-rc1-git4/drivers/ide/ide-tape.c	2006-02-01 13:35:14.000000000 +0100
@@ -1681,7 +1681,7 @@ static void idetape_abort_pipeline(ide_d
  */
 static int idetape_end_request(ide_drive_t *drive, int uptodate, int nr_sects)
 {
-	struct request *rq = HWGROUP(drive)->rq;
+	struct request *rq = drive->hwif->hwgroup->rq;
 	idetape_tape_t *tape = drive->driver_data;
 	unsigned long flags;
 	int error;
@@ -1844,7 +1844,7 @@ static void idetape_postpone_request (id
 	if (tape->debug_level >= 4)
 		printk(KERN_INFO "ide-tape: idetape_postpone_request\n");
 #endif
-	tape->postponed_rq = HWGROUP(drive)->rq;
+	tape->postponed_rq = drive->hwif->hwgroup->rq;
 	ide_stall_queue(drive, tape->dsc_polling_frequency);
 }
 
@@ -2322,7 +2322,7 @@ static ide_startstop_t idetape_media_acc
 static ide_startstop_t idetape_rw_callback (ide_drive_t *drive)
 {
 	idetape_tape_t *tape = drive->driver_data;
-	struct request *rq = HWGROUP(drive)->rq;
+	struct request *rq = drive->hwif->hwgroup->rq;
 	int blocks = tape->pc->actually_transferred / tape->tape_block_size;
 
 	tape->avg_size += blocks * tape->tape_block_size;
--- linux-2.6.16-rc1-git4/drivers/ide/ide-dma.c.orig	2006-02-01 13:35:21.000000000 +0100
+++ linux-2.6.16-rc1-git4/drivers/ide/ide-dma.c	2006-02-01 13:35:47.000000000 +0100
@@ -170,7 +170,7 @@ ide_startstop_t ide_dma_intr (ide_drive_
 	stat = HWIF(drive)->INB(IDE_STATUS_REG);	/* get drive status */
 	if (OK_STAT(stat,DRIVE_READY,drive->bad_wstat|DRQ_STAT)) {
 		if (!dma_stat) {
-			struct request *rq = HWGROUP(drive)->rq;
+			struct request *rq = drive->hwif->hwgroup->rq;
 
 			if (rq->rq_disk) {
 				ide_driver_t *drv;
@@ -402,7 +402,7 @@ static int dma_timer_expiry (ide_drive_t
 	if ((dma_stat & 0x18) == 0x18)	/* BUSY Stupid Early Timer !! */
 		return WAIT_CMD;
 
-	HWGROUP(drive)->expiry = NULL;	/* one free ride for now */
+	drive->hwif->hwgroup->expiry = NULL;	/* one free ride for now */
 
 	/* 1 dmaing, 2 error, 4 intr */
 	if (dma_stat & 2)	/* ERROR */
@@ -552,7 +552,7 @@ EXPORT_SYMBOL(__ide_dma_check);
 int ide_dma_setup(ide_drive_t *drive)
 {
 	ide_hwif_t *hwif = drive->hwif;
-	struct request *rq = HWGROUP(drive)->rq;
+	struct request *rq = drive->hwif->hwgroup->rq;
 	unsigned int reading;
 	u8 dma_stat;
 
--- linux-2.6.16-rc1-git4/drivers/ide/ide-taskfile.c.orig	2006-02-01 13:35:54.000000000 +0100
+++ linux-2.6.16-rc1-git4/drivers/ide/ide-taskfile.c	2006-02-01 13:36:28.000000000 +0100
@@ -195,7 +195,7 @@ ide_startstop_t set_geometry_intr (ide_d
 	if (stat & (ERR_STAT|DRQ_STAT))
 		return ide_error(drive, "set_geometry_intr", stat);
 
-	BUG_ON(HWGROUP(drive)->handler != NULL);
+	BUG_ON(drive->hwif->hwgroup->handler != NULL);
 	ide_set_handler(drive, &set_geometry_intr, WAIT_WORSTCASE, NULL);
 	return ide_started;
 }
@@ -218,7 +218,7 @@ ide_startstop_t recal_intr (ide_drive_t 
  */
 ide_startstop_t task_no_data_intr (ide_drive_t *drive)
 {
-	ide_task_t *args	= HWGROUP(drive)->rq->special;
+	ide_task_t *args	= drive->hwif->hwgroup->rq->special;
 	ide_hwif_t *hwif	= HWIF(drive);
 	u8 stat;
 
@@ -380,7 +380,7 @@ static void task_end_request(ide_drive_t
 ide_startstop_t task_in_intr (ide_drive_t *drive)
 {
 	ide_hwif_t *hwif = drive->hwif;
-	struct request *rq = HWGROUP(drive)->rq;
+	struct request *rq = drive->hwif->hwgroup->rq;
 	u8 stat = hwif->INB(IDE_STATUS_REG);
 
 	/* new way for dealing with premature shared PCI interrupts */
@@ -416,7 +416,7 @@ EXPORT_SYMBOL(task_in_intr);
 static ide_startstop_t task_out_intr (ide_drive_t *drive)
 {
 	ide_hwif_t *hwif = drive->hwif;
-	struct request *rq = HWGROUP(drive)->rq;
+	struct request *rq = drive->hwif->hwgroup->rq;
 	u8 stat = hwif->INB(IDE_STATUS_REG);
 
 	if (!OK_STAT(stat, DRIVE_READY, drive->bad_wstat))
--- linux-2.6.16-rc1-git4/drivers/ide/ide-floppy.c.orig	2006-02-01 13:36:38.000000000 +0100
+++ linux-2.6.16-rc1-git4/drivers/ide/ide-floppy.c	2006-02-01 13:37:21.000000000 +0100
@@ -573,7 +573,7 @@ static void idefloppy_write_zeros (ide_d
 static int idefloppy_do_end_request(ide_drive_t *drive, int uptodate, int nsecs)
 {
 	idefloppy_floppy_t *floppy = drive->driver_data;
-	struct request *rq = HWGROUP(drive)->rq;
+	struct request *rq = drive->hwif->hwgroup->rq;
 	int error;
 
 	debug_log(KERN_INFO "Reached idefloppy_end_request\n");
@@ -897,7 +897,7 @@ static ide_startstop_t idefloppy_pc_intr
 					"to send us more data than expected "
 					"- discarding data\n");
 				idefloppy_discard_data(drive,bcount.all);
-				BUG_ON(HWGROUP(drive)->handler != NULL);
+				BUG_ON(drive->hwif->hwgroup->handler != NULL);
 				ide_set_handler(drive,
 						&idefloppy_pc_intr,
 						IDEFLOPPY_WAIT_CMD,
@@ -930,7 +930,7 @@ static ide_startstop_t idefloppy_pc_intr
 	pc->actually_transferred += bcount.all;
 	pc->current_position += bcount.all;
 
-	BUG_ON(HWGROUP(drive)->handler != NULL);
+	BUG_ON(drive->hwif->hwgroup->handler != NULL);
 	ide_set_handler(drive, &idefloppy_pc_intr, IDEFLOPPY_WAIT_CMD, NULL);		/* And set the interrupt handler again */
 	return ide_started;
 }
@@ -957,7 +957,7 @@ static ide_startstop_t idefloppy_transfe
 				"issuing a packet command\n");
 		return ide_do_reset(drive);
 	}
-	BUG_ON(HWGROUP(drive)->handler != NULL);
+	BUG_ON(drive->hwif->hwgroup->handler != NULL);
 	/* Set the interrupt routine */
 	ide_set_handler(drive, &idefloppy_pc_intr, IDEFLOPPY_WAIT_CMD, NULL);
 	/* Send the actual packet */
@@ -1013,7 +1013,7 @@ static ide_startstop_t idefloppy_transfe
 	 * 40 and 50msec work well. idefloppy_pc_intr will not be actually
 	 * used until after the packet is moved in about 50 msec.
 	 */
-	BUG_ON(HWGROUP(drive)->handler != NULL);
+	BUG_ON(drive->hwif->hwgroup->handler != NULL);
 	ide_set_handler(drive, 
 	  &idefloppy_pc_intr, 		/* service routine for packet command */
 	  floppy->ticks,		/* wait this long before "failing" */
--- linux-2.6.16-rc1-git4/drivers/ide/ide-cd.c.orig	2006-02-01 13:37:29.000000000 +0100
+++ linux-2.6.16-rc1-git4/drivers/ide/ide-cd.c	2006-02-01 13:39:38.000000000 +0100
@@ -590,7 +590,7 @@ static void cdrom_queue_request_sense(id
 
 static void cdrom_end_request (ide_drive_t *drive, int uptodate)
 {
-	struct request *rq = HWGROUP(drive)->rq;
+	struct request *rq = drive->hwif->hwgroup->rq;
 	int nsectors = rq->hard_cur_sectors;
 
 	if ((rq->flags & REQ_SENSE) && uptodate) {
@@ -636,7 +636,7 @@ static void cdrom_end_request (ide_drive
    Returns 1 if the request was ended. */
 static int cdrom_decode_status(ide_drive_t *drive, int good_stat, int *stat_ret)
 {
-	struct request *rq = HWGROUP(drive)->rq;
+	struct request *rq = drive->hwif->hwgroup->rq;
 	int stat, err, sense_key;
 	
 	/* Check for errors. */
@@ -700,7 +700,7 @@ static int cdrom_decode_status(ide_drive
 		if (stat & ERR_STAT) {
 			spin_lock_irqsave(&ide_lock, flags);
 			blkdev_dequeue_request(rq);
-			HWGROUP(drive)->rq = NULL;
+			drive->hwif->hwgroup->rq = NULL;
 			spin_unlock_irqrestore(&ide_lock, flags);
 
 			cdrom_queue_request_sense(drive, rq->sense, rq);
@@ -799,7 +799,7 @@ static int cdrom_decode_status(ide_drive
 
 static int cdrom_timer_expiry(ide_drive_t *drive)
 {
-	struct request *rq = HWGROUP(drive)->rq;
+	struct request *rq = drive->hwif->hwgroup->rq;
 	unsigned long wait = 0;
 
 	/*
@@ -1024,7 +1024,7 @@ static ide_startstop_t cdrom_read_intr (
 	u8 lowcyl = 0, highcyl = 0;
 	int dma = info->dma, dma_error = 0;
 
-	struct request *rq = HWGROUP(drive)->rq;
+	struct request *rq = drive->hwif->hwgroup->rq;
 
 	/*
 	 * handle dma case
@@ -1151,7 +1151,7 @@ static ide_startstop_t cdrom_read_intr (
 static int cdrom_read_from_buffer (ide_drive_t *drive)
 {
 	struct cdrom_info *info = drive->driver_data;
-	struct request *rq = HWGROUP(drive)->rq;
+	struct request *rq = drive->hwif->hwgroup->rq;
 	unsigned short sectors_per_frame;
 
 	sectors_per_frame = queue_hardsect_size(drive->queue) >> SECTOR_BITS;
@@ -1211,7 +1211,7 @@ static int cdrom_read_from_buffer (ide_d
  */
 static ide_startstop_t cdrom_start_read_continuation (ide_drive_t *drive)
 {
-	struct request *rq = HWGROUP(drive)->rq;
+	struct request *rq = drive->hwif->hwgroup->rq;
 	unsigned short sectors_per_frame;
 	int nskip;
 
@@ -1274,7 +1274,7 @@ static ide_startstop_t cdrom_seek_intr (
 
 static ide_startstop_t cdrom_start_seek_continuation (ide_drive_t *drive)
 {
-	struct request *rq = HWGROUP(drive)->rq;
+	struct request *rq = drive->hwif->hwgroup->rq;
 	sector_t frame = rq->sector;
 
 	sector_div(frame, queue_hardsect_size(drive->queue) >> SECTOR_BITS);
@@ -1319,7 +1319,7 @@ static void restore_request (struct requ
 static ide_startstop_t cdrom_start_read (ide_drive_t *drive, unsigned int block)
 {
 	struct cdrom_info *info = drive->driver_data;
-	struct request *rq = HWGROUP(drive)->rq;
+	struct request *rq = drive->hwif->hwgroup->rq;
 	unsigned short sectors_per_frame;
 
 	sectors_per_frame = queue_hardsect_size(drive->queue) >> SECTOR_BITS;
@@ -1353,7 +1353,7 @@ static ide_startstop_t cdrom_start_read 
 static ide_startstop_t cdrom_pc_intr (ide_drive_t *drive)
 {
 	int ireason, len, thislen;
-	struct request *rq = HWGROUP(drive)->rq;
+	struct request *rq = drive->hwif->hwgroup->rq;
 	u8 lowcyl = 0, highcyl = 0;
 	int stat;
 
@@ -1462,7 +1462,7 @@ confused:
 
 static ide_startstop_t cdrom_do_pc_continuation (ide_drive_t *drive)
 {
-	struct request *rq = HWGROUP(drive)->rq;
+	struct request *rq = drive->hwif->hwgroup->rq;
 
 	if (!rq->timeout)
 		rq->timeout = ATAPI_WAIT_PC;
@@ -1475,7 +1475,7 @@ static ide_startstop_t cdrom_do_pc_conti
 static ide_startstop_t cdrom_do_packet_command (ide_drive_t *drive)
 {
 	int len;
-	struct request *rq = HWGROUP(drive)->rq;
+	struct request *rq = drive->hwif->hwgroup->rq;
 	struct cdrom_info *info = drive->driver_data;
 
 	info->dma = 0;
@@ -1603,7 +1603,7 @@ typedef void (xfer_func_t)(ide_drive_t *
 static ide_startstop_t cdrom_newpc_intr(ide_drive_t *drive)
 {
 	struct cdrom_info *info = drive->driver_data;
-	struct request *rq = HWGROUP(drive)->rq;
+	struct request *rq = drive->hwif->hwgroup->rq;
 	int dma_error, dma, stat, ireason, len, thislen;
 	u8 lowcyl, highcyl;
 	xfer_func_t *xferfunc;
@@ -1721,7 +1721,7 @@ static ide_startstop_t cdrom_newpc_intr(
 		}
 	}
 
-	BUG_ON(HWGROUP(drive)->handler != NULL);
+	BUG_ON(drive->hwif->hwgroup->handler != NULL);
 
 	ide_set_handler(drive, cdrom_newpc_intr, rq->timeout, NULL);
 	return ide_started;
@@ -1733,7 +1733,7 @@ end_request:
 	spin_lock_irqsave(&ide_lock, flags);
 	blkdev_dequeue_request(rq);
 	end_that_request_last(rq, 1);
-	HWGROUP(drive)->rq = NULL;
+	drive->hwif->hwgroup->rq = NULL;
 	spin_unlock_irqrestore(&ide_lock, flags);
 	return ide_stopped;
 }
@@ -1745,7 +1745,7 @@ static ide_startstop_t cdrom_write_intr(
 	int dma_error = 0, dma = info->dma;
 	u8 lowcyl = 0, highcyl = 0;
 
-	struct request *rq = HWGROUP(drive)->rq;
+	struct request *rq = drive->hwif->hwgroup->rq;
 
 	/* Check for errors. */
 	if (dma) {
@@ -1838,7 +1838,7 @@ static ide_startstop_t cdrom_write_intr(
 
 static ide_startstop_t cdrom_start_write_cont(ide_drive_t *drive)
 {
-	struct request *rq = HWGROUP(drive)->rq;
+	struct request *rq = drive->hwif->hwgroup->rq;
 
 #if 0	/* the immediate bit */
 	rq->cmd[1] = 1 << 3;
@@ -1885,7 +1885,7 @@ static ide_startstop_t cdrom_start_write
 
 static ide_startstop_t cdrom_do_newpc_cont(ide_drive_t *drive)
 {
-	struct request *rq = HWGROUP(drive)->rq;
+	struct request *rq = drive->hwif->hwgroup->rq;
 
 	if (!rq->timeout)
 		rq->timeout = ATAPI_WAIT_PC;
--- linux-2.6.16-rc1-git4/drivers/ide/ide-iops.c.orig	2006-02-01 13:39:49.000000000 +0100
+++ linux-2.6.16-rc1-git4/drivers/ide/ide-iops.c	2006-02-01 13:41:00.000000000 +0100
@@ -768,7 +768,7 @@ int ide_config_drive_speed (ide_drive_t 
 	int	i, error	= 1;
 	u8 stat;
 
-//	while (HWGROUP(drive)->busy)
+//	while (drive->hwif->hwgroup->busy)
 //		msleep(50);
 
 #ifdef CONFIG_BLK_DEV_IDEDMA
@@ -893,7 +893,7 @@ EXPORT_SYMBOL(ide_config_drive_speed);
 static void __ide_set_handler (ide_drive_t *drive, ide_handler_t *handler,
 		      unsigned int timeout, ide_expiry_t *expiry)
 {
-	ide_hwgroup_t *hwgroup = HWGROUP(drive);
+	ide_hwgroup_t *hwgroup = drive->hwif->hwgroup;
 
 	if (hwgroup->handler != NULL) {
 		printk(KERN_CRIT "%s: ide_set_handler: handler not null; "
@@ -934,7 +934,7 @@ EXPORT_SYMBOL(ide_set_handler);
 void ide_execute_command(ide_drive_t *drive, task_ioreg_t cmd, ide_handler_t *handler, unsigned timeout, ide_expiry_t *expiry)
 {
 	unsigned long flags;
-	ide_hwgroup_t *hwgroup = HWGROUP(drive);
+	ide_hwgroup_t *hwgroup = drive->hwif->hwgroup;
 	ide_hwif_t *hwif = HWIF(drive);
 	
 	spin_lock_irqsave(&ide_lock, flags);
@@ -969,7 +969,7 @@ static ide_startstop_t do_reset1 (ide_dr
  */
 static ide_startstop_t atapi_reset_pollfunc (ide_drive_t *drive)
 {
-	ide_hwgroup_t *hwgroup	= HWGROUP(drive);
+	ide_hwgroup_t *hwgroup	= drive->hwif->hwgroup;
 	ide_hwif_t *hwif	= HWIF(drive);
 	u8 stat;
 
@@ -980,7 +980,7 @@ static ide_startstop_t atapi_reset_pollf
 		printk("%s: ATAPI reset complete\n", drive->name);
 	} else {
 		if (time_before(jiffies, hwgroup->poll_timeout)) {
-			BUG_ON(HWGROUP(drive)->handler != NULL);
+			BUG_ON(drive->hwif->hwgroup->handler != NULL);
 			ide_set_handler(drive, &atapi_reset_pollfunc, HZ/20, NULL);
 			/* continue polling */
 			return ide_started;
@@ -1005,7 +1005,7 @@ static ide_startstop_t atapi_reset_pollf
  */
 static ide_startstop_t reset_pollfunc (ide_drive_t *drive)
 {
-	ide_hwgroup_t *hwgroup	= HWGROUP(drive);
+	ide_hwgroup_t *hwgroup	= drive->hwif->hwgroup;
 	ide_hwif_t *hwif	= HWIF(drive);
 	u8 tmp;
 
@@ -1019,7 +1019,7 @@ static ide_startstop_t reset_pollfunc (i
 
 	if (!OK_STAT(tmp = hwif->INB(IDE_STATUS_REG), 0, BUSY_STAT)) {
 		if (time_before(jiffies, hwgroup->poll_timeout)) {
-			BUG_ON(HWGROUP(drive)->handler != NULL);
+			BUG_ON(drive->hwif->hwgroup->handler != NULL);
 			ide_set_handler(drive, &reset_pollfunc, HZ/20, NULL);
 			/* continue polling */
 			return ide_started;
@@ -1132,7 +1132,7 @@ static ide_startstop_t do_reset1 (ide_dr
 	
 	spin_lock_irqsave(&ide_lock, flags);
 	hwif = HWIF(drive);
-	hwgroup = HWGROUP(drive);
+	hwgroup = drive->hwif->hwgroup;
 
 	/* We must not reset with running handlers */
 	BUG_ON(hwgroup->handler != NULL);
--- linux-2.6.16-rc1-git4/drivers/ide/ide-lib.c.orig	2006-02-01 13:41:09.000000000 +0100
+++ linux-2.6.16-rc1-git4/drivers/ide/ide-lib.c	2006-02-01 13:43:50.000000000 +0100
@@ -452,8 +452,8 @@ static void ide_dump_opcode(ide_drive_t 
 
 	spin_lock(&ide_lock);
 	rq = NULL;
-	if (HWGROUP(drive))
-		rq = HWGROUP(drive)->rq;
+	if (drive->hwif->hwgroup)
+		rq = drive->hwif->hwgroup->rq;
 	spin_unlock(&ide_lock);
 	if (!rq)
 		return;
@@ -538,9 +538,10 @@ static u8 ide_dump_ata_status(ide_drive_
 					  hwif->INB(IDE_SECTOR_REG));
 				}
 			}
-			if (HWGROUP(drive) && HWGROUP(drive)->rq)
+			if (drive->hwif->hwgroup && drive->hwif->hwgroup->rq)
 				printk(", sector=%llu",
-					(unsigned long long)HWGROUP(drive)->rq->sector);
+					(unsigned long long)
+					drive->hwif->hwgroup->rq->sector);
 		}
 		printk("\n");
 	}



--===============90879508476659132==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============90879508476659132==--
