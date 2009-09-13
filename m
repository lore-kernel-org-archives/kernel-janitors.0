From: Julia Lawall <julia@diku.dk>
Date: Sun, 13 Sep 2009 15:49:40 +0000
Subject: Re: [PATCH 1/8] arch/mips/txx9: introduce missing kfree, iounmap
Message-Id: <Pine.LNX.4.64.0909131749150.25903@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0909111820370.10552@pc-004.diku.dk>
 <20090913.232548.253168283.anemo@mba.ocn.ne.jp> <Pine.LNX.4.64.0909131708190.25903@ask.diku.dk>
 <20090914.003321.160496287.anemo@mba.ocn.ne.jp>
In-Reply-To: <20090914.003321.160496287.anemo@mba.ocn.ne.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
Cc: ralf@linux-mips.org, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, 14 Sep 2009, Atsushi Nemoto wrote:

> On Sun, 13 Sep 2009 17:14:06 +0200 (CEST), Julia Lawall <julia@diku.dk> wrote:
> > > This patch add some correctness, but obviously incomplete: there are
> > > more error pathes without iounmap/kfree/etc. in this function.
> > 
> > The only other error path that I see is:
> > 
> >        pdev = platform_device_alloc("leds-gpio", basenum);
> >         if (!pdev)
> >                 return;
> > 
> > But at that point the call gpiochip_add(&iocled->chip) has already 
> > succeeded.  From looking at this function, I have the impression that it 
> > makes the iocled structure available from a global array, gpio_desc.  
> > Since the function containing the above code doesn't return any error 
> > code, perhaps the caller will not know whether this platform_device_alloc 
> > error occurred or not.  There would also be at least the problem of 
> > getting the pointer out of the gpio_desc structure.  I guess this could be 
> > done with gpiochip_remove?
> > 
> > I can certainly make a new patch using the goto style, but let me know 
> > what to do about the above issue.
> 
> Yes, this gpiochip is only used by leds-gpio driver.  So
> gpiochip_remove() would be the right thing to do when something
> failed.
> 
> Also there is one another error path: platform_device_add() failure at
> the end of this function.

OK, I see.  I will submit an improved patch.  Thanks for the explanations.

julia
