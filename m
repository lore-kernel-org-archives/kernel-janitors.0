From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Date: Thu, 11 May 2017 01:41:30 +0000
Subject: Re: [PATCH] PowerCap: Fix an error code in powercap_register_zone()
Message-Id: <1494466890.440.3.camel@linux.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170510194006.vsr5r5eyvjry4cka@mwanda>
In-Reply-To: <20170510194006.vsr5r5eyvjry4cka@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dan Carpenter <dan.carpenter@oracle.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: linux-pm@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, 2017-05-10 at 22:40 +0300, Dan Carpenter wrote:
> In the current code we accidentally return the successful result from
> idr_alloc() instead of a negative error pointer.  The caller is
> looking
> for an error pointer and so it treats the returned value as a valid
> pointer.
> 
> This one might be a bit serious because if it lets people get around
> the
> kernel's protection for remapping NULL.  I'm not sure.
> 
> Fixes: 75d2364ea0ca ("PowerCap: Add class driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Reviewed-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>

> 
> diff --git a/drivers/powercap/powercap_sys.c
> b/drivers/powercap/powercap_sys.c
> index 14bde0db8c24..5b10b50f8686 100644
> --- a/drivers/powercap/powercap_sys.c
> +++ b/drivers/powercap/powercap_sys.c
> @@ -538,6 +538,7 @@ struct powercap_zone *powercap_register_zone(
>  
>  	power_zone->id = result;
>  	idr_init(&power_zone->idr);
> +	result = -ENOMEM;
>  	power_zone->name = kstrdup(name, GFP_KERNEL);
>  	if (!power_zone->name)
>  		goto err_name_alloc;
