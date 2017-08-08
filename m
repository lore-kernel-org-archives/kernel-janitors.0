From: Zhang Rui <rui.zhang@intel.com>
Date: Tue, 08 Aug 2017 08:38:24 +0000
Subject: Re: [PATCH 1/3] thermal: core: Fix a memory leak in 'thermal_zone_device_register()' error handling 
Message-Id: <1502181504.4296.17.camel@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cover.1500187753.git.christophe.jaillet@wanadoo.fr>
         <dcc79547980dca6c42c16c60f76cf8b4cbd5a392.1500187753.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <dcc79547980dca6c42c16c60f76cf8b4cbd5a392.1500187753.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, edubezval@gmail.com
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sun, 2017-07-16 at 08:59 +0200, Christophe JAILLET wrote:
> 'tz' is freed in some error handling paths but not in the main one.
> So free it also here to avoid a memory leak.
> 
After device registered, tz is freed in thermal_release().

thanks,
rui
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/thermal/thermal_core.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/thermal/thermal_core.c
> b/drivers/thermal/thermal_core.c
> index 5a51c740e372..9743f3e65eb0 100644
> --- a/drivers/thermal/thermal_core.c
> +++ b/drivers/thermal/thermal_core.c
> @@ -1296,6 +1296,7 @@ thermal_zone_device_register(const char *type,
> int trips, int mask,
>  unregister:
>  	ida_simple_remove(&thermal_tz_ida, tz->id);
>  	device_unregister(&tz->device);
> +	kfree(tz);
>  	return ERR_PTR(result);
>  }
>  EXPORT_SYMBOL_GPL(thermal_zone_device_register);
