From: Markus Elfring <Markus.Elfring@web.de>
Date: Tue, 23 Jun 2020 15:55:33 +0000
Subject: Re: [PATCH 1/7] irqchip: Fix potential resource leaks
Message-Id: <65e734f7-c43c-f96b-3650-980e15edba60@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Tiezhu Yang <yangtiezhu@loongson.cn>, devicetree@vger.kernel.org, linux-mips@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Huacai Chen <chenhc@lemote.com>, Jason Cooper <jason@lakedaemon.net>, Jiaxun Yang <jiaxun.yang@flygoat.com>, Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Xuefeng Li <lixuefeng@loongson.cn>

> There exists some potential resource leaks in the error path, fix them.

Will the tag “Fixes” become relevant for the commit message?


…
> +++ b/drivers/irqchip/irq-nvic.c
> @@ -94,6 +94,7 @@ static int __init nvic_of_init(struct device_node *node,
>
>  	if (!nvic_irq_domain) {
>  		pr_warn("Failed to allocate irq domain\n");
> +		iounmap(nvic_base);
>  		return -ENOMEM;
>  	}
>
> @@ -103,6 +104,7 @@ static int __init nvic_of_init(struct device_node *node,
>  	if (ret) {
>  		pr_warn("Failed to allocate irq chips\n");
>  		irq_domain_remove(nvic_irq_domain);
> +		iounmap(nvic_base);
>  		return ret;
>  	}

Can it helpful to add jump targets so that a bit of exception handling
can be better reused at the end of this function?

Regards,
Markus
