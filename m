From: Markus Elfring <Markus.Elfring@web.de>
Date: Wed, 01 Jul 2020 08:40:35 +0000
Subject: Re: [PATCH v4 02/14] irqchip/csky-apb-intc: Fix potential resource leaks
Message-Id: <564ffff9-6043-7191-2458-f425dd8d0c11@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1593569786-11500-1-git-send-email-yangtiezhu@loongson.cn>
 <1593569786-11500-3-git-send-email-yangtiezhu@loongson.cn>
In-Reply-To: <1593569786-11500-3-git-send-email-yangtiezhu@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Tiezhu Yang <yangtiezhu@loongson.cn>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <maz@kernel.org>, Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

> … were not released in a few error cases. …

Another small wording adjustment:
  … in two error cases. …


…
> +++ b/drivers/irqchip/irq-csky-apb-intc.c
…
> @@ -126,10 +127,17 @@ ck_intc_init_comm(struct device_node *node, struct device_node *parent)
…
> +err_iounmap:
> +	iounmap(reg_base);
> +	return ret;
>  }
…

How do you think about to use the statement “return -ENOMEM;”?
Can the local variable “ret” be omitted in this function implementation?

Regards,
Markus
