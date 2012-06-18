From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Date: Mon, 18 Jun 2012 11:25:02 +0000
Subject: Re: [patch] mtd: cafe_nand: fix an & vs | mistake
Message-Id: <1340018702.2420.32.camel@sauron.fi.intel.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="=-Y4qdUGQx/Q6Y4SaHH4yr"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120609160825.GC6488@elgon.mountain>
In-Reply-To: <20120609160825.GC6488@elgon.mountain>
To: Dan Carpenter <dan.carpenter@oracle.com>, Daniel Drake <dsd@laptop.org>
Cc: Mike Dunn <mikedunn@newsguy.com>, Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>, kernel-janitors@vger.kernel.org, linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>


--=-Y4qdUGQx/Q6Y4SaHH4yr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Pushed this patch to l2-mtd.git and added CC to -stable. The patch seems
to be a real bug-fix. Daniel, could you please check it - it will be
shame if it hits -stable and breaks something.

Thanks!

On Sat, 2012-06-09 at 19:08 +0300, Dan Carpenter wrote:
> The intent here was clearly to set result to true if the 0x40000000 flag
> was set.  But instead there was a | vs & typo and we always set result
> to true.
>=20
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> I do not have the hardware to test this.  The original code is clearly
> buggy, but what about if 0x40000000 is the wrong flag?
>=20
> diff --git a/drivers/mtd/nand/cafe_nand.c b/drivers/mtd/nand/cafe_nand.c
> index f3594a6..ac0d967 100644
> --- a/drivers/mtd/nand/cafe_nand.c
> +++ b/drivers/mtd/nand/cafe_nand.c
> @@ -102,7 +102,7 @@ static const char *part_probes[] =3D { "cmdlinepart",=
 "RedBoot", NULL };
>  static int cafe_device_ready(struct mtd_info *mtd)
>  {
>  	struct cafe_priv *cafe =3D mtd->priv;
> -	int result =3D !!(cafe_readl(cafe, NAND_STATUS) | 0x40000000);
> +	int result =3D !!(cafe_readl(cafe, NAND_STATUS) & 0x40000000);
>  	uint32_t irqs =3D cafe_readl(cafe, NAND_IRQ);
> =20
>  	cafe_writel(cafe, irqs, NAND_IRQ);
>=20
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

--=20
Best Regards,
Artem Bityutskiy

--=-Y4qdUGQx/Q6Y4SaHH4yr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJP3xAOAAoJECmIfjd9wqK05poP/RkT/BdhlrAVJlTvUQfAaytN
M370dgaeofoH4VoYMGliL+Vw5ccDbaJSAj/NcBMrvvXFZ0Z+GX2cfVO4ZF/6LrvQ
PmZITgWhy+bltUEIWnn6RuaeQW2AvJP/n6/7t87mFosGtaJ8TOKxLUFk+fiYEQXm
9jqw6tqCifECzm0m0dci6rT9uocuxpKwtd1+i7o+aAF1iJQePV9eGjhxKD0v9MMS
3nK4iY25Xx9bhFcITYfLj1LEaK2pbDMvkapDsZ2PNKxHdvtJnEyCe9SuzdfmRBhm
sbMK48euSovb3zuurJJUr28qdX2lxzIn5Kog+zI8kgKn/Z3PzgNPFnyIjF+w1Puy
rYTiOZrywmriRTYqf5ghSxgRQ/ci8D8EhWmheRDXKN5eh5XaQHUxoPPC4p89Lt5D
0hZUZDCgRiQMPju2nWUGvXO4FMOMutFlNskAIGsRLu4CnA10DtDmdjM1U9rzngoK
0B9apQprvQsdVsqRucGLrqS0Iym/wnVzAyTiHhp3hyOwHNHlLV6Yvb40s1pRLotn
Eih9bnxlYIqrvas8JObhgfBuhwrNtwRtDvDlKl1aBXuAL3t/JJsOh467hQ0CgYzn
Ugth+yVA8svxqHKtpukv/c6JQ9WK8q6QzjT6E/kRjfAZ2dsmmz7G7e+2FTxAeqbQ
MHfjuIZZZB+/738Gbfyy
=gHCP
-----END PGP SIGNATURE-----

--=-Y4qdUGQx/Q6Y4SaHH4yr--

