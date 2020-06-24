From: Markus Elfring <Markus.Elfring@web.de>
Date: Wed, 24 Jun 2020 13:12:36 +0000
Subject: Re: [PATCH v3 04/14] irqchip/davinci-aintc: Fix potential resource leaks
Message-Id: <0e39761c-4673-d116-fc62-5573c2abae06@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Tiezhu Yang <yangtiezhu@loongson.cn>, linux-mips@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Xuefeng Li <lixuefeng@loongson.cn>

> There exists potential resource leaks in the error path, fix them.

Would you like to reconsider this change description?
https://lore.kernel.org/linux-mips/be3acb13-2963-ddf1-a867-7e30fd23a0b4@loongson.cn/
https://lkml.org/lkml/2020/6/24/498


…
> +++ b/drivers/irqchip/irq-davinci-aintc.c
…
> @@ -160,4 +160,13 @@ void __init davinci_aintc_init(const struct davinci_aintc_config *config)
>  				       irq_base + irq_off, 32);
>
>  	set_handle_irq(davinci_aintc_handle_irq);
> +
> +err_domain_remove:
…

Are you sure that you would to like to release the allocated system resources
always in this function implementation?

Otherwise, I suggest to add a return statement before the source code section
for the desired exception handling.

Regards,
Markus
