From: Niklas =?iso-8859-1?Q?S=F6derlund?=  <niklas.soderlund@ragnatech.se>
Date: Fri, 04 Dec 2020 21:04:29 +0000
Subject: Re: [PATCH][next] media: rcar-vin: fix return, use ret instead of zero
Message-Id: <20201204210429.GB2018713@oden.dyn.berto.se>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201204173833.1146570-1-colin.king@canonical.com>
In-Reply-To: <20201204173833.1146570-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Colin King <colin.king@canonical.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Jacopo Mondi <jacopo+renesas@jmondi.org>, linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Colin,

Thanks for catching this!

On 2020-12-04 17:38:33 +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>=20
> Currently the return error code is in ret is being assigned but not
> used. It and should be returned by the return statement and currently
> just 0 is being returned. Fix this.
>=20
> Addresses-Coverity: ("Unused value")
> Fixes: b9ad52aafe38 ("media: rcar-vin: Rework parallel firmware parsing")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed-by: Niklas S=F6derlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/media/platform/rcar-vin/rcar-core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/media/=
platform/rcar-vin/rcar-core.c
> index 98bff765b02e..e48d666f2c63 100644
> --- a/drivers/media/platform/rcar-vin/rcar-core.c
> +++ b/drivers/media/platform/rcar-vin/rcar-core.c
> @@ -654,7 +654,7 @@ static int rvin_parallel_parse_of(struct rvin_dev *vi=
n)
>  out:
>  	fwnode_handle_put(fwnode);
> =20
> -	return 0;
> +	return ret;
>  }
> =20
>  static int rvin_parallel_init(struct rvin_dev *vin)
> --=20
> 2.29.2
>=20

--=20
Regards,
Niklas S=F6derlund
