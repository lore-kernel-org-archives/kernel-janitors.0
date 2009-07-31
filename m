From: Takashi Iwai <tiwai@suse.de>
Date: Fri, 31 Jul 2009 06:22:49 +0000
Subject: Re: [PATCH 5/5] sound/aoa: Add kmalloc NULL tests
Message-Id: <s5hws5pid6u.wl%tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0907301610550.8734@ask.diku.dk>
	<1248963420.16129.0.camel@johannes.local>
	<Pine.LNX.4.64.0907301627260.8734@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0907301627260.8734@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: linuxppc-dev@ozlabs.org, Johannes Berg <johannes@sipsolutions.net>, kernel-janitors@vger.kernel.org, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org

At Thu, 30 Jul 2009 16:29:54 +0200 (CEST),
Julia Lawall wrote:
> 
> On Thu, 30 Jul 2009, Johannes Berg wrote:
> 
> > On Thu, 2009-07-30 at 16:11 +0200, Julia Lawall wrote:
> > > From: Julia Lawall <julia@diku.dk>
> > > 
> > > Check that the result of kzalloc is not NULL before a dereference.
> > 
> > >  		irq_client = kzalloc(sizeof(struct pmf_irq_client),
> > >  				     GFP_KERNEL);
> > > +		if (!irq_client) {
> > > +			err = -ENOMEM;
> > > +			printk(KERN_ERR "snd-aoa: gpio layer failed to"
> > > +				" register %s irq (%d)\n", name, err);
> > > +			goto out_unlock;
> > > +		}
> > 
> > Looks good, thanks, but I'd really drop the printk if only to not have
> > the string there, that doesn't really seem interesting.
> 
> The printk is based on similar error handling code a few lines later:

But another problem is that the same error message is reused although
the error condition is totally different.  The kzalloc NULL isn't
about the registration error.  So, it's rather confusing.

However, for this particular error path, I agree with Johannes; we can
skip the error message since the error code ENOMEM is obvious.


thanks,

Takashi

> 
>                if (err) {
>                         printk(KERN_ERR "snd-aoa: gpio layer failed to"
>                                         " register %s irq (%d)\n", name, 
> err);
>                         kfree(irq_client);
>                         goto out_unlock;
>                 }
> 
> Should the printk be removed in this case as well?  Or is it ok to fail 
> silently in one case and not in the other?
> 
> julia
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
> 
