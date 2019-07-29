From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Date: Mon, 29 Jul 2019 21:09:00 +0000
Subject: Re: [PATCH][V2] drivers: thermal: processor_thermal_device: fix missing bitwise-or operators
Message-Id: <42db46c33466a12221e0968e82c4c4ee17b0341d.camel@linux.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190729120323.15838-1-colin.king@canonical.com>
In-Reply-To: <20190729120323.15838-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Zhang Rui <rui.zhang@intel.com>, Eduardo Valentin <edubezval@gmail.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-pm@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, 2019-07-29 at 13:03 +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable val is having the top 8 bits cleared and then the
> variable is being
> re-assinged and setting just the top 8 bits.  I believe the intention
> was bitwise-or
> in the top 8 bits.  Fix this by replacing the = operators with &= and
> |= instead.
> 
> Addresses-Coverity: ("Unused value")
> Fixes: b0c74b08517e ("drivers: thermal: processor_thermal_device:
> Export sysfs inteface for TCC offset")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
Reviewed-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>

> ---
> 
> V2: Add in &= operator missing from V1. Doh.
> 
> ---
>  .../thermal/intel/int340x_thermal/processor_thermal_device.c  | 4
> ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git
> a/drivers/thermal/intel/int340x_thermal/processor_thermal_device.c
> b/drivers/thermal/intel/int340x_thermal/processor_thermal_device.c
> index 6f6ac6a8e82d..97333fc4be42 100644
> ---
> a/drivers/thermal/intel/int340x_thermal/processor_thermal_device.c
> +++
> b/drivers/thermal/intel/int340x_thermal/processor_thermal_device.c
> @@ -163,8 +163,8 @@ static int tcc_offset_update(int tcc)
>  	if (err)
>  		return err;
>  
> -	val = ~GENMASK_ULL(31, 24);
> -	val = (tcc & 0xff) << 24;
> +	val &= ~GENMASK_ULL(31, 24);
> +	val |= (tcc & 0xff) << 24;
>  
>  	err = wrmsrl_safe(MSR_IA32_TEMPERATURE_TARGET, val);
>  	if (err)
