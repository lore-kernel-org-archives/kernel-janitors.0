From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Thu, 20 Jan 2005 23:39:11 +0000
Subject: [KJ] [PATCH 15/39] m68k/stdma: replace sleep_on() with wait_event()
Message-Id: <20050120233911.GC2600@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============10198897657862016=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============10198897657862016==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Please consider applying.

Description: Use wait_event() instead of the deprecated sleep_on() function.
Since wait_event() expects the condition passed in to be the stopping condition,
negate the current one.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.11-rc1-kj-v/arch/m68k/atari/stdma.c	2005-01-15 16:55:41.000000000 -0800
+++ 2.6.11-rc1-kj/arch/m68k/atari/stdma.c	2005-01-19 17:25:33.000000000 -0800
@@ -34,6 +34,7 @@
 #include <linux/sched.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
+#include <linux/wait.h>
 
 #include <asm/atari_stdma.h>
 #include <asm/atariints.h>
@@ -81,11 +82,10 @@ void stdma_lock(irqreturn_t (*handler)(i
 
 	local_irq_save(flags);		/* protect lock */
 
-	while(stdma_locked)
-		/* Since the DMA is used for file system purposes, we
-		 have to sleep uninterruptible (there may be locked
-		 buffers) */
-		sleep_on(&stdma_wait);
+	/* Since the DMA is used for file system purposes, we
+	 have to sleep uninterruptible (there may be locked
+	 buffers) */
+	wait_event(stdma_wait, !stdma_locked);
 
 	stdma_locked   = 1;
 	stdma_isr      = handler;

--===============10198897657862016==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============10198897657862016==--
