From: maximilian attems <janitor@sternwelten.at>
Date: Tue, 21 Sep 2004 20:45:09 +0000
Subject: Re: [Kernel-janitors] [PATCH] net/cs89x0: replace schedule_timeout()
Message-Id: <20040921204509.GA4260@stro.at>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============10919126986935357=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============10919126986935357==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, 26 Jul 2004, Nishanth Aravamudan wrote:

> I would appreciate any comments from the janitors list. This is one (of
> many) cases where I made a decision about replacing
> 
> set_current_state(TASK_INTERRUPTIBLE);
> schedule_timeout(some_time);
> 
> with
> 
> msleep(jiffies_to_msecs(some_time));
> 
> msleep() is not exactly the same as the previous code, but I only did
> this replacement where I thought long delays were *desired*. If this is
> not the case here, then just disregard this patch. 
> 
> Thanks,
> Nish
> 
> 
> 
> Applys-to: 2.6.7
> 
> Description: Replace schedule_timeout() with msleep() to guarantee the
> task delays for the desired time.
> 
> 
> --- linux-vanilla/drivers/net/cs89x0.c	2004-06-16 05:19:52.000000000 +0000
> +++ linux-dev/drivers/net/cs89x0.c	2004-07-12 18:59:24.000000000 +0000
> @@ -889,8 +889,7 @@ void  __init reset_chip(struct net_devic
>  	writereg(dev, PP_SelfCTL, readreg(dev, PP_SelfCTL) | POWER_ON_RESET);
>  
>  	/* wait 30 ms */
> -	current->state = TASK_INTERRUPTIBLE;
> -	schedule_timeout(30*HZ/1000);
> +	msleep(30);
>  
>  	if (lp->chip_type != CS8900) {
>  		/* Hardware problem requires PNP registers to be reconfigured after a reset */

this one doesn't compile:
drivers/net/cs89x0.c:912: warning: implicit declaration of function `msleep'

fixed for next kjt.
a++ maks



--===============10919126986935357==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============10919126986935357==--
