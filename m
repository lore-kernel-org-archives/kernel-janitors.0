From: Kari Argillander <kari.argillander@gmail.com>
Date: Tue, 15 Dec 2020 20:39:04 +0000
Subject: Re: [PATCH] irqdomain: Add documentation for irq_create_of_mapping()
Message-Id: <20201215203904.iilkgwyqsyatryln@kari-VirtualBox>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201215200747.148439-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20201215200747.148439-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: maz@kernel.org, tglx@linutronix.de, mripard@kernel.org, dan.carpenter@oracle.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Dec 15, 2020 at 09:07:47PM +0100, Christophe JAILLET wrote:
> +++ b/kernel/irq/irqdomain.c
> @@ -858,6 +858,15 @@ unsigned int irq_create_fwspec_mapping(struct irq_fwspec *fwspec)
>  }
>  EXPORT_SYMBOL_GPL(irq_create_fwspec_mapping) 
> +/**
> + * irq_create_of_mapping() - Map an interrupt
> + * @irq_data: structure of_phandle_args returned by a previous
> + * of_irq_parse_xxx() call

Start with upper case and use periods. Also next line should align.

> + * 
> + * The resources allocated by this function should be freed by
> + * calling irq_dispose_mapping() when the mapping if not useful
> + * anymore.
> + */

Maybe "mapping is not" or "if the mappign is not". There could be lot 
better wording formatting also but everyone would still understand. So
it is ok. 
