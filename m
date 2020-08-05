From: Paul Cercueil <paul@crapouillou.net>
Date: Wed, 05 Aug 2020 00:04:34 +0000
Subject: Re: [PATCH] memory: jz4780_nemc: Fix an error pointer vs NULL check in probe()
Message-Id: <MJDKEQ.BWLP6TXTA14J1@crapouillou.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200803143607.GC346925@mwanda>
In-Reply-To: <20200803143607.GC346925@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org



Le lun. 3 ao=FBt 2020 =E0 17:36, Dan Carpenter <dan.carpenter@oracle.com>=20
a =E9crit :
> The devm_ioremap() function returns NULL on error, it doesn't return
> error pointers.  This bug could lead to an Oops during probe.
>=20
> Fixes: f046e4a3f0b9 ("memory: jz4780_nemc: Only request IO memory the=20
> driver will use")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Paul Cercueil <paul@crapouillou.net>

Thanks!
-Paul

> ---
>  drivers/memory/jz4780-nemc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/memory/jz4780-nemc.c=20
> b/drivers/memory/jz4780-nemc.c
> index 3ec5cb0fce1e..608ae925e641 100644
> --- a/drivers/memory/jz4780-nemc.c
> +++ b/drivers/memory/jz4780-nemc.c
> @@ -304,9 +304,9 @@ static int jz4780_nemc_probe(struct=20
> platform_device *pdev)
>  	}
>=20
>  	nemc->base =3D devm_ioremap(dev, res->start, NEMC_REG_LEN);
> -	if (IS_ERR(nemc->base)) {
> +	if (!nemc->base) {
>  		dev_err(dev, "failed to get I/O memory\n");
> -		return PTR_ERR(nemc->base);
> +		return -ENOMEM;
>  	}
>=20
>  	writel(0, nemc->base + NEMC_NFCSR);
> --
> 2.27.0
>=20
