From: Julia Lawall <julia@diku.dk>
Date: Tue, 02 Aug 2011 15:20:14 +0000
Subject: Re: [PATCH 1/11] kernel/kfifo.c: trivial: use BUG_ON
Message-Id: <Pine.LNX.4.64.1108021719450.2512@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1312281304-11847-1-git-send-email-julia@diku.dk>
 <1312281304-11847-2-git-send-email-julia@diku.dk> <20110802113335.GA4185@thinkpad>
 <Pine.LNX.4.64.1108021349330.24349@ask.diku.dk> <20110802120329.GA9088@thinkpad>
In-Reply-To: <20110802120329.GA9088@thinkpad>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrea Righi <andrea@betterlinux.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, trivial@kernel.org, kernel-janitors@vger.kernel.org, Stefani Seibold <stefani@seibold.net>, "Ira W. Snyder" <iws@ovro.caltech.edu>, linux-kernel@vger.kernel.org

On Tue, 2 Aug 2011, Andrea Righi wrote:

> On Tue, Aug 02, 2011 at 01:52:49PM +0200, Julia Lawall wrote:
> > On Tue, 2 Aug 2011, Andrea Righi wrote:
> > 
> > > On Tue, Aug 02, 2011 at 12:34:54PM +0200, Julia Lawall wrote:
> > > > From: Julia Lawall <julia@diku.dk>
> > > > 
> > > > Use BUG_ON(x) rather than if(x) BUG();
> > > > 
> > > > The semantic patch that fixes this problem is as follows:
> > > > (http://coccinelle.lip6.fr/)
> > > > 
> > > > // <smpl>
> > > > @@ identifier x; @@
> > > > -if (x) BUG();
> > > > +BUG_ON(x);
> > > > 
> > > > @@ identifier x; @@
> > > > -if (!x) BUG();
> > > > +BUG_ON(!x);
> > > > // </smpl>
> > > > 
> > > > Signed-off-by: Julia Lawall <julia@diku.dk>
> > > > 
> > > 
> > > The patch looks good. However, I think we should just get rid of the
> > > BUG_ON() there. If nents is 0, setup_sgl_buf() would just returns 0 and
> > > nothing critical will happen.
> > 
> > I don't know the code at all.  Indeed, I'm not sure to see any uses of eg 
> > __kfifo_dma_in_prepare_r, except in demo code.  But that would imply 
> > returning 0 for two different reasons: asking for nothing and being out of 
> > space.
> > 
> > julia
> 
> Right. But I'd prefer to return nothing also when asking nothing rather
> than crashing the kernel.

OK, that seems like a good point too.  I will send a new patch.

julia
