From: Karsten Keil <isdn@linux-pingi.de>
Date: Sun, 09 Aug 2009 12:20:33 +0000
Subject: Re: [PATCH 1/3] drivers/isdn/hisax: Correct use of request_region/request_mem_region
Message-Id: <200908091420.33935.isdn@linux-pingi.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0908090942560.13271@ask.diku.dk> <Pine.LNX.4.64.0908091150310.13271@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0908091150310.13271@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>, isdn4linux@listserv.isdn4linux.de, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sonntag, 9. August 2009 11:51:14 you wrote:
> Or perhaps it is the request_region that is incorrect, since the same
> value is later used with ioremap?

Yes this is the real error, these cards have one IO port (hw.isurf.reset) and 
one memory mapped IO area (
hw.isurf.phymem).


>
> julia
>
> On Sun, 9 Aug 2009, Julia Lawall wrote:
> > From: Julia Lawall <julia@diku.dk>
> >
> > request_region should be used with release_region, not
> > request_mem_region.
> >
> > The semantic patch that fixes this problem is as follows:
> > (http://coccinelle.lip6.fr/)
> >
> > // <smpl>
> > @r1@
> > expression start;
> > @@
> >
> > request_region(start,...)
> >
> > @b1@
> > expression r1.start;
> > @@
> >
> > request_mem_region(start,...)
> >
> > @depends on !b1@
> > expression r1.start;
> > expression E;
> > @@
> >
> > - release_mem_region
> > + release_region
> >   (start,E)
> > // </smpl>
> >
> > Signed-off-by: Julia Lawall <julia@diku.dk>
> >
> > ---
> >  drivers/isdn/hisax/isurf.c |    2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff -u -p a/drivers/isdn/hisax/isurf.c b/drivers/isdn/hisax/isurf.c
> > --- a/drivers/isdn/hisax/isurf.c
> > +++ b/drivers/isdn/hisax/isurf.c
> > @@ -125,7 +125,7 @@ release_io_isurf(struct IsdnCardState *c
> >  {
> >  	release_region(cs->hw.isurf.reset, 1);
> >  	iounmap(cs->hw.isurf.isar);
> > -	release_mem_region(cs->hw.isurf.phymem, ISURF_IOMEM_SIZE);
> > +	release_region(cs->hw.isurf.phymem, ISURF_IOMEM_SIZE);
> >  }
> >
> >  static void

