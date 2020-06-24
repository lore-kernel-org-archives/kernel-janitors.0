From: Tiezhu Yang <yangtiezhu@loongson.cn>
Date: Wed, 24 Jun 2020 01:44:51 +0000
Subject: Re: [PATCH 1/7] irqchip: Fix potential resource leaks
Message-Id: <d2111f53-ca52-fedf-0257-71f0aa89b093@loongson.cn>
List-Id: <kernel-janitors.vger.kernel.org>
References: <65e734f7-c43c-f96b-3650-980e15edba60@web.de>
In-Reply-To: <65e734f7-c43c-f96b-3650-980e15edba60@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>, devicetree@vger.kernel.org, linux-mips@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Huacai Chen <chenhc@lemote.com>, Jason Cooper <jason@lakedaemon.net>, Jiaxun Yang <jiaxun.yang@flygoat.com>, Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Xuefeng Li <lixuefeng@loongson.cn>

On 06/23/2020 11:55 PM, Markus Elfring wrote:
>> There exists some potential resource leaks in the error path, fix them.
> Will the tag “Fixes” become relevant for the commit message?

Hi Markus,

Thanks for your reply and suggestion.

This patch contains many files in drivers/irqchip,
maybe I should split it into some small patches if use the tag "Fixes"?

>
>
> …
>> +++ b/drivers/irqchip/irq-nvic.c
>> @@ -94,6 +94,7 @@ static int __init nvic_of_init(struct device_node *node,
>>
>>   	if (!nvic_irq_domain) {
>>   		pr_warn("Failed to allocate irq domain\n");
>> +		iounmap(nvic_base);
>>   		return -ENOMEM;
>>   	}
>>
>> @@ -103,6 +104,7 @@ static int __init nvic_of_init(struct device_node *node,
>>   	if (ret) {
>>   		pr_warn("Failed to allocate irq chips\n");
>>   		irq_domain_remove(nvic_irq_domain);
>> +		iounmap(nvic_base);
>>   		return ret;
>>   	}
> Can it helpful to add jump targets so that a bit of exception handling
> can be better reused at the end of this function?

OK, no problem, I will do it in the v2.

By the way, I have resent this patch series due to git send-email failed,
https://lore.kernel.org/patchwork/cover/1261517/

Thanks,
Tiezhu

>
> Regards,
> Markus
