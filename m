From: maximilian attems <janitor@sternwelten.at>
Date: Sat, 14 Aug 2004 19:07:16 +0000
Subject: Re: [Kernel-janitors] [PATCH] irda/irtty-sir: replace
Message-Id: <20040814190716.GK1756@stro.at>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============28508338650616682=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============28508338650616682==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, 27 Jul 2004, Nishanth Aravamudan wrote:

> I would appreciate any comments from the janitors list. 
> 
> Applys-to: 2.6.7
> 
> Description: Replace schedule_timeout() with msleep() to guarantee the
> task delays for the desired time.
> 
> Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>
> 
> 
> --- linux-vanilla/drivers/net/irda/irtty-sir.c	2004-06-16 05:18:37.000000000 +0000
> +++ linux-dev/drivers/net/irda/irtty-sir.c	2004-07-21 17:26:31.000000000 +0000
> @@ -32,6 +32,7 @@
>  #include <linux/init.h>
>  #include <asm/uaccess.h>
>  #include <linux/smp_lock.h>
> +#include <linux/delay.h>
>  
>  #include <net/irda/irda.h>
>  #include <net/irda/irda_device.h>
> @@ -96,10 +97,8 @@ static void irtty_wait_until_sent(struct
>  		tty->driver->wait_until_sent(tty, msecs_to_jiffies(100));
>  		unlock_kernel();
>  	}
> -	else {
> -		set_task_state(current, TASK_UNINTERRUPTIBLE);
> -		schedule_timeout(msecs_to_jiffies(USBSERIAL_TX_DONE_DELAY));
> -	}
> +	else 
aheem
> +		msleep(USBSERIAL_TX_DONE_DELAY);
>  }
>  
>  /* 

> _______________________________________________
> Kernel-janitors mailing list
> Kernel-janitors@lists.osdl.org
> http://lists.osdl.org/mailman/listinfo/kernel-janitors


--===============28508338650616682==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============28508338650616682==--
