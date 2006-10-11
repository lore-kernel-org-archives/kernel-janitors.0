From: Amol Lad <amol@verismonetworks.com>
Date: Wed, 11 Oct 2006 12:54:57 +0000
Subject: [KJ] [PATCH 2/2] drivers/cdrom/sonycd535.c: Replacing yield() with
Message-Id: <1160570577.19143.303.camel@amol.verismonetworks.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux kernel <linux-kernel@vger.kernel.org>
Cc: kernel Janitors <kernel-janitors@lists.osdl.org>

Signed-off-by: Amol Lad <amol@verismonetworks.com>
---
diff -uprN -X linux-2.6.19-rc1-orig/Documentation/dontdiff linux-2.6.19-rc1-orig/drivers/cdrom/sonycd535.c linux-2.6.19-rc1/drivers/cdrom/sonycd535.c
--- linux-2.6.19-rc1-orig/drivers/cdrom/sonycd535.c	2006-09-21 10:15:32.000000000 +0530
+++ linux-2.6.19-rc1/drivers/cdrom/sonycd535.c	2006-10-11 17:29:15.000000000 +0530
@@ -342,7 +342,7 @@ static inline void
 sony_sleep(void)
 {
 	if (sony535_irq_used <= 0) {	/* poll */
-		yield();
+		schedule_timeout_interruptible(1);
 	} else {	/* Interrupt driven */
 		DEFINE_WAIT(wait);
 		


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
