From: Frank Rowand <frowand.list@gmail.com>
Date: Thu, 04 May 2017 00:05:29 +0000
Subject: Re: [PATCH] of/unittest: Missing unlocks on error
Message-Id: <590A7049.3070108@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170503194950.4xbdbwybvx6dkadx@mwanda>
In-Reply-To: <20170503194950.4xbdbwybvx6dkadx@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On 05/03/17 12:49, Dan Carpenter wrote:
> Static checkers complain that we should unlock before returning.  Which
> is true.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
> index 12597ff8cfb0..425338d6286d 100644
> --- a/drivers/of/unittest.c
> +++ b/drivers/of/unittest.c
> @@ -2210,14 +2210,14 @@ static __init void of_unittest_overlay_high_level(void)
>  				unittest(0,
>  					 "duplicate property '%s' in overlay_base node __symbols__",
>  					 prop->name);
> -				return;
> +				goto err_unlock;
>  			}
>  			ret = __of_add_property_sysfs(of_symbols, prop);
>  			if (ret) {
>  				unittest(0,
>  					 "unable to add property '%s' in overlay_base node __symbols__ to sysfs",
>  					 prop->name);
> -				return;
> +				goto err_unlock;
>  			}
>  		}
>  	}
> @@ -2232,6 +2232,10 @@ static __init void of_unittest_overlay_high_level(void)
>  
>  	unittest(overlay_data_add(2),
>  		 "Adding overlay 'overlay_bad_phandle' failed\n");
> +	return;
> +
> +err_unlock:
> +	mutex_unlock(&of_mutex);
>  }
>  
>  #else
> 

Thanks Dan.

Reviewed-by: Frank Rowand <frank.rowand@sony.com>
