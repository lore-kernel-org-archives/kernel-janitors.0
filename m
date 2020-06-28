From: Tiezhu Yang <yangtiezhu@loongson.cn>
Date: Sun, 28 Jun 2020 03:23:12 +0000
Subject: Re: [PATCH v3 04/14] irqchip/davinci-aintc: Fix potential resource leaks
Message-Id: <e98e609b-1074-c57c-3b17-6fb635474762@loongson.cn>
List-Id: <kernel-janitors.vger.kernel.org>
References: <0e39761c-4673-d116-fc62-5573c2abae06@web.de>
In-Reply-To: <0e39761c-4673-d116-fc62-5573c2abae06@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>, linux-mips@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Xuefeng Li <lixuefeng@loongson.cn>

On 06/24/2020 09:12 PM, Markus Elfring wrote:
>> There exists potential resource leaks in the error path, fix them.
> Would you like to reconsider this change description?
> https://lore.kernel.org/linux-mips/be3acb13-2963-ddf1-a867-7e30fd23a0b4@loongson.cn/
> https://lkml.org/lkml/2020/6/24/498
>
>
> …
>> +++ b/drivers/irqchip/irq-davinci-aintc.c
> …
>> @@ -160,4 +160,13 @@ void __init davinci_aintc_init(const struct davinci_aintc_config *config)
>>   				       irq_base + irq_off, 32);
>>
>>   	set_handle_irq(davinci_aintc_handle_irq);
>> +
>> +err_domain_remove:
> …
>
> Are you sure that you would to like to release the allocated system resources
> always in this function implementation?
>
> Otherwise, I suggest to add a return statement before the source code section
> for the desired exception handling.

Thank you! Sorry for the late reply.
I will add a return statement.

>
> Regards,
> Markus
