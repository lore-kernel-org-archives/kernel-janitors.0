From: Amol Lad <amol@verismonetworks.com>
Date: Mon, 09 Oct 2006 13:38:06 +0000
Subject: [KJ] save_flags()/cli() replace with spin_lock_irq{save,restore}
Message-Id: <1160400366.19143.251.camel@amol.verismonetworks.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

I have a query.

In ARM, does spin_lock_irqsave() disables both IRQs and FIQs (fast
interrupts) ?

If yes, then it is dangerous to replace save_flags()/cli() with
spin_lock_irqsave() in drivers that are required in ARM based systems
also. In ARM cli() diables IRQs and clf() disables FIQs. With this
change we may unintentionally disable FIQs also when it's only required
to disable IRQs







_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
