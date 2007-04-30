From: Jestin Stoffel <jestin.stoffel@gmail.com>
Date: Mon, 30 Apr 2007 17:48:23 +0000
Subject: [KJ] [PATCH] Replacing current->state with set_current_state
Message-Id: <20070430174823.GC16727@studio>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

From:  Jestin Stoffel<jestin.stoffel@gmail.com>

Replaced current->state with set_current_state to avoid a race condition

Signed-off-by:  Jestin Stoffel<jestin.stoffel@gmail.com>
---
--- linux-2.6.21.1/drivers/char/n_r3964.c.orig	2007-04-29 04:17:08.000000000 -0500
+++ linux-2.6.21.1/drivers/char/n_r3964.c	2007-04-29 04:26:29.000000000 -0500
@@ -1088,7 +1088,7 @@ static ssize_t r3964_read(struct tty_str
 			/* block until there is a message: */
 			add_wait_queue(&pInfo->read_wait, &wait);
 repeat:
-			current->state = TASK_INTERRUPTIBLE;
+			set_current_state(TASK_INTERRUPTIBLE);
 			pMsg = remove_msg(pInfo, pClient);
 			if (!pMsg && !signal_pending(current)) {
 				schedule();
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
