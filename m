From: Takashi Iwai <tiwai@suse.de>
Date: Thu, 19 Apr 2012 12:29:37 +0000
Subject: Re: [PATCH] sound/isa/sc6000.c: add missing sc6000_setup_board
Message-Id: <s5hwr5b6h1q.wl%tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1334817640-15426-1-git-send-email-Julia.Lawall@lip6.fr>
	<s5h8vhs6iyf.wl%tiwai@suse.de>
	<alpine.DEB.2.02.1204191418420.1866@hadrien>
In-Reply-To: <alpine.DEB.2.02.1204191418420.1866@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

At Thu, 19 Apr 2012 14:21:59 +0200 (CEST),
Julia Lawall wrote:
> 
> On Thu, 19 Apr 2012, Takashi Iwai wrote:
> 
> > At Thu, 19 Apr 2012 08:40:40 +0200,
> > Julia Lawall wrote:
> >>
> >> From: Julia Lawall <Julia.Lawall@lip6.fr>
> >>
> >> There seems to be no interaction between *port and the requested region, so
> >> the clearing of *vport should take place if the request_region fails.
> >>
> >> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
> >>
> >> ---
> >> Not tested.  sc6000_setup_board seems rather complicated, so my reasoning
> >> could be completely wrong.
> >
> > This setup is called first at sc6000_init_board(), which is called
> > much later than these error paths.  So, I don't think the need to call
> > sc6000_setup_board(*vport, 0) at err_unmap1.
> 
> Thanks for the feedback.  I guess then it is not needed on the failure 
> of devm_ioport_map either.  Is it needed on the failure of 
> sc6000_init_board?  That can fail either before or after the calls to 
> sc6000_setup_board hav taken place.

Some error paths in sc6000_init_board() don't look necessary to call
sc6000_setup_board(0), indeed.  But it's not too critical to call
sc6000_setup_board() at that timinig (there should be no hang), so I
don't think we need to change it unless it hits any real problem.


thanks,

Takashi


> 
> thanks,
> julia
> 
> 
> 
> >
> >
> > thanks,
> >
> > Takashi
> >
> >>
> >>  sound/isa/sc6000.c |    5 +++--
> >>  1 file changed, 3 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/sound/isa/sc6000.c b/sound/isa/sc6000.c
> >> index d97d0f3..57679cb 100644
> >> --- a/sound/isa/sc6000.c
> >> +++ b/sound/isa/sc6000.c
> >> @@ -594,7 +594,7 @@ static int __devinit snd_sc6000_probe(struct device *devptr, unsigned int dev)
> >>  		snd_printk(KERN_ERR PFX
> >>  			   "I/O port cannot be iomaped.\n");
> >>  		err = -EBUSY;
> >> -		goto err_unmap1;
> >> +		goto err_unmap0;
> >>  	}
> >>
> >>  	/* to make it marked as used */
> >> @@ -678,9 +678,10 @@ static int __devinit snd_sc6000_probe(struct device *devptr, unsigned int dev)
> >>  	return 0;
> >>
> >>  err_unmap2:
> >> -	sc6000_setup_board(*vport, 0);
> >>  	release_region(mss_port[dev], 4);
> >>  err_unmap1:
> >> +	sc6000_setup_board(*vport, 0);
> >> +err_unmap0:
> >>  	release_region(port[dev], 0x10);
> >>  err_exit:
> >>  	snd_card_free(card);
> >>
> > --
> > To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
> >
> 
