From: Anton Vorontsov <cbouatmailru@gmail.com>
Date: Sat, 17 Nov 2012 02:36:49 +0000
Subject: Re: [patch] power: battery: pointer math issue in gab_probe()
Message-Id: <20121117023649.GA29966@lizard>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120929071346.GE10993@elgon.mountain>
In-Reply-To: <20120929071346.GE10993@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: anish kumar <anish198519851985@gmail.com>, David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sat, Sep 29, 2012 at 10:13:46AM +0300, Dan Carpenter wrote:
> psy->properties is an enum (32 bit type) so adding sizeof() puts us
> four times further along than we intended.  It should be cast to a char
> pointer before doing the math.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> Casting to void * would also work on GCC, at least.

Applied, thanks a lot!

> 
> diff --git a/drivers/power/generic-adc-battery.c b/drivers/power/generic-adc-battery.c
> index 9bdf444..776f118 100644
> --- a/drivers/power/generic-adc-battery.c
> +++ b/drivers/power/generic-adc-battery.c
> @@ -279,7 +279,8 @@ static int __devinit gab_probe(struct platform_device *pdev)
>  	}
>  
>  	memcpy(psy->properties, gab_props, sizeof(gab_props));
> -	properties = psy->properties + sizeof(gab_props);
> +	properties = (enum power_supply_property *)
> +				((char *)psy->properties + sizeof(gab_props));
>  
>  	/*
>  	 * getting channel from iio and copying the battery properties
