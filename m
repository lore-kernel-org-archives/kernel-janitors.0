From: Amol Lad <amol@verismonetworks.com>
Date: Mon, 09 Oct 2006 10:26:48 +0000
Subject: [KJ] [PATCH] calling yield considered harmful
Message-Id: <1160388888.19143.233.camel@amol.verismonetworks.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi,

I'm starting to replace yield with appropriate schedule, cond_resched
etc calls.. 

To begin with please see if this is ok

Signed-off-by: Amol Lad <amol@verismonetworks.com>
---
diff -uprN -X linux-2.6.19-rc1-orig/Documentation/dontdiff linux-2.6.19-rc1-orig/drivers/cdrom/cdu31a.c linux-2.6.19-rc1/drivers/cdrom/cdu31a.c
--- linux-2.6.19-rc1-orig/drivers/cdrom/cdu31a.c	2006-10-05 14:00:42.000000000 +0530
+++ linux-2.6.19-rc1/drivers/cdrom/cdu31a.c	2006-10-09 15:33:22.000000000 +0530
@@ -370,7 +370,7 @@ static inline void disable_interrupts(vo
 static inline void sony_sleep(void)
 {
 	if (cdu31a_irq <= 0) {
-		yield();
+		schedule_timeout_interruptible(1);
 	} else {		/* Interrupt driven */
 		DEFINE_WAIT(w);
 		int first = 1;
diff -uprN -X linux-2.6.19-rc1-orig/Documentation/dontdiff linux-2.6.19-rc1-orig/drivers/cdrom/sonycd535.c linux-2.6.19-rc1/drivers/cdrom/sonycd535.c
--- linux-2.6.19-rc1-orig/drivers/cdrom/sonycd535.c	2006-09-21 10:15:32.000000000 +0530
+++ linux-2.6.19-rc1/drivers/cdrom/sonycd535.c	2006-10-09 15:33:52.000000000 +0530
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
