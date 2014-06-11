From: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Date: Wed, 11 Jun 2014 08:36:17 +0000
Subject: Re: [patch] pinctrl: berlin: fix an error code in berlin_pinctrl_probe()
Message-Id: <53981501.9090404@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140611081513.GA29572@mwanda>
In-Reply-To: <20140611081513.GA29572@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: Antoine Tenart <antoine.tenart@free-electrons.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 06/11/2014 10:15 AM, Dan Carpenter wrote:
> We are returning success here because PTR_ERR(NULL) is zero.  We should
> be returning -ENODEV.
>
> Fixes: 3de68d331c24 ('pinctrl: berlin: add the core pinctrl driver for Marvell Berlin SoCs')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Dan, thanks for the fix!

Acked-by: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>

> diff --git a/drivers/pinctrl/berlin/berlin.c b/drivers/pinctrl/berlin/berlin.c
> index edf5d2f..86db223 100644
> --- a/drivers/pinctrl/berlin/berlin.c
> +++ b/drivers/pinctrl/berlin/berlin.c
> @@ -320,7 +320,7 @@ int berlin_pinctrl_probe(struct platform_device *pdev,
>
>   	regmap = dev_get_regmap(&pdev->dev, NULL);
>   	if (!regmap)
> -		return PTR_ERR(regmap);
> +		return -ENODEV;
>
>   	pctrl = devm_kzalloc(dev, sizeof(*pctrl), GFP_KERNEL);
>   	if (!pctrl)
>

