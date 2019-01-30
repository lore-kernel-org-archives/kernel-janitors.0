From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 30 Jan 2019 09:32:50 +0000
Subject: Re: [PATCH][next] mtd: rawnand: meson: fix missing assignment of ret on a call to meson_chip_buffer_
Message-Id: <20190130103250.4080a3b3@xps13>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190129105757.19138-1-colin.king@canonical.com>
 <aeadd16e-ed46-28f2-15de-66d1d9f1ed11@amlogic.com>
In-Reply-To: <aeadd16e-ed46-28f2-15de-66d1d9f1ed11@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Liang Yang <liang.yang@amlogic.com>
Cc: Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>, Colin King <colin.king@canonical.com>, linux-amlogic@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org

Hi Liang, Colin,

Liang Yang <liang.yang@amlogic.com> wrote on Wed, 30 Jan 2019 17:26:49
+0800:

> Hi Colin,
>=20
> On 2019/1/29 18:57, Colin King wrote:
> > From: Colin Ian King <colin.king@canonical.com>
> >=20
> > The call to meson_chip_buffer_init is not assigning ret, however, ret
> > is being checked for failure. Fix this by adding in the missing assignm=
ent.
> >=20
> > Fixes: 2d570b34b41a ("mtd: rawnand: meson: add support for Amlogic NAND=
 flash controller")
> > Signed-off-by: Colin Ian King <colin.king@canonical.com>
> > ---
> >   drivers/mtd/nand/raw/meson_nand.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/mtd/nand/raw/meson_nand.c b/drivers/mtd/nand/raw/m=
eson_nand.c
> > index e858d58d97b0..b9c543d1054c 100644
> > --- a/drivers/mtd/nand/raw/meson_nand.c
> > +++ b/drivers/mtd/nand/raw/meson_nand.c
> > @@ -1206,7 +1206,7 @@ static int meson_nand_attach_chip(struct nand_chi=
p *nand)
> >   		dev_err(nfc->dev, "16bits bus width not supported");
> >   		return -EINVAL;
> >   	}
> > -	meson_chip_buffer_init(nand);
> > +	ret =3D meson_chip_buffer_init(nand); =20
>=20
> Looks good to me:
>=20
> Acked-by: Liang Yang <liang.yang@amlogic.com>

This is nand/next material, so if you don't mind I would like to squash
the two fixes you sent into the original commit inserting the driver.


Thanks,
Miqu=C3=A8l
