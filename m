From: Miquel Raynal <miquel.raynal@free-electrons.com>
Date: Fri, 19 Jan 2018 08:04:48 +0000
Subject: Re: [PATCH][V2] mtd: nand: marvell: fix spelling mistake: "suceed"-> "succeed"
Message-Id: <20180119090448.07352020@xps13>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180119075531.14841-1-colin.king@canonical.com>
In-Reply-To: <20180119075531.14841-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Colin King <colin.king@canonical.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>, Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org

Hello,

On Fri, 19 Jan 2018 07:55:31 +0000
Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
>=20
> Trivial fix to spelling mistakes in dev_err error message text.
>=20
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/mtd/nand/marvell_nand.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/mtd/nand/marvell_nand.c b/drivers/mtd/nand/marvell_n=
and.c
> index b8fec6093b75..4bd53b360277 100644
> --- a/drivers/mtd/nand/marvell_nand.c
> +++ b/drivers/mtd/nand/marvell_nand.c
> @@ -517,7 +517,7 @@ static int marvell_nfc_prepare_cmd(struct nand_chip *=
chip)
>  	/* Poll ND_RUN and clear NDSR before issuing any command */
>  	ret =3D marvell_nfc_wait_ndrun(chip);
>  	if (ret) {
> -		dev_err(nfc->dev, "Last operation did not suceed\n");
> +		dev_err(nfc->dev, "Last operation did not succeed\n");
>  		return ret;
>  	}
> =20

Acked-by: Miquel Raynal <miquel.raynal@free-electrons.com>

Thanks,
Miqu=C3=A8l
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
