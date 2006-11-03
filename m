From: Andi Kleen <ak@muc.de>
Date: Fri, 03 Nov 2006 04:48:34 +0000
Subject: Re: [KJ] [PATCH] x86_64: remove unused variable
Message-Id: <20061103044834.GA36272@muc.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20061101134540.GB26426@silverwood.ncultra.org>
In-Reply-To: <20061101134540.GB26426@silverwood.ncultra.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

> index fe429e5..7807228 100644
> --- a/arch/x86_64/kernel/io_apic.c
> +++ b/arch/x86_64/kernel/io_apic.c
> @@ -688,7 +688,6 @@ void __setup_vector_irq(int cpu)
> {
> 	/* Initialize vector_irq on a new cpu */
> 	/* This function must be called with vector_lock held */
> -	unsigned long flags;

It seems to be already gone. Thanks anyways.

-Andi
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
