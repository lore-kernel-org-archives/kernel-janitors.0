From: Javi Merino <javi.merino@arm.com>
Date: Mon, 30 Mar 2015 12:23:22 +0000
Subject: Re: [patch] thermal: cpu_cooling: check for allocation failure
Message-Id: <20150330122322.GB11519@e104805>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150330112144.GC27144@mwanda>
In-Reply-To: <20150330112144.GC27144@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Zhang Rui <rui.zhang@intel.com>, Eduardo Valentin <edubezval@gmail.com>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

On Mon, Mar 30, 2015 at 12:21:44PM +0100, Dan Carpenter wrote:
> If this fails, then we're likely in trouble anyway, but it's nice to
> keep the code free from static checker warnings so you don't miss more
> important bugs.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/thermal/cpu_cooling.c b/drivers/thermal/cpu_cooling.c
> index c497414..3a01dfd 100644
> --- a/drivers/thermal/cpu_cooling.c
> +++ b/drivers/thermal/cpu_cooling.c
> @@ -329,6 +329,10 @@ static int build_dyn_power_table(struct cpufreq_cooling_device *cpufreq_device,
>  	}
>  
>  	power_table = kcalloc(num_opps, sizeof(*power_table), GFP_KERNEL);
> +	if (!power_table) {
> +		ret = -ENOMEM;
> +		goto unlock;
> +	}

This fix is already in Eduardo's tree and is scheduled for 4.1:

https://git.kernel.org/cgit/linux/kernel/git/evalenti/linux-soc-thermal.git/commit/?h=linus&idea7db8371d1203adb871d240d46b040fd6b4e1d

Cheers,
Javi

