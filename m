From: Markus Elfring <Markus.Elfring@web.de>
Date: Wed, 01 Jul 2020 08:15:19 +0000
Subject: Re: [PATCH v4 04/14] irqchip/davinci-aintc: Fix potential resource leaks
Message-Id: <08cad331-0a17-586c-07a7-6e3843cb61a1@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1593569786-11500-1-git-send-email-yangtiezhu@loongson.cn>
 <1593569786-11500-5-git-send-email-yangtiezhu@loongson.cn>
In-Reply-To: <1593569786-11500-5-git-send-email-yangtiezhu@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Tiezhu Yang <yangtiezhu@loongson.cn>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <maz@kernel.org>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

…
> +++ b/drivers/irqchip/irq-davinci-aintc.c
> @@ -96,7 +96,7 @@ void __init davinci_aintc_init(const struct davinci_aintc_config *config)
>  				     resource_size(&config->reg));
>  	if (!davinci_aintc_base) {
>  		pr_err("%s: unable to ioremap register range\n", __func__);
> -		return;
> +		goto err_release;
>  	}
…

Can it help to return any error codes?
Would you like to reconsider the function return type?

Regards,
Markus
