From: Julia Lawall <julia@diku.dk>
Date: Thu, 30 Jul 2009 14:29:54 +0000
Subject: Re: [PATCH 5/5] sound/aoa: Add kmalloc NULL tests
Message-Id: <Pine.LNX.4.64.0907301627260.8734@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0907301610550.8734@ask.diku.dk>
 <1248963420.16129.0.camel@johannes.local>
In-Reply-To: <1248963420.16129.0.camel@johannes.local>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linuxppc-dev@ozlabs.org, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, 30 Jul 2009, Johannes Berg wrote:

> On Thu, 2009-07-30 at 16:11 +0200, Julia Lawall wrote:
> > From: Julia Lawall <julia@diku.dk>
> > 
> > Check that the result of kzalloc is not NULL before a dereference.
> 
> >  		irq_client = kzalloc(sizeof(struct pmf_irq_client),
> >  				     GFP_KERNEL);
> > +		if (!irq_client) {
> > +			err = -ENOMEM;
> > +			printk(KERN_ERR "snd-aoa: gpio layer failed to"
> > +				" register %s irq (%d)\n", name, err);
> > +			goto out_unlock;
> > +		}
> 
> Looks good, thanks, but I'd really drop the printk if only to not have
> the string there, that doesn't really seem interesting.

The printk is based on similar error handling code a few lines later:

               if (err) {
                        printk(KERN_ERR "snd-aoa: gpio layer failed to"
                                        " register %s irq (%d)\n", name, 
err);
                        kfree(irq_client);
                        goto out_unlock;
                }

Should the printk be removed in this case as well?  Or is it ok to fail 
silently in one case and not in the other?

julia
