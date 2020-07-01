From: Markus Elfring <Markus.Elfring@web.de>
Date: Wed, 01 Jul 2020 09:14:58 +0000
Subject: Re: [PATCH v4 11/14] irqchip/omap-intc: Fix potential resource leak
Message-Id: <fdbd6e18-37d4-cf29-a990-89c1974491cb@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1593569786-11500-1-git-send-email-yangtiezhu@loongson.cn>
 <1593569786-11500-12-git-send-email-yangtiezhu@loongson.cn>
In-Reply-To: <1593569786-11500-12-git-send-email-yangtiezhu@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Tiezhu Yang <yangtiezhu@loongson.cn>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <maz@kernel.org>, Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

> In the function omap_init_irq_of(), system resource "omap_irq_base"
> was not released in the error case, fix it.

Another small wording adjustment:
  … in an error case. Thus add a call of the function “iounmap”
  in the if branch.

Regards,
Markus
