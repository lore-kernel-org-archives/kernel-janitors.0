From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Wed, 02 Feb 2005 23:05:15 +0000
Subject: [KJ] [UPDATE PATCH 18/20] ppc/serial_sicc: remove
Message-Id: <20050202230515.GZ2546@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============5864411336669525=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050202225504.GX2546@us.ibm.com>
In-Reply-To: <20050202225504.GX2546@us.ibm.com>
To: mporter@kernel.crashing.org
Cc: kernel-janitors@lists.osdl.org, linuxppc-embedded@ozlabs.org

--===============5864411336669525==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 02, 2005 at 02:55:04PM -0800, Nishanth Aravamudan wrote:
> Hello,
> 
> Please consider applying.

Sorry, for the noise, but the patch was incomplete, as there was another call to
sleep_on() in the same file. Fixed below, please consider applying.

Description: Remove deprecated interruptible_sleep_on_timeout() function calls
and replace with direct wait-queue usage.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.11-rc2-kj-v/arch/ppc/4xx_io/serial_sicc.c	2005-01-24 09:34:02.000000000 -0800
+++ 2.6.11-rc2-kj/arch/ppc/4xx_io/serial_sicc.c	2005-02-02 15:04:20.000000000 -0800
@@ -52,6 +52,7 @@
 #include <linux/console.h>
 #include <linux/sysrq.h>
 #include <linux/bitops.h>
+#include <linux/wait.h>
 
 #include <asm/system.h>
 #include <asm/io.h>
@@ -1561,8 +1562,11 @@ static int block_til_ready(struct tty_st
      */
     if (tty_hung_up_p(filp) ||
         (info->flags & ASYNC_CLOSING)) {
-        if (info->flags & ASYNC_CLOSING)
-            interruptible_sleep_on(&info->close_wait);
+        if (info->flags & ASYNC_CLOSING) {
+            prepare_to_wait(&info->close_wait, &wait, TASK_INTERRUPTIBLE);
+            schedule();
+            finish_wait(&info->close_wait, &wait);
+        }
         return (info->flags & ASYNC_HUP_NOTIFY) ?
             -EAGAIN : -ERESTARTSYS;
     }
@@ -1664,6 +1668,7 @@ static struct SICC_info *siccuart_get(in
 
 static int siccuart_open(struct tty_struct *tty, struct file *filp)
 {
+    DEFINE_WAIT(wait);
     struct SICC_info *info;
     int retval, line = tty->index;
 
@@ -1699,8 +1704,11 @@ static int siccuart_open(struct tty_stru
      */
     if (tty_hung_up_p(filp) ||
         (info->flags & ASYNC_CLOSING)) {
-        if (info->flags & ASYNC_CLOSING)
-            interruptible_sleep_on(&info->close_wait);
+        if (info->flags & ASYNC_CLOSING) {
+            prepare_to_wait(&info->close_wait, &wait, TASK_INTERRUPTIBLE);
+            schedule();
+            finish_wait(&info->close_wait, &wait);
+        }
         return -EAGAIN;
     }
 


--===============5864411336669525==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============5864411336669525==--
