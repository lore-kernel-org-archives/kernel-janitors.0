From: Jestin Stoffel <jstnstffl@gmail.com>
Date: Fri, 06 Apr 2007 02:46:03 +0000
Subject: [KJ] [PATCH]set_current_state cleanup in
Message-Id: <20070406024603.GB8199@crackpot>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

From:  Jestin Stoffel <jstnstffl@gmail.com>

Replaced a couple current->state= with set_current_state

Signed-off-by:  Jestin Stoffel <jstnstffl@gmail.com>
---
--- linux-2.6.21-rc5/drivers/serial/68360serial.c.orig	2007-04-05 21:34:12.000000000 -0500
+++ linux-2.6.21-rc5/drivers/serial/68360serial.c	2007-04-05 21:35:17.000000000 -0500
@@ -1750,7 +1750,7 @@ static void rs_360_wait_until_sent(struc
 		else
 			bdp--;
 	} while (bdp->status & BD_SC_READY);
-	current->state = TASK_RUNNING;
+	set_current_state(TASK_RUNNING);
 #ifdef SERIAL_DEBUG_RS_WAIT_UNTIL_SENT
 	printk("lsr = %d (jiff=%lu)...done\n", lsr, jiffies);
 #endif
@@ -1880,7 +1880,7 @@ static int block_til_ready(struct tty_st
 #endif
 		schedule();
 	}
-	current->state = TASK_RUNNING;
+	set_current_state(TASK_RUNNING);
 	remove_wait_queue(&info->open_wait, &wait);
 	if (!tty_hung_up_p(filp))
 		state->count++;
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
