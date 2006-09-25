From: Mikael Pettersson <mikpe@it.uu.se>
Date: Mon, 25 Sep 2006 11:18:27 +0000
Subject: Re: [KJ] [PATCH] misc_register error return handling
Message-Id: <200609251118.k8PBIRec000783@harpo.it.uu.se>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1157964812.7814.32.camel@amol.verismonetworks.com>
In-Reply-To: <1157964812.7814.32.camel@amol.verismonetworks.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: amol@verismonetworks.com, kernel-janitors@lists.osdl.org, linux-kernel@vger.kernel.org

On Mon, 25 Sep 2006 14:29:00 +0530, Amol Lad wrote:
> diff -uprN -X linux-2.6.18-orig/Documentation/dontdiff linux-2.6.18-orig/arch/i386/kernel/apm.c linux-2.6.18/arch/i386/kernel/apm.c
> --- linux-2.6.18-orig/arch/i386/kernel/apm.c	2006-09-21 10:15:25.000000000 +0530
> +++ linux-2.6.18/arch/i386/kernel/apm.c	2006-09-25 13:59:53.000000000 +0530
> @@ -2246,6 +2246,12 @@ static int __init apm_init(void)
>  		return -ENODEV;
>  	}
>  
> +	ret = misc_register(&apm_device);
> +	if (ret != 0) {
> +		printk(KERN_ERR "apm: cannot register misc device.\n");
> +		return ret;
> +	}
> +
>  	if (allow_ints)
>  		apm_info.allow_ints = 1;
>  	if (broken_psr)
> @@ -2282,17 +2288,20 @@ static int __init apm_init(void)
>  
>  	if (apm_info.disabled) {
>  		printk(KERN_NOTICE "apm: disabled on user request.\n");
> -		return -ENODEV;
> +		ret = -ENODEV;
> +		goto out_misc;

etc

NAK on the APM changes. APM can do its work just fine even if
it failed to register a device file; it will just lack some
user interface/control bits.

> @@ -2348,8 +2358,6 @@ static int __init apm_init(void)
>  		return 0;
>  	}
>  
> -	misc_register(&apm_device);
> -

This should just print a warning (but not fail) if misc_register()
returned failure.

/Mikael
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
