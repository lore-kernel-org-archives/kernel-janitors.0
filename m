From: Chanwoo Choi <cw00.choi@samsung.com>
Date: Fri, 15 May 2015 10:19:00 +0000
Subject: Re: [patch] regulator: max77686: fix a shift wrapping bug
Message-Id: <5555C814.7030405@samsung.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150515092501.GB21508@mwanda>
In-Reply-To: <20150515092501.GB21508@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi Dan,

On 05/15/2015 06:25 PM, Dan Carpenter wrote:
> We need to be able to handle more than 32 bits here because "id" can go
> up to MAX77686_BUCK9 (34).  ->gpio_enabled is a u64 so that's fine
> already.
> 
> Fixes: 3307e9025d29 ('regulator: max77686: Add GPIO control')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/regulator/max77686.c b/drivers/regulator/max77686.c
> index 23b7c06..59b3210 100644
> --- a/drivers/regulator/max77686.c
> +++ b/drivers/regulator/max77686.c
> @@ -121,7 +121,7 @@ static unsigned int max77686_map_normal_mode(struct max77686_data *max77686,
>  	case MAX77686_BUCK8:
>  	case MAX77686_BUCK9:
>  	case MAX77686_LDO20 ... MAX77686_LDO22:
> -		if (max77686->gpio_enabled & (1 << id))
> +		if (max77686->gpio_enabled & (1ULL << id))
>  			return MAX77686_GPIO_CONTROL;
>  	}
>  
> @@ -277,7 +277,7 @@ static int max77686_of_parse_cb(struct device_node *np,
>  	}
>  
>  	if (gpio_is_valid(config->ena_gpio)) {
> -		max77686->gpio_enabled |= (1 << desc->id);
> +		max77686->gpio_enabled |= (1ULL << desc->id);
>  
>  		return regmap_update_bits(config->regmap, desc->enable_reg,
>  					  desc->enable_mask,
> 

Looks good to me.

Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>

Thanks,
Chanwoo Choi
