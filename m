From: Julia Lawall <julia.lawall@lip6.fr>
Date: Sat, 10 Dec 2016 20:06:44 +0000
Subject: Re: [patch] nvme-fabrics: correct some printk information
Message-Id: <alpine.DEB.2.20.1612102104050.1986@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161210090618.GA11680@elgon.mountain>
 <1481369270.5946.51.camel@perches.com> <20161210184029.GY8176@mwanda>
In-Reply-To: <20161210184029.GY8176@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org



On Sat, 10 Dec 2016, Dan Carpenter wrote:

> On Sat, Dec 10, 2016 at 03:27:50AM -0800, Joe Perches wrote:
> > On Sat, 2016-12-10 at 12:06 +0300, Dan Carpenter wrote:
> > > We really don't care where "ctrl" is on the stack since we're just
> > > returning soon what we want is the actual ctrl pointer itself.
> > >
> > > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > >
> > > diff --git a/drivers/nvme/host/fc.c b/drivers/nvme/host/fc.c
> > []
> > > @@ -2402,7 +2402,7 @@ enum blk_eh_timer_return
> > >
> > >  	dev_info(ctrl->ctrl.device,
> > >  		"NVME-FC{%d}: new ctrl: NQN \"%s\" (%p)\n",
> > > -		ctrl->cnum, ctrl->ctrl.opts->subsysnqn, &ctrl);
> > > +		ctrl->cnum, ctrl->ctrl.opts->subsysnqn, ctrl);
> >
> > Found by script or inspection?
> >
> > If by script, it seems unlikely there's only 1 instance
> > where an address of an automatic pointer type is used
> > incorrectly.
>
> Script.  But it's using a pretty specific heuristic where we kmalloc a
> pointer and then pass the address.  It prints few warnings.  Probably
> 40% false positives, but the remaining examples of course are 100% false
> positives.

I tried anything that looks like a print, ie has a format string argument,
and was taking the address of a local variable as another argument.  But
there are lots of weird format designators in the kernel that Coccinelle
doesn't know about for which passing the address of a local variable is
reasonable.  So for the moment, there are, as far as I can see, just a lot
of false positives.  I did add improving the support for format strings to
my TODO list.

julia


>
> regards,
> dan carpenter
>
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
