From: Jean Tourrilhes <jt@bougret.hpl.hp.com>
Date: Tue, 27 Jul 2004 17:50:04 +0000
Subject: [Kernel-janitors] Re: [PATCH] irda/irtty-sir: replace
Message-Id: <20040727175004.GA18782@bougret.hpl.hp.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============23536151188151933=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============23536151188151933==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 27, 2004 at 10:11:20AM -0700, Nishanth Aravamudan wrote:
> I would appreciate any comments from the janitors list. 
> 
> Applys-to: 2.6.7
> 
> Description: Replace schedule_timeout() with msleep() to guarantee the
> task delays for the desired time.

	I'm forwarding that the Martin, which is the maintainer of
that piece of code.
	I personally find the name of the msleep() function dangerous
and confusing, and I would prefer not to use it as it is. Despite its
very generic name, the msleep() function apply only when we are within
a real process/task context. If you attempt to use it in interrupt, BH
or timer context, you will get some very interesting results.
	On the other hand, both udelay() and mdelay() can be used in
any context, so deserve a generic name.
	Because the IrDA drivers use both interrupt/BH and process
context, we need to make sure that we don't use msleep() in the wrong
context. The current code make this explicit, you see the
set_task_state() and you know that you must be in the proper
context. Using msleep() in IrDA drivers only obfuscate this important
issue and make the source less maintainable.
	I would suggest renaming "msleep()" to "task_msleep()" or
"schedule_msleep()" before applying this patch, so that things are
clear. Or just make "task_msleep()" or "schedule_msleep()" a wrapper
around "msleep()".

	Have fun...

	Jean

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
> +		msleep(USBSERIAL_TX_DONE_DELAY);
>  }
>  
>  /* 

--===============23536151188151933==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============23536151188151933==--
