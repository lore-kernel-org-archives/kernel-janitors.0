From: james4765@verizon.net
Date: Sat, 30 Oct 2004 19:46:40 +0000
Subject: [KJ] [RFC][PATCH 2/2] floppy: New file drivers/block/floppy.h
Message-Id: <20041030194640.5280.277.23277@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============90801159877433402=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============90801159877433402==

Pulled all the defines, prototypes, macros, and includes into new file floppy.h

Signed-off-by: James Nelson <james4765@gmail.com>

diff -urN --exclude='*~' linux-2.6.9-original/drivers/block/floppy.h linux-2.6.9/drivers/block/floppy.h
--- linux-2.6.9-original/drivers/block/floppy.h	1969-12-31 19:00:00.000000000 -0500
+++ linux-2.6.9/drivers/block/floppy.h	2004-10-30 14:59:17.539197610 -0400
@@ -0,0 +1,196 @@
+/* floppy.h
+ * defines, includes, prototypes, and macros for floppy.c
+ * 2004-10-30 James Nelson 
+ */
+
+
+#define FLOPPY_SANITY_CHECK
+#undef  FLOPPY_SILENT_DCL_CLEAR
+#define REALLY_SLOW_IO
+#define DEBUGT 2
+#define DCL_DEBUG		/* debug disk change line */
+#define FDPATCHES
+#define K_64	0x10000		/* 64KB */
+#define LOCAL_END_REQUEST
+#define DEVICE_NAME "floppy"
+#define current_reqD -1
+#define MAXTIMEOUT -2
+#define MORE_OUTPUT -2
+#define NOMINAL_DTR 500
+
+/*
+ * Maximum disk size (in kilobytes). This default is used whenever the
+ * current disk size is unknown.
+ * [Now it is rather a minimum]
+ */
+#define MAX_DISK_SIZE 4		/* 3984 */
+#define MAX_REPLIES 16
+
+/* Synchronization of FDC access. */
+#define FD_COMMAND_NONE -1
+#define FD_COMMAND_ERROR 2
+#define FD_COMMAND_OKAY 3
+
+/*
+ * These are global variables, as that's the easiest way to give
+ * information to interrupts. They are the data used for the current
+ * request.
+ */
+#define NO_TRACK -1
+#define NEED_1_RECAL -2
+#define NEED_2_RECAL -3
+
+#define DP (&drive_params[current_drive])
+#define DRS (&drive_state[current_drive])
+#define DRWE (&write_errors[current_drive])
+#define FDCS (&fdc_state[fdc])
+
+#define UDP (&drive_params[drive])
+#define UDRS (&drive_state[drive])
+#define UDRWE (&write_errors[drive])
+#define UFDCS (&fdc_state[FDC(drive)])
+
+/* read/write */
+#define COMMAND raw_cmd->cmd[0]
+#define DR_SELECT raw_cmd->cmd[1]
+#define TRACK raw_cmd->cmd[2]
+#define HEAD raw_cmd->cmd[3]
+#define SECTOR raw_cmd->cmd[4]
+#define SIZECODE raw_cmd->cmd[5]
+#define SECT_PER_TRACK raw_cmd->cmd[6]
+#define GAP raw_cmd->cmd[7]
+#define SIZECODE2 raw_cmd->cmd[8]
+#define NR_RW 9
+
+/* format */
+#define F_SIZECODE raw_cmd->cmd[2]
+#define F_SECT_PER_TRACK raw_cmd->cmd[3]
+#define F_GAP raw_cmd->cmd[4]
+#define F_FILL raw_cmd->cmd[5]
+#define NR_F 6
+
+#define ST0 (reply_buffer[0])
+#define ST1 (reply_buffer[1])
+#define ST2 (reply_buffer[2])
+#define ST3 (reply_buffer[0])	/* result of GETSTATUS */
+#define R_TRACK (reply_buffer[3])
+#define R_HEAD (reply_buffer[4])
+#define R_SECTOR (reply_buffer[5])
+#define R_SIZECODE (reply_buffer[6])
+
+/* macros */
+#define SEL_DLY (2*HZ/100)
+#define NO_SIGNAL (!interruptible || !signal_pending(current))
+#define CALL(x) if ((x) == -EINTR) return -EINTR
+#define ECALL(x) if ((ret = (x))) return ret;
+#define _WAIT(x,i) CALL(ret=wait_til_done((x),i))
+#define WAIT(x) _WAIT((x),interruptible)
+#define IWAIT(x) _WAIT((x),1)
+#define ITYPE(x) (((x)>>2) & 0x1f)
+#define TOMINOR(x) ((x & 3) | ((x & 4) << 5))
+#define UNIT(x) ((x) & 0x03)	/* drive on fdc */
+#define FDC(x) (((x) & 0x04) >> 2)	/* fdc of drive */
+#define REVDRIVE(fdc, unit) ((unit) + ((fdc) << 2))
+/* reverse mapping from unit and fdc to drive */
+#define INFBOUND(a,b) (a)=max_t(int, a, b)
+#define SUPBOUND(a,b) (a)=min_t(int, a, b)
+#define CHECK_RESET { if (FDCS->reset){ reset_fdc(); return; } }
+#define lock_fdc(drive,interruptible) _lock_fdc(drive,interruptible, __LINE__)
+#define LOCK_FDC(drive,interruptible) \
+	if (lock_fdc(drive,interruptible)) return -EINTR;
+#define CLEARF(x) (clear_bit(x##_BIT, &DRS->flags))
+#define SETF(x) (set_bit(x##_BIT, &DRS->flags))
+#define TESTF(x) (test_bit(x##_BIT, &DRS->flags))
+#define CODE2SIZE (ssize = ((1 << SIZECODE) + 3) >> 2)
+#define FM_MODE(x,y) ((y) & ~(((x)->rate & 0x80) >>1))
+#define CT(x) ((x) | 0xc0)
+#define _COPYOUT(x) (copy_to_user((void __user *)param, &(x), sizeof(x)) ? -EFAULT : 0)
+#define _COPYIN(x) (copy_from_user(&(x), (void __user *)param, sizeof(x)) ? -EFAULT : 0)
+#define COPYOUT(x) ECALL(_COPYOUT(x))
+#define COPYIN(x) ECALL(_COPYIN(x))
+#define FD_IOCTL_ALLOWED ((filp) && (filp)->private_data)
+#define NO_GEOM (!current_type[drive] && !ITYPE(UDRS->fd_device))
+#define	NUMBER(x)	(sizeof(x) / sizeof(*(x)))
+#define SECTSIZE (_FD_SECTSIZE(*floppy))
+#define UCLEARF(x) (clear_bit(x##_BIT, &UDRS->flags))
+#define USETF(x) (set_bit(x##_BIT, &UDRS->flags))
+#define UTESTF(x) (test_bit(x##_BIT, &UDRS->flags))
+#define DPRINT(format, args...) printk(DEVICE_NAME "%d: " format, current_drive , ## args)
+#define PH_HEAD(floppy,head) (((((floppy)->stretch & 2) >>1) ^ head) << 2)
+#define STRETCH(floppy) ((floppy)->stretch & FD_STRETCH)
+#define CLEARSTRUCT(x) memset((x), 0, sizeof(*(x)))
+
+
+#include <linux/module.h>
+#include <linux/sched.h>
+#include <linux/fs.h>
+#include <linux/kernel.h>
+#include <linux/timer.h>
+#include <linux/workqueue.h>
+#include <linux/version.h>
+#include <linux/fdreg.h>
+#include <linux/fd.h>
+#include <linux/hdreg.h>
+#include <linux/errno.h>
+#include <linux/slab.h>
+#include <linux/mm.h>
+#include <linux/bio.h>
+#include <linux/string.h>
+#include <linux/fcntl.h>
+#include <linux/delay.h>
+#include <linux/mc146818rtc.h>	/* CMOS defines */
+#include <linux/ioport.h>
+#include <linux/interrupt.h>
+#include <linux/init.h>
+#include <linux/devfs_fs_kernel.h>
+#include <linux/device.h>
+#include <linux/buffer_head.h>	/* for invalidate_buffers() */
+#include <linux/blkdev.h>
+#include <linux/blkpg.h>
+#include <linux/cdrom.h>	/* for the compatibility eject ioctl */
+#include <linux/completion.h>
+#include <asm/dma.h>
+#include <asm/irq.h>
+#include <asm/system.h>
+#include <asm/io.h>
+#include <asm/uaccess.h>
+
+static void do_fd_request(request_queue_t * q);
+
+static DECLARE_MUTEX(open_lock);
+
+static DECLARE_WAIT_QUEUE_HEAD(fdc_wait);
+
+static DECLARE_WAIT_QUEUE_HEAD(command_done);
+
+static int set_dor(int fdc, char mask, char data);
+
+static void floppy_ready(void);
+
+static void floppy_start(void);
+
+static void process_fd_request(void);
+
+static void recalibrate_floppy(void);
+
+static void floppy_shutdown(unsigned long);
+
+static int floppy_grab_irq_and_dma(void);
+
+static void floppy_release_irq_and_dma(void);
+
+/*
+ * The "reset" variable should be tested whenever an interrupt is scheduled,
+ * after the commands have been sent. This is to ensure that the driver doesn't
+ * get wedged when the interrupt doesn't come because of a failed command.
+ * reset doesn't need to be tested before sending commands, because
+ * output_byte is automatically disabled when reset is set.
+ */
+static void reset_fdc(void);
+
+static void show_floppy(void);
+
+static DECLARE_WORK(floppy_work, NULL, NULL);
+
+irqreturn_t floppy_interrupt(int irq, void *dev_id, struct pt_regs *regs);
+

--===============90801159877433402==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============90801159877433402==--
