From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Date: Tue, 22 May 2018 19:59:41 +0000
Subject: Re: [PATCH -next] leds: sc27xx: Fix return value check in sc27xx_led_probe()
Message-Id: <4b7b65c3-54e7-6ee0-1afa-1f63bc59ee62@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1526989556-139872-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1526989556-139872-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Wei,

Thank you for the patch.

On 05/22/2018 01:45 PM, Wei Yongjun wrote:
> In case of error, the function dev_get_regmap() returns NULL pointer not
> ERR_PTR(). The IS_ERR() test in the return value check should be
> replaced with NULL test.
> 
> Fixes: e081c49e30ec ("leds: Add Spreadtrum SC27xx breathing light controller driver")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>   drivers/leds/leds-sc27xx-bltc.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/leds/leds-sc27xx-bltc.c b/drivers/leds/leds-sc27xx-bltc.c
> index 54a90c8..9d9b7aa 100644
> --- a/drivers/leds/leds-sc27xx-bltc.c
> +++ b/drivers/leds/leds-sc27xx-bltc.c
> @@ -176,8 +176,8 @@ static int sc27xx_led_probe(struct platform_device *pdev)
>   	mutex_init(&priv->lock);
>   	priv->base = base;
>   	priv->regmap = dev_get_regmap(dev->parent, NULL);
> -	if (IS_ERR(priv->regmap)) {
> -		err = PTR_ERR(priv->regmap);
> +	if (!priv->regmap) {
> +		err = -ENODEV;
>   		dev_err(dev, "failed to get regmap: %d\n", err);
>   		return err;
>   	}
> 
> 

Applied.

-- 
Best regards,
Jacek Anaszewski
