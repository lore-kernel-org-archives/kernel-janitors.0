From: Markus Elfring <Markus.Elfring@web.de>
Date: Fri, 08 May 2020 11:25:19 +0000
Subject: Re: [PATCH] power: supply: lp8788: Fix an error handling path in lp8788_charger_probe()
Message-Id: <ccb359c1-b157-6d41-5fd2-791a368d7cf5@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200508071150.204974-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200508071150.204974-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Christophe Jaillet <christophe.jaillet@wanadoo.fr>, linux-pm@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Anton Vorontsov <anton.vorontsov@linaro.org>, Milo Kim <milo.kim@ti.com>, Sebastian Reichel <sre@kernel.org>

> In case of error, resources allocated in 'lp8788_setup_adc_channel()' must
> be released.
>
> Add a call to 'lp8788_release_adc_channel()' as already done in the remove
> function.

I suggest to omit apostrophes from this commit message.


…
> +++ b/drivers/power/supply/lp8788-charger.c
> @@ -719,13 +719,17 @@  static int lp8788_charger_probe(struct platform_device *pdev)
>
>  	ret = lp8788_psy_register(pdev, pchg);
>  	if (ret)
> -		return ret;
> +		goto err_release_adc_channel;
>
>  	ret = lp8788_irq_register(pdev, pchg);
…

You propose to perform another channel release only once for this
function implementation.
Thus I find nicer to specify the desired exception handling in
this if branch directly.

Regards,
Markus
