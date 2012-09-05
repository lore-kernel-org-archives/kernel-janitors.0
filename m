From: Jiri Olsa <jolsa@redhat.com>
Date: Wed, 05 Sep 2012 12:59:34 +0000
Subject: Re: [patch] perf: off by one test in perf_reg_value()
Message-Id: <20120905125934.GA1869@krava.brq.redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120905123126.GC6128@elgon.mountain>
In-Reply-To: <20120905123126.GC6128@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, Sep 05, 2012 at 03:31:26PM +0300, Dan Carpenter wrote:
> The test should be >= ARRAY_SIZE() instead of > ARRAY_SIZE().
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Jiri Olsa <jolsa@redhat.com>

thanks,
jirka

> ---
> Only needed on linux-next.
> 
> diff --git a/arch/x86/kernel/perf_regs.c b/arch/x86/kernel/perf_regs.c
> index c5a3e5c..e309cc5 100644
> --- a/arch/x86/kernel/perf_regs.c
> +++ b/arch/x86/kernel/perf_regs.c
> @@ -57,7 +57,7 @@ static unsigned int pt_regs_offset[PERF_REG_X86_MAX] = {
>  
>  u64 perf_reg_value(struct pt_regs *regs, int idx)
>  {
> -	if (WARN_ON_ONCE(idx > ARRAY_SIZE(pt_regs_offset)))
> +	if (WARN_ON_ONCE(idx >= ARRAY_SIZE(pt_regs_offset)))
>  		return 0;
>  
>  	return regs_get_register(regs, pt_regs_offset[idx]);
