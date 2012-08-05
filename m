From: "Rafael J. Wysocki" <rjw@sisk.pl>
Date: Sun, 05 Aug 2012 21:11:44 +0000
Subject: Re: [PATCH 2/6] drivers/cpufreq/pcc-cpufreq.c: fix error return code
Message-Id: <201208052311.44825.rjw@sisk.pl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1344160356-387-1-git-send-email-Julia.Lawall@lip6.fr> <1344160356-387-3-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1344160356-387-3-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: kernel-janitors@vger.kernel.org, cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, Julia Lawall <julia@diku.dk>

On Sunday, August 05, 2012, Julia Lawall wrote:
> From: Julia Lawall <julia@diku.dk>
> 
> Convert a 0 error return code to a negative one, as returned elsewhere in the
> function.
> 
> A simplified version of the semantic match that finds this problem is as
> follows: (http://coccinelle.lip6.fr/)
> 
> // <smpl>
> @@
> identifier ret;
> expression e,e1,e2,e3,e4,x;
> @@
> 
> (
> if (\(ret != 0\|ret < 0\) || ...) { ... return ...; }
> |
> ret = 0
> )
> ... when != ret = e1
> *x = \(kmalloc\|kzalloc\|kcalloc\|devm_kzalloc\|ioremap\|ioremap_nocache\|devm_ioremap\|devm_ioremap_nocache\)(...);
> ... when != x = e2
>     when != ret = e3
> *if (x = NULL || ...)
> {
>   ... when != ret = e4
> *  return ret;
> }
> // </smpl>
> 
> Signed-off-by: Julia Lawall <julia@diku.dk>

Applied to the linux-next branch of the linux-pm.git tree.  I'm going to
push it as a fix for v3.6.

Thanks,
Rafael


> ---
>  drivers/cpufreq/pcc-cpufreq.c |    1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/cpufreq/pcc-cpufreq.c b/drivers/cpufreq/pcc-cpufreq.c
> index cdc02ac..503996a 100644
> --- a/drivers/cpufreq/pcc-cpufreq.c
> +++ b/drivers/cpufreq/pcc-cpufreq.c
> @@ -454,6 +454,7 @@ static int __init pcc_cpufreq_probe(void)
>  					mem_resource->address_length);
>  	if (pcch_virt_addr = NULL) {
>  		pr_debug("probe: could not map shared mem region\n");
> +		ret = -ENOMEM;
>  		goto out_free;
>  	}
>  	pcch_hdr = pcch_virt_addr;
> 
> 
> 

