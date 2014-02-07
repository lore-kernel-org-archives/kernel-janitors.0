From: Ben Skeggs <bskeggs@redhat.com>
Date: Fri, 07 Feb 2014 05:37:05 +0000
Subject: Re: [patch] drm/nouveau/hwmon: remove some redundant checks
Message-Id: <1439365393.26189549.1391751425086.JavaMail.root@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140206092942.GC31780@elgon.mountain>
In-Reply-To: <20140206092942.GC31780@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Martin Peres <martin.peres@labri.fr>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, Dave Airlie <airlied@redhat.com>

----- Original Message -----
> From: "Dan Carpenter" <dan.carpenter@oracle.com>
> To: "David Airlie" <airlied@linux.ie>
> Cc: "Ben Skeggs" <bskeggs@redhat.com>, "Martin Peres" <martin.peres@labri.fr>, "Ilia Mirkin" <imirkin@alum.mit.edu>,
> "Dave Airlie" <airlied@redhat.com>, dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org
> Sent: Thursday, 6 February, 2014 7:29:43 PM
> Subject: [patch] drm/nouveau/hwmon: remove some redundant checks
> 
> No need to check "ret" twice in a row.
> 
Got it.  Thank you!

> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_hwmon.c
> b/drivers/gpu/drm/nouveau/nouveau_hwmon.c
> index 4aff04fa483c..5e4ab58f4f6b 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_hwmon.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_hwmon.c
> @@ -587,18 +587,14 @@ nouveau_hwmon_init(struct drm_device *dev)
>  
>  	/* set the default attributes */
>  	ret = sysfs_create_group(&hwmon_dev->kobj, &hwmon_default_attrgroup);
> -	if (ret) {
> -		if (ret)
> -			goto error;
> -	}
> +	if (ret)
> +		goto error;
>  
>  	/* if the card has a working thermal sensor */
>  	if (therm->temp_get(therm) >= 0) {
>  		ret = sysfs_create_group(&hwmon_dev->kobj, &hwmon_temp_attrgroup);
> -		if (ret) {
> -			if (ret)
> -				goto error;
> -		}
> +		if (ret)
> +			goto error;
>  	}
>  
>  	/* if the card has a pwm fan */
> 
