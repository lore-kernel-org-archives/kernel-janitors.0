From: Julia Lawall <julia@diku.dk>
Date: Mon, 12 May 2008 16:53:01 +0000
Subject: Re: [PATCH 3/6] drivers/net: remove null pointer dereference
Message-Id: <Pine.LNX.4.64.0805121852510.16384@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0805121537320.3694@ask.diku.dk>
 <20080512161734.GA22190@electric-eye.fr.zoreil.com>
In-Reply-To: <20080512161734.GA22190@electric-eye.fr.zoreil.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Francois Romieu <romieu@fr.zoreil.com>
Cc: jgarzik@pobox.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, 12 May 2008, Francois Romieu wrote:

> Julia Lawall <julia@diku.dk> :
> [...]
> > diff -u -p a/drivers/net/au1000_eth.c b/drivers/net/au1000_eth.c
> > --- a/drivers/net/au1000_eth.c	2008-04-27 11:41:11.000000000 +0200
> > +++ b/drivers/net/au1000_eth.c	2008-05-12 09:32:54.000000000 +0200
> > @@ -1242,7 +1242,7 @@ static irqreturn_t au1000_interrupt(int 
> >  	struct net_device *dev = (struct net_device *) dev_id;
> >  
> >  	if (dev = NULL) {
> > -		printk(KERN_ERR "%s: isr: null dev ptr\n", dev->name);
> > +		printk(KERN_ERR "isr: null dev ptr\n");
> >  		return IRQ_RETVAL(1);
> >  	}
> 
> The lifespan of 'dev' covers the request_irq..free_irq interval in this
> driver. The whole 'dev = NULL' block can be removed.

Will you do that?

julia
