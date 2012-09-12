From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 12 Sep 2012 15:40:23 +0000
Subject: Re: [PATCH] module: report -EFAULT on bytes remaining
Message-Id: <20120912154023.GL19410@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120912150616.GA27343@www.outflux.net>
In-Reply-To: <20120912150616.GA27343@www.outflux.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kees Cook <keescook@chromium.org>
Cc: linux-kernel@vger.kernel.org, Rusty Russell <rusty@rustcorp.com.au>, Fengguang Wu <fengguang.wu@intel.com>, kernel-janitors@vger.kernel.org, Mimi Zohar <zohar@linux.vnet.ibm.com>

On Wed, Sep 12, 2012 at 08:06:16AM -0700, Kees Cook wrote:
> Caught by smatch:
> kernel/module.c:2450 copy_module_from_user() warn: maybe return -EFAULT instead of the bytes remaining?  
> 
> Clean up the copy_from_user() call to not report a positive value.
> With this patch, init_module() will report errors from copy_from_user
> (before it would always only report -EFAULT when err != 0).
> 
> Reported-by: Fengguang Wu <fengguang.wu@intel.com>
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
> This change is on top of the finit_module patch series.
> ---
>  kernel/module.c |    5 ++++-
>  1 files changed, 4 insertions(+), 1 deletions(-)
> 
> diff --git a/kernel/module.c b/kernel/module.c
> index 0ad03c4..05b8dde 100644
> --- a/kernel/module.c
> +++ b/kernel/module.c
> @@ -2441,8 +2441,11 @@ int copy_module_from_user(const void __user *umod, unsigned long len,
>  		return -ENOMEM;
>  
>  	err = copy_from_user(info->hdr, umod, info->len);
> -	if (err)
> +	if (err) {
> +		if (err > 0)
                ^^^^^^^^^^^
This condition is always true because copy_to/from_user() returns
the number of bytes remaining to be copied.  (It never returns a
negative error code).

> +			err = -EFAULT;
>  		goto free_hdr;
> +	}

regards,
dan carpenter


