From: James Nelson <james4765@cwazy.co.uk>
Date: Fri, 21 Jan 2005 01:07:59 +0000
Subject: [KJ] [PATCH 2/2] acorn: clean up printk()'s in
Message-Id: <20050121010758.18138.2311.25849@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============55577160943999937=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============55577160943999937==

Signed-off-by: James Nelson <james4765@gmail.com>

diff -urN --exclude='*~' linux-2.6.11-rc1-mm2-original/drivers/acorn/block/mfmhd.c linux-2.6.11-rc1-mm2/drivers/acorn/block/mfmhd.c
--- linux-2.6.11-rc1-mm2-original/drivers/acorn/block/mfmhd.c	2005-01-20 16:33:13.000000000 -0500
+++ linux-2.6.11-rc1-mm2/drivers/acorn/block/mfmhd.c	2005-01-20 19:56:16.110042179 -0500
@@ -98,6 +98,8 @@
  *  This would be a performance boost with dual drive systems.
  */
 
+#undef DEBUG /* define to enable debugging statements */
+
 #include <linux/module.h>
 #include <linux/config.h>
 #include <linux/sched.h>
@@ -126,6 +128,7 @@
 static struct request_queue *mfm_queue;
 static DEFINE_SPINLOCK(mfm_lock);
 
+#define PFX "mfm: "
 #define MAJOR_NR	MFM_ACORN_MAJOR
 #define QUEUE (mfm_queue)
 #define CURRENT elv_next_request(mfm_queue)
@@ -301,26 +304,10 @@
 
 /* ------------------------------------------------------------------------------------------ */
 #ifdef DEBUG
-static void console_printf(const char *fmt,...)
-{
-	static char buffer[2048];	/* Arbitary! */
-	extern void console_print(const char *);
-	unsigned long flags;
-	va_list ap;
-
-	local_irq_save(flags);
-
-	va_start(ap, fmt);
-	vsprintf(buffer, fmt, ap);
-	console_print(buffer);
-	va_end(fmt);
-
-	local_irq_restore(flags);
-};	/* console_printf */
 
-#define DBG(x...) console_printf(x)
+#define DBG(fmt, args...) pr_debug(PFX "%s(): " fmt, __FUNCTION__ , ## args)
 #else
-#define DBG(x...)
+#define DBG(fmt, args...)
 #endif
 
 static void print_status(void)
@@ -377,23 +364,23 @@
 	int status;
 #ifdef DEBUG
 	int i;
-	console_printf("issue_command: %02X: ", command);
+	DBG("%02X:", command);
 	for (i = 0; i < len; i++)
-		console_printf("%02X ", cmdb[i]);
-	console_printf("\n");
+		printk(" %02X", cmdb[i]);
+	printk("\n");
 #endif
 
 	do {
 		status = inw(MFM_STATUS);
 	} while (status & (STAT_BSY | STAT_POL));
-	DBG("issue_command: status after pol/bsy loop: %02X:\n ", status >> 8);
+	DBG("status after pol/bsy loop: %02X:\n ", status >> 8);
 
 	if (status & (STAT_CPR | STAT_CED | STAT_SED | STAT_DER | STAT_ABN)) {
 		outw(CMD_RCAL, MFM_COMMAND);
 		while (inw(MFM_STATUS) & STAT_BSY);
 	}
 	status = inw(MFM_STATUS);
-	DBG("issue_command: status before parameter issue: %02X:\n ", status >> 8);
+	DBG("status before parameter issue: %02X:\n ", status >> 8);
 
 	while (len > 0) {
 		outw(cmdb[1] | (cmdb[0] << 8), MFM_DATAOUT);
@@ -401,11 +388,11 @@
 		cmdb += 2;
 	}
 	status = inw(MFM_STATUS);
-	DBG("issue_command: status before command issue: %02X:\n ", status >> 8);
+	DBG("status before command issue: %02X:\n ", status >> 8);
 
 	outw(command, MFM_COMMAND);
 	status = inw(MFM_STATUS);
-	DBG("issue_command: status immediately after command issue: %02X:\n ", status >> 8);
+	DBG("status immediately after command issue: %02X:\n ", status >> 8);
 }
 
 static void wait_for_completion(void)
@@ -434,7 +421,7 @@
 {
 	int old_status;		/* Holds status on entry, we read to see if the command just finished */
 #ifdef DEBUG
-	console_printf("mfm_rw_intr...dataleft=%d\n", hdc63463_dataleft);
+	DBG("dataleft=%d ", hdc63463_dataleft);
 	print_status();
 #endif
 
@@ -443,7 +430,7 @@
 		/* Something has gone wrong - let's try that again */
 		outw(CMD_RCAL, MFM_COMMAND);	/* Clear interrupt condition */
 		if (cont) {
-			DBG("mfm_rw_intr: DER/ABN err\n");
+			DBG("DER/ABN err\n");
 			cont->error();
 			cont->redo();
 		};
@@ -457,7 +444,7 @@
 	if (CURRENT->cmd == WRITE) {
 		extern void hdc63463_writedma(void);
 		if ((hdc63463_dataleft <= 0) && (!(mfm_status & STAT_CED))) {
-			printk("mfm_rw_intr: Apparent DMA write request when no more to DMA\n");
+			printk(KERN_WARN PFX "mfm_rw_intr: Apparent DMA write request when no more to DMA\n");
 			if (cont) {
 				cont->error();
 				cont->redo();
@@ -468,7 +455,7 @@
 	} else {
 		extern void hdc63463_readdma(void);
 		if ((hdc63463_dataleft <= 0) && (!(mfm_status & STAT_CED))) {
-			printk("mfm_rw_intr: Apparent DMA read request when no more to DMA\n");
+			printk(KERN_WARN PFX "mfm_rw_intr: Apparent DMA read request when no more to DMA\n");
 			if (cont) {
 				cont->error();
 				cont->redo();
@@ -482,7 +469,7 @@
 	if (hdc63463_dataptr != ((unsigned int) Copy_buffer + 256)) {
 		/* If we didn't actually manage to get any data on this interrupt - but why? We got the interrupt */
 		/* Ah - well looking at the status its just when we get command end; so no problem */
-		/*console_printf("mfm: dataptr mismatch. dataptr=0x%08x Copy_buffer+256=0x%08p\n",
+		/*DBG("dataptr mismatch. dataptr=0x%08x Copy_buffer+256=0x%08p\n",
 		   hdc63463_dataptr,Copy_buffer+256);
 		   print_status(); */
 	} else {
@@ -492,7 +479,7 @@
 
 		/* We have come to the end of this request */
 		if (!Sectors256LeftInCurrent) {
-			DBG("mfm: end_request for CURRENT=0x%p CURRENT(sector=%d current_nr_sectors=%d nr_sectors=%d)\n",
+			DBG("end_request for CURRENT=0x%p CURRENT(sector=%d current_nr_sectors=%d nr_sectors=%d)\n",
 				       CURRENT, CURRENT->sector, CURRENT->current_nr_sectors, CURRENT->nr_sectors);
 
 			CURRENT->nr_sectors -= CURRENT->current_nr_sectors;
@@ -511,10 +498,10 @@
 
 				if (Copy_Sector != CURRENT->sector * 2)
 #ifdef DEBUG
-					/*console_printf*/printk("mfm: Copy_Sector mismatch. Copy_Sector=%d CURRENT->sector*2=%d\n",
+					DBG("Copy_Sector mismatch. Copy_Sector=%d CURRENT->sector*2=%d\n",
 					Copy_Sector, CURRENT->sector * 2);
 #else
-					printk("mfm: Copy_Sector mismatch! Eek!\n");
+					printk(KERN_ERR PFX "Copy_Sector mismatch! Eek!\n");
 #endif
 			};	/* CURRENT */
 		};	/* Sectors256LeftInCurrent */
@@ -525,7 +512,7 @@
 	if (mfm_status & (STAT_DER | STAT_ABN)) {
 		/* Something has gone wrong - let's try that again */
 		if (cont) {
-			DBG("mfm_rw_intr: DER/ABN error\n");
+			DBG("DER/ABN error\n");
 			cont->error();
 			cont->redo();
 		};
@@ -547,7 +534,7 @@
 		};
 	};			/* Result read */
 
-	/*console_printf ("mfm_rw_intr nearexit [%02X]\n", __raw_readb(mfm_IRQPollLoc)); */
+	/*DBG("nearexit [%02X]\n", __raw_readb(mfm_IRQPollLoc)); */
 
 	/* If end of command move on */
 	if (mfm_status & (STAT_CED)) {
@@ -556,7 +543,7 @@
 		if (cont) {
 			cont->done(1);
 		}
-		DBG("mfm_rw_intr: returned from cont->done\n");
+		DBG("returned from cont->done\n");
 	} else {
 		/* Its going to generate another interrupt */
 		do_mfm = mfm_rw_intr;
@@ -574,12 +561,12 @@
 static void mfm_recal_intr(void)
 {
 #ifdef DEBUG
-	console_printf("recal intr - status = ");
+	DBG("status = ");
 	print_status();
 #endif
 	outw(CMD_RCAL, MFM_COMMAND);	/* Clear interrupt condition */
 	if (mfm_status & (STAT_DER | STAT_ABN)) {
-		printk("recal failed\n");
+		printk(KERN_ERR PFX "recal failed\n");
 		MFM_DRV_INFO.cylinder = NEED_2_RECAL;
 		if (cont) {
 			cont->error();
@@ -601,18 +588,18 @@
 		issue_command(CMD_POL, NULL, 0);
 		return;
 	}
-	printk("recal: unknown status\n");
+	printk(KERN_ERR PFX "recal: unknown status\n");
 }
 
 static void mfm_seek_intr(void)
 {
 #ifdef DEBUG
-	console_printf("seek intr - status = ");
+	DBG("status = ");
 	print_status();
 #endif
 	outw(CMD_RCAL, MFM_COMMAND);	/* Clear interrupt condition */
 	if (mfm_status & (STAT_DER | STAT_ABN)) {
-		printk("seek failed\n");
+		printk(KERN_ERR PFX "seek failed\n");
 		MFM_DRV_INFO.cylinder = NEED_2_RECAL;
 		if (cont) {
 			cont->error();
@@ -631,7 +618,7 @@
 		issue_command(CMD_POL, NULL, 0);
 		return;
 	}
-	printk("seek: unknown status\n");
+	printk(KERN_ERR PFX "seek: unknown status\n");
 }
 
 /* IDEA2 seems to work better - its what RiscOS sets my
@@ -686,7 +673,7 @@
 	DBG("seeking...\n");
 	if (MFM_DRV_INFO.cylinder < 0) {
 		do_mfm = mfm_recal_intr;
-		DBG("mfm_seek: about to call specify\n");
+		DBG("about to call specify\n");
 		mfm_specify ();	/* DAG added this */
 
 		cmdb[0] = raw_cmd.dev + 1;
@@ -715,13 +702,14 @@
 
 static void request_done(int uptodate)
 {
-	DBG("mfm:request_done\n");
+	DBG("start\n");
 	if (uptodate) {
 		unsigned char block[2] = {0, 0};
 
 		/* Apparently worked - let's check bytes left to DMA */
 		if (hdc63463_dataleft != (PartFragRead_SectorsLeft * 256)) {
-			printk("mfm: request_done - dataleft=%d - should be %d - Eek!\n", hdc63463_dataleft, PartFragRead_SectorsLeft * 256);
+			printk(KERN_ERR PFX "request_done - dataleft=%d - should be %d - Eek!\n",
+				hdc63463_dataleft, PartFragRead_SectorsLeft * 256);
 			end_request(CURRENT, 0);
 			Busy = 0;
 		};
@@ -740,7 +728,8 @@
 		/* ah well - perhaps there is another fragment to go */
 
 		/* Increment pointers/counts to start of next fragment */
-		if (SectorsLeftInRequest > 0) printk("mfm: SectorsLeftInRequest>0 - Eek! Shouldn't happen!\n");
+		if (SectorsLeftInRequest > 0)
+			printk(KERN_CRIT PFX "SectorsLeftInRequest > 0 - Eek! Shouldn't happen!\n");
 
 		/* No - its the end of the line */
 		/* end_request's should have happened at the end of sector DMAs */
@@ -749,12 +738,12 @@
 			issue_command(CMD_CKV, block, 2);
 
 		Busy = 0;
-		DBG("request_done: About to mfm_request\n");
+		DBG("About to mfm_request\n");
 		/* Next one please */
 		mfm_request();	/* Moved from mfm_rw_intr */
-		DBG("request_done: returned from mfm_request\n");
+		DBG("returned from mfm_request\n");
 	} else {
-		printk("mfm:request_done: update=0\n");
+		DBG("update=0\n");
 		end_request(CURRENT, 0);
 		Busy = 0;
 	}
@@ -762,7 +751,7 @@
 
 static void error_handler(void)
 {
-	printk("error detected... status = ");
+	printk(KERN_ERR PFX "error detected... status = ");
 	print_status();
 	(*errors)++;
 	if (*errors > MFM_DRV_INFO.errors.abort)
@@ -773,7 +762,7 @@
 
 static void rw_interrupt(void)
 {
-	printk("rw_interrupt\n");
+	DBG("rw_interrupt\n");
 }
 
 static struct cont rw_cont =
@@ -807,7 +796,7 @@
 	/* Then add in the number of sectors left on this track */
 	sectors_to_next_cyl += (p->sectors - start_sector);
 
-	DBG("issue_request: mfm_info[dev].sectors=%d track=%d\n", p->sectors, track);
+	DBG("mfm_info[dev].sectors=%d track=%d\n", p->sectors, track);
 
 	raw_cmd.dev = dev;
 	raw_cmd.sector = start_sector;
@@ -869,7 +858,7 @@
  */
 static void mfm_rerequest(void)
 {
-	DBG("mfm_rerequest\n");
+	DBG("start\n");
 	cli();
 	Busy = 0;
 	mfm_request();
@@ -879,12 +868,12 @@
 
 static void mfm_request(void)
 {
-	DBG("mfm_request CURRENT=%p Busy=%d\n", CURRENT, Busy);
+	DBG("CURRENT=%p Busy=%d\n", CURRENT, Busy);
 
 	/* If we are still processing then return; we will get called again */
 	if (Busy) {
 		/* Again seems to be common in 1.3.45 */
-		/*DBG*/printk("mfm_request: Exiting due to busy\n");
+		DBG("Exiting due to busy\n");
 		return;
 	}
 	Busy = 1;
@@ -893,28 +882,28 @@
 		unsigned int block, nsect;
 		struct gendisk *disk;
 
-		DBG("mfm_request: loop start\n");
+		DBG("loop start\n");
 		sti();
 
-		DBG("mfm_request: before !CURRENT\n");
+		DBG("before !CURRENT\n");
 
 		if (!CURRENT) {
-			printk("mfm_request: Exiting due to empty queue (pre)\n");
+			DBG("Exiting due to empty queue (pre)\n");
 			do_mfm = NULL;
 			Busy = 0;
 			return;
 		}
 
-		DBG("mfm_request:                 before arg extraction\n");
+		DBG("before arg extraction\n");
 
 		disk = CURRENT->rq_disk;
 		block = CURRENT->sector;
 		nsect = CURRENT->nr_sectors;
 		if (block >= get_capacity(disk) ||
 		    block+nsect > get_capacity(disk)) {
-			printk("%s: bad access: block=%d, count=%d, nr_sects=%ld\n",
+			printk(KERN_ERR "%s: bad access: block=%d, count=%d, nr_sects=%ld\n",
 			       disk->disk_name, block, nsect, get_capacity(disk));
-			printk("mfm: continue 1\n");
+			DBG("continue 1\n");
 			end_request(CURRENT, 0);
 			Busy = 0;
 			continue;
@@ -930,25 +919,25 @@
 		Copy_buffer = CURRENT->buffer;
 		Copy_Sector = CURRENT->sector << 1;
 
-		DBG("mfm_request: block after offset=%d\n", block);
+		DBG("block after offset=%d\n", block);
 
 		if (CURRENT->cmd != READ && CURRENT->cmd != WRITE) {
-			printk("unknown mfm-command %d\n", CURRENT->cmd);
+			printk(KERN_ERR "unknown mfm-command %d\n", CURRENT->cmd);
 			end_request(CURRENT, 0);
 			Busy = 0;
-			printk("mfm: continue 4\n");
+			DBG("continue 4\n");
 			continue;
 		}
 		issue_request(block, nsect, CURRENT);
 
 		break;
 	}
-	DBG("mfm_request: Dropping out bottom\n");
+	DBG("Dropping out bottom\n");
 }
 
 static void do_mfm_request(request_queue_t *q)
 {
-	DBG("do_mfm_request: about to mfm_request\n");
+	DBG("about to mfm_request\n");
 	mfm_request();
 }
 
@@ -958,7 +947,7 @@
 
 	do_mfm = NULL;
 
-	DBG("mfm_interrupt_handler (handler=0x%p)\n", handler);
+	DBG("(handler=0x%p)\n", handler);
 
 	mfm_status = inw(MFM_STATUS);
 
@@ -978,7 +967,7 @@
 		return;
 	}
 	outw (CMD_RCAL, MFM_COMMAND);	/* Clear interrupt condition */
-	printk ("mfm: unexpected interrupt - status = ");
+	printk (KERN_WARN PFX "unexpected interrupt - status = ");
 	print_status ();
 	while (1);
 }
@@ -996,7 +985,7 @@
 	struct gendisk *disk = mfm_gendisk[drive];
 	disk->private_data = p;
 	if (p->cylinders)
-		printk ("%s: %dMB CHS=%d/%d/%d LCC=%d RECOMP=%d\n",
+		pr_info ("%s: %dMB CHS=%d/%d/%d LCC=%d RECOMP=%d\n",
 			disk->disk_name,
 			p->cylinders * p->heads * p->sectors / 4096,
 			p->cylinders, p->heads, p->sectors,
@@ -1108,7 +1097,8 @@
 
 	if (number_mfm_drives > MFM_MAXDRIVES) {
 		number_mfm_drives = MFM_MAXDRIVES;
-		printk("No. of ADFS MFM drives is greater than MFM_MAXDRIVES - you can't have that many!\n");
+		printk(KERN_WARN "No. of ADFS MFM drives is greater than "
+			"MFM_MAXDRIVES - you can't have that many!\n");
 	}
 
 	for (drive = 0; drive < number_mfm_drives; drive++) {
@@ -1199,7 +1189,7 @@
 		p->cylinders = discsize / (secsptrack * heads * secsize);
 
 		if ((heads < 1) || (p->cylinders > 1024)) {
-			printk("%s: Insane disc shape! Setting to 512/4/32\n",
+			printk(KERN_WARN "%s: Insane disc shape! Setting to 512/4/32\n",
 				bdev->bd_disk->disk_name);
 
 			/* These values are fairly arbitary, but are there so that if your
@@ -1260,7 +1250,7 @@
 {
 	int i, ret;
 
-	printk("mfm: found at address %08X, interrupt %d\n", mfm_addr, mfm_irq);
+	pr_info(PFX "controller found at address %08X, interrupt %d\n", mfm_addr, mfm_irq);
 
 	ret = -EBUSY;
 	if (!request_region (mfm_addr, 10, "mfm"))
@@ -1299,11 +1289,11 @@
 		mfm_gendisk[i] = disk;
 	}
 
-	printk("mfm: detected %d hard drive%s\n", mfm_drives,
+	pr_info(PFX "detected %d hard drive%s\n", mfm_drives,
 				mfm_drives == 1 ? "" : "s");
 	ret = request_irq(mfm_irq, mfm_interrupt_handler, SA_INTERRUPT, "MFM harddisk", NULL);
 	if (ret) {
-		printk("mfm: unable to get IRQ%d\n", mfm_irq);
+		printk(KERN_ERR PFX "unable to get IRQ%d\n", mfm_irq);
 		goto out4;
 	}
 

--===============55577160943999937==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============55577160943999937==--
