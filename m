From: Julia Lawall <julia@diku.dk>
Date: Sun, 27 Dec 2009 22:07:48 +0000
Subject: Re: [PATCH 1/5] arch/arm: Correct NULL test
Message-Id: <Pine.LNX.4.64.0912272307310.20548@ask.diku.dk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="-511516320-821148813-1261951668=:20548"
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0912272226360.20548@ask.diku.dk>
	<20091227215106.GA18317@pengutronix.de>
In-Reply-To: <20091227215106.GA18317@pengutronix.de>
To: linux-arm-kernel@lists.infradead.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---511516320-821148813-1261951668=:20548
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Sun, 27 Dec 2009, Uwe Kleine-K=F6nig wrote:

> On Sun, Dec 27, 2009 at 10:26:54PM +0100, Julia Lawall wrote:
> > From: Julia Lawall <julia@diku.dk>
> >=20
> > Test the just-allocated value for NULL rather than some other value.
> >=20
> > The semantic patch that makes this change is as follows:
> > (http://coccinelle.lip6.fr/)
> >=20
> > // <smpl>
> > ....
> > // </smpl>
> >=20
> > Signed-off-by: Julia Lawall <julia@diku.dk>
> >=20
> > ---
> >  arch/arm/plat-pxa/dma.c |    2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff -u -p a/arch/arm/plat-pxa/dma.c b/arch/arm/plat-pxa/dma.c
> > --- a/arch/arm/plat-pxa/dma.c
> > +++ b/arch/arm/plat-pxa/dma.c
> > @@ -244,7 +244,7 @@ static void pxa_dma_init_debugfs(void)
> > =20
> >  	dbgfs_chan =3D kmalloc(sizeof(*dbgfs_state) * num_dma_channels,
> >  			     GFP_KERNEL);
> > -	if (!dbgfs_state)
> > +	if (!dbgfs_chan)
> >  		goto err_alloc;
> Shouldn't the malloc line read:
>=20
> 	... =3D kmalloc(sizeof(*dbgfs_chan) * ...)
> 	                      ^^^^^^^^^^
>=20
> ?

Good point, thanks.  I will send a revised patch.

julia
---511516320-821148813-1261951668=:20548--
