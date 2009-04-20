From: Jiri Kosina <jkosina@suse.cz>
Date: Mon, 20 Apr 2009 15:44:12 +0000
Subject: Re: [PATCH] kernel/power/poweroff.c : Fix coding style whitespace
Message-Id: <alpine.LNX.2.00.0904201744010.13028@wotan.suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sun, 22 Feb 2009, Manish Katiyar wrote:

> Fix coding style whitespace fixes. Patch compile tested
> Before :-
> total: 1 errors, 0 warnings, 46 lines checked
> After
> total: 0 errors, 0 warnings, 46 lines checked
> 
> Before :-
>   text	   data	    bss	    dec	    hex	filename
>     107	     48	      0	    155	     9b	kernel/power/poweroff.o
> After
>    text	   data	    bss	    dec	    hex	filename
>     107	     48	      0	    155	     9b	kernel/power/poweroff.o
> 
> 
> Signed-off-by: Manish Katiyar <mkatiyar@gmail.com>
> ---
>  kernel/power/poweroff.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/kernel/power/poweroff.c b/kernel/power/poweroff.c
> index 9789083..e8b3370 100644
> --- a/kernel/power/poweroff.c
> +++ b/kernel/power/poweroff.c
> @@ -34,7 +34,7 @@ static struct sysrq_key_op	sysrq_poweroff_op = {
>  	.handler        = handle_poweroff,
>  	.help_msg       = "powerOff",
>  	.action_msg     = "Power Off",
> - 	.enable_mask	= SYSRQ_ENABLE_BOOT,
> +	.enable_mask	= SYSRQ_ENABLE_BOOT,
>  };
> 
>  static int pm_sysrq_init(void)

Applied to trivial tree, thanks.

-- 
Jiri Kosina
SUSE Labs
