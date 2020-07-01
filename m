From: Markus Elfring <Markus.Elfring@web.de>
Date: Wed, 01 Jul 2020 09:42:47 +0000
Subject: Re: [PATCH v4 14/14] irqchip/xilinx-intc: Fix potential resource leak
Message-Id: <e9aaa867-bb11-a469-a4b9-03fb68a18c56@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1593569786-11500-1-git-send-email-yangtiezhu@loongson.cn>
 <1593569786-11500-15-git-send-email-yangtiezhu@loongson.cn>
In-Reply-To: <1593569786-11500-15-git-send-email-yangtiezhu@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Tiezhu Yang <yangtiezhu@loongson.cn>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <maz@kernel.org>, Michal Simek <michal.simek@xilinx.com>, linux-arm-kernel@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

> In the function xilinx_intc_of_init(), system resource "irqc->root_domain"
> was not released in the error case. Thus add jump target for the completion
> of the desired exception handling.

Another small wording adjustment:
  … Thus add a jump target …


…
> +++ b/drivers/irqchip/irq-xilinx-intc.c
…
> @@ -250,6 +250,8 @@ static int __init xilinx_intc_of_init(struct device_node *intc,
>
>  	return 0;
>
> +error_domain_remove:
> +	irq_domain_remove(irqc->root_domain);
>  error:
>  	iounmap(irqc->base);
…

Can labels like “remove_irq_domain” and “unmap_io” be nicer?

Regards,
Markus
