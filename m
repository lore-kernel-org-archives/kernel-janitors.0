From: Thomas Gleixner <tglx@linutronix.de>
Date: Fri, 25 Aug 2017 08:45:15 +0000
Subject: Re: [PATCH] irqdomain: check for NULL before dereferencing
Message-Id: <alpine.DEB.2.20.1708251042500.1883@nanos>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170825071337.g72afdd5pdqjshon@mwanda>
In-Reply-To: <20170825071337.g72afdd5pdqjshon@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Marc Zyngier <marc.zyngier@arm.com>, David Daney <david.daney@cavium.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, 25 Aug 2017, Dan Carpenter wrote:

> I reversed these two checks so we check "root_irq_data" for NULL before
> dereferencing it.

Can you please start to write coherent changelogs? See
Documentation/process/submitting-patches.rst

The above describes the change you made which is completely pointless
because we can see the change in the patch.

What's missing is WHY this is required and WHAT the problem with the
existing code is.

Thanks,

	tglx

> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/kernel/irq/irqdomain.c b/kernel/irq/irqdomain.c
> index b9c688944429..e84b7056bb08 100644
> --- a/kernel/irq/irqdomain.c
> +++ b/kernel/irq/irqdomain.c
> @@ -1505,10 +1505,10 @@ int irq_domain_push_irq(struct irq_domain *domain, int virq, void *arg)
>  	if (WARN_ON(!irq_domain_is_hierarchy(domain)))
>  		return -EINVAL;
>  
> -	if (domain->parent != root_irq_data->domain)
> +	if (!root_irq_data)
>  		return -EINVAL;
>  
> -	if (!root_irq_data)
> +	if (domain->parent != root_irq_data->domain)
>  		return -EINVAL;
>  
>  	child_irq_data = kzalloc_node(sizeof(*child_irq_data), GFP_KERNEL,
> 
