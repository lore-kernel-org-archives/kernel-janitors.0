From: Tiezhu Yang <yangtiezhu@loongson.cn>
Date: Thu, 02 Jul 2020 11:53:47 +0000
Subject: Re: [PATCH v4 02/14] irqchip/csky-apb-intc: Fix potential resource leaks
Message-Id: <c0093731-fa42-9d43-ebfc-208ba51a96c5@loongson.cn>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1593569786-11500-1-git-send-email-yangtiezhu@loongson.cn>
 <1593569786-11500-3-git-send-email-yangtiezhu@loongson.cn>
 <564ffff9-6043-7191-2458-f425dd8d0c11@web.de>
 <1a0e007a-db94-501b-4ab9-0bb479ec093b@loongson.cn>
 <971c649e-fe07-3771-6fea-f5aaeaf090ad@web.de>
 <c7cc848a-1ce0-e877-aa44-ebafe4b5985c@loongson.cn>
 <41b48aa5-e5b2-0257-8b3d-07e1b86634b4@web.de>
 <0726ddc2-6b01-2ac8-d5bf-74c3df36b6ef@loongson.cn>
In-Reply-To: <0726ddc2-6b01-2ac8-d5bf-74c3df36b6ef@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <maz@kernel.org>, Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 07/02/2020 04:05 PM, Tiezhu Yang wrote:
> On 07/02/2020 03:19 PM, Markus Elfring wrote:
>>>>> +++ b/drivers/irqchip/irq-csky-apb-intc.c
>> …
>>>> I suggest to recheck the parameter alignment for such a function call.
>>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/coding-style.rst?id|30b859a947535f2213277e827d7ac7dcff9c84#n93 
>>>>
>>> OK, thank you, like this:
>>>
>>> -       ret = irq_alloc_domain_generic_chips(root_domain, 32, 1,
>>> -                       "csky_intc", handle_level_irq,
>>> -                       IRQ_NOREQUEST | IRQ_NOPROBE | IRQ_NOAUTOEN, 
>>> 0, 0);
>>> -       if (ret) {
>>> +       if (irq_alloc_domain_generic_chips(root_domain, 32, 1,
>>> +                                          "csky_intc", 
>>> handle_level_irq,
>>> +                                          IRQ_NOREQUEST | 
>>> IRQ_NOPROBE | IRQ_NOAUTOEN, 0, 0)) {
>>>                  pr_err("C-SKY Intc irq_alloc_gc failed.\n");
>> …
>>
>> Would you like to use also horizontal tab characters for the 
>> corresponding indentation?
>
> Sorry, I do not quite understanding what you mean, maybe like this?
>
>         if (irq_alloc_domain_generic_chips(root_domain, 32, 1,
>                 "csky_intc", handle_level_irq,
>                 IRQ_NOREQUEST | IRQ_NOPROBE | IRQ_NOAUTOEN, 0, 0)) {
>                 pr_err("C-SKY Intc irq_alloc_gc failed.\n");
>                 goto err_domain_remove;
>         }
>

Hi Markus,

Thank you very much for your review and suggestion.

Maybe still use "ret" variable is better, the following is another comment
which is only sent to me:

[I think that if one of the return values comes from a function call, then
you should use the value from the function call even if it is currently
always -ENOMEM.  The return value of the function call could perhaps
change in the future.

In any case, ret = foo(); if (ret) is very common in kernel code, and
there is no reason not to do it, especially when the function call takes
up a lot of space.]

Let us keep it as it is to make the code clear and to avoid the 
alignment issue:

ret = foo();
if (ret) {
         ret = -ENOMEM;
         goto ...
}

Thanks,
Tiezhu

>>
>> Regards,
>> Markus
>
