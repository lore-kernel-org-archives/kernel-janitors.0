From: Francois Romieu <romieu@fr.zoreil.com>
Date: Thu, 19 Feb 2004 22:26:10 +0000
Subject: Re: [Kernel-janitors] [PATCH][RFC] - proc cleanup for
Message-Id: <20040219232610.A8262@electric-eye.fr.zoreil.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1077194142.3626.6.camel@telecentrolivre>
In-Reply-To: <1077194142.3626.6.camel@telecentrolivre>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Luiz Fernando Capitulino <lcapitulino@prefeitura.sp.gov.br> :
[...]
> @@ -501,12 +514,9 @@
>  	if(retval < 0)
>  		return retval;
>  
> -#ifdef CONFIG_PROC_FS
> -	if((create_proc_read_entry ("driver/rtc", 0, 0, gen_rtc_read_proc, NULL)) = NULL){
> -		misc_deregister(&rtc_gen_dev);
> -		return -ENOMEM;
> -	}
> -#endif
> +	retval = gen_rtc_proc_init(&rtc_gen_dev);
> +	if(retval < 0)
> +		return retval;

You do not need to test retval: simply return it.

We have an xxx_init() function which deregisters something that
has been registered in a completely different place -> not pretty
Moreover the procfs related #ifdef pops up a bit everywhere.

Could the compiler be smart enough to do the right thing (TM) if the
various proc functions were defined in a central place when CONFIG_PROC_FS
is not set ? 

This way it would even be possible to notify the caller of such functions
when the interface is obsoleted in 2.x.y :o)

--
Ueimor
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
