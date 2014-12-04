From: Dave Hansen <dave.hansen@intel.com>
Date: Thu, 04 Dec 2014 21:56:56 +0000
Subject: Re: [patch v2] x86_64, traps: always true condition
Message-Id: <5480D8A8.3050003@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20141125172114.GA24535@mwanda>
In-Reply-To: <20141125172114.GA24535@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 11/25/2014 09:21 AM, Dan Carpenter wrote:
> We should be checking IS_ERR() here.  PTR_ERR() is always true.
>
> Fixes: fe3d197f8431 ('x86, mpx: On-demand kernel allocation of bounds
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> v2: Use correct fixes tag.
>
> diff --git a/arch/x86/kernel/traps.c b/arch/x86/kernel/traps.c
> index 67d817e..f176d96 100644
> --- a/arch/x86/kernel/traps.c
> +++ b/arch/x86/kernel/traps.c
> @@ -331,7 +331,7 @@ dotraplinkage void do_bounds(struct pt_regs >  	
break; /* Success, it was handled */
>  	case 1: /* Bound violation. */
>  		info = mpx_generate_siginfo(regs, xsave_buf);
> -		if (PTR_ERR(info)) {
> +		if (IS_ERR(info)) {
>  			/*
>  			 * We failed to decode the MPX instruction.
>  			 * the exception was not caused by MPX.

I checked that this works on real hardware.  The si_addr field in the
generated siginfo was empty without this patch applied.  With this
patch, it has good (looking at least) contents.

Thanks for catching this!

Tested-by: Dave Hansen <dave.hansen@intel.com>


