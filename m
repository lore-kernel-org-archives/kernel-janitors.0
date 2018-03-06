From: Antoine Tenart <antoine.tenart@bootlin.com>
Date: Tue, 06 Mar 2018 15:32:47 +0000
Subject: Re: [PATCH][net-next] net: mvpp2: make function mvpp2_check_hw_buf_num static
Message-Id: <20180306153247.GL4321@kwain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180306152517.2770-1-colin.king@canonical.com>
In-Reply-To: <20180306152517.2770-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Colin King <colin.king@canonical.com>
Cc: "David S . Miller" <davem@davemloft.net>, Antoine Tenart <antoine.tenart@bootlin.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Colin,

On Tue, Mar 06, 2018 at 04:25:17PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>=20
> The function mvpp2_check_hw_buf_num is local to the source and does
> not need to be in global scope, so make it static.
>=20
> Cleans up sparse warning:
> drivers/net/ethernet/marvell/mvpp2.c:4298:5: warning: symbol
> 'mvpp2_check_hw_buf_num' was not declared. Should it be static?
>=20
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Acked-by: Antoine Tenart <antoine.tenart@bootlin.com>

Thanks!
Antoine

> ---
>  drivers/net/ethernet/marvell/mvpp2.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/net/ethernet/marvell/mvpp2.c b/drivers/net/ethernet/=
marvell/mvpp2.c
> index ac0a0dc8f157..61c6896d0d62 100644
> --- a/drivers/net/ethernet/marvell/mvpp2.c
> +++ b/drivers/net/ethernet/marvell/mvpp2.c
> @@ -4295,7 +4295,8 @@ static void mvpp2_bm_bufs_free(struct device *dev, =
struct mvpp2 *priv,
>  }
> =20
>  /* Check number of buffers in BM pool */
> -int mvpp2_check_hw_buf_num(struct mvpp2 *priv, struct mvpp2_bm_pool *bm_=
pool)
> +static int mvpp2_check_hw_buf_num(struct mvpp2 *priv,
> +				  struct mvpp2_bm_pool *bm_pool)
>  {
>  	int buf_num =3D 0;
> =20
> --=20
> 2.15.1
>=20

--=20
Antoine T=E9nart, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
