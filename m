From: walter harms <wharms@bfs.de>
Date: Mon, 29 Jul 2019 12:34:35 +0000
Subject: Re: [PATCH][V2] drivers: thermal: processor_thermal_device: fix missing bitwise-or operators
Message-Id: <5D3EE7DB.9070706@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190729120323.15838-1-colin.king@canonical.com>
In-Reply-To: <20190729120323.15838-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Zhang Rui <rui.zhang@intel.com>, Eduardo Valentin <edubezval@gmail.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, linux-pm@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org



Am 29.07.2019 14:03, schrieb Colin King:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable val is having the top 8 bits cleared and then the variable is being
> re-assinged and setting just the top 8 bits.  I believe the intention was bitwise-or
> in the top 8 bits.  Fix this by replacing the = operators with &= and |= instead.
> 
> Addresses-Coverity: ("Unused value")
> Fixes: b0c74b08517e ("drivers: thermal: processor_thermal_device: Export sysfs inteface for TCC offset")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
> 
> V2: Add in &= operator missing from V1. Doh.
> 
> ---
>  .../thermal/intel/int340x_thermal/processor_thermal_device.c  | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/thermal/intel/int340x_thermal/processor_thermal_device.c b/drivers/thermal/intel/int340x_thermal/processor_thermal_device.c
> index 6f6ac6a8e82d..97333fc4be42 100644
> --- a/drivers/thermal/intel/int340x_thermal/processor_thermal_device.c
> +++ b/drivers/thermal/intel/int340x_thermal/processor_thermal_device.c
> @@ -163,8 +163,8 @@ static int tcc_offset_update(int tcc)
>  	if (err)
>  		return err;
>  
> -	val = ~GENMASK_ULL(31, 24);
> -	val = (tcc & 0xff) << 24;
> +	val &= ~GENMASK_ULL(31, 24);
> +	val |= (tcc & 0xff) << 24;
>  

IMHO GENMASK_ULL(31, 24) is a complicated way to say 0xFF000000
In this special case it would be better to use that (or 0xff<<24).

just my 2 cents,

re,
 wh


>  	err = wrmsrl_safe(MSR_IA32_TEMPERATURE_TARGET, val);
>  	if (err)
