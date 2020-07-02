From: Tiezhu Yang <yangtiezhu@loongson.cn>
Date: Thu, 02 Jul 2020 01:18:25 +0000
Subject: Re: [PATCH v4 02/14] irqchip/csky-apb-intc: Fix potential resource leaks
Message-Id: <c7cc848a-1ce0-e877-aa44-ebafe4b5985c@loongson.cn>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1593569786-11500-1-git-send-email-yangtiezhu@loongson.cn>
 <1593569786-11500-3-git-send-email-yangtiezhu@loongson.cn>
 <564ffff9-6043-7191-2458-f425dd8d0c11@web.de>
 <1a0e007a-db94-501b-4ab9-0bb479ec093b@loongson.cn>
 <971c649e-fe07-3771-6fea-f5aaeaf090ad@web.de>
In-Reply-To: <971c649e-fe07-3771-6fea-f5aaeaf090ad@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <maz@kernel.org>, Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 07/01/2020 09:04 PM, Markus Elfring wrote:
>> If remove the local variable "ret",  it will look like this:
> …
>> +++ b/drivers/irqchip/irq-csky-apb-intc.c
> …
>> @@ -118,18 +116,23 @@ ck_intc_init_comm(struct device_node *node, struct device_node *parent)
> …
>> -       ret = irq_alloc_domain_generic_chips(root_domain, 32, 1,
>> +       if (irq_alloc_domain_generic_chips(root_domain, 32, 1,
>>                          "csky_intc", handle_level_irq,
>> -                       IRQ_NOREQUEST | IRQ_NOPROBE | IRQ_NOAUTOEN, 0, 0);
>> -       if (ret) {
>> +                       IRQ_NOREQUEST | IRQ_NOPROBE | IRQ_NOAUTOEN, 0, 0)) {
>>                  pr_err("C-SKY Intc irq_alloc_gc failed.\n");
> …
>
> I suggest to recheck the parameter alignment for such a function call.
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/coding-style.rst?id|30b859a947535f2213277e827d7ac7dcff9c84#n93

OK, thank you, like this:

-       ret = irq_alloc_domain_generic_chips(root_domain, 32, 1,
-                       "csky_intc", handle_level_irq,
-                       IRQ_NOREQUEST | IRQ_NOPROBE | IRQ_NOAUTOEN, 0, 0);
-       if (ret) {
+       if (irq_alloc_domain_generic_chips(root_domain, 32, 1,
+                                          "csky_intc", handle_level_irq,
+                                          IRQ_NOREQUEST | IRQ_NOPROBE | 
IRQ_NOAUTOEN, 0, 0)) {
                 pr_err("C-SKY Intc irq_alloc_gc failed.\n");
-               return -ENOMEM;
+               goto err_domain_remove;
         }

>
> Regards,
> Markus
