From: Samuel Ortiz <sameo@linux.intel.com>
Date: Wed, 06 Feb 2013 18:17:52 +0000
Subject: Re: [PATCH] mfd: lpc_ich: Fix arguments to kmalloc
Message-Id: <20130206181752.GD3418@sortiz-mobl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1360173659-22409-1-git-send-email-emilgoode@gmail.com>
In-Reply-To: <1360173659-22409-1-git-send-email-emilgoode@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Emil Goode <emilgoode@gmail.com>
Cc: ptyser@xes-inc.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

HI Emil,

On Wed, Feb 06, 2013 at 07:00:59PM +0100, Emil Goode wrote:
> This patch changes the order of the arguments to kmalloc,
> the allocation flag should be the second argument.
> 
> Sparse warnings:
> 
> drivers/mfd/lpc_ich.c:881:24: warning:
> 	incorrect type in argument 1 (different base types)
> 	drivers/mfd/lpc_ich.c:881:24:
> 	expected unsigned long [unsigned] [usertype] size
> 	drivers/mfd/lpc_ich.c:881:24:    got restricted gfp_t
> 
> drivers/mfd/lpc_ich.c:881:36: warning:
> 	incorrect type in argument 2 (different base types)
> 	drivers/mfd/lpc_ich.c:881:36:
> 	expected restricted gfp_t [usertype] flags
> 	drivers/mfd/lpc_ich.c:881:36:    got unsigned long
> 
> Signed-off-by: Emil Goode <emilgoode@gmail.com>
> ---
>  drivers/mfd/lpc_ich.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
This patch does not apply to my for-next branch.

Cheers,
Samuel.

-- 
Intel Open Source Technology Centre
http://oss.intel.com/
