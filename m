From: Arnaldo Carvalho de Melo <acme@conectiva.com.br>
Date: Sun, 22 Feb 2004 12:55:02 +0000
Subject: Re: [Kernel-janitors] [PATCH] 90 patches for unnecessary casts
Message-Id: <20040222125502.GD13913@conectiva.com.br>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040125105212.GA2064@localhost>
In-Reply-To: <20040125105212.GA2064@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

Em Sun, Feb 22, 2004 at 01:05:20PM +0100, Carlo Perassi escreveu:
> > I have most of these merged, but some of the changes no longer
> > apply.  Please rediff and resend the changes for:
> >=20
> > drivers/net/3c527.c
> > drivers/net/tc35815.c
> > drivers/net/68360enet.c
> >=20
> > (against 2.6.3).
>=20
> - a patch for drivers/net/3c527.c is attached
> - drivers/net/tc35815.c is fine
> - drivers/net/68360enet.c doesn't exist. which file do you mean?

> --=20
> Carlo Perassi - http://www.linux.it/~carlo/
> =20
>  static void mc32_tx_ring(struct net_device *dev)=20
>  {
> -	struct mc32_local *lp=3D(struct mc32_local *)dev->priv;
> +	struct mc32_local *lp=DEv->priv;

While at it please insert spaces before and after operators, like:

	struct mc32_local *lp =3D dev->priv;

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
