From: Ingo Molnar <mingo@kernel.org>
Date: Thu, 09 Apr 2015 12:02:12 +0000
Subject: Re: [patch] perf/x86/intel/pt: cleanup error handling in pt_pmu_hw_init()
Message-Id: <20150409120211.GA13290@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150409090805.GG17605@mwanda>
In-Reply-To: <20150409090805.GG17605@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


* Dan Carpenter <dan.carpenter@oracle.com> wrote:

> There is no need to free NULL pointers.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/arch/x86/kernel/cpu/perf_event_intel_pt.c b/arch/x86/kernel/cpu/perf_event_intel_pt.c
> index f5a3afc..c358877 100644
> --- a/arch/x86/kernel/cpu/perf_event_intel_pt.c
> +++ b/arch/x86/kernel/cpu/perf_event_intel_pt.c
> @@ -135,12 +135,12 @@ static int __init pt_pmu_hw_init(void)
>  	size = sizeof(struct attribute *) * (ARRAY_SIZE(pt_caps) + 1);
>  	attrs = kzalloc(size, GFP_KERNEL);
>  	if (!attrs)
> -		goto err_attrs;
> +		return -ENOMEM;

Please don't put stray return statements into functions, try to keep 
to clean (and singular) goto driven exit paths.

Thanks,

	Ingo
