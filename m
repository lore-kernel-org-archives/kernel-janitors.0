From: Jestin Stoffel <jstnstffl@gmail.com>
Date: Fri, 06 Apr 2007 02:55:30 +0000
Subject: [KJ] [PATCH]set_current_state cleanup in
Message-Id: <20070406025530.GD8199@crackpot>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20070406024603.GB8199@crackpot>
In-Reply-To: <20070406024603.GB8199@crackpot>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

From:  Jestin Stoffel <jstnstffl@gmail.com>

Replaced current->state= with set_current_state

---
--- linux-2.6.21-rc5/drivers/serial/serial_core.c.orig	2007-04-05 21:52:04.000000000 -0500
+++ linux-2.6.21-rc5/drivers/serial/serial_core.c	2007-04-05 21:52:45.000000000 -0500
@@ -1013,7 +1013,7 @@ uart_wait_modem_status(struct uart_state
 		cprev = cnow;
 	}
 
-	current->state = TASK_RUNNING;
+	set_current_state(TASK_RUNNING);
 	remove_wait_queue(&state->info->delta_msr_wait, &wait);
 
 	return ret;
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
