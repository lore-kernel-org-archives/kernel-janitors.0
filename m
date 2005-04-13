From: Alexey Dobriyan <adobriyan@mail.ru>
Date: Wed, 13 Apr 2005 13:29:53 +0000
Subject: Re: [KJ] [PATCH] scsi/a100u2w: Remove custom msecs_to_jiffies and
Message-Id: <200504131728.46401.adobriyan@mail.ru>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050413121104.GA9419@argon.tklauser.home>
In-Reply-To: <20050413121104.GA9419@argon.tklauser.home>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tobias Klauser <tklauser@nuerscht.ch>
Cc: kernel-janitors@lists.osdl.org, linux-scsi@vger.kernel.org

On Wednesday 13 April 2005 12:11, Tobias Klauser wrote:
> Replace the MS_TO_JIFFIES() macro with msecs_to_jiffies() from jiffies.h

> --- linux-2.6.12-rc2-mm3/drivers/scsi/a100u2w.c
> +++ linux-2.6.12-rc2-mm3-tk/drivers/scsi/a100u2w.c

>  static void waitForPause(unsigned amount)
>  {
> -	ULONG the_time = jiffies + MS_TO_JIFFIES(amount);
> +	ULONG the_time = jiffies + msecs_to_jiffies(amount);
>  	while (time_before_eq(jiffies, the_time))
>  		cpu_relax();
>  }

It'd be better to find out what is the equivalent generic sleeping/delaying
function and, if any, remove waitForPause() altogether.

However, Bas Vermeulen added these lines at the top of the file:

	* 01/31/99 bv - v1.02b Use mdelay instead of waitForPause
	* 08/08/99 bv - v1.02c Use waitForPause again.

Maybe he can recall what was wrong with mdelay().
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
