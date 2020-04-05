From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 05 Apr 2020 17:27:49 +0000
Subject: Re: [PATCH] gpu/drm: ingenic: Delete an error message in ingenic_drm_probe()
Message-Id: <a0a0c054-f71e-a23e-ba47-c1f6554b79e6@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <e03e7106-0f22-99c4-ad21-b288e8990b5a@web.de>
In-Reply-To: <e03e7106-0f22-99c4-ad21-b288e8990b5a@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

Le 05/04/2020 à 11:30, Markus Elfring a écrit :
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sun, 5 Apr 2020 11:25:30 +0200
>
> The function “platform_get_irq” can log an error already.
> Thus omit a redundant message for the exception handling in the
> calling function.
>
> This issue was detected by using the Coccinelle software.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>   drivers/gpu/drm/ingenic/ingenic-drm.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/ingenic/ingenic-drm.c b/drivers/gpu/drm/ingenic/ingenic-drm.c
> index 9dfe7cb530e1..06ca752b76ee 100644
> --- a/drivers/gpu/drm/ingenic/ingenic-drm.c
> +++ b/drivers/gpu/drm/ingenic/ingenic-drm.c
> @@ -661,10 +661,8 @@ static int ingenic_drm_probe(struct platform_device *pdev)
>   	}
>
>   	irq = platform_get_irq(pdev, 0);
> -	if (irq < 0) {
> -		dev_err(dev, "Failed to get platform irq");

Some 'dev_err' or equivalent functions sometimes don't have a trailing 
'\n'. (just like here)
Do you think that it worth fixing? Or is it to low level value?

According to a few grep, there seems to be quite a lot of them to fix.

Julia, can 'coccinelle' be used for that?

CJ

> +	if (irq < 0)
>   		return irq;
> -	}
>
>   	if (soc_info->needs_dev_clk) {
>   		priv->lcd_clk = devm_clk_get(dev, "lcd");
> --
> 2.26.0
>
>
