From: Zhang Rui <rui.zhang@intel.com>
Date: Wed, 17 Apr 2013 15:45:53 +0000
Subject: Re: [patch] Thermal: cpufreq cooling: endian bug in cpufreq_get_max_state()
Message-Id: <1366213553.2091.70.camel@rzhang1-mobl4>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130417071828.GD7923@elgon.mountain>
In-Reply-To: <20130417071828.GD7923@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-pm@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, 2013-04-17 at 10:18 +0300, Dan Carpenter wrote:
> This code doesn't work on big endian systems because we're storing low
> values in the high bits of the unsigned long.  It makes it a very high
> value instead.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

applied to thermal -next.

thanks,
rui
> 
> diff --git a/drivers/thermal/cpu_cooling.c b/drivers/thermal/cpu_cooling.c
> index 5f5c780..768b508 100644
> --- a/drivers/thermal/cpu_cooling.c
> +++ b/drivers/thermal/cpu_cooling.c
> @@ -303,12 +303,12 @@ static int cpufreq_get_max_state(struct thermal_cooling_device *cdev,
>  	struct cpufreq_cooling_device *cpufreq_device = cdev->devdata;
>  	struct cpumask *mask = &cpufreq_device->allowed_cpus;
>  	unsigned int cpu;
> -	unsigned long count = 0;
> +	unsigned int count = 0;
>  	int ret;
>  
>  	cpu = cpumask_any(mask);
>  
> -	ret = get_property(cpu, 0, (unsigned int *)&count, GET_MAXL);
> +	ret = get_property(cpu, 0, &count, GET_MAXL);
>  
>  	if (count > 0)
>  		*state = count;


