From: Luiz Fernando Capitulino <lcapitulino@prefeitura.sp.gov.br>
Date: Wed, 03 Mar 2004 19:34:09 +0000
Subject: [Kernel-janitors] [PATCH 0/3] - De-uglification work for
Message-Id: <1078342448.14557.36.camel@telecentrolivre>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

Hi all,

 I did some de-uglification work, here is the patches.

 I don't know if the split was good enough, but is what I did: the first
patch is for attribuitions and blank lines; the second is for if()
stataments and loops; the third only for switch()s; the last is a better
definition for debugt.

 There is a extra patch for better error handling in floppy_init(). I
will also send it, but it is not "de-uglification" work.

 All of then was tested.

 Here goes the first:

diff -X dontdiff -Nparu linux-2.6.4-rc1-bk2/drivers/block/floppy.c linux-2.=
6.4-rc1-bk2~/drivers/block/floppy.c
--- linux-2.6.4-rc1-bk2/drivers/block/floppy.c	2004-02-18 15:54:22.00000000=
0 -0300
+++ linux-2.6.4-rc1-bk2~/drivers/block/floppy.c	2004-03-01 17:35:38.0000000=
00 -0300
@@ -148,7 +148,7 @@
 #define DCL_DEBUG /* debug disk change line */
=20
 /* do print messages for unexpected interrupts */
-static int print_unex=3D1;
+static int print_unex =3D 1;
 #include <linux/module.h>
 #include <linux/sched.h>
 #include <linux/fs.h>
@@ -195,9 +195,9 @@ static int slow_floppy;
 #include <asm/io.h>
 #include <asm/uaccess.h>
=20
-static int FLOPPY_IRQ=3D6;
-static int FLOPPY_DMA=3D2;
-static int can_use_virtual_dma=3D2;
+static int FLOPPY_IRQ =3D 6;
+static int FLOPPY_DMA =3D 2;
+static int can_use_virtual_dma =3D 2;
 /* =3D=3D=3D  * can use virtual DMA:
  * 0 =3D use of virtual DMA disallowed by config
@@ -221,7 +221,7 @@ static int use_virtual_dma;
 static spinlock_t floppy_lock =3D SPIN_LOCK_UNLOCKED;
 static struct completion device_release;
=20
-static unsigned short virtual_dma_port=3D0x3f0;
+static unsigned short virtual_dma_port =3D 0x3f0;
 irqreturn_t floppy_interrupt(int irq, void *dev_id, struct pt_regs * regs);
 static int set_dor(int fdc, char mask, char data);
 static void register_devfs_entries (int drive) __init;
@@ -287,7 +287,7 @@ static inline void fallback_on_nodma_all
 /* End dma memory related stuff */
=20
 static unsigned long fake_change;
-static int initialising=3D1;
+static int initialising =3D 1;
=20
 #define ITYPE(x) (((x)>>2) & 0x1f)
 #define TOMINOR(x) ((x & 3) | ((x & 4) << 5))
@@ -368,7 +368,7 @@ static int inr; /* size of reply buffer,
 static struct {
 	struct floppy_drive_params params;
 	const char *name; /* name printed while booting */
-} default_drive_params[]=3D {
+} default_drive_params[] =3D {
 /* NOTE: the time values in jiffies should be in msec!
  CMOS drive type
   |     Maximum data rate supported by drive type
@@ -736,7 +736,7 @@ static void reschedule_timeout(int drive
=20
 static int disk_change(int drive)
 {
-	int fdc=FDC(drive);
+	int fdc =3D FDC(drive);
 #ifdef FLOPPY_SANITY_CHECK
 	if (jiffies - UDRS->select_date < UDP->select_delay)
 		DPRINT("WARNING disk change called early\n");
@@ -920,7 +920,6 @@ static int _lock_fdc(int drive, int inte
 #define LOCK_FDC(drive,interruptible) \
 if (lock_fdc(drive,interruptible)) return -EINTR;
=20
-
 /* unlocks the driver */
 static inline void unlock_fdc(void)
 {
@@ -957,7 +956,7 @@ static void motor_off_callback(unsigned=20
 static void floppy_off(unsigned int drive)
 {
 	unsigned long volatile delta;
-	register int fdc=FDC(drive);
+	register int fdc =3D FDC(drive);
=20
 	if (!(FDCS->dor & (0x10 << UNIT(drive))))
 		return;
@@ -1084,7 +1083,7 @@ static void floppy_disable_hlt(void)
=20
 	spin_lock_irqsave(&floppy_hlt_lock, flags);
 	if (!hlt_disabled) {
-		hlt_disabled=3D1;
+		hlt_disabled =3D 1;
 #ifdef HAVE_DISABLE_HLT
 		disable_hlt();
 #endif
@@ -1098,7 +1097,7 @@ static void floppy_enable_hlt(void)
=20
 	spin_lock_irqsave(&floppy_hlt_lock, flags);
 	if (hlt_disabled){
-		hlt_disabled=3D0;
+		hlt_disabled =3D 0;
 #ifdef HAVE_DISABLE_HLT
 		enable_hlt();
 #endif
@@ -1106,7 +1105,6 @@ static void floppy_enable_hlt(void)
 	spin_unlock_irqrestore(&floppy_hlt_lock, flags);
 }
=20
-
 static void setup_DMA(void)
 {
 	unsigned long f;
@@ -1126,11 +1124,11 @@ static void setup_DMA(void)
 	if (((unsigned long) raw_cmd->kernel_data) % 512){
 		printk("non aligned address: %p\n", raw_cmd->kernel_data);
 		cont->done(0);
-		FDCS->reset=3D1;
+		FDCS->reset =3D 1;
 		return;
 	}
 #endif
-	f=3Dclaim_dma_lock();
+	f =3D claim_dma_lock();
 	fd_disable_dma();
 #ifdef fd_dma_setup
 	if (fd_dma_setup(raw_cmd->kernel_data, raw_cmd->length,=20
@@ -1139,7 +1137,7 @@ static void setup_DMA(void)
 			FDCS->address) < 0) {
 		release_dma_lock(f);
 		cont->done(0);
-		FDCS->reset=3D1;
+		FDCS->reset =3D 1;
 		return;
 	}
 	release_dma_lock(f);
@@ -1209,7 +1207,7 @@ static int output_byte(char byte)
 /* gets the response from the fdc */
 static int result(void)
 {
-	int i, status=3D0;
+	int i, status =3D 0;
=20
 	for(i=3D0; i < MAX_REPLIES; i++) {
 		if ((status =3D wait_til_ready()) < 0)
@@ -1543,7 +1541,7 @@ static void setup_rw_floppy(void)
 	if (flags & FD_RAW_INTR)
 		do_floppy =3D main_command_interrupt;
=20
-	r=3D0;
+	r =3D 0;
 	for (i=3D0; i< raw_cmd->cmd_count; i++)
 		r|=3Doutput_byte(raw_cmd->cmd[i]);
=20
@@ -1624,7 +1622,7 @@ static void seek_floppy(void)
 {
 	int track;
=20
-	blind_seek=3D0;
+	blind_seek =3D 0;
=20
 #ifdef DCL_DEBUG
 	if (DP->flags & FD_DEBUG){
@@ -1760,7 +1758,7 @@ irqreturn_t floppy_interrupt(int irq, vo
 	lasthandler =3D handler;
 	interruptjiffies =3D jiffies;
=20
-	f=3Dclaim_dma_lock();
+	f =3D claim_dma_lock();
 	fd_disable_dma();
 	release_dma_lock(f);
=20
@@ -1851,7 +1849,7 @@ static void reset_fdc(void)
 	/* Pseudo-DMA may intercept 'reset finished' interrupt.  */
 	/* Irrelevant for systems with true DMA (i386).          */
=20
-	flags=3Dclaim_dma_lock();
+	flags =3D claim_dma_lock();
 	fd_disable_dma();
 	release_dma_lock(flags);
=20
@@ -1874,7 +1872,6 @@ static void show_floppy(void)
 	printk("now=3D%lu last interrupt=3D%lu diff=3D%lu last called handler=3D%=
p\n",
 	       jiffies, interruptjiffies, jiffies-interruptjiffies, lasthandler);
=20
-
 #ifdef FLOPPY_SANITY_CHECK
 	printk("timeout_message=3D%s\n", timeout_message);
 	printk("last output bytes:\n");
@@ -1920,7 +1917,7 @@ static void floppy_shutdown(unsigned lon
=20
 	floppy_enable_hlt();
 =09
-	flags=3Dclaim_dma_lock();
+	flags =3D claim_dma_lock();
 	fd_disable_dma();
 	release_dma_lock(flags);
 =09
@@ -2052,7 +2049,6 @@ static struct cont_t wakeup_cont =3D {
 	.done =3D (done_f) empty
 };
=20
-
 static struct cont_t intr_cont =3D {
 	.interrupt =3D empty,
 	.redo =3D process_fd_request,
@@ -2097,9 +2093,9 @@ static int wait_til_done(void (*handler)
 	if (FDCS->reset)
 		command_status =3D FD_COMMAND_ERROR;
 	if (command_status =3D FD_COMMAND_OKAY)
-		ret=3D0;
+		ret =3D 0;
 	else
-		ret=3D-EIO;
+		ret =3D -EIO;
 	command_status =3D FD_COMMAND_NONE;
 	return ret;
 }
@@ -2324,7 +2320,6 @@ static void floppy_end_request(struct re
 	current_req =3D NULL;
 }
=20
-
 /* new request_done. Can handle physical sectors which are smaller than a
  * logical buffer */
 static void request_done(int uptodate)
@@ -3069,10 +3064,10 @@ static int user_reset_fdc(int drive, int
 {
 	int ret;
=20
-	ret=3D0;
+	ret =3D 0;
 	LOCK_FDC(drive,interruptible);
 	if (arg =3D FD_RESET_ALWAYS)
-		FDCS->reset=3D1;
+		FDCS->reset =3D 1;
 	if (FDCS->reset){
 		cont =3D &reset_cont;
 		WAIT(reset_fdc);
@@ -3119,7 +3114,6 @@ static inline const char *drive_name(int
 		return "(null)";
 }
=20
-
 /* raw commands */
 static void raw_cmd_done(int flag)
 {
@@ -3194,7 +3188,6 @@ static inline int raw_cmd_copyout(int cm
 	return 0;
 }
=20
-
 static void raw_cmd_free(struct floppy_raw_cmd **ptr)
 {
 	struct floppy_raw_cmd *next,*this;
@@ -3213,7 +3206,6 @@ static void raw_cmd_free(struct floppy_r
 	}
 }
=20
-
 static inline int raw_cmd_copyin(int cmd, char *param,
 				 struct floppy_raw_cmd **rcmd)
 {
@@ -3301,7 +3293,7 @@ static int raw_cmd_ioctl(int cmd, void *
=20
 	raw_cmd =3D my_raw_cmd;
 	cont =3D &raw_cmd_cont;
-	ret=3Dwait_til_done(floppy_start,1);
+	ret =3D wait_til_done(floppy_start,1);
 #ifdef DCL_DEBUG
 	if (DP->flags & FD_DEBUG){
 		DPRINT("calling disk change from raw_cmd ioctl\n");
@@ -3329,7 +3321,6 @@ static int invalidate_drive(struct block
 	return 0;
 }
=20
-
 static inline void clear_write_error(int drive)
 {
 	CLEARSTRUCT(UDRWE);
@@ -3354,7 +3345,7 @@ static inline int set_geometry(unsigned=20
 		down(&open_lock);
 		LOCK_FDC(drive,1);
 		floppy_type[type] =3D *g;
-		floppy_type[type].name=3D"user format";
+		floppy_type[type].name =3D "user format";
 		for (cnt =3D type << 2; cnt < (type << 2) + 4; cnt++)
 			floppy_sizes[cnt]=3D floppy_sizes[cnt+0x80] 				floppy_type[type].size+=
1;
@@ -3637,14 +3628,14 @@ static int fd_ioctl(struct inode *inode,
=20
 static void __init config_types(void)
 {
-	int first=3D1;
+	int first =3D 1;
 	int drive;
=20
 	/* read drive info out of physical CMOS */
-	drive=3D0;
+	drive =3D 0;
 	if (!UDP->cmos)
 		UDP->cmos =3D FLOPPY0_TYPE;
-	drive=3D1;
+	drive =3D 1;
 	if (!UDP->cmos && FLOPPY1_TYPE)
 		UDP->cmos =3D FLOPPY1_TYPE;
=20
@@ -3691,7 +3682,7 @@ static int floppy_release(struct inode *
=20
 	down(&open_lock);
 	if (UDRS->fd_ref < 0)
-		UDRS->fd_ref=3D0;
+		UDRS->fd_ref =3D 0;
 	else if (!UDRS->fd_ref--) {
 		DPRINT("floppy_release with fd_ref =3D 0");
 		UDRS->fd_ref =3D 0;
@@ -3755,7 +3746,7 @@ static int floppy_open(struct inode * in
 		if (!tmp && !floppy_track_buffer) {
 			try >>=3D 1; /* buffer only one side */
 			INFBOUND(try, 16);
-			tmp=3D (char *)fd_dma_mem_alloc(1024*try);
+			tmp =3D (char *)fd_dma_mem_alloc(1024*try);
 		}
 		if (!tmp && !floppy_track_buffer) {
 			fallback_on_nodma_alloc(&tmp, 2048 * try);
@@ -3805,7 +3796,7 @@ static int floppy_open(struct inode * in
 	return 0;
 out:
 	if (UDRS->fd_ref < 0)
-		UDRS->fd_ref=3D0;
+		UDRS->fd_ref =3D 0;
 	else
 		UDRS->fd_ref--;
 	if (!UDRS->fd_ref)
@@ -3908,7 +3899,7 @@ static int __floppy_read_block_0(struct=20
  * geometry formats */
 static int floppy_revalidate(struct gendisk *disk)
 {
-	int drive=3D(long)disk->private_data;
+	int drive =3D (long)disk->private_data;
 #define NO_GEOM (!current_type[drive] && !ITYPE(UDRS->fd_device))
 	int cf;
 	int res =3D 0;
@@ -4102,7 +4093,7 @@ static void __init daring(int *ints,int=20
=20
 static void __init set_cmos(int *ints, int dummy, int dummy2)
 {
-	int current_drive=3D0;
+	int current_drive =3D 0;
=20
 	if (ints[0] !=3D 2){
 		DPRINT("wrong number of parameters for CMOS\n");
@@ -4127,7 +4118,7 @@ static struct param_table {
 	int *var;
 	int def_param;
 	int param2;
-} config_params[]=3D{
+} config_params[] =3D {
 	{ "allowed_drive_mask", 0, &allowed_drive_mask, 0xff, 0}, /* obsolete */
 	{ "all_drives", 0, &allowed_drive_mask, 0xff, 0 }, /* obsolete */
 	{ "asus_pci", 0, &allowed_drive_mask, 0x33, 0},
@@ -4203,7 +4194,7 @@ static int __init floppy_setup(char *str
 	return 0;
 }
=20
-static int have_no_fdc=3D -ENODEV;
+static int have_no_fdc =3D -ENODEV;
=20
 static void floppy_device_release(struct device *dev)
 {
@@ -4351,11 +4342,11 @@ int __init floppy_init(void)
 		 */
 		user_reset_fdc(-1,FD_RESET_ALWAYS,0);
 	}
-	fdc=3D0;
+	fdc =3D 0;
 	del_timer(&fd_timeout);
 	current_drive =3D 0;
 	floppy_release_irq_and_dma();
-	initialising=3D0;
+	initialising =3D 0;
 	if (have_no_fdc) {
 		DPRINT("no floppy controllers found\n");
 		flush_scheduled_work();


--=20
Luiz Fernando N. Capitulino
<lcapitulino@prefeitura.sp.gov.br>
<http://www.telecentros.sp.gov.br>

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
