From: Domen Puncer <domen@coderock.org>
Date: Mon, 18 Jul 2005 14:05:21 +0000
Subject: Re: [KJ] [PATCH] drivers/net/cs89x0.c : Use of time_after(),
Message-Id: <20050718140521.GA2457@homer.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============047481719945830836=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <42D8B1D6.2090302@feitoza.com.br>
In-Reply-To: <42D8B1D6.2090302@feitoza.com.br>
To: kernel-janitors@vger.kernel.org

--===============047481719945830836==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 16/07/05 04:05 -0300, Marcelo Feitoza Parisi wrote:
> 

> Use of time_after(), time_after_eq() and time_before() macros, define at
> linux/jiffies.h, which deal with wrapping correctly and are nicer to read.
> 
> Signed-off-by: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>
> 
> --- linux/drivers/net/cs89x0.c	2005-07-13 17:52:18.000000000 -0300
> +++ linux-kj/drivers/net/cs89x0.c	2005-07-15 21:55:17.376267208 -0300
> @@ -93,6 +93,7 @@
>     or override something. */
>  #include <linux/config.h>
>  #include <linux/module.h>
> +#include <linux/jiffies.h>
>  
>  /*
>   * Set this to zero to disable DMA code
> @@ -363,12 +364,12 @@
>  static int __init
>  wait_eeprom_ready(struct net_device *dev)
>  {
> -	int timeout = jiffies;
> +	unsigned long timeout = jiffies;
>  	/* check to see if the EEPROM is ready, a timeout is used -
>  	   just in case EEPROM is ready when SI_BUSY in the
>  	   PP_SelfST is clear */
>  	while(readreg(dev, PP_SelfST) & SI_BUSY)
> -		if (jiffies - timeout >= 40)
> +		if (time_after_eq(jiffies, timeout + 40))

linux.bkbits.net tells me:
2002/02/05 torvalds           | 		if (jiffies - timeout >= 40)
And since this is a i386 driver (cs89x0.txt), HZ was 100 back then.

So... change this to msecs_to_jiffies(400) to make it right?
Same goes for the rest of patch.

> @@ -958,7 +959,8 @@
>  
>  	/* Wait until the chip is reset */
>  	reset_start_time = jiffies;
> -	while( (readreg(dev, PP_SelfST) & INIT_DONE) == 0 && jiffies - reset_start_time < 2)
> +	while( (readreg(dev, PP_SelfST) & INIT_DONE) == 0 &&

	while ((...


--===============047481719945830836==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============047481719945830836==--
