From: Julia Lawall <julia@diku.dk>
Date: Tue, 25 Mar 2008 08:51:20 +0000
Subject: Re: [PATCH 4/5] drivers/acpi: elide a non-zero test on a result that
Message-Id: <Pine.LNX.4.64.0803250950170.22289@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0803241909420.32740@ask.diku.dk>
 <1206431411.3047.45.camel@acpi-hp-zz.sh.intel.com>
 <Pine.LNX.4.64.0803250931440.22289@ask.diku.dk> <1206433818.3047.50.camel@acpi-hp-zz.sh.intel.com>
In-Reply-To: <1206433818.3047.50.camel@acpi-hp-zz.sh.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Zhang, Rui" <rui.zhang@intel.com>
Cc: "Brown, Len" <len.brown@intel.com>, linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

> > > And the return value of thermal_zone_device_register is also
> > misused.
> I guess you didn't fix this one, right?
> Len, please apply this patch.:)

Indeed, I did not fix this one.  So your patch should be used in this 
case.

julia

> 
> 
> Check the return value of thermal zone device registration correctly.
> 
> Signed-off-by: Zhang Rui <rui.zhang@intel.com>
> ---
>  drivers/acpi/thermal.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> Index: linux-2.6/drivers/acpi/thermal.c
> =================================> --- linux-2.6.orig/drivers/acpi/thermal.c
> +++ linux-2.6/drivers/acpi/thermal.c
> @@ -1125,7 +1125,7 @@ static int acpi_thermal_register_thermal
>  			tz->trips.active[i].flags.valid; i++, trips++);
>  	tz->thermal_zone = thermal_zone_device_register("ACPI thermal zone",
>  					trips, tz, &acpi_thermal_zone_ops);
> -	if (!tz->thermal_zone)
> +	if (IS_ERR(tz->thermal_zone))
>  		return -ENODEV;
>  
>  	result = sysfs_create_link(&tz->device->dev.kobj,
> 
> 
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

