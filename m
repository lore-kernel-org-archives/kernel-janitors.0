From: Amol Lad <amol@verismonetworks.com>
Date: Wed, 11 Oct 2006 12:54:56 +0000
Subject: [KJ] [PATCH 1/2] drivers/cdrom/cdu31a.c: Replacing yield() with
Message-Id: <1160570576.19143.301.camel@amol.verismonetworks.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux kernel <linux-kernel@vger.kernel.org>
Cc: kernel Janitors <kernel-janitors@lists.osdl.org>

In 2.6, the semantics of calling yield() changed from "sleep for a
bit" to "I really don't want to run for a while".  This matches POSIX
better, but there's a lot of drivers still using yield() when they mean
cond_resched(), schedule() or even schedule_timeout().

For this driver schedule_timeout_interruptible() seems to be a better
alternative

Tested compile only

Signed-off-by: Amol Lad <amol@verismonetworks.com>
---
diff -uprN -X linux-2.6.19-rc1-orig/Documentation/dontdiff linux-2.6.19-rc1-orig/drivers/cdrom/cdu31a.c linux-2.6.19-rc1/drivers/cdrom/cdu31a.c
--- linux-2.6.19-rc1-orig/drivers/cdrom/cdu31a.c	2006-10-05 14:00:42.000000000 +0530
+++ linux-2.6.19-rc1/drivers/cdrom/cdu31a.c	2006-10-11 17:28:42.000000000 +0530
@@ -370,7 +370,7 @@ static inline void disable_interrupts(vo
 static inline void sony_sleep(void)
 {
 	if (cdu31a_irq <= 0) {
-		yield();
+		schedule_timeout_interruptible(1);
 	} else {		/* Interrupt driven */
 		DEFINE_WAIT(w);
 		int first = 1;




_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
