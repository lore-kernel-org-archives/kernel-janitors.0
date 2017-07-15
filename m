From: Julia Lawall <julia.lawall@lip6.fr>
Date: Sat, 15 Jul 2017 20:59:35 +0000
Subject: Re: [PATCH 06/11] irqchip: mips-cpu: Drop unnecessary static
Message-Id: <alpine.DEB.2.20.1707152258060.5105@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1500149266-32357-1-git-send-email-Julia.Lawall@lip6.fr> <1500149266-32357-7-git-send-email-Julia.Lawall@lip6.fr> <83D70E98-A5D4-48E5-9397-25826083E2A8@gmail.com>
In-Reply-To: <83D70E98-A5D4-48E5-9397-25826083E2A8@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mark D Rustad <mrustad@gmail.com>
Cc: Julia Lawall <Julia.Lawall@lip6.fr>, Thomas Gleixner <tglx@linutronix.de>, keescook@chromium.org, kernel-janitors@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, linux-kernel@vger.kernel.org



On Sat, 15 Jul 2017, Mark D Rustad wrote:

>
> > On Jul 15, 2017, at 1:07 PM, Julia Lawall <Julia.Lawall@lip6.fr> wrote:
> >
> > Drop static on a local variable, when the variable is initialized before
> > any possible use.  Thus, the static has no benefit.
>
> I think this is in error like the other one. I believe that the irq_chip structure needs a persistent lifetime.

I'm not following in this case.  chip is a pointer to a structure, not a
structure.  Its address is not taken.  irq_set_chip_and_handler that uses
it below is a fnuction, so it just gets the value.

julia

>
> > The semantic patch that fixes this problem is as follows:
> > (http://coccinelle.lip6.fr/)
> >
> > // <smpl>
> > @bad exists@
> > position p;
> > identifier x;
> > type T;
> > @@
> > static T x@p;
> > ...
> > x = <+...x...+>
> >
> > @@
> > identifier x;
> > expression e;
> > type T;
> > position p != bad.p;
> > @@
> > -static
> > T x@p;
> > ... when != x
> >     when strict
> > ?x = e;
> > // </smpl>
> >
> > Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
> >
> > ---
> > These patches are all independent of each other.
> >
> > drivers/irqchip/irq-mips-cpu.c |    2 +-
> > 1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff -u -p a/drivers/irqchip/irq-mips-cpu.c b/drivers/irqchip/irq-mips-cpu.c
> > --- a/drivers/irqchip/irq-mips-cpu.c
> > +++ b/drivers/irqchip/irq-mips-cpu.c
> > @@ -154,7 +154,7 @@ asmlinkage void __weak plat_irq_dispatch
> > static int mips_cpu_intc_map(struct irq_domain *d, unsigned int irq,
> > 			     irq_hw_number_t hw)
> > {
> > -	static struct irq_chip *chip;
> > +	struct irq_chip *chip;
> >
> > 	if (hw < 2 && cpu_has_mipsmt) {
> > 		/* Software interrupts are used for MT/CMT IPI */
> >
>
> --
> Mark Rustad, MRustad@gmail.com
>
>
