From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
Date: Thu, 10 Dec 2009 08:28:03 +0000
Subject: Re: [PATCH 1/12] arch/arm: Correct size given to memset
Message-Id: <20091210082803.GA6255@pengutronix.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0912092022040.1870@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0912092022040.1870@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-arm-kernel@lists.infradead.org

Hello,

On Wed, Dec 09, 2009 at 08:22:26PM +0100, Julia Lawall wrote:
> From: Julia Lawall <julia@diku.dk>
>=20
> Memset should be given the size of the structure, not the size of the poi=
nter.
>=20
> The semantic patch that makes this change is as follows:
> (http://coccinelle.lip6.fr/)
>=20
> // <smpl>
> @@
> type T;
> T *x;
> expression E;
> @@
>=20
> memset(x, E, sizeof(
> + *
>  x))
> // </smpl>
>=20
> Signed-off-by: Julia Lawall <julia@diku.dk>
>=20
> ---
>  arch/arm/plat-mxc/dma-mx1-mx2.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff -u -p a/arch/arm/plat-mxc/dma-mx1-mx2.c b/arch/arm/plat-mxc/dma-mx1-=
mx2.c
> --- a/arch/arm/plat-mxc/dma-mx1-mx2.c
> +++ b/arch/arm/plat-mxc/dma-mx1-mx2.c
> @@ -694,7 +694,7 @@ int imx_dma_request(int channel, const c
>  		local_irq_restore(flags);
>  		return -EBUSY;
>  	}
> -	memset(imxdma, 0, sizeof(imxdma));
> +	memset(imxdma, 0, sizeof(*imxdma));
>  	imxdma->name =3D name;
>  	local_irq_restore(flags); /* request_irq() can block */
Patch is OK, Sascha, if you take it you can add my Ack, if not I can
take care of it in my cleanup series.

Best regards
Uwe

--=20
Pengutronix e.K.                              | Uwe Kleine-K=F6nig         =
   |
Industrial Linux Solutions                    | http://www.pengutronix.de/ =
 |
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
