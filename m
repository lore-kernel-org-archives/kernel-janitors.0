From: Jestin Stoffel <jestin.stoffel@gmail.com>
Date: Mon, 02 Apr 2007 02:51:22 +0000
Subject: [KJ] [PATCH]set_current_state cleanup
Message-Id: <200704012151.22871.jestin.stoffel@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

from:  Jestin Stoffel <jestin.stoffel@gmail.com>

Replacing current->state with set_current_state

Signed-off-by:  Jestin Stoffel
---
--- linux-2.6.21-rc5/drivers/serial/68328serial.c.orig  2007-04-01
21:26:52.000000000 -0500
+++ linux-2.6.21-rc5/drivers/serial/68328serial.c       2007-04-01 
21:27:36.000000000 -0500
@@ -1249,7 +1249,7 @@ static int block_til_ready(struct tty_st
                local_irq_disable();
                m68k_rtsdtr(info, 1);
                local_irq_enable();
-               current->state = TASK_INTERRUPTIBLE;
+               set_current_state(TASK_INTERRUPTIBLE);
                if (tty_hung_up_p(filp) ||
                    !(info->flags & S_INITIALIZED)) {
 #ifdef SERIAL_DO_RESTART
@@ -1270,7 +1270,7 @@ static int block_til_ready(struct tty_st
                }
                schedule();
        }
-       current->state = TASK_INTERRUPTIBLE;
+       set_current_state(TASK_INTERRUPTIBLE);
        remove_wait_queue(&info->open_wait, &wait);
        if (!tty_hung_up_p(filp))
                info->count++;
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
