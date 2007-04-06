From: Jestin Stoffel <jstnstffl@gmail.com>
Date: Fri, 06 Apr 2007 02:51:20 +0000
Subject: [KJ] [PATCH]set_current_state cleanup in drivers/serial/mcfserial.c
Message-Id: <20070406025120.GC8199@crackpot>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

From:  Jestin Stoffel <jstnstffl@gmail.com>

Replaced a couple current->state= with set_current_state

Signed-of-by:  Jestin Stoffel <jstnstffl@gmail.com>
---
--- linux-2.6.21-rc5/drivers/serial/mcfserial.c.orig	2007-04-05 21:47:40.000000000 -0500
+++ linux-2.6.21-rc5/drivers/serial/mcfserial.c	2007-04-05 21:48:37.000000000 -0500
@@ -1399,7 +1399,7 @@ static int block_til_ready(struct tty_st
 		local_irq_disable();
 		mcfrs_setsignals(info, 1, 1);
 		local_irq_enable();
-		current->state = TASK_INTERRUPTIBLE;
+		set_current_state(TASK_INTERRUPTIBLE);
 		if (tty_hung_up_p(filp) ||
 		    !(info->flags & ASYNC_INITIALIZED)) {
 #ifdef SERIAL_DO_RESTART
@@ -1425,7 +1425,7 @@ static int block_til_ready(struct tty_st
 #endif
 		schedule();
 	}
-	current->state = TASK_RUNNING;
+	set_current_state(TASK_RUNNING);
 	remove_wait_queue(&info->open_wait, &wait);
 	if (!tty_hung_up_p(filp))
 		info->count++;
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
