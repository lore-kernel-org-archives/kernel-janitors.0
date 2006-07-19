From: Thomas Gleixner <tglx@linutronix.de>
Date: Wed, 19 Jul 2006 17:02:14 +0000
Subject: Re: [KJ] [PATCH] kernel-doc in kernel/irq/handle.c
Message-Id: <87ejwhle95.wl%tglx@linutronix.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <44BCCD3A.20109@nachtwindheim.de>
In-Reply-To: <44BCCD3A.20109@nachtwindheim.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Henne <henne@nachtwindheim.de>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@lists.osdl.org

At Tue, 18 Jul 2006 13:59:54 +0200,
Henne wrote:
> 
> From: Henrik Kretzschmar <henne@nachtwindheim.de>
> 
> Adds the description of the parameters from handle_bad_irq().
> Signed-off-by: Henrik Kretzschmar <henne@nachtwindheim.de>

Acked-by: Thomas Gleixner <tglx@linutronix.de>

Thanks,

	tglx


> ---
> 
> diff -ruN linux-2.6.18-rc2/kernel/irq/handle.c linux/kernel/irq/handle.c
> --- linux-2.6.18-rc2/kernel/irq/handle.c        2006-07-18 13:37:39.000000000 +0200
> +++ linux/kernel/irq/handle.c   2006-07-18 13:51:15.000000000 +0200
> @@ -20,6 +20,11 @@
> 
>  /**
>   * handle_bad_irq - handle spurious and unhandled irqs
> + * @irq:       the interrupt number
> + * @desc:      description of the interrupt
> + * @regs:      pointer to a register structure
> + *
> + * Handles spurious and unhandled IRQ's. It also prints a debugmessage.
>   */
>  void fastcall
>  handle_bad_irq(unsigned int irq, struct irq_desc *desc, struct pt_regs *regs)
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
