From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 13 Sep 2019 12:33:13 +0000
Subject: Re: [PATCH] mtd: rawnand: fix spelling mistake "gravepagess" -> "gravepages"
Message-Id: <20190913143313.43d17e86@xps13>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190913092243.7399-1-colin.king@canonical.com>
In-Reply-To: <20190913092243.7399-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Colin King <colin.king@canonical.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>

Hi Colin,

Colin King <colin.king@canonical.com> wrote on Fri, 13 Sep 2019
10:22:43 +0100:

> From: Colin Ian King <colin.king@canonical.com>
>=20
> There is a spelling mistake in a NS_ERR error message. Fix it.

A Fixes tag would be great!

>=20
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/mtd/nand/raw/nandsim.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/mtd/nand/raw/nandsim.c b/drivers/mtd/nand/raw/nandsi=
m.c
> index 9a70754a61ef..76c31d1dea31 100644
> --- a/drivers/mtd/nand/raw/nandsim.c
> +++ b/drivers/mtd/nand/raw/nandsim.c
> @@ -910,7 +910,7 @@ static int parse_gravepages(void)
>  		zero_ok =3D (*g =3D '0' ? 1 : 0);
>  		page_no =3D simple_strtoul(g, &g, 0);
>  		if (!zero_ok && !page_no) {
> -			NS_ERR("invalid gravepagess.\n");
> +			NS_ERR("invalid gravepages.\n");
>  			return -EINVAL;
>  		}
>  		max_reads =3D 3;


Thanks,
Miqu=C3=A8l
