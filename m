From: Ludovic Desroches <ludovic.desroches@microchip.com>
Date: Mon, 10 Sep 2018 08:50:17 +0000
Subject: Re: [PATCH] pinctrl: at91-pio4: fix has_config check in atmel_pctl_dt_subnode_to_map()
Message-Id: <20180910085017.akmo7gtqc5yyl33h@M43218.corp.atmel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180910083745.2laxr4upjq36cyqf@kili.mountain>
In-Reply-To: <20180910083745.2laxr4upjq36cyqf@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, Sep 10, 2018 at 11:37:45AM +0300, Dan Carpenter wrote:
> Smatch complains about this condition:
> 
> 	if (has_config && num_pins >= 1)
> 
> The "has_config" variable is either uninitialized or true.  The
> "num_pins" variable is unsigned and we verified that it is non-zero on
> the lines before so we know "num_pines >= 1" is true.  Really, we could
> just check "num_configs" directly and remove the "has_config" variable.
> 
> Fixes: 776180848b57 ("pinctrl: introduce driver for Atmel PIO4 controller")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Acked-by: Ludovic Desroches <ludovic.desroches@microchip.com>

Thanks

> 
> diff --git a/drivers/pinctrl/pinctrl-at91-pio4.c b/drivers/pinctrl/pinctrl-at91-pio4.c
> index ef7ab208b951..9e2f3738bf3e 100644
> --- a/drivers/pinctrl/pinctrl-at91-pio4.c
> +++ b/drivers/pinctrl/pinctrl-at91-pio4.c
> @@ -493,7 +493,6 @@ static int atmel_pctl_dt_subnode_to_map(struct pinctrl_dev *pctldev,
>  	unsigned num_pins, num_configs, reserve;
>  	unsigned long *configs;
>  	struct property	*pins;
> -	bool has_config;
>  	u32 pinfunc;
>  	int ret, i;
>  
> @@ -509,9 +508,6 @@ static int atmel_pctl_dt_subnode_to_map(struct pinctrl_dev *pctldev,
>  		return ret;
>  	}
>  
> -	if (num_configs)
> -		has_config = true;
> -
>  	num_pins = pins->length / sizeof(u32);
>  	if (!num_pins) {
>  		dev_err(pctldev->dev, "no pins found in node %pOF\n", np);
> @@ -524,7 +520,7 @@ static int atmel_pctl_dt_subnode_to_map(struct pinctrl_dev *pctldev,
>  	 * map for each pin.
>  	 */
>  	reserve = 1;
> -	if (has_config && num_pins >= 1)
> +	if (num_configs)
>  		reserve++;
>  	reserve *= num_pins;
>  	ret = pinctrl_utils_reserve_map(pctldev, map, reserved_maps, num_maps,
> @@ -547,7 +543,7 @@ static int atmel_pctl_dt_subnode_to_map(struct pinctrl_dev *pctldev,
>  		pinctrl_utils_add_map_mux(pctldev, map, reserved_maps, num_maps,
>  					  group, func);
>  
> -		if (has_config) {
> +		if (num_configs) {
>  			ret = pinctrl_utils_add_map_configs(pctldev, map,
>  					reserved_maps, num_maps, group,
>  					configs, num_configs,
