From: Tiezhu Yang <yangtiezhu@loongson.cn>
Date: Wed, 01 Jul 2020 09:58:06 +0000
Subject: Re: [PATCH v4 14/14] irqchip/xilinx-intc: Fix potential resource leak
Message-Id: <9434711b-96c1-8ef5-79b6-510170654df8@loongson.cn>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1593569786-11500-1-git-send-email-yangtiezhu@loongson.cn>
 <1593569786-11500-15-git-send-email-yangtiezhu@loongson.cn>
 <e9aaa867-bb11-a469-a4b9-03fb68a18c56@web.de>
In-Reply-To: <e9aaa867-bb11-a469-a4b9-03fb68a18c56@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <maz@kernel.org>, Michal Simek <michal.simek@xilinx.com>, linux-arm-kernel@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 07/01/2020 05:42 PM, Markus Elfring wrote:
>> In the function xilinx_intc_of_init(), system resource "irqc->root_domain"
>> was not released in the error case. Thus add jump target for the completion
>> of the desired exception handling.
> Another small wording adjustment:
>    … Thus add a jump target …

OK

>
>
> …
>> +++ b/drivers/irqchip/irq-xilinx-intc.c
> …
>> @@ -250,6 +250,8 @@ static int __init xilinx_intc_of_init(struct device_node *intc,
>>
>>   	return 0;
>>
>> +error_domain_remove:
>> +	irq_domain_remove(irqc->root_domain);
>>   error:
>>   	iounmap(irqc->base);
> …
>
> Can labels like “remove_irq_domain” and “unmap_io” be nicer?

Thank you, I will use "err_domain_remove" and "err_iounmap"
to keep consistence with other patches.

>
> Regards,
> Markus
