From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Tue, 05 Feb 2019 13:08:18 +0000
Subject: Re: [PATCH 1/3] mtd: rawnand: meson: Fix a limit test in meson_nfc_select_chip()
Message-Id: <20190205140818.2de31843@xps13>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190201082922.GC8459@kadam>
In-Reply-To: <20190201082922.GC8459@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>, kernel-janitors@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>, Liang Yang <liang.yang@amlogic.com>, linux-mtd@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>

Hi Dan,

Dan Carpenter <dan.carpenter@oracle.com> wrote on Fri, 1 Feb 2019
11:29:22 +0300:

> This test is off by one because the > should be >=3D and it's also testing
> against the wrong limit.  The MAX_CE_NUM is the maximum size that
> meson_chip->sels[] is allowed to be but meson_chip->nsels is the actual
> size.
>=20
> Fixes: 2d570b34b41a ("mtd: rawnand: meson: add support for Amlogic NAND f=
lash controller ")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/mtd/nand/raw/meson_nand.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/mtd/nand/raw/meson_nand.c b/drivers/mtd/nand/raw/mes=
on_nand.c
> index e858d58d97b0..94c90be7e1e0 100644
> --- a/drivers/mtd/nand/raw/meson_nand.c
> +++ b/drivers/mtd/nand/raw/meson_nand.c
> @@ -225,7 +225,7 @@ static void meson_nfc_select_chip(struct nand_chip *n=
and, int chip)
>  	struct meson_nfc *nfc =3D nand_get_controller_data(nand);
>  	int ret, value;
> =20
> -	if (chip < 0 || WARN_ON_ONCE(chip > MAX_CE_NUM))
> +	if (chip < 0 || WARN_ON_ONCE(chip >=3D meson_chip->nsels))
>  		return;
> =20
>  	nfc->param.chip_select =3D meson_chip->sels[chip] ? NAND_CE1 : NAND_CE0;

I am gonna fold this three patches if this is fine for you with the
original patch adding the driver which is currently in my next branch.


Thanks,
Miqu=C3=A8l
