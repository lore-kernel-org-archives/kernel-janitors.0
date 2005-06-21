From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Tue, 21 Jun 2005 19:24:50 +0000
Subject: Re: [KJ] [PATCH] Audit return code : drivers/input/misc/hp_sdc_rtc.c
Message-Id: <200506212324.50215.adobriyan@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050621101313.GE4880@rhum.iomeda.fr>
In-Reply-To: <20050621101313.GE4880@rhum.iomeda.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tuesday 21 June 2005 14:16, Christophe Lucas wrote:
> Audit return codes (and handle failure correctly) for misc_register.

> --- 2.6.12-orig/drivers/input/misc/hp_sdc_rtc.c
> +++ 2.6.12/drivers/input/misc/hp_sdc_rtc.c
> @@ -702,7 +702,10 @@ static int __init hp_sdc_rtc_init(void)
>  
>  	if ((ret = hp_sdc_request_timer_irq(&hp_sdc_rtc_isr)))
>  		return ret;
> -	misc_register(&hp_sdc_rtc_dev);
> +	if (ret = misc_register(&hp_sdc_rtc_dev)) {

hp_sdc_request_timer_irq() have hp_sdc_release_timer_irq() counterpart.
Double brackets, please. Otherwise gcc will warn. Ditto for other patches.

> +		printk(KERN_WARNING "Unable to register misc device.\n");
> +		return ret ;

And don't add space. Ditto for other patches.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
