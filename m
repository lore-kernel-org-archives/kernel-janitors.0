From: Domen Puncer <domen@coderock.org>
Date: Fri, 29 Apr 2005 21:47:26 +0000
Subject: Re: [KJ] =?us-ascii?B?PT9pc28tODg1OS0xP1E/?=
Message-Id: <20050429214726.GA8401@nd47.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============24657995814107414=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============24657995814107414==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Weird subject :-)

On 29/04/05 11:18 +0200, david.chosrova@libertysurf.fr wrote:
> --- linux-2.6.11.7/drivers/net/irda/ep7211_ir.c.orig
> 2005-04-27 17:41:36.000000000 +0100
> +++ linux-2.6.11.7/drivers/net/irda/ep7211_ir.c	2005-04-29

No description, no Signed-off-by:, lines wrapped.

> 10:10:07.000000000 +0100
> @@ -14,6 +14,7 @@
> 
>  #include <asm/io.h>
>  #include <asm/hardware.h>
> +#include<linux/spinlock.h>

Please put this after others linux/ includes, with a space before '<'.

>  static void ep7211_ir_open(dongle_t *self, struct qos_info
> *qos)
>  {
>  	unsigned int syscon1, flags;
> -
> -	save_flags(flags); cli();
> +	spin_lock_init(&driver_lock);
> +
> +	spin_lock_irqsave(&driver_lock,flags);

This doesn't look safe. Imagine 2 processes on SMP. (After some
browsing, this looks like some ARM architecture, so probably no
SMP; still better put this in ep7211_ir_init() or declare with
static DEFINE_SPINLOCK.)

Space after ',' missing, not just here.


	Domen

--===============24657995814107414==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============24657995814107414==--
