From: Tiezhu Yang <yangtiezhu@loongson.cn>
Date: Wed, 01 Jul 2020 09:40:32 +0000
Subject: Re: [PATCH v4 11/14] irqchip/omap-intc: Fix potential resource leak
Message-Id: <25e52567-bda4-e936-f04b-8126eb849520@loongson.cn>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1593569786-11500-1-git-send-email-yangtiezhu@loongson.cn>
 <1593569786-11500-12-git-send-email-yangtiezhu@loongson.cn>
 <fdbd6e18-37d4-cf29-a990-89c1974491cb@web.de>
In-Reply-To: <fdbd6e18-37d4-cf29-a990-89c1974491cb@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <maz@kernel.org>, Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 07/01/2020 05:14 PM, Markus Elfring wrote:
>> In the function omap_init_irq_of(), system resource "omap_irq_base"
>> was not released in the error case, fix it.
> Another small wording adjustment:
>    … in an error case. Thus add a call of the function “iounmap”
>    in the if branch.

OK, thank you, I will do it in v5 of this patch #11 and next patch #12.

>
> Regards,
> Markus
