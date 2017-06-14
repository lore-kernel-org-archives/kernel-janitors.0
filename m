From: Marc Zyngier <marc.zyngier@arm.com>
Date: Wed, 14 Jun 2017 06:39:54 +0000
Subject: Re: [bug report] irqdomain: Let irq_domain_mapping display hierarchical domains
Message-Id: <20170614073954.131846bd@why.wild-wind.fr.eu.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170613193252.GA2224@elgon.mountain>
In-Reply-To: <20170613193252.GA2224@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, 13 Jun 2017 22:32:52 +0300
Dan Carpenter <dan.carpenter@oracle.com> wrote:

Hi Dan,

> Hello Marc Zyngier,
> 
> This is a semi-automatic email about new static checker warnings.
> 
> The patch fe17a42e704a: "irqdomain: Let irq_domain_mapping display 
> hierarchical domains" from May 12, 2017, leads to the following 
> Smatch complaint:
> 
> kernel/irq/irqdomain.c:772 virq_debug_show_one()
> 	 warn: variable dereferenced before check 'data' (see line 758)
> 
> kernel/irq/irqdomain.c
>    757		while (domain) {
>    758			unsigned int irq = data->irq;
>                                            ^^^^^^^^^
> Dereference.
> 
>    759			unsigned long hwirq = data->hwirq;
>    760			struct irq_chip *chip;
>    761			bool direct;
>    762	
>    763			if (data = &desc->irq_data)
>    764				seq_printf(m, "%5d  ", irq);
>    765			else
>    766				seq_printf(m, "%5d+ ", irq);
>    767			seq_printf(m, "0x%05lx  ", hwirq);
>    768	
>    769			chip = irq_data_get_irq_chip(data);
>    770			seq_printf(m, "%-15s  ", (chip && chip->name) ? chip->name : "none");
>    771	
>    772			seq_printf(m, data ? "0x%p  " : "  %p  ",
>                                       ^^^^
> Too late to check.

This check is utter crap, and I should have nuked it when reworking
that code. We're guaranteed that if "data" becomes NULL at the end of
that loop, so will "domain". So the check is a leftover of... something.

I'll fix it in a subsequent patch, thanks a lot for the report.

	M.
-- 
Without deviation from the norm, progress is not possible.
