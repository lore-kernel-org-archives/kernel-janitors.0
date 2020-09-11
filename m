From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 11 Sep 2020 15:55:14 +0000
Subject: Re: [PATCH] mtd: remove redundant assignment to pointer eb
Message-Id: <20200911175514.766eeaf1@xps13>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200911102321.22515-1-colin.king@canonical.com>
In-Reply-To: <20200911102321.22515-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Colin King <colin.king@canonical.com>
Cc: Richard Weinberger <richard@nod.at>, kernel-janitors@vger.kernel.org, linux-mtd@lists.infradead.org, Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org

Hi Colin,

Colin King <colin.king@canonical.com> wrote on Fri, 11 Sep 2020
11:23:21 +0100:

> From: Colin Ian King <colin.king@canonical.com>
>=20
> Pointer eb is being assigned a value that is never read, the assignment
> is redundant and can be removed.
>=20
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/mtd/mtdswap.c | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/drivers/mtd/mtdswap.c b/drivers/mtd/mtdswap.c
> index 58eefa43af14..795dec4483c2 100644
> --- a/drivers/mtd/mtdswap.c
> +++ b/drivers/mtd/mtdswap.c
> @@ -1053,7 +1053,6 @@ static int mtdswap_writesect(struct mtd_blktrans_de=
v *dev,
>  	if (ret < 0)
>  		return ret;
> =20
> -	eb =3D d->eb_data + (newblock / d->pages_per_eblk);
>  	d->page_data[page] =3D newblock;
> =20
>  	return 0;

Yes it looks unused but perhaps it helps to catch the logic here. This
is not a strong disagreement but I'd keep it this way. Let's see what
other maintainers think.

Thanks,
Miqu=C3=A8l
