From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Date: Wed, 10 May 2017 10:03:01 +0000
Subject: Re: [PATCH v2] mtd: spi-nor: Potential oops on error path in quad_enable()
Message-Id: <1bc9d422-734b-8520-8e25-510ce9253f6f@wedev4u.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170505053356.vcgboleyqigluhc3@mwanda>
In-Reply-To: <20170505053356.vcgboleyqigluhc3@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Marek Vasut <marek.vasut@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org

Le 05/05/2017 =E0 07:33, Dan Carpenter a =E9crit :
> Before commit cff959958832 ("mtd: spi-nor: introduce SPI 1-2-2 and SPI
> 1-4-4 protocols") then we treated 1 as -EINVAL in the caller but after
> that commit we changed to propagate the return.  My static checker
> complains that it's eventually passed to an ERR_PTR() and later
> dereferenced, but I'm not totally certain if that's true.  Regardless,
> returning 1 is wrong.
>=20
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied to the github/spi-nor tree.

Thanks!
> ---
> v2: Propogate the error code from spi_nor_wait_till_ready() instead of
>     just returning -EINVAL
>=20
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 060a59e716be..eef55b597ec7 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -1389,8 +1389,9 @@ static int macronix_quad_enable(struct spi_nor *nor)
> =20
>  	write_sr(nor, val | SR_QUAD_EN_MX);
> =20
> -	if (spi_nor_wait_till_ready(nor))
> -		return 1;
> +	ret =3D spi_nor_wait_till_ready(nor);
> +	if (ret)
> +		return ret;
> =20
>  	ret =3D read_sr(nor);
>  	if (!(ret > 0 && (ret & SR_QUAD_EN_MX))) {
>=20

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
