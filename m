From: Tiezhu Yang <yangtiezhu@loongson.cn>
Date: Wed, 01 Jul 2020 09:19:28 +0000
Subject: Re: [PATCH v4 04/14] irqchip/davinci-aintc: Fix potential resource leaks
Message-Id: <879ce976-042d-b8d7-676e-304e02e7c965@loongson.cn>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1593569786-11500-1-git-send-email-yangtiezhu@loongson.cn>
 <1593569786-11500-5-git-send-email-yangtiezhu@loongson.cn>
 <08cad331-0a17-586c-07a7-6e3843cb61a1@web.de>
In-Reply-To: <08cad331-0a17-586c-07a7-6e3843cb61a1@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <maz@kernel.org>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 07/01/2020 04:15 PM, Markus Elfring wrote:
> …
>> +++ b/drivers/irqchip/irq-davinci-aintc.c
>> @@ -96,7 +96,7 @@ void __init davinci_aintc_init(const struct davinci_aintc_config *config)
>>   				     resource_size(&config->reg));
>>   	if (!davinci_aintc_base) {
>>   		pr_err("%s: unable to ioremap register range\n", __func__);
>> -		return;
>> +		goto err_release;
>>   	}
> …
>
> Can it help to return any error codes?
> Would you like to reconsider the function return type?

No, the initial aim of this patch is just to fix the potential resource 
leaks,
so I think maybe no need to consider the function return type now.

>
> Regards,
> Markus
