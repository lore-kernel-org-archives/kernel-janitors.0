From: "Srivatsa S. Bhat" <srivatsa.bhat@linux.vnet.ibm.com>
Date: Mon, 09 Jan 2012 13:12:55 +0000
Subject: Re: [patch] cpuidle: checking the wrong variable in __cpuidle_register_device()
Message-Id: <4F0AE507.8020200@linux.vnet.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120109105454.GA6940@elgon.mountain>
In-Reply-To: <20120109105454.GA6940@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Len Brown <len.brown@intel.com>, Kay Sievers <kay.sievers@vrfy.org>, Kevin Hilman <khilman@ti.com>, Trinabh Gupta <g.trinabh@gmail.com>, Arjan van de Ven <arjan@linux.intel.com>, Deepthi Dharwar <deepthi@linux.vnet.ibm.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Linux PM mailing list <linux-pm@vger.kernel.org>, Greg Kroah-Hartman <gregkh@suse.de>

On 01/09/2012 04:24 PM, Dan Carpenter wrote:

> We updated this in 8a25a2fd12 "cpu: convert 'cpu' and 'machinecheck'
> sysdev_class to a regular subsystem" but it should be checking "cpu_dev"
> here not "dev".  The "dev" variable was dereferenced already.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/cpuidle/cpuidle.c b/drivers/cpuidle/cpuidle.c
> index 59f4261..7771810 100644
> --- a/drivers/cpuidle/cpuidle.c
> +++ b/drivers/cpuidle/cpuidle.c
> @@ -294,7 +294,7 @@ static int __cpuidle_register_device(struct cpuidle_device *dev)
>  	struct device *cpu_dev = get_cpu_device((unsigned long)dev->cpu);
>  	struct cpuidle_driver *cpuidle_driver = cpuidle_get_driver();
> 
> -	if (!dev)
> +	if (!cpu_dev)
>  		return -EINVAL;
>  	if (!try_module_get(cpuidle_driver->owner))
>  		return -EINVAL;


Reviewed-by: Srivatsa S. Bhat <srivatsa.bhat@linux.vnet.ibm.com>

