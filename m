From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Wed, 02 Feb 2005 23:08:53 +0000
Subject: [KJ] [PATCH 20/20] mips/bcm1250_tbprof: remove
Message-Id: <20050202230853.GA2546@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============10685029398335621=="
List-Id: <kernel-janitors.vger.kernel.org>
To: ralf@linux-mips.org
Cc: linux-mips@linux-mips.org, kernel-janitors@lists.osdl.org

--===============10685029398335621==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

Please consider applying.

Description: Remove deprecated interruptible_sleep_on() function call
and replace with direct wait-queue usage.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.11-rc2-kj-v/arch/mips/sibyte/sb1250/bcm1250_tbprof.c	2005-01-24 09:28:12.000000000 -0800
+++ 2.6.11-rc2-kj/arch/mips/sibyte/sb1250/bcm1250_tbprof.c	2005-02-02 15:07:08.000000000 -0800
@@ -28,6 +28,7 @@
 #include <linux/fs.h>
 #include <linux/errno.h>
 #include <linux/reboot.h>
+#include <linux/wait.h>
 #include <asm/uaccess.h>
 #include <asm/io.h>
 #include <asm/sibyte/sb1250.h>
@@ -227,6 +228,7 @@ int sbprof_zbprof_start(struct file *fil
 
 int sbprof_zbprof_stop(void)
 {
+	DEFINE_WAIT(wait);
 	DBG(printk(DEVNAME ": stopping\n"));
 
 	if (sbp.tb_enable) {
@@ -236,7 +238,9 @@ int sbprof_zbprof_stop(void)
 		   this sleep happens. */
 		if (sbp.tb_armed) {
 			DBG(printk(DEVNAME ": wait for disarm\n"));
-			interruptible_sleep_on(&sbp.tb_sync);
+			prepare_to_wait(&sbp.tb_sync, &wait, TASK_INTERRUPTIBLE);
+			schedule();
+			finish_wait(&sbp.tb_sync, &wait);
 			DBG(printk(DEVNAME ": disarm complete\n"));
 		}
 		free_irq(K_INT_TRACE_FREEZE, &sbp);
@@ -344,7 +348,10 @@ static int sbprof_tb_ioctl(struct inode 
 		error = sbprof_zbprof_stop();
 		break;
 	case SBPROF_ZBWAITFULL:
-		interruptible_sleep_on(&sbp.tb_read);
+		DEFINE_WAIT(wait);
+		prepare_to_wait(&sbp.tb_read, &wait, TASK_INTERRUPTIBLE);
+		schedule();
+		finish_wait(&sbp.tb_read, &wait);
 		/* XXXKW check if interrupted? */
 		return put_user(TB_FULL, (int *) arg);
 	default:

--===============10685029398335621==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============10685029398335621==--
