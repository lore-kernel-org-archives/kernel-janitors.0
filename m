From: Matthew Wilcox <matthew@wil.cx>
Date: Mon, 09 Oct 2006 18:00:24 +0000
Subject: Re: [KJ] save_flags()/cli() replace with spin_lock_irq{save,
Message-Id: <20061009180024.GA28254@parisc-linux.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1160400366.19143.251.camel@amol.verismonetworks.com>
In-Reply-To: <1160400366.19143.251.camel@amol.verismonetworks.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, Oct 09, 2006 at 06:56:06PM +0530, Amol Lad wrote:
> In ARM, does spin_lock_irqsave() disables both IRQs and FIQs (fast
> interrupts) ?
> 
> If yes, then it is dangerous to replace save_flags()/cli() with
> spin_lock_irqsave() in drivers that are required in ARM based systems
> also. In ARM cli() diables IRQs and clf() disables FIQs. With this
> change we may unintentionally disable FIQs also when it's only required
> to disable IRQs

cli does:

static inline void __deprecated cli(void)
{
        local_irq_disable();
}

spin_lock_irq does:

#define _spin_lock_irq(lock)                    __LOCK_IRQ(lock)

#define __LOCK_IRQ(lock) \
  do { local_irq_disable(); __LOCK(lock); } while (0)

see?  exactly the same code.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
