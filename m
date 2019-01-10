From: Marek Vasut <marek.vasut@gmail.com>
Date: Thu, 10 Jan 2019 14:07:20 +0000
Subject: Re: [PATCH -next] gpio: pca953x: Make symbol 'pca953x_i2c_regmap' static
Message-Id: <52902326-baf8-d6b5-52e3-0442fdaebc87@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 1/10/19 3:07 PM, Wei Yongjun wrote:
> Fixes the following sparse warning:
> 
> drivers/gpio/gpio-pca953x.c:292:28: warning:
>  symbol 'pca953x_i2c_regmap' was not declared. Should it be static?
> 
> Fixes: 49427232764d ("gpio: pca953x: Perform basic regmap conversion")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Nice, thanks.
Reviewed-by: Marek Vasut <marex@denx.de>

For future reference, how did you run sparse to detect this ?

> ---
>  drivers/gpio/gpio-pca953x.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
> index 83617fd..0dc9641 100644
> --- a/drivers/gpio/gpio-pca953x.c
> +++ b/drivers/gpio/gpio-pca953x.c
> @@ -289,7 +289,7 @@ static bool pca953x_volatile_register(struct device *dev, unsigned int reg)
>  	return pca953x_check_register(chip, reg, bank);
>  }
>  
> -const struct regmap_config pca953x_i2c_regmap = {
> +static const struct regmap_config pca953x_i2c_regmap = {
>  	.reg_bits = 8,
>  	.val_bits = 8,
> 
> 
> 


-- 
Best regards,
Marek Vasut
