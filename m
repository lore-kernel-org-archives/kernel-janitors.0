From: james4765@verizon.net
Date: Sat, 30 Oct 2004 19:46:34 +0000
Subject: [KJ] [RFC][PATCH 1/2] floppy: drivers/block/floppy.c cleanup
Message-Id: <20041030194633.5280.8917.69695@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============47893606754643292=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============47893606754643292==

Pull all static variable definitions to top of file, move defines, macros,
includes, and prototypes to new file drivers/block/floppy.h.

Primarily readability improvements.

Signed-off-by : James Nelson <james4765@gmail.com>

diff -urN --exclude='*~' linux-2.6.9-original/drivers/block/floppy.c linux-2.6.9/drivers/block/floppy.c
--- linux-2.6.9-original/drivers/block/floppy.c	2004-10-18 17:53:22.000000000 -0400
+++ linux-2.6.9/drivers/block/floppy.c	2004-10-30 14:46:12.817989844 -0400
@@ -98,6 +98,10 @@
  */
 
 /*
+ * 1998/1/21 -- Richard Gooch <rgooch@atnf.csiro.au> -- devfs support
+ */
+
+/*
  * 1998/05/07 -- Russell King -- More portability cleanups; moved definition of
  * interrupt and dma channel to asm/floppy.h. Cleaned up some formatting &
  * use of '0' for NULL.
@@ -139,63 +143,25 @@
  * Better audit of register_blkdev.
  */
 
-#define FLOPPY_SANITY_CHECK
-#undef  FLOPPY_SILENT_DCL_CLEAR
+/* 2004/10/30 -- James Nelson - move prototypes and #defines to new file
+ * floppy.h.
+ */
 
-#define REALLY_SLOW_IO
+#include "floppy.h"
 
-#define DEBUGT 2
-#define DCL_DEBUG		/* debug disk change line */
+typedef void (*timeout_fn) (unsigned long);
+typedef void (*done_f) (int);
 
-/* do print messages for unexpected interrupts */
 static int print_unex = 1;
-#include <linux/module.h>
-#include <linux/sched.h>
-#include <linux/fs.h>
-#include <linux/kernel.h>
-#include <linux/timer.h>
-#include <linux/workqueue.h>
-#include <linux/version.h>
-#define FDPATCHES
-#include <linux/fdreg.h>
-
-/*
- * 1998/1/21 -- Richard Gooch <rgooch@atnf.csiro.au> -- devfs support
- */
-
-#include <linux/fd.h>
-#include <linux/hdreg.h>
-
-#include <linux/errno.h>
-#include <linux/slab.h>
-#include <linux/mm.h>
-#include <linux/bio.h>
-#include <linux/string.h>
-#include <linux/fcntl.h>
-#include <linux/delay.h>
-#include <linux/mc146818rtc.h>	/* CMOS defines */
-#include <linux/ioport.h>
-#include <linux/interrupt.h>
-#include <linux/init.h>
-#include <linux/devfs_fs_kernel.h>
-#include <linux/device.h>
-#include <linux/buffer_head.h>	/* for invalidate_buffers() */
+/* do print messages for unexpected interrupts */
 
+static int slow_floppy;
 /*
  * PS/2 floppies have much slower step rates than regular floppies.
  * It's been recommended that take about 1/4 of the default speed
  * in some more extreme cases.
  */
-static int slow_floppy;
-
-#include <asm/dma.h>
-#include <asm/irq.h>
-#include <asm/system.h>
-#include <asm/io.h>
-#include <asm/uaccess.h>
 
-static int FLOPPY_IRQ = 6;
-static int FLOPPY_DMA = 2;
 static int can_use_virtual_dma = 2;
 /* =======
  * can use virtual DMA:
@@ -217,17 +183,8 @@
  * record each buffers capabilities
  */
 
-static spinlock_t floppy_lock = SPIN_LOCK_UNLOCKED;
-static struct completion device_release;
-
-static unsigned short virtual_dma_port = 0x3f0;
-irqreturn_t floppy_interrupt(int irq, void *dev_id, struct pt_regs *regs);
-static int set_dor(int fdc, char mask, char data);
-static void register_devfs_entries(int drive) __init;
-
-#define K_64	0x10000		/* 64KB */
-
-/* the following is the mask of allowed drives. By default units 2 and
+static int allowed_drive_mask = 0x33;
+/* the previous is the mask of allowed drives. By default units 2 and
  * 3 of both floppy controllers are disabled, because switching on the
  * motor of these drives causes system hangs on some PCI computers. drive
  * 0 is the low bit (0x1), and drive 7 is the high bit (0x80). Bits are on if
@@ -237,129 +194,127 @@
  *       some ports reference this variable from there. -DaveM
  */
 
-static int allowed_drive_mask = 0x33;
+static int probing;
+/*
+ * The driver is trying to determine the correct media format
+ * while probing is set. rw_interrupt() clears it after a
+ * successful access.
+ */
 
-#include <asm/floppy.h>
+static int format_errors;
+/* Errors during formatting are counted here. */
 
-static int irqdma_allocated;
+static int inr;
+/* size of reply buffer, when called from interrupt */
 
-#define LOCAL_END_REQUEST
-#define DEVICE_NAME "floppy"
+static int buffer_track = -1;
+static int buffer_drive = -1;
+static int buffer_min = -1;
+static int buffer_max = -1;
+/* buffer related variables */
 
-#include <linux/blkdev.h>
-#include <linux/blkpg.h>
-#include <linux/cdrom.h>	/* for the compatibility eject ioctl */
-#include <linux/completion.h>
+static int fdc;
+/* current fdc */
 
-static struct request *current_req;
-static struct request_queue *floppy_queue;
-static void do_fd_request(request_queue_t * q);
+static int ioctl_table[] = {
+	FDCLRPRM,
+	FDSETPRM,
+	FDDEFPRM,
+	FDGETPRM,
+	FDMSGON,
+	FDMSGOFF,
+	FDFMTBEG,
+	FDFMTTRK,
+	FDFMTEND,
+	FDSETEMSGTRESH,
+	FDFLUSH,
+	FDSETMAXERRS,
+	FDGETMAXERRS,
+	FDGETDRVTYP,
+	FDSETDRVPRM,
+	FDGETDRVPRM,
+	FDGETDRVSTAT,
+	FDPOLLDRVSTAT,
+	FDRESET,
+	FDGETFDCSTAT,
+	FDWERRORCLR,
+	FDWERRORGET,
+	FDRAWCMD,
+	FDEJECT,
+	FDTWADDLE
+};
 
-#ifndef fd_get_dma_residue
-#define fd_get_dma_residue() get_dma_residue(FLOPPY_DMA)
-#endif
+static int t360[] = { 1, 0 },
+	t1200[] = { 2, 5, 6, 10, 12, 14, 16, 18, 20, 23, 0 },
+	t3in[] = { 8, 9, 26, 27, 28, 7, 11, 15, 19, 24, 25, 29, 31, 3, 4, 13,
+			17, 21, 22, 30, 0 };
+static int *table_sup[] =
+    { NULL, t360, t1200, t3in + 5 + 8, t3in + 5, t3in, t3in };
 
-/* Dma Memory related stuff */
 
-#ifndef fd_dma_mem_free
-#define fd_dma_mem_free(addr, size) free_pages(addr, get_order(size))
-#endif
+static int FLOPPY_IRQ = 6;
+static int FLOPPY_DMA = 2;
+static int initialising = 1;
+static int have_no_fdc = -ENODEV;
+static int fifo_depth = 0xa;
+static int irqdma_allocated;
+static int max_buffer_sectors;
+static int usage_count;
+static int blind_seek;
+static int hlt_disabled;
+static int no_fifo;
 
-#ifndef fd_dma_mem_alloc
-#define fd_dma_mem_alloc(size) __get_dma_pages(GFP_KERNEL,get_order(size))
-#endif
+static int *errors;
 
-static inline void fallback_on_nodma_alloc(char **addr, size_t l)
-{
-#ifdef FLOPPY_CAN_FALLBACK_ON_NODMA
-	if (*addr)
-		return;		/* we have the memory */
-	if (can_use_virtual_dma != 2)
-		return;		/* no fallback allowed */
-	printk
-	    ("DMA memory shortage. Temporarily falling back on virtual DMA\n");
-	*addr = (char *)nodma_mem_alloc(l);
-#else
-	return;
-#endif
-}
+static volatile int command_status = FD_COMMAND_NONE;
+
+static unsigned short virtual_dma_port = 0x3f0;
 
-/* End dma memory related stuff */
+static long current_count_sectors;
 
 static unsigned long fake_change;
-static int initialising = 1;
+static unsigned long fdc_busy;
+static unsigned long debugtimer;
 
-#define ITYPE(x) (((x)>>2) & 0x1f)
-#define TOMINOR(x) ((x & 3) | ((x & 4) << 5))
-#define UNIT(x) ((x) & 0x03)	/* drive on fdc */
-#define FDC(x) (((x) & 0x04) >> 2)	/* fdc of drive */
-#define REVDRIVE(fdc, unit) ((unit) + ((fdc) << 2))
-				/* reverse mapping from unit and fdc to drive */
-#define DP (&drive_params[current_drive])
-#define DRS (&drive_state[current_drive])
-#define DRWE (&write_errors[current_drive])
-#define FDCS (&fdc_state[fdc])
-#define CLEARF(x) (clear_bit(x##_BIT, &DRS->flags))
-#define SETF(x) (set_bit(x##_BIT, &DRS->flags))
-#define TESTF(x) (test_bit(x##_BIT, &DRS->flags))
-
-#define UDP (&drive_params[drive])
-#define UDRS (&drive_state[drive])
-#define UDRWE (&write_errors[drive])
-#define UFDCS (&fdc_state[FDC(drive)])
-#define UCLEARF(x) (clear_bit(x##_BIT, &UDRS->flags))
-#define USETF(x) (set_bit(x##_BIT, &UDRS->flags))
-#define UTESTF(x) (test_bit(x##_BIT, &UDRS->flags))
-
-#define DPRINT(format, args...) printk(DEVICE_NAME "%d: " format, current_drive , ## args)
-
-#define PH_HEAD(floppy,head) (((((floppy)->stretch & 2) >>1) ^ head) << 2)
-#define STRETCH(floppy) ((floppy)->stretch & FD_STRETCH)
-
-#define CLEARSTRUCT(x) memset((x), 0, sizeof(*(x)))
-
-/* read/write */
-#define COMMAND raw_cmd->cmd[0]
-#define DR_SELECT raw_cmd->cmd[1]
-#define TRACK raw_cmd->cmd[2]
-#define HEAD raw_cmd->cmd[3]
-#define SECTOR raw_cmd->cmd[4]
-#define SIZECODE raw_cmd->cmd[5]
-#define SECT_PER_TRACK raw_cmd->cmd[6]
-#define GAP raw_cmd->cmd[7]
-#define SIZECODE2 raw_cmd->cmd[8]
-#define NR_RW 9
-
-/* format */
-#define F_SIZECODE raw_cmd->cmd[2]
-#define F_SECT_PER_TRACK raw_cmd->cmd[3]
-#define F_GAP raw_cmd->cmd[4]
-#define F_FILL raw_cmd->cmd[5]
-#define NR_F 6
+static char *table[] = {
+	"", "d360", "h1200", "u360", "u720", "h360", "h720",
+	"u1440", "u2880", "CompaQ", "h1440", "u1680", "h410",
+	"u820", "h1476", "u1722", "h420", "u830", "h1494", "u1743",
+	"h880", "u1040", "u1120", "h1600", "u1760", "u1920",
+	"u3200", "u3520", "u3840", "u1840", "u800", "u1600",
+	NULL
+};
 
+static char *floppy_track_buffer;
 /*
- * Maximum disk size (in kilobytes). This default is used whenever the
- * current disk size is unknown.
- * [Now it is rather a minimum]
+ * Track buffer
+ * Because these are written to by the DMA controller, they must
+ * not contain a 64k byte boundary crossing, or data will be
+ * corrupted/lost.
  */
-#define MAX_DISK_SIZE 4		/* 3984 */
 
-/*
- * globals used by 'result()'
- */
-#define MAX_REPLIES 16
+static unsigned char fsector_t;
+/* sector in track */
+
+static unsigned char in_sector_offset;
+/* offset within physical sector, expressed in units of 512 bytes */
+
+static unsigned char current_drive;
 static unsigned char reply_buffer[MAX_REPLIES];
-static int inr;			/* size of reply buffer, when called from interrupt */
-#define ST0 (reply_buffer[0])
-#define ST1 (reply_buffer[1])
-#define ST2 (reply_buffer[2])
-#define ST3 (reply_buffer[0])	/* result of GETSTATUS */
-#define R_TRACK (reply_buffer[3])
-#define R_HEAD (reply_buffer[4])
-#define R_SECTOR (reply_buffer[5])
-#define R_SIZECODE (reply_buffer[6])
 
-#define SEL_DLY (2*HZ/100)
+static const char *timeout_message;
+
+static spinlock_t floppy_lock = SPIN_LOCK_UNLOCKED;
+static spinlock_t floppy_hlt_lock = SPIN_LOCK_UNLOCKED;
+static spinlock_t floppy_usage_lock = SPIN_LOCK_UNLOCKED;
+
+static sector_t floppy_sizes[256];
+
+static void (*do_floppy) (void) = NULL;
+static void register_devfs_entries(int drive) __init;
+
+/* Format request descriptor. */
+static struct format_descr format_req;
 
 /*
  * this struct defines the different floppy drive types.
@@ -409,15 +364,6 @@
  *	            Frequency of disk change checks */
 };
 
-static struct floppy_drive_params drive_params[N_DRIVE];
-static struct floppy_drive_struct drive_state[N_DRIVE];
-static struct floppy_write_errors write_errors[N_DRIVE];
-static struct timer_list motor_off_timer[N_DRIVE];
-static struct gendisk *disks[N_DRIVE];
-static struct block_device *opened_bdev[N_DRIVE];
-static DECLARE_MUTEX(open_lock);
-static struct floppy_raw_cmd *raw_cmd, default_raw_cmd;
-
 /*
  * This struct defines the different floppy types.
  *
@@ -480,8 +426,11 @@
 	{ 3200,20,2,80,0,0x1C,0x00,0xCF,0x2C,"H1600" }, /* 31 1.6MB 3.5"    */
 };
 
-#define	NUMBER(x)	(sizeof(x) / sizeof(*(x)))
-#define SECTSIZE (_FD_SECTSIZE(*floppy))
+#include <asm/floppy.h>
+/* =====
+ * This #include must be here - relies on a number of static variables defined
+ * above here.  A number of the structs below rely upon it as well.
+ */
 
 /* Auto-detection: Disk type used until the next media change occurs. */
 static struct floppy_struct *current_type[N_DRIVE];
@@ -492,55 +441,24 @@
  */
 static struct floppy_struct user_params[N_DRIVE];
 
-static sector_t floppy_sizes[256];
-
-/*
- * The driver is trying to determine the correct media format
- * while probing is set. rw_interrupt() clears it after a
- * successful access.
- */
-static int probing;
-
-/* Synchronization of FDC access. */
-#define FD_COMMAND_NONE -1
-#define FD_COMMAND_ERROR 2
-#define FD_COMMAND_OKAY 3
-
-static volatile int command_status = FD_COMMAND_NONE;
-static unsigned long fdc_busy;
-static DECLARE_WAIT_QUEUE_HEAD(fdc_wait);
-static DECLARE_WAIT_QUEUE_HEAD(command_done);
-
-#define NO_SIGNAL (!interruptible || !signal_pending(current))
-#define CALL(x) if ((x) == -EINTR) return -EINTR
-#define ECALL(x) if ((ret = (x))) return ret;
-#define _WAIT(x,i) CALL(ret=wait_til_done((x),i))
-#define WAIT(x) _WAIT((x),interruptible)
-#define IWAIT(x) _WAIT((x),1)
-
-/* Errors during formatting are counted here. */
-static int format_errors;
-
-/* Format request descriptor. */
-static struct format_descr format_req;
+/* fdc related variables, should end up in a struct */
+static struct floppy_fdc_state fdc_state[N_FDC];
 
-/*
- * Rate is 0 for 500kb/s, 1 for 300kbps, 2 for 250kbps
- * Spec1 is 0xSH, where S is stepping rate (F=1ms, E=2ms, D=3ms etc),
- * H is head unload time (1=16ms, 2=32ms, etc)
- */
+static struct completion device_release;
+static struct request *current_req;
+static struct request_queue *floppy_queue;
 
-/*
- * Track buffer
- * Because these are written to by the DMA controller, they must
- * not contain a 64k byte boundary crossing, or data will be
- * corrupted/lost.
- */
-static char *floppy_track_buffer;
-static int max_buffer_sectors;
+static struct floppy_drive_params drive_params[N_DRIVE];
+static struct floppy_drive_struct drive_state[N_DRIVE];
+static struct floppy_write_errors write_errors[N_DRIVE];
+static struct timer_list motor_off_timer[N_DRIVE];
+static struct gendisk *disks[N_DRIVE];
+static struct block_device *opened_bdev[N_DRIVE];
+static struct floppy_raw_cmd *raw_cmd, default_raw_cmd;
+static struct floppy_struct *_floppy = floppy_type;
+static struct timer_list fd_timer = TIMER_INITIALIZER(NULL, 0, 0);
+static struct timer_list fd_timeout = TIMER_INITIALIZER(floppy_shutdown, 0, 0);
 
-static int *errors;
-typedef void (*done_f) (int);
 static struct cont_t {
 	void (*interrupt) (void);	/* this is called after the interrupt of the
 					 * main command */
@@ -550,66 +468,32 @@
 				 * succeeded/failed */
 } *cont;
 
-static void floppy_ready(void);
-static void floppy_start(void);
-static void process_fd_request(void);
-static void recalibrate_floppy(void);
-static void floppy_shutdown(unsigned long);
 
-static int floppy_grab_irq_and_dma(void);
-static void floppy_release_irq_and_dma(void);
 
-/*
- * The "reset" variable should be tested whenever an interrupt is scheduled,
- * after the commands have been sent. This is to ensure that the driver doesn't
- * get wedged when the interrupt doesn't come because of a failed command.
- * reset doesn't need to be tested before sending commands, because
- * output_byte is automatically disabled when reset is set.
- */
-#define CHECK_RESET { if (FDCS->reset){ reset_fdc(); return; } }
-static void reset_fdc(void);
 
-/*
- * These are global variables, as that's the easiest way to give
- * information to interrupts. They are the data used for the current
- * request.
- */
-#define NO_TRACK -1
-#define NEED_1_RECAL -2
-#define NEED_2_RECAL -3
 
-static int usage_count;
 
-/* buffer related variables */
-static int buffer_track = -1;
-static int buffer_drive = -1;
-static int buffer_min = -1;
-static int buffer_max = -1;
 
-/* fdc related variables, should end up in a struct */
-static struct floppy_fdc_state fdc_state[N_FDC];
-static int fdc;			/* current fdc */
 
-static struct floppy_struct *_floppy = floppy_type;
-static unsigned char current_drive;
-static long current_count_sectors;
-static unsigned char fsector_t;	/* sector in track */
-static unsigned char in_sector_offset;	/* offset within physical sector,
-					 * expressed in units of 512 bytes */
 
-#ifndef fd_eject
-static inline int fd_eject(int drive)
-{
-	return -EINVAL;
-}
-#endif
+
+
+/* JSN: where shoud this go?
+ * Rate is 0 for 500kb/s, 1 for 300kbps, 2 for 250kbps
+ * Spec1 is 0xSH, where S is stepping rate (F=1ms, E=2ms, D=3ms etc),
+ * H is head unload time (1=16ms, 2=32ms, etc)
+ */
+
+
+
+
+
 
 /*
  * Debugging
  * =========
  */
 #ifdef DEBUGT
-static long unsigned debugtimer;
 
 static inline void set_debugt(void)
 {
@@ -626,23 +510,6 @@
 static inline void debugt(const char *message) { }
 #endif /* DEBUGT */
 
-typedef void (*timeout_fn) (unsigned long);
-static struct timer_list fd_timeout = TIMER_INITIALIZER(floppy_shutdown, 0, 0);
-
-static const char *timeout_message;
-
-#ifdef FLOPPY_SANITY_CHECK
-static void is_alive(const char *message)
-{
-	/* this routine checks whether the floppy driver is "alive" */
-	if (test_bit(0, &fdc_busy) && command_status < 2
-	    && !timer_pending(&fd_timeout)) {
-		DPRINT("timeout handler died: %s\n", message);
-	}
-}
-#endif
-
-static void (*do_floppy) (void) = NULL;
 
 #ifdef FLOPPY_SANITY_CHECK
 
@@ -661,10 +528,59 @@
 } output_log[OLOGSIZE];
 
 static int output_log_pos;
+
+static void is_alive(const char *message)
+{
+	/* this routine checks whether the floppy driver is "alive" */
+	if (test_bit(0, &fdc_busy) && command_status < 2
+	    && !timer_pending(&fd_timeout)) {
+		DPRINT("timeout handler died: %s\n", message);
+	}
+}
+
+#endif /* FLOPPY_SANITY_CHECK */
+
+
+/* DMA memory related stuff */
+
+#ifndef fd_get_dma_residue
+#define fd_get_dma_residue() get_dma_residue(FLOPPY_DMA)
+#endif
+
+#ifndef fd_dma_mem_free
+#define fd_dma_mem_free(addr, size) free_pages(addr, get_order(size))
+#endif
+
+#ifndef fd_dma_mem_alloc
+#define fd_dma_mem_alloc(size) __get_dma_pages(GFP_KERNEL,get_order(size))
+#endif
+
+static inline void fallback_on_nodma_alloc(char **addr, size_t l)
+{
+#ifdef FLOPPY_CAN_FALLBACK_ON_NODMA
+	if (*addr)
+		return;		/* we have the memory */
+	if (can_use_virtual_dma != 2)
+		return;		/* no fallback allowed */
+	printk
+	    ("DMA memory shortage. Temporarily falling back on virtual DMA\n");
+	*addr = (char *)nodma_mem_alloc(l);
+#else
+	return;
+#endif
+}
+
+/* End DMA memory related stuff */
+
+
+/* returns failure on non-ejectable floppy drives */
+#ifndef fd_eject
+static inline int fd_eject(int drive)
+{
+	return -EINVAL;
+}
 #endif
 
-#define current_reqD -1
-#define MAXTIMEOUT -2
 
 static void __reschedule_timeout(int drive, const char *message, int marg)
 {
@@ -694,10 +610,6 @@
 	spin_unlock_irqrestore(&floppy_lock, flags);
 }
 
-#define INFBOUND(a,b) (a)=max_t(int, a, b)
-
-#define SUPBOUND(a,b) (a)=min_t(int, a, b)
-
 /*
  * Bottom half floppy driver.
  * ==========================
@@ -912,11 +824,6 @@
 	return 0;
 }
 
-#define lock_fdc(drive,interruptible) _lock_fdc(drive,interruptible, __LINE__)
-
-#define LOCK_FDC(drive,interruptible) \
-if (lock_fdc(drive,interruptible)) return -EINTR;
-
 /* unlocks the driver */
 static inline void unlock_fdc(void)
 {
@@ -1003,16 +910,12 @@
 {
 }
 
-static DECLARE_WORK(floppy_work, NULL, NULL);
-
 static void schedule_bh(void (*handler) (void))
 {
 	PREPARE_WORK(&floppy_work, (void (*)(void *))handler, NULL);
 	schedule_work(&floppy_work);
 }
 
-static struct timer_list fd_timer = TIMER_INITIALIZER(NULL, 0, 0);
-
 static void cancel_activity(void)
 {
 	unsigned long flags;
@@ -1073,8 +976,6 @@
 	return 0;
 }
 
-static spinlock_t floppy_hlt_lock = SPIN_LOCK_UNLOCKED;
-static int hlt_disabled;
 static void floppy_disable_hlt(void)
 {
 	unsigned long flags;
@@ -1152,8 +1053,6 @@
 	floppy_disable_hlt();
 }
 
-static void show_floppy(void);
-
 /* waits until the fdc becomes ready */
 static int wait_til_ready(void)
 {
@@ -1232,7 +1131,6 @@
 	return -1;
 }
 
-#define MORE_OUTPUT -2
 /* does the fdc need more output? */
 static int need_more_output(void)
 {
@@ -1281,9 +1179,6 @@
 	}
 }				/* perpendicular_mode */
 
-static int fifo_depth = 0xa;
-static int no_fifo;
-
 static int fdc_configure(void)
 {
 	/* Turn on FIFO */
@@ -1297,8 +1192,6 @@
 	return 1;
 }
 
-#define NOMINAL_DTR 500
-
 /* Issue a "SPECIFY" command to set the step rate time, head unload time,
  * head load time, and DMA disable flag to values needed by floppy.
  *
@@ -1560,8 +1453,6 @@
 		fd_watchdog();
 }
 
-static int blind_seek;
-
 /*
  * This is the routine called after every seek (or recalibrate) interrupt
  * from the floppy controller.
@@ -2174,9 +2065,6 @@
 	cont->redo();
 }
 
-#define CODE2SIZE (ssize = ((1 << SIZECODE) + 3) >> 2)
-#define FM_MODE(x,y) ((y) & ~(((x)->rate & 0x80) >>1))
-#define CT(x) ((x) | 0xc0)
 static void setup_format_params(int track)
 {
 	struct fparm {
@@ -3090,12 +2978,6 @@
 	return copy_from_user(address, param, size) ? -EFAULT : 0;
 }
 
-#define _COPYOUT(x) (copy_to_user((void __user *)param, &(x), sizeof(x)) ? -EFAULT : 0)
-#define _COPYIN(x) (copy_from_user(&(x), (void __user *)param, sizeof(x)) ? -EFAULT : 0)
-
-#define COPYOUT(x) ECALL(_COPYOUT(x))
-#define COPYIN(x) ECALL(_COPYIN(x))
-
 static inline const char *drive_name(int type, int drive)
 {
 	struct floppy_struct *floppy;
@@ -3387,34 +3269,6 @@
 }
 
 /* handle obsolete ioctl's */
-static int ioctl_table[] = {
-	FDCLRPRM,
-	FDSETPRM,
-	FDDEFPRM,
-	FDGETPRM,
-	FDMSGON,
-	FDMSGOFF,
-	FDFMTBEG,
-	FDFMTTRK,
-	FDFMTEND,
-	FDSETEMSGTRESH,
-	FDFLUSH,
-	FDSETMAXERRS,
-	FDGETMAXERRS,
-	FDGETDRVTYP,
-	FDSETDRVPRM,
-	FDGETDRVPRM,
-	FDGETDRVSTAT,
-	FDPOLLDRVSTAT,
-	FDRESET,
-	FDGETFDCSTAT,
-	FDWERRORCLR,
-	FDWERRORGET,
-	FDRAWCMD,
-	FDEJECT,
-	FDTWADDLE
-};
-
 static inline int normalize_ioctl(int *cmd, int *size)
 {
 	int i;
@@ -3451,7 +3305,7 @@
 static int fd_ioctl(struct inode *inode, struct file *filp, unsigned int cmd,
 		    unsigned long param)
 {
-#define FD_IOCTL_ALLOWED ((filp) && (filp)->private_data)
+/* The following 2 macros are for use in fd_ioctl() only */
 #define OUT(c,x) case c: outparam = (const char *) (x); break
 #define IN(c,x,tag) case c: *(x) = inparam. tag ; return 0
 
@@ -3900,7 +3754,6 @@
 static int floppy_revalidate(struct gendisk *disk)
 {
 	int drive = (long)disk->private_data;
-#define NO_GEOM (!current_type[drive] && !ITYPE(UDRS->fd_device))
 	int cf;
 	int res = 0;
 
@@ -3945,20 +3798,6 @@
 	.media_changed	= check_floppy_change,
 	.revalidate_disk = floppy_revalidate,
 };
-static char *table[] = {
-	"", "d360", "h1200", "u360", "u720", "h360", "h720",
-	"u1440", "u2880", "CompaQ", "h1440", "u1680", "h410",
-	"u820", "h1476", "u1722", "h420", "u830", "h1494", "u1743",
-	"h880", "u1040", "u1120", "h1600", "u1760", "u1920",
-	"u3200", "u3520", "u3840", "u1840", "u800", "u1600",
-	NULL
-};
-static int t360[] = { 1, 0 },
-	t1200[] = { 2, 5, 6, 10, 12, 14, 16, 18, 20, 23, 0 },
-	t3in[] = { 8, 9, 26, 27, 28, 7, 11, 15, 19, 24, 25, 29, 31, 3, 4, 13,
-			17, 21, 22, 30, 0 };
-static int *table_sup[] =
-    { NULL, t360, t1200, t3in + 5 + 8, t3in + 5, t3in, t3in };
 
 static void __init register_devfs_entries(int drive)
 {
@@ -4063,7 +3902,7 @@
 	}
 }				/* get_fdc_version */
 
-/* lilo configuration */
+/* bootloader configuration */
 
 static void __init floppy_set_flags(int *ints, int param, int param2)
 {
@@ -4194,8 +4033,6 @@
 	return 0;
 }
 
-static int have_no_fdc = -ENODEV;
-
 static void floppy_device_release(struct device *dev)
 {
 	complete(&device_release);
@@ -4407,8 +4244,6 @@
 	return err;
 }
 
-static spinlock_t floppy_usage_lock = SPIN_LOCK_UNLOCKED;
-
 static int floppy_grab_irq_and_dma(void)
 {
 	unsigned long flags;

--===============47893606754643292==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============47893606754643292==--
