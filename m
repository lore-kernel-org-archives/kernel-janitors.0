From: Markus Elfring <Markus.Elfring@web.de>
Date: Thu, 02 Jul 2020 12:24:10 +0000
Subject: Re: [v4 02/14] irqchip/csky-apb-intc: Fix potential resource leaks
Message-Id: <14cacb4e-d687-dfc4-8ad8-26f9f1050a0e@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1593569786-11500-1-git-send-email-yangtiezhu@loongson.cn>
 <1593569786-11500-3-git-send-email-yangtiezhu@loongson.cn>
 <564ffff9-6043-7191-2458-f425dd8d0c11@web.de>
 <1a0e007a-db94-501b-4ab9-0bb479ec093b@loongson.cn>
 <971c649e-fe07-3771-6fea-f5aaeaf090ad@web.de>
 <c7cc848a-1ce0-e877-aa44-ebafe4b5985c@loongson.cn>
 <41b48aa5-e5b2-0257-8b3d-07e1b86634b4@web.de>
 <0726ddc2-6b01-2ac8-d5bf-74c3df36b6ef@loongson.cn>
 <c0093731-fa42-9d43-ebfc-208ba51a96c5@loongson.cn>
In-Reply-To: <c0093731-fa42-9d43-ebfc-208ba51a96c5@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Tiezhu Yang <yangtiezhu@loongson.cn>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <maz@kernel.org>, Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

>>>>>> +++ b/drivers/irqchip/irq-csky-apb-intc.c
…
> Let us keep it as it is

I propose to reconsider also this view.


> to make the code clear and to avoid the alignment issue:
>
> ret = foo();
> if (ret) {
>         ret = -ENOMEM;

How do you think about to delete this assignment if you would like to
reuse the return value from a call of the function “irq_alloc_domain_generic_chips”?


>         goto ...
> }


Please apply a known script also for the purpose to achieve consistent indentation.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/scripts/checkpatch.pl?id=cd77006e01b3198c75fb7819b3d0ff89709539bb#n3301

Regards,
Markus
