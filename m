From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Wed, 02 Feb 2005 22:55:04 +0000
Subject: [KJ] [PATCH 18/20] ppc/serial_sicc: remove
Message-Id: <20050202225504.GX2546@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============5271386742481079=="
List-Id: <kernel-janitors.vger.kernel.org>
To: mporter@kernel.crashing.org
Cc: kernel-janitors@lists.osdl.org, linuxppc-embedded@ozlabs.org

--===============5271386742481079==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

Please consider applying.

Description: Remove deprecated interruptible_sleep_on_timeout() function calls
and replace with direct wait-queue usage.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.11-rc2-kj-v/arch/ppc/4xx_io/serial_sicc.c	2005-01-24 09:34:02.000000000 -0800
+++ 2.6.11-rc2-kj/arch/ppc/4xx_io/serial_sicc.c	2005-02-02 14:41:49.000000000 -0800
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

--===============5271386742481079==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============5271386742481079==--
