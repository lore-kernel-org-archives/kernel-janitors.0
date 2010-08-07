From: Jesse Barnes <jbarnes@virtuousgeek.org>
Date: Sat, 07 Aug 2010 23:48:53 +0000
Subject: Re: [patch] intel_ips: potential null dereference
Message-Id: <20100807164853.4c3818c9@virtuousgeek.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100807215703.GA9031@bicker>
In-Reply-To: <20100807215703.GA9031@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: Matthew Garrett <mjg@redhat.com>, Jiri Slaby <jslaby@suse.cz>, platform-driver-x86@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sun, 8 Aug 2010 00:01:12 +0200
Dan Carpenter <error27@gmail.com> wrote:

> There is a potential NULL dereference of "limits."  We can just return
> NULL earlier to avoid it.  The caller already handles NULL returns.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> 
> diff --git a/drivers/platform/x86/intel_ips.c b/drivers/platform/x86/intel_ips.c
> index afe82e5..c908048 100644
> --- a/drivers/platform/x86/intel_ips.c
> +++ b/drivers/platform/x86/intel_ips.c
> @@ -1342,8 +1342,10 @@ static struct ips_mcp_limits *ips_detect_cpu(struct ips_driver *ips)
>  		limits = &ips_lv_limits;
>  	else if (strstr(boot_cpu_data.x86_model_id, "CPU       U"))
>  		limits = &ips_ulv_limits;
> -	else
> +	else {
>  		dev_info(&ips->dev->dev, "No CPUID match found.\n");
> +		goto out;
> +	}
>  
>  	rdmsrl(TURBO_POWER_CURRENT_LIMIT, turbo_power);
>  	tdp = turbo_power & TURBO_TDP_MASK;

Yep, good idea to catch this case.

Reviewed-by: Jesse Barnes <jbarnes@virtuousgeek.org>

-- 
Jesse Barnes, Intel Open Source Technology Center
