From: Daniel =?iso-8859-1?q?Marjam=E4ki?= <daniel.marjamaki@comhem.se>
Date: Mon, 14 Nov 2005 07:35:20 +0000
Subject: [KJ] [PATCH] drivers/block/floppy.c: trivial printk() updates
Message-Id: <200511140835.20684.daniel.marjamaki@comhem.se>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org


This is a trivial update that inserts appropriate KERN_ in printk() calls.

Signed-off-by: Daniel Marjam=E4ki


--- linux-2.6.14.1.orig/drivers/block/floppy.c	2005-11-14 08:14:40.00000000=
0 +0100
+++ linux-2.6.14.1/drivers/block/floppy.c	2005-11-14 08:25:46.000000000 +01=
00
@@ -310,7 +310,7 @@ static int initialising =3D 1;
 #define USETF(x) (set_bit(x##_BIT, &UDRS->flags))
 #define UTESTF(x) (test_bit(x##_BIT, &UDRS->flags))
=20
-#define DPRINT(format, args...) printk(DEVICE_NAME "%d: " format, current_=
drive , ## args)
+#define DPRINT(format, args...) printk(KERN_INFO DEVICE_NAME "%d: " format=
, current_drive , ## args)
=20
 #define PH_HEAD(floppy,head) (((((floppy)->stretch & 2) >>1) ^ head) << 2)
 #define STRETCH(floppy) ((floppy)->stretch & FD_STRETCH)
@@ -620,7 +620,7 @@ static inline void set_debugt(void)
 static inline void debugt(const char *message)
 {
 	if (DP->flags & DEBUGT)
-		printk("%s dtime=3D%lu\n", message, jiffies - debugtimer);
+		printk(KERN_INFO "%s dtime=3D%lu\n", message, jiffies - debugtimer);
 }
 #else
 static inline void set_debugt(void) { }
@@ -860,7 +860,7 @@ static void set_fdc(int drive)
 		current_drive =3D drive;
 	}
 	if (fdc !=3D 1 && fdc !=3D 0) {
-		printk("bad fdc value\n");
+		printk(KERN_INFO "bad fdc value\n");
 		return;
 	}
 	set_dor(fdc, ~0, 8);
@@ -1112,7 +1112,7 @@ static void setup_DMA(void)
 	if (raw_cmd->length =3D 0) {
 		int i;
=20
-		printk("zero dma transfer size:");
+		printk(KERN_INFO "zero dma transfer size:");
 		for (i =3D 0; i < raw_cmd->cmd_count; i++)
 			printk("%x,", raw_cmd->cmd[i]);
 		printk("\n");
@@ -1121,7 +1121,7 @@ static void setup_DMA(void)
 		return;
 	}
 	if (((unsigned long)raw_cmd->kernel_data) % 512) {
-		printk("non aligned address: %p\n", raw_cmd->kernel_data);
+		printk(KERN_INFO "non aligned address: %p\n", raw_cmd->kernel_data);
 		cont->done(0);
 		FDCS->reset =3D 1;
 		return;
@@ -1755,9 +1755,9 @@ irqreturn_t floppy_interrupt(int irq, vo
 	do_floppy =3D NULL;
 	if (fdc >=3D N_FDC || FDCS->address =3D -1) {
 		/* we don't even know which FDC is the culprit */
-		printk("DOR0=3D%x\n", fdc_state[0].dor);
-		printk("floppy interrupt on bizarre fdc %d\n", fdc);
-		printk("handler=3D%p\n", handler);
+		printk(KERN_INFO "DOR0=3D%x\n", fdc_state[0].dor);
+		printk(KERN_INFO "floppy interrupt on bizarre fdc %d\n", fdc);
+		printk(KERN_INFO "handler=3D%p\n", handler);
 		is_alive("bizarre fdc");
 		return IRQ_NONE;
 	}
@@ -1853,46 +1853,47 @@ static void show_floppy(void)
 {
 	int i;
=20
-	printk("\n");
-	printk("floppy driver state\n");
-	printk("-------------------\n");
-	printk("now=3D%lu last interrupt=3D%lu diff=3D%lu last called handler=3D%=
p\n",
+	printk(KERN_NOTICE "\n");
+	printk(KERN_NOTICE "floppy driver state\n");
+	printk(KERN_NOTICE "-------------------\n");
+	printk(KERN_NOTICE "now=3D%lu last interrupt=3D%lu diff=3D%lu last called=
 handler=3D%p\n",
 	       jiffies, interruptjiffies, jiffies - interruptjiffies,
 	       lasthandler);
=20
 #ifdef FLOPPY_SANITY_CHECK
-	printk("timeout_message=3D%s\n", timeout_message);
-	printk("last output bytes:\n");
+	printk(KERN_NOTICE "timeout_message=3D%s\n", timeout_message);
+	printk(KERN_NOTICE "last output bytes:\n");
 	for (i =3D 0; i < OLOGSIZE; i++)
-		printk("%2x %2x %lu\n",
+		printk(KERN_NOTICE "%2x %2x %lu\n",
 		       output_log[(i + output_log_pos) % OLOGSIZE].data,
 		       output_log[(i + output_log_pos) % OLOGSIZE].status,
 		       output_log[(i + output_log_pos) % OLOGSIZE].jiffies);
-	printk("last result at %lu\n", resultjiffies);
-	printk("last redo_fd_request at %lu\n", lastredo);
+	printk(KERN_NOTICE "last result at %lu\n", resultjiffies);
+	printk(KERN_NOTICE "last redo_fd_request at %lu\n", lastredo);
+	printk(KERN_NOTICE);
 	for (i =3D 0; i < resultsize; i++) {
 		printk("%2x ", reply_buffer[i]);
 	}
 	printk("\n");
 #endif
=20
-	printk("status=3D%x\n", fd_inb(FD_STATUS));
-	printk("fdc_busy=3D%lu\n", fdc_busy);
+	printk(KERN_NOTICE "status=3D%x\n", fd_inb(FD_STATUS));
+	printk(KERN_NOTICE "fdc_busy=3D%lu\n", fdc_busy);
 	if (do_floppy)
-		printk("do_floppy=3D%p\n", do_floppy);
+		printk(KERN_NOTICE "do_floppy=3D%p\n", do_floppy);
 	if (floppy_work.pending)
-		printk("floppy_work.func=3D%p\n", floppy_work.func);
+		printk(KERN_NOTICE "floppy_work.func=3D%p\n", floppy_work.func);
 	if (timer_pending(&fd_timer))
-		printk("fd_timer.function=3D%p\n", fd_timer.function);
+		printk(KERN_NOTICE "fd_timer.function=3D%p\n", fd_timer.function);
 	if (timer_pending(&fd_timeout)) {
-		printk("timer_function=3D%p\n", fd_timeout.function);
-		printk("expires=3D%lu\n", fd_timeout.expires - jiffies);
-		printk("now=3D%lu\n", jiffies);
-	}
-	printk("cont=3D%p\n", cont);
-	printk("current_req=3D%p\n", current_req);
-	printk("command_status=3D%d\n", command_status);
-	printk("\n");
+		printk(KERN_NOTICE "timer_function=3D%p\n", fd_timeout.function);
+		printk(KERN_NOTICE "expires=3D%lu\n", fd_timeout.expires - jiffies);
+		printk(KERN_NOTICE "now=3D%lu\n", jiffies);
+	}
+	printk(KERN_NOTICE "cont=3D%p\n", cont);
+	printk(KERN_NOTICE "current_req=3D%p\n", current_req);
+	printk(KERN_NOTICE "command_status=3D%d\n", command_status);
+	printk(KERN_NOTICE "\n");
 }
=20
 static void floppy_shutdown(unsigned long data)
@@ -1918,7 +1919,7 @@ static void floppy_shutdown(unsigned lon
 		cont->done(0);
 		cont->redo();	/* this will recall reset when needed */
 	} else {
-		printk("no cont in shutdown!\n");
+		printk(KERN_INFO "no cont in shutdown!\n");
 		process_fd_request();
 	}
 	is_alive("floppy shutdown");
@@ -2320,7 +2321,7 @@ static void request_done(int uptodate)
 	reschedule_timeout(MAXTIMEOUT, "request done %d", uptodate);
=20
 	if (!req) {
-		printk("floppy.c: no request in request_done\n");
+		printk(KERN_INFO "floppy.c: no request in request_done\n");
 		return;
 	}
=20
@@ -2390,13 +2391,13 @@ static void rw_interrupt(void)
 	    (in_sector_offset + current_count_sectors + ssize - 1) / ssize) {
 		DPRINT("long rw: %x instead of %lx\n",
 		       nr_sectors, current_count_sectors);
-		printk("rs=3D%d s=3D%d\n", R_SECTOR, SECTOR);
-		printk("rh=3D%d h=3D%d\n", R_HEAD, HEAD);
-		printk("rt=3D%d t=3D%d\n", R_TRACK, TRACK);
-		printk("heads=3D%d eoc=3D%d\n", heads, eoc);
-		printk("spt=3D%d st=3D%d ss=3D%d\n", SECT_PER_TRACK,
+		printk(KERN_INFO "rs=3D%d s=3D%d\n", R_SECTOR, SECTOR);
+		printk(KERN_INFO "rh=3D%d h=3D%d\n", R_HEAD, HEAD);
+		printk(KERN_INFO "rt=3D%d t=3D%d\n", R_TRACK, TRACK);
+		printk(KERN_INFO "heads=3D%d eoc=3D%d\n", heads, eoc);
+		printk(KERN_INFO "spt=3D%d st=3D%d ss=3D%d\n", SECT_PER_TRACK,
 		       fsector_t, ssize);
-		printk("in_sector_offset=3D%d\n", in_sector_offset);
+		printk(KERN_INFO "in_sector_offset=3D%d\n", in_sector_offset);
 	}
 #endif
=20
@@ -2509,14 +2510,14 @@ static void copy_buffer(int ssize, int m
 	if ((remaining >> 9) > current_req->nr_sectors &&
 	    CT(COMMAND) =3D FD_WRITE) {
 		DPRINT("in copy buffer\n");
-		printk("current_count_sectors=3D%ld\n", current_count_sectors);
-		printk("remaining=3D%d\n", remaining >> 9);
-		printk("current_req->nr_sectors=3D%ld\n",
+		printk(KERN_INFO "current_count_sectors=3D%ld\n", current_count_sectors);
+		printk(KERN_INFO "remaining=3D%d\n", remaining >> 9);
+		printk(KERN_INFO "current_req->nr_sectors=3D%ld\n",
 		       current_req->nr_sectors);
-		printk("current_req->current_nr_sectors=3D%u\n",
+		printk(KERN_INFO "current_req->current_nr_sectors=3D%u\n",
 		       current_req->current_nr_sectors);
-		printk("max_sector=3D%d\n", max_sector);
-		printk("ssize=3D%d\n", ssize);
+		printk(KERN_INFO "max_sector=3D%d\n", max_sector);
+		printk(KERN_INFO "ssize=3D%d\n", ssize);
 	}
 #endif
=20
@@ -2542,14 +2543,14 @@ static void copy_buffer(int ssize, int m
 				DPRINT("buffer overrun in copy buffer %d\n",
 				       (int)((floppy_track_buffer -
 					      dma_buffer) >> 9));
-				printk("fsector_t=3D%d buffer_min=3D%d\n",
+				printk(KERN_INFO "fsector_t=3D%d buffer_min=3D%d\n",
 				       fsector_t, buffer_min);
-				printk("current_count_sectors=3D%ld\n",
+				printk(KERN_INFO "current_count_sectors=3D%ld\n",
 				       current_count_sectors);
 				if (CT(COMMAND) =3D FD_READ)
-					printk("read\n");
+					printk(KERN_INFO "read\n");
 				if (CT(COMMAND) =3D FD_WRITE)
-					printk("write\n");
+					printk(KERN_INFO "write\n");
 				break;
 			}
 			if (((unsigned long)buffer) % 512)
@@ -2578,7 +2579,7 @@ static inline int check_dma_crossing(cha
 				     unsigned long length, char *message)
 {
 	if (CROSS_64KB(start, length)) {
-		printk("DMA xfer crosses 64KB boundary in %s %p-%p\n",
+		printk(KERN_INFO "DMA xfer crosses 64KB boundary in %s %p-%p\n",
 		       message, start, start + length);
 		return 1;
 	} else
@@ -2604,7 +2605,7 @@ static void virtualdmabug_workaround(voi
 		end_sector =3D SECTOR + hard_sectors - 1;
 #ifdef FLOPPY_SANITY_CHECK
 		if (end_sector > SECT_PER_TRACK) {
-			printk("too many sectors %d > %d\n",
+			printk(KERN_INFO "too many sectors %d > %d\n",
 			       end_sector, SECT_PER_TRACK);
 			return;
 		}
@@ -2630,7 +2631,7 @@ static int make_raw_rw_request(void)
 	int max_sector, max_size, tracksize, ssize;
=20
 	if (max_buffer_sectors =3D 0) {
-		printk("VFS: Block I/O scheduled on unopened device\n");
+		printk(KERN_INFO "VFS: Block I/O scheduled on unopened device\n");
 		return 0;
 	}
=20
@@ -2859,19 +2860,19 @@ static int make_raw_rw_request(void)
 		DPRINT("fractionary current count b=3D%lx s=3D%lx\n",
 		       raw_cmd->length, current_count_sectors);
 		if (raw_cmd->kernel_data !=3D current_req->buffer)
-			printk("addr=3D%d, length=3D%ld\n",
+			printk(KERN_INFO "addr=3D%d, length=3D%ld\n",
 			       (int)((raw_cmd->kernel_data -
 				      floppy_track_buffer) >> 9),
 			       current_count_sectors);
-		printk("st=3D%d ast=3D%d mse=3D%d msi=3D%d\n",
+		printk(KERN_INFO "st=3D%d ast=3D%d mse=3D%d msi=3D%d\n",
 		       fsector_t, aligned_sector_t, max_sector, max_size);
-		printk("ssize=3D%x SIZECODE=3D%d\n", ssize, SIZECODE);
-		printk("command=3D%x SECTOR=3D%d HEAD=3D%d, TRACK=3D%d\n",
+		printk(KERN_INFO "ssize=3D%x SIZECODE=3D%d\n", ssize, SIZECODE);
+		printk(KERN_INFO "command=3D%x SECTOR=3D%d HEAD=3D%d, TRACK=3D%d\n",
 		       COMMAND, SECTOR, HEAD, TRACK);
-		printk("buffer drive=3D%d\n", buffer_drive);
-		printk("buffer track=3D%d\n", buffer_track);
-		printk("buffer_min=3D%d\n", buffer_min);
-		printk("buffer_max=3D%d\n", buffer_max);
+		printk(KERN_INFO "buffer drive=3D%d\n", buffer_drive);
+		printk(KERN_INFO "buffer track=3D%d\n", buffer_track);
+		printk(KERN_INFO "buffer_min=3D%d\n", buffer_min);
+		printk(KERN_INFO "buffer_max=3D%d\n", buffer_max);
 		return 0;
 	}
=20
@@ -2882,14 +2883,14 @@ static int make_raw_rw_request(void)
 		    raw_cmd->kernel_data + raw_cmd->length >
 		    floppy_track_buffer + (max_buffer_sectors << 10)) {
 			DPRINT("buffer overrun in schedule dma\n");
-			printk("fsector_t=3D%d buffer_min=3D%d current_count=3D%ld\n",
+			printk(KERN_INFO "fsector_t=3D%d buffer_min=3D%d current_count=3D%ld\n",
 			       fsector_t, buffer_min, raw_cmd->length >> 9);
-			printk("current_count_sectors=3D%ld\n",
+			printk(KERN_INFO "current_count_sectors=3D%ld\n",
 			       current_count_sectors);
 			if (CT(COMMAND) =3D FD_READ)
-				printk("read\n");
+				printk(KERN_INFO "read\n");
 			if (CT(COMMAND) =3D FD_WRITE)
-				printk("write\n");
+				printk(KERN_INFO "write\n");
 			return 0;
 		}
 	} else if (raw_cmd->length > current_req->nr_sectors << 9 ||
@@ -2898,8 +2899,8 @@ static int make_raw_rw_request(void)
 		return 0;
 	} else if (raw_cmd->length < current_count_sectors << 9) {
 		DPRINT("more sectors than bytes\n");
-		printk("bytes=3D%ld\n", raw_cmd->length >> 9);
-		printk("sectors=3D%ld\n", current_count_sectors);
+		printk(KERN_INFO "bytes=3D%ld\n", raw_cmd->length >> 9);
+		printk(KERN_INFO "sectors=3D%ld\n", current_count_sectors);
 	}
 	if (raw_cmd->length =3D 0) {
 		DPRINT("zero dma transfer attempted from make_raw_request\n");
@@ -2996,14 +2997,14 @@ static void process_fd_request(void)
 static void do_fd_request(request_queue_t * q)
 {
 	if (max_buffer_sectors =3D 0) {
-		printk("VFS: do_fd_request called on non-open device\n");
+		printk(KERN_INFO "VFS: do_fd_request called on non-open device\n");
 		return;
 	}
=20
 	if (usage_count =3D 0) {
-		printk("warning: usage count=3D0, current_req=3D%p exiting\n",
+		printk(KERN_INFO "warning: usage count=3D0, current_req=3D%p exiting\n",
 		       current_req);
-		printk("sect=3D%ld flags=3D%lx\n", (long)current_req->sector,
+		printk(KERN_INFO "sect=3D%ld flags=3D%lx\n", (long)current_req->sector,
 		       current_req->flags);
 		return;
 	}
@@ -3051,7 +3052,7 @@ static int poll_drive(int interruptible,
=20
 static void reset_intr(void)
 {
-	printk("weird, reset interrupt called\n");
+	printk(KERN_WARNING "weird, reset interrupt called\n");
 }
=20
 static struct cont_t reset_cont =3D {
@@ -3421,7 +3422,7 @@ static inline int normalize_ioctl(int *c
 			*size =3D _IOC_SIZE(*cmd);
 			*cmd =3D ioctl_table[i];
 			if (*size > _IOC_SIZE(*cmd)) {
-				printk("ioctl not yet supported\n");
+				printk(KERN_ERR "ioctl not yet supported\n");
 				return -EFAULT;
 			}
 			return 0;
@@ -3904,7 +3905,7 @@ static int floppy_revalidate(struct gend
 	if (UTESTF(FD_DISK_CHANGED) ||
 	    UTESTF(FD_VERIFY) || test_bit(drive, &fake_change) || NO_GEOM) {
 		if (usage_count =3D 0) {
-			printk("VFS: revalidate called on non-open device.\n");
+			printk(KERN_INFO "VFS: revalidate called on non-open device.\n");
 			return -EFAULT;
 		}
 		lock_fdc(drive, 0);
@@ -4022,14 +4023,14 @@ static char __init get_fdc_version(void)
 					 * LOCK/UNLOCK */
 	}
 	if ((r !=3D 1) || (reply_buffer[0] !=3D 0x00)) {
-		printk("FDC %d init: UNLOCK: unexpected return of %d bytes.\n",
+		printk(KERN_WARNING "FDC %d init: UNLOCK: unexpected return of %d bytes.=
\n",
 		       fdc, r);
 		return FDC_UNKNOWN;
 	}
 	output_byte(FD_PARTID);
 	r =3D result();
 	if (r !=3D 1) {
-		printk("FDC %d init: PARTID: unexpected return of %d bytes.\n",
+		printk(KERN_WARNING "FDC %d init: PARTID: unexpected return of %d bytes.=
\n",
 		       fdc, r);
 		return FDC_UNKNOWN;
 	}
@@ -4544,15 +4545,15 @@ static void floppy_release_irq_and_dma(v
 #ifndef __sparc__
 	for (drive =3D 0; drive < N_FDC * 4; drive++)
 		if (timer_pending(motor_off_timer + drive))
-			printk("motor off timer %d still active\n", drive);
+			printk(KERN_INFO "motor off timer %d still active\n", drive);
 #endif
=20
 	if (timer_pending(&fd_timeout))
-		printk("floppy timer still active:%s\n", timeout_message);
+		printk(KERN_INFO "floppy timer still active:%s\n", timeout_message);
 	if (timer_pending(&fd_timer))
-		printk("auxiliary floppy timer still active\n");
+		printk(KERN_INFO "auxiliary floppy timer still active\n");
 	if (floppy_work.pending)
-		printk("work still pending\n");
+		printk(KERN_INFO "work still pending\n");
 #endif
 	old_fdc =3D fdc;
 	for (fdc =3D 0; fdc < N_FDC; fdc++)


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
