From: Tiezhu Yang <yangtiezhu@loongson.cn>
Date: Wed, 01 Jul 2020 09:23:29 +0000
Subject: Re: [PATCH v4 03/14] irqchip/csky-mpintc: Fix potential resource leaks
Message-Id: <6a468fb4-74b0-4bf3-49bc-cfc62d734e24@loongson.cn>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1593569786-11500-1-git-send-email-yangtiezhu@loongson.cn>
 <1593569786-11500-4-git-send-email-yangtiezhu@loongson.cn>
 <35eae701-e6b1-96af-9be4-0993330a17dc@web.de>
In-Reply-To: <35eae701-e6b1-96af-9be4-0993330a17dc@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <maz@kernel.org>, Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 07/01/2020 03:49 PM, Markus Elfring wrote:
>> exception handling. By the way, do some coding-style cleanups
> I propose to consider another bit of fine-tuning.
>
>
> …
>> +++ b/drivers/irqchip/irq-csky-mpintc.c
> …
>> @@ -270,12 +274,24 @@ csky_mpintc_init(struct device_node *node, struct device_node *parent)
>>
>>   #ifdef CONFIG_SMP
>>   	ipi_irq = irq_create_mapping(root_domain, IPI_IRQ);
>> -	if (!ipi_irq)
>> -		return -EIO;
>> +	if (!ipi_irq) {
>> +		ret = -EIO;
>> +		goto err_domain_remove;
> How do you think about to use the following source code variant
> at this place?
>
> +		irq_domain_remove(root_domain);
> +		ret = -EIO;
> +		goto err_iounmap;
>
>
> Would you like to avoid the repetition of the check “#ifdef CONFIG_SMP”?

OK, thank you, it looks good to me, I will do it in v5.

>
> Regards,
> Markus
