From: Corentin Labbe <clabbe.montjoie@gmail.com>
Date: Sun, 05 Apr 2020 17:56:24 +0000
Subject: Re: [PATCH] crypto: sun8i-ss - Delete an error message in sun8i_ss_probe()
Message-Id: <20200405175624.GA24925@Red>
List-Id: <kernel-janitors.vger.kernel.org>
References: <c7e1193f-7d8b-7da3-a2a8-e92ca0fd83b2@web.de>
In-Reply-To: <c7e1193f-7d8b-7da3-a2a8-e92ca0fd83b2@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, Tang Bin <tangbin@cmss.chinamobile.com>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, linux-crypto@vger.kernel.org, Colin Ian King <colin.king@canonical.com>, "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org

On Sat, Apr 04, 2020 at 05:45:26PM +0200, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sat, 4 Apr 2020 17:34:53 +0200
> 
> The function “platform_get_irq” can log an error already.
> Thus omit a redundant message for the exception handling in the
> calling function.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/crypto/allwinner/sun8i-ss/sun8i-ss-core.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-core.c b/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-core.c
> index 6b301afffd11..a1fb2fbdbe7b 100644
> --- a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-core.c
> +++ b/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-core.c
> @@ -537,10 +537,8 @@ static int sun8i_ss_probe(struct platform_device *pdev)
>  		return err;
> 
>  	irq = platform_get_irq(pdev, 0);
> -	if (irq < 0) {
> -		dev_err(ss->dev, "Cannot get SecuritySystem IRQ\n");
> +	if (irq < 0)
>  		return irq;
> -	}
> 
>  	ss->reset = devm_reset_control_get(&pdev->dev, NULL);
>  	if (IS_ERR(ss->reset)) {
> --
> 2.26.0
> 

Hello

Acked-by: Corentin Labbe <clabbe.montjoie@gmail.com>

Thanks
