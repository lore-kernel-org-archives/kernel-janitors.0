From: Joe Perches <joe@perches.com>
Date: Mon, 27 Nov 2017 09:42:36 +0000
Subject: Re: [PATCH v2] checkpatch: Add a warning for log messages that don't end in a new line
Message-Id: <1511775756.32426.33.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171126054037.9743-1-logang@deltatee.com>
                         <alpine.DEB.2.20.1711260648130.2387@hadrien>
                         <1511676085.20482.18.camel@perches.com>
                         <5c0a2778-8e8f-9fbb-b13f-1d880acb949b@deltatee.com>
                         <1511735382.20482.27.camel@perches.com>
                 <alpine.DEB.2.20.1711262334370.2111@hadrien>
                 <1511745165.20482.34.camel@perches.com>
                 <alpine.DEB.2.20.1711270704420.2369@hadrien>
         <1511774737.32426.29.camel@perches.com>
         <alpine.DEB.2.20.1711271028510.3445@hadrien>
In-Reply-To: <alpine.DEB.2.20.1711271028510.3445@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: Logan Gunthorpe <logang@deltatee.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Andy Whitcroft <apw@canonical.com>

On Mon, 2017-11-27 at 10:32 +0100, Julia Lawall wrote:
> On Mon, 27 Nov 2017, Joe Perches wrote:
[]
> > below: the gig_dbg macro and _many_ other append a newline to a format
> 
> Still, it seems that the file must contain a bug elsewhere, because the
> presence of this report means that some other call ended in a newline.  It
> could be reasonable to highlight the least popular.
> 
> thanks,
> julia
> 
> > diff -u -p a/drivers/isdn/gigaset/ev-layer.c b/drivers/isdn/gigaset/ev-layer.c
> > --- a/drivers/isdn/gigaset/ev-layer.c
> > +++ b/drivers/isdn/gigaset/ev-layer.c
> > @@ -411,7 +411,7 @@ static void add_cid_event(struct cardsta
> >  	unsigned next, tail;
> >  	struct event_t *event;
> > 
> > -	gig_dbg(DEBUG_EVENT, "queueing event %d for cid %d", type, cid);
> > +	gig_dbg(DEBUG_EVENT, "queueing event %d for cid %d\n", type, cid);
> > 
> >  	spin_lock_irqsave(&cs->ev_lock, flags);
> > 
> > etc...

Sure, but more than anything, this shows the difficulty
of automating these changes.

Variability of style is high and highlighting was might
be defective produces a lot of noise.

Perhaps the S/N ratio of your script is somewhat better
than the other proposal.

