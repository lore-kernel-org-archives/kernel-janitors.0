From: Luiz Fernando Capitulino <lcapitulino@prefeitura.sp.gov.br>
Date: Wed, 03 Mar 2004 19:40:31 +0000
Subject: [Kernel-janitors] [PATCH 1/3] - De-uglification work for
Message-Id: <1078342454.14557.38.camel@telecentrolivre>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


if()s and loops.

diff -Nparu linux-2.6.4-rc1-bk2/drivers/block/floppy.c linux-2.6.4-rc1-bk2~/drivers/block/floppy.c
--- linux-2.6.4-rc1-bk2/drivers/block/floppy.c	2004-02-18 15:54:22.000000000 -0300
+++ linux-2.6.4-rc1-bk2~/drivers/block/floppy.c	2004-03-02 17:23:26.000000000 -0300
@@ -679,7 +679,7 @@ static void __reschedule_timeout(int dri
 	} else
 		fd_timeout.expires = jiffies + UDP->timeout;
 	add_timer(&fd_timeout);
-	if (UDP->flags & FD_DEBUG){
+	if (UDP->flags & FD_DEBUG) {
 		DPRINT("reschedule timeout ");
 		printk(message, marg);
 		printk("\n");
@@ -742,7 +742,7 @@ static int disk_change(int drive)
 		DPRINT("WARNING disk change called early\n");
 	if (!(FDCS->dor & (0x10 << UNIT(drive))) ||
 	    (FDCS->dor & 3) != UNIT(drive) ||
-	    fdc != FDC(drive)){
+	    fdc != FDC(drive)) {
 		DPRINT("probing disk change on unselected drive\n");
 		DPRINT("drive=%d fdc=%d dor=%x\n",drive, FDC(drive),
 			(unsigned int)FDCS->dor);
@@ -750,7 +750,7 @@ static int disk_change(int drive)
 #endif
 
 #ifdef DCL_DEBUG
-	if (UDP->flags & FD_DEBUG){
+	if (UDP->flags & FD_DEBUG) {
 		DPRINT("checking disk change line for drive %d\n",drive);
 		DPRINT("jiffies=%lu\n", jiffies);
 		DPRINT("disk change line=%x\n",fd_inb(FD_DIR)&0x80);
@@ -759,9 +759,9 @@ static int disk_change(int drive)
 #endif
 	if (UDP->flags & FD_BROKEN_DCL)
 		return UTESTF(FD_DISK_CHANGED);
-	if ((fd_inb(FD_DIR) ^ UDP->flags) & 0x80){
+	if ((fd_inb(FD_DIR) ^ UDP->flags) & 0x80) {
 		USETF(FD_VERIFY); /* verify write protection */
-		if (UDRS->maxblock){
+		if (UDRS->maxblock) {
 			/* mark it changed */
 			USETF(FD_DISK_CHANGED);
 		}
@@ -799,12 +799,12 @@ static int set_dor(int fdc, char mask, c
 
 	olddor = FDCS->dor;
 	newdor =  (olddor & mask) | data;
-	if (newdor != olddor){
+	if (newdor != olddor) {
 		unit = olddor & 0x3;
-		if (is_selected(olddor, unit) && !is_selected(newdor,unit)){
+		if (is_selected(olddor, unit) && !is_selected(newdor,unit)) {
 			drive = REVDRIVE(fdc,unit);
 #ifdef DCL_DEBUG
-			if (UDP->flags & FD_DEBUG){
+			if (UDP->flags & FD_DEBUG) {
 				DPRINT("calling disk change from set_dor\n");
 			}
 #endif
@@ -814,7 +814,7 @@ static int set_dor(int fdc, char mask, c
 		fd_outb(newdor, FD_DOR);
 
 		unit = newdor & 0x3;
-		if (!is_selected(olddor, unit) && is_selected(newdor,unit)){
+		if (!is_selected(olddor, unit) && is_selected(newdor,unit)) {
 			drive = REVDRIVE(fdc,unit);
 			UDRS->select_date = jiffies;
 		}
@@ -859,7 +859,7 @@ static void reset_fdc_info(int mode)
 /* selects the fdc and drive, and enables the fdc's input/dma. */
 static void set_fdc(int drive)
 {
-	if (drive >= 0 && drive < N_DRIVE){
+	if (drive >= 0 && drive < N_DRIVE) {
 		fdc = FDC(drive);
 		current_drive = drive;
 	}
@@ -880,11 +880,11 @@ static void set_fdc(int drive)
 /* locks the driver */
 static int _lock_fdc(int drive, int interruptible, int line)
 {
-	if (!usage_count){
+	if (!usage_count) {
 		printk(KERN_ERR "Trying to lock fdc while usage count=0 at line %d\n", line);
 		return -1;
 	}
-	if(floppy_grab_irq_and_dma()=-1)
+	if(floppy_grab_irq_and_dma() = -1)
 		return -EBUSY;
 
 	if (test_and_set_bit(0, &fdc_busy)) {
@@ -966,7 +966,7 @@ static void floppy_off(unsigned int driv
 
 	/* make spindle stop in a position which minimizes spinup time
 	 * next time */
-	if (UDP->rps){
+	if (UDP->rps) {
 		delta = jiffies - UDRS->first_read_date + HZ -
 			UDP->spindown_offset;
 		delta = ((delta * UDP->rps) % HZ) / UDP->rps;
@@ -988,7 +988,7 @@ static void scandrives(void)
 		return;
 
 	saved_drive = current_drive;
-	for (i=0; i < N_DRIVE; i++){
+	for (i = 0; i < N_DRIVE; i++) {
 		drive = (saved_drive + i + 1) % N_DRIVE;
 		if (UDRS->fd_ref = 0 || UDP->select_delay != 0)
 			continue; /* skip closed drives */
@@ -1032,12 +1032,12 @@ static void cancel_activity(void)
 static void fd_watchdog(void)
 {
 #ifdef DCL_DEBUG
-	if (DP->flags & FD_DEBUG){
+	if (DP->flags & FD_DEBUG) {
 		DPRINT("calling disk change from watchdog\n");
 	}
 #endif
 
-	if (disk_change(current_drive)){
+	if (disk_change(current_drive)) {
 		DPRINT("disk removed during i/o\n");
 		cancel_activity();
 		cont->done(0);
@@ -1059,14 +1059,14 @@ static void main_command_interrupt(void)
 /* waits for a delay (spinup or select) to pass */
 static int fd_wait_for_completion(unsigned long delay, timeout_fn function)
 {
-	if (FDCS->reset){
+	if (FDCS->reset) {
 		reset_fdc(); /* do the reset during sleep to win time
 			      * if we don't need to sleep, it's a good
 			      * occasion anyways */
 		return 1;
 	}
 
-	if ((signed) (jiffies - delay) < 0){
+	if ((signed) (jiffies - delay) < 0) {
 		del_timer(&fd_timer);
 		fd_timer.function = function;
 		fd_timer.expires = delay;
@@ -1097,7 +1097,7 @@ static void floppy_enable_hlt(void)
 	unsigned long flags;
 
 	spin_lock_irqsave(&floppy_hlt_lock, flags);
-	if (hlt_disabled){
+	if (hlt_disabled) {
 		hlt_disabled=0;
 #ifdef HAVE_DISABLE_HLT
 		enable_hlt();
@@ -1112,18 +1112,18 @@ static void setup_DMA(void)
 	unsigned long f;
 
 #ifdef FLOPPY_SANITY_CHECK
-	if (raw_cmd->length = 0){
+	if (raw_cmd->length = 0) {
 		int i;
 
 		printk("zero dma transfer size:");
-		for (i=0; i < raw_cmd->cmd_count; i++)
+		for (i = 0; i < raw_cmd->cmd_count; i++)
 			printk("%x,", raw_cmd->cmd[i]);
 		printk("\n");
 		cont->done(0);
 		FDCS->reset = 1;
 		return;
 	}
-	if (((unsigned long) raw_cmd->kernel_data) % 512){
+	if (((unsigned long) raw_cmd->kernel_data) % 512) {
 		printk("non aligned address: %p\n", raw_cmd->kernel_data);
 		cont->done(0);
 		FDCS->reset=1;
@@ -1186,7 +1186,7 @@ static int output_byte(char byte)
 
 	if ((status = wait_til_ready()) < 0)
 		return -1;
-	if ((status & (STATUS_READY|STATUS_DIR|STATUS_DMA)) = STATUS_READY){
+	if ((status & (STATUS_READY|STATUS_DIR|STATUS_DMA)) = STATUS_READY) {
 		fd_outb(byte,FD_DATA);
 #ifdef FLOPPY_SANITY_CHECK
 		output_log[output_log_pos].data = byte;
@@ -1211,7 +1211,7 @@ static int result(void)
 {
 	int i, status=0;
 
-	for(i=0; i < MAX_REPLIES; i++) {
+	for(i = 0; i < MAX_REPLIES; i++) {
 		if ((status = wait_til_ready()) < 0)
 			break;
 		status &= STATUS_DIR|STATUS_READY|STATUS_BUSY|STATUS_DMA;
@@ -1366,7 +1366,7 @@ static void fdc_specify(void)
 
 	/* Convert step rate from microseconds to milliseconds and 4 bits */
 	srt = 16 - (DP->srt*scale_dtr/1000 + NOMINAL_DTR - 1)/NOMINAL_DTR;
-	if( slow_floppy ) {
+	if (slow_floppy) {
 		srt = srt / 4;
 	}
 	SUPBOUND(srt, 0xf);
@@ -1437,7 +1437,7 @@ static int interpret_errors(void)
 {
 	char bad;
 
-	if (inr!=7) {
+	if (inr != 7) {
 		DPRINT("-- FDC reply error");
 		FDCS->reset = 1;
 		return 1;
@@ -1519,13 +1519,13 @@ static void setup_rw_floppy(void)
 	if (flags & (FD_RAW_READ | FD_RAW_WRITE))
 		flags |= FD_RAW_INTR;
 
-	if ((flags & FD_RAW_SPIN) && !(flags & FD_RAW_NO_MOTOR)){
+	if ((flags & FD_RAW_SPIN) && !(flags & FD_RAW_NO_MOTOR)) {
 		ready_date = DRS->spinup_date + DP->spinup;
 		/* If spinup will take a long time, rerun scandrives
 		 * again just before spinup completion. Beware that
 		 * after scandrives, we must again wait for selection.
 		 */
-		if ((signed) (ready_date - jiffies) > DP->select_delay){
+		if ((signed) (ready_date - jiffies) > DP->select_delay) {
 			ready_date -= DP->select_delay;
 			function = (timeout_fn) floppy_start;
 		} else
@@ -1544,19 +1544,19 @@ static void setup_rw_floppy(void)
 		do_floppy = main_command_interrupt;
 
 	r=0;
-	for (i=0; i< raw_cmd->cmd_count; i++)
+	for (i = 0; i < raw_cmd->cmd_count; i++)
 		r|=output_byte(raw_cmd->cmd[i]);
 
 #ifdef DEBUGT
 	debugt("rw_command: ");
 #endif
-	if (r){
+	if (r) {
 		cont->error();
 		reset_fdc();
 		return;
 	}
 
-	if (!(flags & FD_RAW_INTR)){
+	if (!(flags & FD_RAW_INTR)) {
 		inr = result();
 		cont->interrupt();
 	} else if (flags & FD_RAW_NEED_DISK)
@@ -1581,9 +1581,9 @@ static void seek_interrupt(void)
 		cont->redo();
 		return;
 	}
-	if (DRS->track >= 0 && DRS->track != ST1 && !blind_seek){
+	if (DRS->track >= 0 && DRS->track != ST1 && !blind_seek) {
 #ifdef DCL_DEBUG
-		if (DP->flags & FD_DEBUG){
+		if (DP->flags & FD_DEBUG) {
 			DPRINT("clearing NEWCHANGE flag because of effective seek\n");
 			DPRINT("jiffies=%lu\n", jiffies);
 		}
@@ -1601,14 +1601,14 @@ static void check_wp(void)
 		/* check write protection */
 		output_byte(FD_GETSTATUS);
 		output_byte(UNIT(current_drive));
-		if (result() != 1){
+		if (result() != 1) {
 			FDCS->reset = 1;
 			return;
 		}
 		CLEARF(FD_VERIFY);
 		CLEARF(FD_NEED_TWADDLE);
 #ifdef DCL_DEBUG
-		if (DP->flags & FD_DEBUG){
+		if (DP->flags & FD_DEBUG) {
 			DPRINT("checking whether disk is write protected\n");
 			DPRINT("wp=%x\n",ST3 & 0x40);
 		}
@@ -1627,14 +1627,14 @@ static void seek_floppy(void)
 	blind_seek=0;
 
 #ifdef DCL_DEBUG
-	if (DP->flags & FD_DEBUG){
+	if (DP->flags & FD_DEBUG) {
 		DPRINT("calling disk change from seek\n");
 	}
 #endif
 
 	if (!TESTF(FD_DISK_NEWCHANGE) &&
 	    disk_change(current_drive) &&
-	    (raw_cmd->flags & FD_RAW_NEED_DISK)){
+	    (raw_cmd->flags & FD_RAW_NEED_DISK)) {
 		/* the media changed flag should be cleared after the seek.
 		 * If it isn't, this means that there is really no disk in
 		 * the drive.
@@ -1644,7 +1644,7 @@ static void seek_floppy(void)
 		cont->redo();
 		return;
 	}
-	if (DRS->track <= NEED_1_RECAL){
+	if (DRS->track <= NEED_1_RECAL) {
 		recalibrate_floppy();
 		return;
 	} else if (TESTF(FD_DISK_NEWCHANGE) &&
@@ -1655,7 +1655,7 @@ static void seek_floppy(void)
 		if (raw_cmd->track)
 			track = raw_cmd->track - 1;
 		else {
-			if (DP->flags & FD_SILENT_DCL_CLEAR){
+			if (DP->flags & FD_SILENT_DCL_CLEAR) {
 				set_dor(fdc, ~(0x10 << UNIT(current_drive)), 0);
 				blind_seek = 1;
 				raw_cmd->flags |= FD_RAW_NEED_SEEK;
@@ -1687,7 +1687,7 @@ static void recal_interrupt(void)
 #ifdef DEBUGT
 	debugt("recal interrupt:");
 #endif
-	if (inr !=2)
+	if (inr != 2)
 		FDCS->reset = 1;
 	else if (ST0 & ST0_ECE) {
 	       	switch(DRS->track){
@@ -1745,7 +1745,7 @@ static void print_result(char *message, 
 
 	DPRINT("%s ", message);
 	if (inr >= 0)
-		for (i=0; i<inr; i++)
+		for (i = 0; i < inr; i++)
 			printk("repl[%d]=%x ", i, reply_buffer[i]);
 	printk("\n");
 }
@@ -1766,7 +1766,7 @@ irqreturn_t floppy_interrupt(int irq, vo
 
 	floppy_enable_hlt();
 	do_floppy = NULL;
-	if (fdc >= N_FDC || FDCS->address = -1){
+	if (fdc >= N_FDC || FDCS->address = -1) {
 		/* we don't even know which FDC is the culprit */
 		printk("DOR0=%x\n", fdc_state[0].dor);
 		printk("floppy interrupt on bizarre fdc %d\n",fdc);
@@ -1790,7 +1790,7 @@ irqreturn_t floppy_interrupt(int irq, vo
 	inr = result();
 	if (do_print)
 		print_result("unexpected interrupt", inr);
-	if (inr = 0){
+	if (inr = 0) {
 		int max_sensei = 4;
 		do {
 			output_byte(FD_SENSEI);
@@ -1878,14 +1878,14 @@ static void show_floppy(void)
 #ifdef FLOPPY_SANITY_CHECK
 	printk("timeout_message=%s\n", timeout_message);
 	printk("last output bytes:\n");
-	for (i=0; i < OLOGSIZE; i++)
+	for (i = 0; i < OLOGSIZE; i++)
 		printk("%2x %2x %lu\n",
 		       output_log[(i+output_log_pos) % OLOGSIZE].data,
 		       output_log[(i+output_log_pos) % OLOGSIZE].status,
 		       output_log[(i+output_log_pos) % OLOGSIZE].jiffies);
 	printk("last result at %lu\n", resultjiffies);
 	printk("last redo_fd_request at %lu\n", lastredo);
-	for (i=0; i<resultsize; i++){
+	for (i = 0; i < resultsize; i++) {
 		printk("%2x ", reply_buffer[i]);
 	}
 	printk("\n");
@@ -1929,7 +1929,7 @@ static void floppy_shutdown(unsigned lon
 	if (!initialising)
 		DPRINT("floppy timeout called\n");
 	FDCS->reset = 1;
-	if (cont){
+	if (cont) {
 		cont->done(0);
 		cont->redo(); /* this will recall reset when needed */
 	} else {
@@ -1947,8 +1947,8 @@ static int start_motor(void (*function)(
 
 	mask = 0xfc;
 	data = UNIT(current_drive);
-	if (!(raw_cmd->flags & FD_RAW_NO_MOTOR)){
-		if (!(FDCS->dor & (0x10 << UNIT(current_drive)))){
+	if (!(raw_cmd->flags & FD_RAW_NO_MOTOR)) {
+		if (!(FDCS->dor & (0x10 << UNIT(current_drive)))) {
 			set_debugt();
 			/* no read since this drive is running */
 			DRS->first_read_date = 0;
@@ -1976,7 +1976,7 @@ static void floppy_ready(void)
 	if (fdc_dtr()) return;
 
 #ifdef DCL_DEBUG
-	if (DP->flags & FD_DEBUG){
+	if (DP->flags & FD_DEBUG) {
 		DPRINT("calling disk change from floppy_ready\n");
 	}
 #endif
@@ -1988,8 +1988,7 @@ static void floppy_ready(void)
 
 #ifdef fd_chose_dma_mode
 	if ((raw_cmd->flags & FD_RAW_READ) || 
-	    (raw_cmd->flags & FD_RAW_WRITE))
-	{
+	    (raw_cmd->flags & FD_RAW_WRITE)) {
 		unsigned long flags = claim_dma_lock();
 		fd_chose_dma_mode(raw_cmd->kernel_data,
 				  raw_cmd->length);
@@ -1997,7 +1996,7 @@ static void floppy_ready(void)
 	}
 #endif
 
-	if (raw_cmd->flags & (FD_RAW_NEED_SEEK | FD_RAW_NEED_DISK)){
+	if (raw_cmd->flags & (FD_RAW_NEED_SEEK | FD_RAW_NEED_DISK)) {
 		perpendicular_mode();
 		fdc_specify(); /* must be done here because of hut, hlt ... */
 		seek_floppy();
@@ -2015,7 +2014,7 @@ static void floppy_start(void)
 
 	scandrives();
 #ifdef DCL_DEBUG
-	if (DP->flags & FD_DEBUG){
+	if (DP->flags & FD_DEBUG) {
 		DPRINT("setting NEWCHANGE in floppy_start\n");
 	}
 #endif
@@ -2087,7 +2086,7 @@ static int wait_til_done(void (*handler)
 		remove_wait_queue(&command_done, &wait);
 	}
 
-	if (command_status < 2){
+	if (command_status < 2) {
 		cancel_activity();
 		cont = &intr_cont;
 		reset_fdc();
@@ -2137,13 +2136,13 @@ static int next_valid_format(void)
 	int probed_format;
 
 	probed_format = DRS->probed_format;
-	while(1){
+	while (1) {
 		if (probed_format >= 8 ||
-		     !DP->autodetect[probed_format]){
+		     !DP->autodetect[probed_format]) {
 			DRS->probed_format = 0;
 			return 1;
 		}
-		if (floppy_type[DP->autodetect[probed_format]].sect){
+		if (floppy_type[DP->autodetect[probed_format]].sect) {
 			DRS->probed_format = probed_format;
 			return 0;
 		}
@@ -2155,7 +2154,7 @@ static void bad_flp_intr(void)
 {
 	int err_count;
 
-	if (probing){
+	if (probing) {
 		DRS->probed_format++;
 		if (!next_valid_format())
 			return;
@@ -2342,7 +2341,7 @@ static void request_done(int uptodate)
 		return;
 	}
 
-	if (uptodate){
+	if (uptodate) {
 		/* maintain values for invalidation on geometry
 		 * change */
 		block = current_count_sectors + req->sector;
@@ -2453,10 +2452,10 @@ static void rw_interrupt(void)
 	}
 
 	if (CT(COMMAND) != FD_READ || 
-	     raw_cmd->kernel_data = current_req->buffer){
+	     raw_cmd->kernel_data = current_req->buffer) {
 		/* transfer directly from buffer */
 		cont->done(1);
-	} else if (CT(COMMAND) = FD_READ){
+	} else if (CT(COMMAND) = FD_READ) {
 		buffer_track = raw_cmd->track;
 		buffer_drive = current_drive;
 		INFBOUND(buffer_max, nr_sectors + fsector_t);
@@ -2524,7 +2523,7 @@ static void copy_buffer(int ssize, int m
 	remaining = current_count_sectors << 9;
 #ifdef FLOPPY_SANITY_CHECK
 	if ((remaining >> 9) > current_req->nr_sectors  &&
-	    CT(COMMAND) = FD_WRITE){
+	    CT(COMMAND) = FD_WRITE) {
 		DPRINT("in copy buffer\n");
 		printk("current_count_sectors=%ld\n", current_count_sectors);
 		printk("remaining=%d\n", remaining >> 9);
@@ -2580,7 +2579,7 @@ static void copy_buffer(int ssize, int m
 		}
 	}
 #ifdef FLOPPY_SANITY_CHECK
-	if (remaining){
+	if (remaining) {
 		if (remaining > 0)
 			max_sector -= remaining >> 9;
 		DPRINT("weirdness: remaining %d\n", remaining>>9);
@@ -2658,7 +2657,7 @@ static int make_raw_rw_request(void)
 	if (rq_data_dir(current_req) = READ) {
 		raw_cmd->flags |= FD_RAW_READ;
 		COMMAND = FM_MODE(_floppy,FD_READ);
-	} else if (rq_data_dir(current_req) = WRITE){
+	} else if (rq_data_dir(current_req) = WRITE) {
 		raw_cmd->flags |= FD_RAW_WRITE;
 		COMMAND = FM_MODE(_floppy,FD_WRITE);
 	} else {
@@ -2684,7 +2683,7 @@ static int make_raw_rw_request(void)
 		max_sector = _floppy->sect;
 
 	/* 2M disks have phantom sectors on the first track */
-	if ((_floppy->rate & FD_2M) && (!TRACK) && (!HEAD)){
+	if ((_floppy->rate & FD_2M) && (!TRACK) && (!HEAD)) {
 		max_sector = 2 * _floppy->sect / 3;
 		if (fsector_t >= max_sector){
 			current_count_sectors = min_t(int, _floppy->sect - fsector_t,
@@ -2715,14 +2714,14 @@ static int make_raw_rw_request(void)
 	 * of size ssize.
 	 */
 	tracksize = _floppy->sect - _floppy->sect % ssize;
-	if (tracksize < _floppy->sect){
+	if (tracksize < _floppy->sect) {
 		SECT_PER_TRACK ++;
 		if (tracksize <= fsector_t % _floppy->sect)
 			SECTOR--;
 
 		/* if we are beyond tracksize, fill up using smaller sectors */
-		while (tracksize <= fsector_t % _floppy->sect){
-			while(tracksize + ssize > _floppy->sect){
+		while (tracksize <= fsector_t % _floppy->sect) {
+			while (tracksize + ssize > _floppy->sect) {
 				SIZECODE--;
 				ssize >>= 1;
 			}
@@ -2748,8 +2747,8 @@ static int make_raw_rw_request(void)
 			copy_buffer(1, max_sector, buffer_max);
 			return 1;
 		}
-	} else if (in_sector_offset || current_req->nr_sectors < ssize){
-		if (CT(COMMAND) = FD_WRITE){
+	} else if (in_sector_offset || current_req->nr_sectors < ssize) {
+		if (CT(COMMAND) = FD_WRITE) {
 			if (fsector_t + current_req->nr_sectors > ssize &&
 			    fsector_t + current_req->nr_sectors < ssize + ssize)
 				max_size = ssize + ssize;
@@ -2820,10 +2819,10 @@ static int make_raw_rw_request(void)
 	    fsector_t > buffer_max ||
 	    fsector_t < buffer_min ||
 	    ((CT(COMMAND) = FD_READ ||
-	      (!in_sector_offset && current_req->nr_sectors >= ssize))&&
+	      (!in_sector_offset && current_req->nr_sectors >= ssize)) &&
 	     max_sector > 2 * max_buffer_sectors + buffer_min &&
 	     max_size + fsector_t > 2 * max_buffer_sectors + buffer_min)
-	    /* not enough space */){
+	    /* not enough space */) {
 		buffer_track = -1;
 		buffer_drive = current_drive;
 		buffer_max = buffer_min = aligned_sector_t;
@@ -2831,7 +2830,7 @@ static int make_raw_rw_request(void)
 	raw_cmd->kernel_data = floppy_track_buffer + 
 		((aligned_sector_t-buffer_min)<<9);
 
-	if (CT(COMMAND) = FD_WRITE){
+	if (CT(COMMAND) = FD_WRITE) {
 		/* copy write buffer to track buffer.
 		 * if we get here, we know that the write
 		 * is either aligned or the data already in the buffer
@@ -2880,12 +2879,12 @@ static int make_raw_rw_request(void)
 		return 0;
 	}
 
-	if (raw_cmd->kernel_data != current_req->buffer){
+	if (raw_cmd->kernel_data != current_req->buffer) {
 		if (raw_cmd->kernel_data < floppy_track_buffer ||
 		    current_count_sectors < 0 ||
 		    raw_cmd->length < 0 ||
 		    raw_cmd->kernel_data + raw_cmd->length >
-		    floppy_track_buffer + (max_buffer_sectors  << 10)){
+		    floppy_track_buffer + (max_buffer_sectors  << 10)) {
 			DPRINT("buffer overrun in schedule dma\n");
 			printk("fsector_t=%d buffer_min=%d current_count=%ld\n",
 			       fsector_t, buffer_min,
@@ -2899,15 +2898,15 @@ static int make_raw_rw_request(void)
 			return 0;
 		}
 	} else if (raw_cmd->length > current_req->nr_sectors << 9 ||
-		   current_count_sectors > current_req->nr_sectors){
+		   current_count_sectors > current_req->nr_sectors) {
 		DPRINT("buffer overrun in direct transfer\n");
 		return 0;
-	} else if (raw_cmd->length < current_count_sectors << 9){
+	} else if (raw_cmd->length < current_count_sectors << 9) {
 		DPRINT("more sectors than bytes\n");
 		printk("bytes=%ld\n", raw_cmd->length >> 9);
 		printk("sectors=%ld\n", current_count_sectors);
 	}
-	if (raw_cmd->length = 0){
+	if (raw_cmd->length = 0) {
 		DPRINT("zero dma transfer attempted from make_raw_request\n");
 		return 0;
 	}
@@ -2958,7 +2957,7 @@ static void redo_fd_request(void)
 		if (!_floppy) { /* Autodetection */
 			if (!probing){
 				DRS->probed_format = 0;
-				if (next_valid_format()){
+				if (next_valid_format()) {
 					DPRINT("no autodetectable formats\n");
 					_floppy = NULL;
 					REPEAT;
@@ -2970,7 +2969,7 @@ static void redo_fd_request(void)
 			probing = 0;
 		errors = & (current_req->errors);
 		tmp = make_raw_rw_request();
-		if (tmp < 2){
+		if (tmp < 2) {
 			request_done(tmp);
 			continue;
 		}
@@ -3001,7 +3000,7 @@ static void process_fd_request(void)
 
 static void do_fd_request(request_queue_t * q)
 {
-	if(max_buffer_sectors = 0) {
+	if (max_buffer_sectors = 0) {
 		printk("VFS: do_fd_request called on non-open device\n");
 		return;
 	}
@@ -3132,7 +3131,7 @@ static void raw_cmd_done(int flag)
 		raw_cmd->reply_count = inr;
 		if (raw_cmd->reply_count > MAX_REPLIES)
 			raw_cmd->reply_count=0;
-		for (i=0; i< raw_cmd->reply_count; i++)
+		for (i = 0; i < raw_cmd->reply_count; i++)
 			raw_cmd->reply[i] = reply_buffer[i];
 
 		if (raw_cmd->flags & (FD_RAW_READ | FD_RAW_WRITE))
@@ -3179,10 +3178,10 @@ static inline int raw_cmd_copyout(int cm
 {
 	int ret;
 
-	while(ptr) {
+	while (ptr) {
 		COPYOUT(*ptr);
 		param += sizeof(struct floppy_raw_cmd);
-		if ((ptr->flags & FD_RAW_READ) && ptr->buffer_length){
+		if ((ptr->flags & FD_RAW_READ) && ptr->buffer_length) {
 			if (ptr->length>=0 && ptr->length<=ptr->buffer_length)
 				ECALL(fd_copyout(ptr->data, 
 						 ptr->kernel_data, 
@@ -3222,7 +3221,7 @@ static inline int raw_cmd_copyin(int cmd
 	int i;
 	
 	*rcmd = 0;
-	while(1) {
+	while (1) {
 		ptr = (struct floppy_raw_cmd *) 
 			kmalloc(sizeof(struct floppy_raw_cmd), GFP_USER);
 		if (!ptr)
@@ -3243,7 +3242,7 @@ static inline int raw_cmd_copyin(int cmd
 			 */
 			return -EINVAL;
 
-		for (i=0; i< 16; i++)
+		for (i = 0; i < 16; i++)
 			ptr->reply[i] = 0;
 		ptr->resultcode = 0;
 		ptr->kernel_data = 0;
@@ -3276,15 +3275,15 @@ static int raw_cmd_ioctl(int cmd, void *
 
 	if (FDCS->rawcmd <= 1)
 		FDCS->rawcmd = 1;
-	for (drive= 0; drive < N_DRIVE; drive++){
+	for (drive = 0; drive < N_DRIVE; drive++) {
 		if (FDC(drive) != fdc)
 			continue;
-		if (drive = current_drive){
-			if (UDRS->fd_ref > 1){
+		if (drive = current_drive) {
+			if (UDRS->fd_ref > 1) {
 				FDCS->rawcmd = 2;
 				break;
 			}
-		} else if (UDRS->fd_ref){
+		} else if (UDRS->fd_ref) {
 			FDCS->rawcmd = 2;
 			break;
 		}
@@ -3303,7 +3302,7 @@ static int raw_cmd_ioctl(int cmd, void *
 	cont = &raw_cmd_cont;
 	ret=wait_til_done(floppy_start,1);
 #ifdef DCL_DEBUG
-	if (DP->flags & FD_DEBUG){
+	if (DP->flags & FD_DEBUG) {
 		DPRINT("calling disk change from raw_cmd ioctl\n");
 	}
 #endif
@@ -3348,7 +3347,7 @@ static inline int set_geometry(unsigned 
 	    /* check if reserved bits are set */
 	    (g->stretch&~(FD_STRETCH|FD_SWAPSIDES)) != 0)
 		return -EINVAL;
-	if (type){
+	if (type) {
 		if (!capable(CAP_SYS_ADMIN))
 			return -EPERM;
 		down(&open_lock);
@@ -3427,8 +3426,8 @@ static inline int normalize_ioctl(int *c
 {
 	int i;
 
-	for (i=0; i < ARRAY_SIZE(ioctl_table); i++) {
-		if ((*cmd & 0xffff) = (ioctl_table[i] & 0xffff)){
+	for (i = 0; i < ARRAY_SIZE(ioctl_table); i++) {
+		if ((*cmd & 0xffff) = (ioctl_table[i] & 0xffff)) {
 			*size = _IOC_SIZE(*cmd);
 			*cmd = ioctl_table[i];
 			if (*size > _IOC_SIZE(*cmd)) {
@@ -3651,7 +3650,7 @@ static void __init config_types(void)
 	/* XXX */
 	/* additional physical CMOS drive detection should go here */
 
-	for (drive=0; drive < N_DRIVE; drive++){
+	for (drive = 0; drive < N_DRIVE; drive++) {
 		unsigned int type = UDP->cmos;
 		struct floppy_drive_params *params;
 		const char *name = NULL;
@@ -3743,7 +3742,7 @@ static int floppy_open(struct inode * in
 
 	res = -ENXIO;
 
-	if (!floppy_track_buffer){
+	if (!floppy_track_buffer) {
 		/* if opening an ED drive, reserve a big buffer,
 		 * else reserve a small one */
 		if ((UDP->cmos = 6) || (UDP->cmos = 5))
@@ -3935,7 +3934,7 @@ static int floppy_revalidate(struct gend
 		UCLEARF(FD_DISK_CHANGED);
 		if (cf)
 			UDRS->generation++;
-		if (NO_GEOM){
+		if (NO_GEOM) {
 			/* auto-sensing */
 			res = __floppy_read_block_0(opened_bdev[drive]);
 		} else {
@@ -4027,7 +4026,7 @@ static char __init get_fdc_version(void)
 
 	output_byte(FD_UNLOCK);
 	r = result();
-	if ((r = 1) && (reply_buffer[0] = 0x80)){
+	if ((r = 1) && (reply_buffer[0] = 0x80)) {
 		printk(KERN_INFO "FDC %d is a pre-1991 82077\n", fdc);
 		return FDC_82077_ORIG;	/* Pre-1991 82077, doesn't know 
 					 * LOCK/UNLOCK */
@@ -4075,7 +4074,7 @@ static void __init floppy_set_flags(int 
 {
 	int i;
 
-	for (i=0; i < ARRAY_SIZE(default_drive_params); i++){
+	for (i = 0; i < ARRAY_SIZE(default_drive_params); i++) {
 		if (param)
 			default_drive_params[i].params.flags |= param2;
 		else
@@ -4088,8 +4087,8 @@ static void __init daring(int *ints,int 
 {
 	int i;
 
-	for (i=0; i < ARRAY_SIZE(default_drive_params); i++){
-		if (param){
+	for (i = 0; i < ARRAY_SIZE(default_drive_params); i++) {
+		if (param) {
 			default_drive_params[i].params.select_delay = 0;
 			default_drive_params[i].params.flags |= FD_SILENT_DCL_CLEAR;
 		} else {
@@ -4104,12 +4103,12 @@ static void __init set_cmos(int *ints, i
 {
 	int current_drive=0;
 
-	if (ints[0] != 2){
+	if (ints[0] != 2) {
 		DPRINT("wrong number of parameters for CMOS\n");
 		return;
 	}
 	current_drive = ints[1];
-	if (current_drive < 0 || current_drive >= 8){
+	if (current_drive < 0 || current_drive >= 8) {
 		DPRINT("bad drive for set_cmos\n");
 		return;
 	}
@@ -4172,8 +4171,8 @@ static int __init floppy_setup(char *str
 
 	str = get_options(str,ARRAY_SIZE(ints),ints);
 	if (str) {
-		for (i=0; i< ARRAY_SIZE(config_params); i++){
-			if (strcmp(str,config_params[i].name) = 0){
+		for (i = 0; i < ARRAY_SIZE(config_params); i++) {
+			if (strcmp(str,config_params[i].name) = 0) {
 				if (ints[0])
 					param = ints[1];
 				else
@@ -4194,7 +4193,7 @@ static int __init floppy_setup(char *str
 		DPRINT("unknown floppy option [%s]\n", str);
 		
 		DPRINT("allowed options are:");
-		for (i=0; i< ARRAY_SIZE(config_params); i++)
+		for (i = 0; i < ARRAY_SIZE(config_params); i++)
 			printk(" %s",config_params[i].name);
 		printk("\n");
 	} else
@@ -4238,7 +4237,7 @@ int __init floppy_init(void)
 
 	raw_cmd = NULL;
 
-	for (i=0; i<N_DRIVE; i++) {
+	for (i = 0; i < N_DRIVE; i++) {
 		disks[i] = alloc_disk(1);
 		if (!disks[i])
 			goto Enomem;
@@ -4255,7 +4254,7 @@ int __init floppy_init(void)
 		goto fail_queue;
 	}
 
-	for (i=0; i<N_DRIVE; i++) {
+	for (i = 0; i < N_DRIVE; i++) {
 		disks[i]->major = FLOPPY_MAJOR;
 		disks[i]->first_minor = TOMINOR(i);
 		disks[i]->fops = &floppy_fops;
@@ -4324,7 +4323,7 @@ int __init floppy_init(void)
 		if (FDCS->address = -1)
 			continue;
 		FDCS->rawcmd = 2;
-		if (user_reset_fdc(-1,FD_RESET_ALWAYS,0)){
+		if (user_reset_fdc(-1,FD_RESET_ALWAYS,0)) {
  			/* free ioports reserved by floppy_grab_irq_and_dma() */
  			release_region(FDCS->address+2, 4);
  			release_region(FDCS->address+7, 1);
@@ -4334,7 +4333,7 @@ int __init floppy_init(void)
 		}
 		/* Try to determine the floppy controller type */
 		FDCS->version = get_fdc_version();
-		if (FDCS->version = FDC_NONE){
+		if (FDCS->version = FDC_NONE) {
  			/* free ioports reserved by floppy_grab_irq_and_dma() */
  			release_region(FDCS->address+2, 4);
  			release_region(FDCS->address+7, 1);
@@ -4409,7 +4408,7 @@ static int floppy_grab_irq_and_dma(void)
 	unsigned long flags;
 
 	spin_lock_irqsave(&floppy_usage_lock, flags);
-	if (usage_count++){
+	if (usage_count++) {
 		spin_unlock_irqrestore(&floppy_usage_lock, flags);
 		return 0;
 	}
@@ -4432,8 +4431,8 @@ static int floppy_grab_irq_and_dma(void)
 		return -1;
 	}
 
-	for (fdc=0; fdc< N_FDC; fdc++){
-		if (FDCS->address != -1){
+	for (fdc = 0; fdc < N_FDC; fdc++) {
+		if (FDCS->address != -1) {
 			if (!request_region(FDCS->address+2, 4, "floppy")) {
 				DPRINT("Floppy io-port 0x%04lx in use\n", FDCS->address + 2);
 				goto cleanup1;
@@ -4446,8 +4445,8 @@ static int floppy_grab_irq_and_dma(void)
 			 * Unfortunately, Adaptec doesn't know this :-(, */
 		}
 	}
-	for (fdc=0; fdc< N_FDC; fdc++){
-		if (FDCS->address != -1){
+	for (fdc = 0; fdc < N_FDC; fdc++) {
+		if (FDCS->address != -1) {
 			reset_fdc_info(1);
 			fd_outb(FDCS->dor, FD_DOR);
 		}
@@ -4493,13 +4492,12 @@ static void floppy_release_irq_and_dma(v
 	unsigned long flags;
 
 	spin_lock_irqsave(&floppy_usage_lock, flags);
-	if (--usage_count){
+	if (--usage_count) {
 		spin_unlock_irqrestore(&floppy_usage_lock, flags);
 		return;
 	}
 	spin_unlock_irqrestore(&floppy_usage_lock, flags);
-	if(irqdma_allocated)
-	{
+	if (irqdma_allocated) {
 		fd_disable_dma();
 		fd_free_dma();
 		fd_free_irq();
@@ -4522,7 +4520,7 @@ static void floppy_release_irq_and_dma(v
 
 #ifdef FLOPPY_SANITY_CHECK
 #ifndef __sparc__
-	for (drive=0; drive < N_FDC * 4; drive++)
+	for (drive = 0; drive < N_FDC * 4; drive++)
 		if (timer_pending(motor_off_timer + drive))
 			printk("motor off timer %d still active\n", drive);
 #endif


-- 
Luiz Fernando N. Capitulino
<lcapitulino@prefeitura.sp.gov.br>
<http://www.telecentros.sp.gov.br>

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
