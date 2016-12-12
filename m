From: Joe Perches <joe@perches.com>
Date: Mon, 12 Dec 2016 15:55:30 +0000
Subject: Re: [patch] nvme-fabrics: correct some printk information
Message-Id: <1481558130.1764.21.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161210090618.GA11680@elgon.mountain>
 <1481369270.5946.51.camel@perches.com> <20161210184029.GY8176@mwanda>
 <alpine.DEB.2.20.1612102104050.1986@hadrien>
 <1481403290.1764.1.camel@perches.com> <20161210210737.GR8244@mwanda>
 <1481408662.1764.3.camel@perches.com> <20161212093352.GB8176@mwanda>
 <alpine.DEB.2.10.1612121646460.3156@hadrien>
In-Reply-To: <alpine.DEB.2.10.1612121646460.3156@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On Mon, 2016-12-12 at 16:47 +0100, Julia Lawall wrote:
>=20
> On Mon, 12 Dec 2016, Dan Carpenter wrote:
>=20
> > On Sat, Dec 10, 2016 at 02:24:22PM -0800, Joe Perches wrote:
> > > On Sun, 2016-12-11 at 00:07 +0300, Dan Carpenter wrote:
> > > > On Sat, Dec 10, 2016 at 12:54:50PM -0800, Joe Perches wrote:
> > > > > diff -u -p drivers//dma/pxa_dma.c /tmp/nothing//dma/pxa_dma.c
> > > > > --- drivers//dma/pxa_dma.c
> > > > > +++ /tmp/nothing//dma/pxa_dma.c
> > > > > @@ -640,9 +640,6 @@ static unsigned int clear_chan_irq(struc
> > > > >=A0=A0=A0=A0=A0=A0=A0=A0=A0dcsr =3D phy_readl_relaxed(phy, DCSR);
> > > > >=A0=A0=A0=A0=A0=A0=A0=A0=A0phy_writel(phy, dcsr, DCSR);
> > > > >=A0=A0=A0=A0=A0=A0=A0=A0=A0if ((dcsr & PXA_DCSR_BUSERR) && (phy->v=
chan))
> > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0dev_warn(&phy->vcha=
n->vc.chan.dev->device,
> > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 "%s(chan=3D%p): PXA_DCSR_BUSERR\n",
> > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 __func__, &phy->vchan);
> > > >
> > > > That's not a defect.=A0 We're getting the address of vchan.=A0 I do=
n't get
> > > > it?
> > >
> > > $ git grep -n -w vchan drivers/dma/pxa*
> > > drivers/dma/pxa_dma.c:103:=A0=A0=A0=A0=A0 struct pxad_chan=A0=A0=A0=
=A0=A0=A0=A0 *vchan;
> >
> > I'm not sure what you're saying here still.=A0 This code works as
> > intended.=A0 We're not printing a stack address.
>=20
> I guess that the point is that one would like to print the channel, not
> the address of the channel?

Generally, printing the address of a pointer
_can_ be useful, but it's likely a defect with
a low false positive rate.
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
