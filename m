From: Joe Perches <joe@perches.com>
Date: Sat, 09 May 2020 22:42:36 +0000
Subject: Re: [PATCH] net/sonic: Fix some resource leaks in error handling paths
Message-Id: <fc5cf8da8e70ebb981a9fc3aec6834c74197f0ed.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200508172557.218132-1-christophe.jaillet@wanadoo.fr>
         <20200508185402.41d9d068@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
         <50ef36cd-d095-9abe-26ea-d363d11ce521@wanadoo.fr>
         <20200509111321.51419b19@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20200509111321.51419b19@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Jakub Kicinski <kuba@kernel.org>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: davem@davemloft.net, fthain@telegraphics.com.au, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sat, 2020-05-09 at 11:13 -0700, Jakub Kicinski wrote:
> On Sat, 9 May 2020 18:47:08 +0200 Christophe JAILLET wrote:
> > Le 09/05/2020 =E0 03:54, Jakub Kicinski a =E9crit :
> > > On Fri,  8 May 2020 19:25:57 +0200 Christophe JAILLET wrote: =20
> > > > @@ -527,8 +531,9 @@ static int mac_sonic_platform_remove(struct pla=
tform_device *pdev)
> > > >   	struct sonic_local* lp =3D netdev_priv(dev);
> > > >  =20
> > > >   	unregister_netdev(dev);
> > > > -	dma_free_coherent(lp->device, SIZEOF_SONIC_DESC * SONIC_BUS_SCALE=
(lp->dma_bitmode),
> > > > -	                  lp->descriptors, lp->descriptors_laddr);
> > > > +	dma_free_coherent(lp->device,
> > > > +			  SIZEOF_SONIC_DESC * SONIC_BUS_SCALE(lp->dma_bitmode),
> > > > +			  lp->descriptors, lp->descriptors_laddr);
> > > >   	free_netdev(dev);
> > > >  =20
> > > >   	return 0; =20
> > > This is a white-space only change, right? Since this is a fix we shou=
ld
> > > avoid making cleanups which are not strictly necessary.
> >=20
> > Right.
> >=20
> > The reason of this clean-up is that I wanted to avoid a checkpatch=20
> > warning with the proposed patch and I felt that having the same layout =

> > in the error handling path of the probe function and in the remove=20
> > function was clearer.
> > So I updated also the remove function.
>=20
> I understand the motivation is good.

David, maybe I missed some notification about Jakub's role.

What is Jakub's role in relation to the networking tree?
