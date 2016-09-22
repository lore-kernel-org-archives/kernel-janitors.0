From: Jyri Sarha <jsarha@ti.com>
Date: Thu, 22 Sep 2016 17:04:51 +0000
Subject: Re: [PATCH 3/4] GPU-DRM-TILCDC: Less function calls in tilcdc_convert_slave_node() after error detec
Message-Id: <e9b443c7-2947-46d5-462f-58c175b774bc@ti.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <2f3f7ad7-16a0-1dfb-d073-0d993cd767ee@users.sourceforge.net>
 <0be7fee0-64f7-fa02-0337-51376677343e@users.sourceforge.net>
In-Reply-To: <0be7fee0-64f7-fa02-0337-51376677343e@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>, dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>, Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc: Julia Lawall <julia.lawall@lip6.fr>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On 09/22/16 11:33, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Thu, 22 Sep 2016 10:06:50 +0200
> 
> The of_node_put() function was called in some cases
> by the tilcdc_convert_slave_node() function during error handling
> even if the passed variable contained a null pointer.
> 
> * Adjust jump targets according to the Linux coding style convention.
> 
> * Split a condition check for resource detection failures so that
>   each pointer from these function calls will be checked immediately.
> 
>   See also background information:
>   Topic "CWE-754: Improper check for unusual or exceptional conditions"
>   Link: https://cwe.mitre.org/data/definitions/754.html
> 

I don't really agree with this patch. There is no harm in calling
of_node_put() with NULL as an argument and because of that there is no
point in making the function more complex and harder to maintain.

Best regards,
Jyri

> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/gpu/drm/tilcdc/tilcdc_slave_compat.c | 28 +++++++++++++++++-----------
>  1 file changed, 17 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tilcdc/tilcdc_slave_compat.c b/drivers/gpu/drm/tilcdc/tilcdc_slave_compat.c
> index 6204405..6ee5865 100644
> --- a/drivers/gpu/drm/tilcdc/tilcdc_slave_compat.c
> +++ b/drivers/gpu/drm/tilcdc/tilcdc_slave_compat.c
> @@ -209,25 +209,27 @@ void __init tilcdc_convert_slave_node(void)
>  		return;
>  
>  	lcdc = of_find_matching_node(NULL, tilcdc_of_match);
> -	slave = of_find_matching_node(NULL, tilcdc_slave_of_match);
> +	if (!of_device_is_available(lcdc))
> +		goto free_table;
>  
> -	if (!slave || !of_device_is_available(lcdc))
> -		goto out;
> +	slave = of_find_matching_node(NULL, tilcdc_slave_of_match);
> +	if (!slave)
> +		goto put_node_lcdc;
>  
>  	i2c = of_parse_phandle(slave, "i2c", 0);
>  	if (!i2c) {
>  		pr_err("%s: Can't find i2c node trough phandle\n", __func__);
> -		goto out;
> +		goto put_node_slave;
>  	}
>  
>  	overlay = tilcdc_get_overlay(&kft);
>  	if (!overlay)
> -		goto out;
> +		goto put_node_i2c;
>  
>  	encoder = of_find_matching_node(overlay, tilcdc_tda998x_of_match);
>  	if (!encoder) {
>  		pr_err("%s: Failed to find tda998x node\n", __func__);
> -		goto out;
> +		goto put_node_i2c;
>  	}
>  
>  	tilcdc_copy_props(slave, encoder, tilcdc_slave_props, &kft);
> @@ -238,10 +240,10 @@ void __init tilcdc_convert_slave_node(void)
>  			continue;
>  		if (!strncmp("i2c", (char *)prop->value, prop->length))
>  			if (tilcdc_prop_str_update(prop, i2c->full_name, &kft))
> -				goto out;
> +				goto put_node_fragment;
>  		if (!strncmp("lcdc", (char *)prop->value, prop->length))
>  			if (tilcdc_prop_str_update(prop, lcdc->full_name, &kft))
> -				goto out;
> +				goto put_node_fragment;
>  	}
>  
>  	tilcdc_node_disable(slave);
> @@ -252,12 +254,16 @@ void __init tilcdc_convert_slave_node(void)
>  	else
>  		pr_info("%s: ti,tilcdc,slave node successfully converted\n",
>  			__func__);
> -out:
> -	kfree_table_free(&kft);
> + put_node_fragment:
> +	of_node_put(fragment);
> + put_node_i2c:
>  	of_node_put(i2c);
> + put_node_slave:
>  	of_node_put(slave);
> + put_node_lcdc:
>  	of_node_put(lcdc);
> -	of_node_put(fragment);
> + free_table:
> +	kfree_table_free(&kft);
>  }
>  
>  int __init tilcdc_slave_compat_init(void)
> 

