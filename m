From: Antoine Tenart <antoine.tenart@bootlin.com>
Date: Thu, 22 Mar 2018 09:24:56 +0000
Subject: Re: [PATCH][next] net: mvpp2: use correct index on array mvpp2_pools
Message-Id: <20180322092456.GA9682@kwain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180321173115.1820-1-colin.king@canonical.com>
In-Reply-To: <20180321173115.1820-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Colin King <colin.king@canonical.com>
Cc: "David S . Miller" <davem@davemloft.net>, Antoine Tenart <antoine.tenart@bootlin.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Colin,

On Wed, Mar 21, 2018 at 05:31:15PM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>=20
> Array mvpp2_pools is being indexed by long_log_pool, however this
> looks like a cut-n-paste bug and in fact should be short_log_pool.
>=20
> Detected by CoverityScan, CID#1466113 ("Copy-paste error")
>=20
> Fixes: 576193f2d579 ("net: mvpp2: jumbo frames support")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Acked-by: Antoine Tenart <antoine.tenart@bootlin.com>

Thanks!
Antoine

> ---
>  drivers/net/ethernet/marvell/mvpp2.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/net/ethernet/marvell/mvpp2.c b/drivers/net/ethernet/=
marvell/mvpp2.c
> index 9bd35f2291d6..f8bc3d4a39ff 100644
> --- a/drivers/net/ethernet/marvell/mvpp2.c
> +++ b/drivers/net/ethernet/marvell/mvpp2.c
> @@ -4632,7 +4632,7 @@ static int mvpp2_swf_bm_pool_init(struct mvpp2_port=
 *port)
>  	if (!port->pool_short) {
>  		port->pool_short >  			mvpp2_bm_pool_use(port, short_log_pool,
> -					  mvpp2_pools[long_log_pool].pkt_size);
> +					  mvpp2_pools[short_log_pool].pkt_size);
>  		if (!port->pool_short)
>  			return -ENOMEM;
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
