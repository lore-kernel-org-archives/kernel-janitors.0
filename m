From: Gautham R Shenoy <ego@linux.vnet.ibm.com>
Date: Mon, 04 May 2020 05:17:47 +0000
Subject: Re: [PATCH] powerpc/powernv: Fix a warning message
Message-Id: <20200504050547.GA2783@in.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200502115949.139000-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200502115949.139000-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: ego@linux.vnet.ibm.com, maddy@linux.vnet.ibm.com, "Rafael J. Wysocki" <rafael@kernel.org>, kernel-janitors@vger.kernel.org, cclaudio@linux.ibm.com, npiggin@gmail.com, linux-kernel@vger.kernel.org, zhangshaokun@hisilicon.com, Viresh Kumar <viresh.kumar@linaro.org>, atrajeev@linux.vnet.ibm.com, paulus@samba.org, tglx@linutronix.de, linuxppc-dev@lists.ozlabs.org, akshay.adiga@linux.vnet.ibm.com

Hello Christophe,

On Sat, May 02, 2020 at 01:59:49PM +0200, Christophe JAILLET wrote:
> Fix a cut'n'paste error in a warning message. This should be
> 'cpu-idle-state-residency-ns' to match the property searched in the
> previous 'of_property_read_u32_array()'
> 
> Fixes: 9c7b185ab2fe ("powernv/cpuidle: Parse dt idle properties into global structure")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Thanks for catching this.

Reviewed-by: Gautham R. Shenoy <ego@linux.vnet.ibm.com>

> ---
>  arch/powerpc/platforms/powernv/idle.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/platforms/powernv/idle.c b/arch/powerpc/platforms/powernv/idle.c
> index 78599bca66c2..2dd467383a88 100644
> --- a/arch/powerpc/platforms/powernv/idle.c
> +++ b/arch/powerpc/platforms/powernv/idle.c
> @@ -1270,7 +1270,7 @@ static int pnv_parse_cpuidle_dt(void)
>  	/* Read residencies */
>  	if (of_property_read_u32_array(np, "ibm,cpu-idle-state-residency-ns",
>  				       temp_u32, nr_idle_states)) {
> -		pr_warn("cpuidle-powernv: missing ibm,cpu-idle-state-latencies-ns in DT\n");
> +		pr_warn("cpuidle-powernv: missing ibm,cpu-idle-state-residency-ns in DT\n");
>  		rc = -EINVAL;
>  		goto out;
>  	}
> -- 
> 2.25.1
> 
