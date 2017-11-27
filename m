From: Julia Lawall <julia.lawall@lip6.fr>
Date: Mon, 27 Nov 2017 09:32:18 +0000
Subject: Re: [PATCH v2] checkpatch: Add a warning for log messages that don't end in a new line
Message-Id: <alpine.DEB.2.20.1711271028510.3445@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171126054037.9743-1-logang@deltatee.com>                 <alpine.DEB.2.20.1711260648130.2387@hadrien>                 <1511676085.20482.18.camel@perches.com>                 <5c0a2778-8e8f-9fbb-b13f-1d880acb949b@deltatee.com>                
 <1511735382.20482.27.camel@perches.com>         <alpine.DEB.2.20.1711262334370.2111@hadrien>         <1511745165.20482.34.camel@perches.com>         <alpine.DEB.2.20.1711270704420.2369@hadrien> <1511774737.32426.29.camel@perches.com>
In-Reply-To: <1511774737.32426.29.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joe Perches <joe@perches.com>
Cc: Logan Gunthorpe <logang@deltatee.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Andy Whitcroft <apw@canonical.com>



On Mon, 27 Nov 2017, Joe Perches wrote:

> On Mon, 2017-11-27 at 07:08 +0100, Julia Lawall wrote:
> >
> > On Sun, 26 Nov 2017, Joe Perches wrote:
> >
> > > On Sun, 2017-11-26 at 23:44 +0100, Julia Lawall wrote:
> > > > My semantic patch and results are below.  The semantic patch has some
> > > > features that may or may not be desired:
> > > >
> > > > 1.  It goes beyond printk, pr_xxx, dev_xxx, and netdev_xxx, by finding
> > > > functions that are sometimes used with a format string ending with a
> > > > newline.  To reduce false positives, such a function is ignored if it is
> > > > sometimes used with a string that ends in a space.  This could lead to
> > > > false positives where actually one of the calls has a \n that it should
> > > > not have.
> > > >
> > > > 2.  Coccinelle puts multipart strings on a single line.  So the rule goes
> > > > a little further and eliminates the multipartness.  Basically "xxx " "yyy"
> > > > becomes "xxx yyy" regardless of the length of the result.
> > >
> > > What about the semi-common string concatenation "foo" #var "bar" ?
> >
> > I don't think this is an issue.  There is no " " pattern in this.  It's
> > true that if the pieces were on separate lines, Coccinelle will now put
> > them on a single line.  I'm not sure I want to bother with this.
> >
> > > > 3.  Some prints appear not to end with a newline because they end with \n.
> > > > where .\n was likely intended.  Instead of creating \n.\n, the semantic
> > > > patch just moves the .to the left of the . And if there was .\n. it just
> > > > drops the final period.
> > >
> > > That may be a problem if the sentence is "something...\n"
> >
> > I think I was not clear.  The sentence ends in ".\n.".
> >
> > > There seem to be many false positives in here too.
> >
> > Could you point to something specifically?  I saw a lot of cases with
> > prints followed by returns and gotos.  I guess those are not likely false
> > positives.
>
> random entries, as your original post is 2.6M (and didn't get to lkml)
> and I only sampled it at a few places.
>
> []
> diff -u -p a/lib/locking-selftest.c b/lib/locking-selftest.c
> --- a/lib/locking-selftest.c
> +++ b/lib/locking-selftest.c
> @@ -1186,7 +1186,7 @@ static void dotest(void (*testcase_fn)(v
>
>  static inline void print_testname(const char *testname)
>  {
> -	printk("%33s:", testname);
> +	printk("%33s:\n", testname);
>  }

Sure.

>
> []
>
> diff -u -p a/lib/dynamic_debug.c b/lib/dynamic_debug.c
> --- a/lib/dynamic_debug.c
> +++ b/lib/dynamic_debug.c
> @@ -562,7 +562,8 @@ void __dynamic_pr_debug(struct _ddebug *
>  	vaf.fmt = fmt;
>  	vaf.va = &args;
>
> -	printk(KERN_DEBUG "%s%pV", dynamic_emit_prefix(descriptor, buf), &vaf);
> +	printk(KERN_DEBUG "%s%pV\n", dynamic_emit_prefix(descriptor, buf),
> +	       &vaf);
>
>  	va_end(args);
>  }

OK, one could look for va_end.

> []
>
> diff -u -p a/drivers/tty/serial/ioc4_serial.c b/drivers/tty/serial/ioc4_serial.c
> --- a/drivers/tty/serial/ioc4_serial.c
> +++ b/drivers/tty/serial/ioc4_serial.c
> @@ -2858,8 +2858,7 @@ ioc4_serial_attach_one(struct ioc4_drive
>  				"sgi-ioc4serial", soft)) {
>  		control->ic_irq = idd->idd_pdev->irq;
>  	} else {
> -		printk(KERN_WARNING
> -		    "%s : request_irq fails for IRQ 0x%x\n ",
> +		printk(KERN_WARNING "%s : request_irq fails for IRQ 0x%x\n \n",
>  			__func__, idd->idd_pdev->irq);
>  	}
>  	ret = ioc4_attach_local(idd);

Like the \n. problem.

> []
>
> below: the gig_dbg macro and _many_ other append a newline to a format

Still, it seems that the file must contain a bug elsewhere, because the
presence of this report means that some other call ended in a newline.  It
could be reasonable to highlight the least popular.

thanks,
julia

> diff -u -p a/drivers/isdn/gigaset/ev-layer.c b/drivers/isdn/gigaset/ev-layer.c
> --- a/drivers/isdn/gigaset/ev-layer.c
> +++ b/drivers/isdn/gigaset/ev-layer.c
> @@ -411,7 +411,7 @@ static void add_cid_event(struct cardsta
>  	unsigned next, tail;
>  	struct event_t *event;
>
> -	gig_dbg(DEBUG_EVENT, "queueing event %d for cid %d", type, cid);
> +	gig_dbg(DEBUG_EVENT, "queueing event %d for cid %d\n", type, cid);
>
>  	spin_lock_irqsave(&cs->ev_lock, flags);
>
> etc...
>
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
