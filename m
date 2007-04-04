From: Jestin Stoffel <jstnstffl@gmail.com>
Date: Wed, 04 Apr 2007 04:56:54 +0000
Subject: [KJ] [PATCH]cleaning up current->state in
Message-Id: <20070404045654.GA17196@crackpot>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

From:  Jestin Stoffel <jstnstffl@gmail.com>

Replaced 2 occurances of current->state with set_current_state

Signed-off-by:  Jestin Stoffel <jstnstffl@gmail.com>
---
--- linux-2.6.21-rc5/drivers/serial/68328serial.c.orig	2007-04-01 21:26:52.000000000 -0500
+++ linux-2.6.21-rc5/drivers/serial/68328serial.c	2007-04-01 21:27:36.000000000 -0500
@@ -1249,7 +1249,7 @@ static int block_til_ready(struct tty_st
 		local_irq_disable();
 		m68k_rtsdtr(info, 1);
 		local_irq_enable();
-		current->state = TASK_INTERRUPTIBLE;
+		set_current_state(TASK_INTERRUPTIBLE);
 		if (tty_hung_up_p(filp) ||
 		    !(info->flags & S_INITIALIZED)) {
 #ifdef SERIAL_DO_RESTART
@@ -1270,7 +1270,7 @@ static int block_til_ready(struct tty_st
 		}
 		schedule();
 	}
-	current->state = TASK_INTERRUPTIBLE;
+	set_current_state(TASK_INTERRUPTIBLE);
 	remove_wait_queue(&info->open_wait, &wait);
 	if (!tty_hung_up_p(filp))
 		info->count++;
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
