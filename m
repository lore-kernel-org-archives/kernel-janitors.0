From: Matthew Wilcox <matthew@wil.cx>
Date: Wed, 11 Oct 2006 14:16:51 +0000
Subject: [KJ] most users of msleep_interruptible are broken
Message-Id: <20061011141651.GD27388@parisc-linux.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1160570743.19143.307.camel@amol.verismonetworks.com> <1160571491.3000.372.camel@laptopd505.fenrus.org>
In-Reply-To: <1160571491.3000.372.camel@laptopd505.fenrus.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arjan van de Ven <arjan@infradead.org>
Cc: Amol Lad <amol@verismonetworks.com>, kernel Janitors <kernel-janitors@lists.osdl.org>, linux kernel <linux-kernel@vger.kernel.org>

On Wed, Oct 11, 2006 at 02:58:11PM +0200, Arjan van de Ven wrote:
> > +++ linux-2.6.19-rc1/drivers/mmc/mmc.c	2006-10-11 17:57:02.000000000 +0530
> > @@ -454,7 +454,7 @@ static void mmc_deselect_cards(struct mm
> >  static inline void mmc_delay(unsigned int ms)
> >  {
> >  	if (ms < HZ / 1000) {
> > -		yield();
> > +		cond_resched();
> >  		mdelay(ms);
> 
> 
> this probably wants msleep(), especially with hrtimers comming up; there
> the sleeps are always exact...

They clearly don't care about exactness; they msleep_interruptible and
throw away the return value, so they don't know how long they slept
before they got a signal.

__must_check treatment for msleep_interruptible, anyone?  On the one hand,
that's 136 new warnings.  On the other hand, that's 136 places wheree
we may as well *delete the call* to msleep_interruptible.  Since it can
return immediately, the code must be prepared to deal with that ... right?
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
