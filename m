From: Markus Elfring <Markus.Elfring@web.de>
Date: Mon, 11 Nov 2019 13:32:30 +0000
Subject: Re: [PATCH 2/4] pwm: omap-dmtimer: simplify error handling
Message-Id: <a7a4656d-98b4-6bbb-e389-fe7028a38f97@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191111071952.6pbswbboqreen6im@pengutronix.de>
 <20191111090357.13903-1-u.kleine-koenig@pengutronix.de>
 <20191111090357.13903-2-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20191111090357.13903-2-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>, linux-pwm@vger.kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>, Neil Brown <neilb@suse.de>, Neil Armstrong <narmstrong@baylibre.com>, kernel@pengutronix.de, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

> Implementation note: The put: label was never reached without a goto and
> ret being unequal to 0, so the removed return statement is fine.

This can look fine (in principle) because the label was repositioned here.
Do you really want to call the function “of_node_put” at two places now?


> +++ b/drivers/pwm/pwm-omap-dmtimer.c
…
>  	omap = devm_kzalloc(&pdev->dev, sizeof(*omap), GFP_KERNEL);
>  	if (!omap) {
> -		pdata->free(dm_timer);
> -		return -ENOMEM;
> +		ret = -ENOMEM;
> +		goto err_alloc_omap;
>  	}
…

I suggest to reconsider your label name selection according to
the Linux coding style.


> @@ -339,13 +334,28 @@ static int pwm_omap_dmtimer_probe(struct platform_device *pdev)
…
> +err_pwmchip_add:
> +
> +	/*
> +	 * *omap is allocated using devm_kzalloc,
> +	 * so no free necessary here
> +	 */
> +err_alloc_omap:
> +
> +	pdata->free(dm_timer);

Would the use of the label “free_dm_timer” be more appropriate?


> +put:
> +	of_node_put(timer);
…

Can the label “put_node” be nicer?

Regards,
Markus
