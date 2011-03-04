From: Dan Carpenter <error27@gmail.com>
Date: Fri, 04 Mar 2011 10:51:56 +0000
Subject: Re: [PATCH] x86: mce: Potential memory leaks when initializing
Message-Id: <20110304092000.GA3416@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1299179552-31563-1-git-send-email-johan.wessfeldt@gmail.com>
In-Reply-To: <1299179552-31563-1-git-send-email-johan.wessfeldt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, Mar 03, 2011 at 08:12:32PM +0100, Johan Wessfeldt wrote:
> This patch makes sure cleanup is done properly when mcheck fails
> initializing any of its resources.
> 
> Note!
> It should be safe to call mce_remove_device on ANY of the cpus as
> mce_remove_device checks if corresponding cpu was initialized
> before removing its resources.
> 
> Please review.
> 

Looks good.  Maybe a couple style quibles.  Also this will need to be
resent to the proper people.

./scripts/get_maintainer.pl -f arch/x86/kernel/cpu/mcheck/mce.c

The important thing is send it to x86@kernel.org, but really if you're
messing with bootup code then I would CC lkml as well so it gets 
more review.  The code seems straight forward enough but review never
hurts.

> Signed-off-by: Johan Wessfeldt <johan.wessfeldt@gmail.com>
> ---
>  arch/x86/kernel/cpu/mcheck/mce.c |   26 ++++++++++++++++++++------
>  1 files changed, 20 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/x86/kernel/cpu/mcheck/mce.c b/arch/x86/kernel/cpu/mcheck/mce.c
> index d916183..a9e3820 100644
> --- a/arch/x86/kernel/cpu/mcheck/mce.c
> +++ b/arch/x86/kernel/cpu/mcheck/mce.c
> @@ -2122,8 +2122,10 @@ static __init int mcheck_init_device(void)
>  	int err;
>  	int i = 0;
>  
> -	if (!mce_available(&boot_cpu_data))
> -		return -EIO;
> +	if (!mce_available(&boot_cpu_data)) {
> +		err = -EIO;
> +		goto out;

Return directly here.  A person reading this will probably think that
there is an unlock or something at the end of the function.  But really
it's there for no reason.  Don't do that.

> +	}
>  
>  	zalloc_cpumask_var(&mce_dev_initialized, GFP_KERNEL);
>  
> @@ -2131,20 +2133,32 @@ static __init int mcheck_init_device(void)
>  
>  	err = sysdev_class_register(&mce_sysclass);
>  	if (err)
> -		return err;
> +		goto out;

And here.

>  
>  	for_each_online_cpu(i) {
>  		err = mce_create_device(i);
>  		if (err)
> -			return err;
> +			goto out_unreg;
>  	}
>  
>  	register_hotcpu_notifier(&mce_cpu_notifier);
> -	misc_register(&mce_log_device);
> +	err = misc_register(&mce_log_device);
> +	if (err)
> +		goto out_unreg_hotcpu;
> +
> +	return 0;
>  
> +out_unreg_hotcpu:
> +	unregister_hotcpu_notifier(&mce_cpu_notifier);
> +out_unreg:
> +	i = 0;
        ^^^^^^

Remove this as well.

> +	for_each_online_cpu(i)
> +		mce_remove_device(i);
> +
> +	sysdev_class_unregister(&mce_sysclass);
> +out:
>  	return err;
>  }

regards,
dan carpenter
