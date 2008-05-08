From: Mark Asselstine <mark.asselstine@windriver.com>
Date: Thu, 08 May 2008 11:53:16 +0000
Subject: Re: [PATCH] Remove cli()/sti() calls from HYSDN driver.
Message-Id: <200805080753.16950.mark.asselstine@windriver.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1209673012-10500-1-git-send-email-mark.asselstine@windriver.com> <20080507153800.16537fbc.akpm@linux-foundation.org> <20080508083353.GA18187@pingi.kke.suse.de>
In-Reply-To: <20080508083353.GA18187@pingi.kke.suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Karsten Keil <kkeil@suse.de>
Cc: Andrew Morton <akpm@linux-foundation.org>, kernel-janitors@vger.kernel.org, netdev@vger.kernel.org

On Thursday 08 May 2008 04:33:53 Karsten Keil wrote:
> On Wed, May 07, 2008 at 03:38:00PM -0700, Andrew Morton wrote:
> > On Thu,  1 May 2008 16:16:52 -0400
> >
> > Mark Asselstine <mark.asselstine@windriver.com> wrote:
> > > >From looking at this driver the use of cli()/sti() within the do/while
> > >
> > > was a way to ensure interrupts were only disabled for short periods of
> > > time while the bulk of the time interrupts were free to occur. The
> > > use of the spin lock has eliminated the need to play with interrupts
> > > in this way while still allowing for IO to be protected.
> >
> > OK.  If we still want the interrupt-latency optimisation then we should
> > switch over to using local_irq_disable().  But probably nobody cares.
> >

I had thought about using local_irq_disable() but it never progressed past a 
thought.

> > > The remaining 3 sti() calls seem unneeded now that at no other point
> > > in the driver is there a call to cli().
> > >
> > > Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> > > ---
> > >  drivers/isdn/hysdn/boardergo.c |   14 +++++---------
> >
> > So... can we now do this?
>
> I think so.
>

I am in agreement here too. From my poking around this driver I see no reason 
why not.

Regards,
Mark

> > --- a/drivers/isdn/hysdn/Kconfig~a
> > +++ a/drivers/isdn/hysdn/Kconfig
> > @@ -3,7 +3,7 @@
> >  #
> >  config HYSDN
> >  	tristate "Hypercope HYSDN cards (Champ, Ergo, Metro) support (module
> > only)" -	depends on m && PROC_FS && PCI && BROKEN_ON_SMP
> > +	depends on m && PROC_FS && PCI
> >  	help
> >  	  Say Y here if you have one of Hypercope's active PCI ISDN cards
> >  	  Champ, Ergo and Metro. You will then get a module called hysdn.
> > _


