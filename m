From: Matthew Wilcox <matthew@wil.cx>
Date: Tue, 21 Oct 2008 04:23:54 +0000
Subject: Re: [PATCH] via-agp.c fixed compilation error and warnings for 2.6.26
Message-Id: <20081021042353.GL26184@parisc-linux.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <663ba5090810050509g6ce3c25bh40686506b1d35b8f@mail.gmail.com> <663ba5090810202049i16285109k34fde3ec1c9df319@mail.gmail.com> <alpine.DEB.0.82.0810210453290.26751@skynet.skynet.ie>
In-Reply-To: <alpine.DEB.0.82.0810210453290.26751@skynet.skynet.ie>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dave Airlie <airlied@linux.ie>
Cc: nagaraj s k <nagaraj.sk@gmail.com>, trivial@kernel.org, greg@kroah.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, nagaraj.krishnappa@thomsonreuters.com

On Tue, Oct 21, 2008 at 04:57:13AM +0100, Dave Airlie wrote:
> > > -    printk(KERN_ERR PFX "Unknown aperture size from AGP bridge (0x%x)\n",
> > > temp);
> > > +    printk(KERN_ERR PFX "Unknown aperture size from AGP
> > > +        bridge (0x%x)\n", temp);
> 
> Uglier code.

Not just that, but it won;t even compile with a recent compiler.  You'd
need to do it as:

	printk(KERN_ERR PFX "Unknown aperture size from AGP "
		"bridge (0x%x)\n", temp);

and that would seem like not much of a win.  What might be a win would
be:
	dev_err(&agp_bridge->dev->dev, "Unknown AGP aperture size 0x%x\n",
		temp);

> > >          if (temp = values[i].size_value) {
> > >              agp_bridge->previous_size > > > -                agp_bridge->current_size = (void *) (values + i);
> > > +                agp_bridge->current_size > > > +                     (void *) (values + i);
> 
> arguably uglier code.

No argument about it ... it's uglier.  The (void *) cast is unnecessary.

What I'd do to this function is:

        for (i = 0; i < agp_bridge->driver->num_aperture_sizes; i++) {
		if (temp != values[i].size_value)
			continue;

		agp_bridge->previous_size = agp_bridge->current_size 			values + i;
		agp_bridge->aperture_size_idx = i;
		return values[i].size;
	}

	dev_err(&agp_bridge->dev->dev, "Unknown AGP aperture size 0x%x\n",
		temp);
	return 0;
}


> > > @@ -142,11 +144,12 @@ static int via_configure_agp3(void)
> > >
> > >      /* 1. Enable GTLB in RX90<7>, all AGP aperture access needs to fetch
> > >       *    translation table first.
> > > -     * 2. Enable AGP aperture in RX91<0>. This bit controls the enabling
> > > of the
> > > -     *    graphics AGP aperture for the AGP3.0 port.
> > > +     * 2. Enable AGP aperture in RX91<0>. This bit controls the
> > > +     * enabling of the graphics AGP aperture for the AGP3.0 port.
> 
> this is okay.

Except the missing spaces between the '*' and 'enabling'.

> > >       */
> > >      pci_read_config_dword(agp_bridge->dev, VIA_AGP3_GARTCTRL, &temp);
> > > -    pci_write_config_dword(agp_bridge->dev, VIA_AGP3_GARTCTRL, temp |
> > > (3<<7));
> > > +    pci_write_config_dword(agp_bridge->dev, VIA_AGP3_GARTCTRL,
> > > +                         temp | (3<<7));
> 
> this one is probably okay.

I'd add some more spacing:

+				temp | (3 << 7));

The driver seems to suffer from a lack of spaces around << throughout.
And most of those << should probably be defines somewhere ...

-- 
Matthew Wilcox				Intel Open Source Technology Centre
"Bill, look, we understand that you're interested in selling us this
operating system, but compare it to ours.  We can't possibly take such
a retrograde step."
