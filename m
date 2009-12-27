From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
Date: Sun, 27 Dec 2009 21:51:06 +0000
Subject: Re: [PATCH 1/5] arch/arm: Correct NULL test
Message-Id: <20091227215106.GA18317@pengutronix.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0912272226360.20548@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0912272226360.20548@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-arm-kernel@lists.infradead.org

On Sun, Dec 27, 2009 at 10:26:54PM +0100, Julia Lawall wrote:
> From: Julia Lawall <julia@diku.dk>
>=20
> Test the just-allocated value for NULL rather than some other value.
>=20
> The semantic patch that makes this change is as follows:
> (http://coccinelle.lip6.fr/)
>=20
> // <smpl>
> ....
> // </smpl>
>=20
> Signed-off-by: Julia Lawall <julia@diku.dk>
>=20
> ---
>  arch/arm/plat-pxa/dma.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff -u -p a/arch/arm/plat-pxa/dma.c b/arch/arm/plat-pxa/dma.c
> --- a/arch/arm/plat-pxa/dma.c
> +++ b/arch/arm/plat-pxa/dma.c
> @@ -244,7 +244,7 @@ static void pxa_dma_init_debugfs(void)
> =20
>  	dbgfs_chan =3D kmalloc(sizeof(*dbgfs_state) * num_dma_channels,
>  			     GFP_KERNEL);
> -	if (!dbgfs_state)
> +	if (!dbgfs_chan)
>  		goto err_alloc;
Shouldn't the malloc line read:

	... =3D kmalloc(sizeof(*dbgfs_chan) * ...)
	                      ^^^^^^^^^^

?

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
