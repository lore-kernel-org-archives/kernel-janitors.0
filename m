From: Sascha Hauer <s.hauer@pengutronix.de>
Date: Wed, 20 Oct 2010 06:35:42 +0000
Subject: Re: [PATCH] dma: imx-dma: fix signedness bug
Message-Id: <20101020063542.GD28242@pengutronix.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1287327110-9158-1-git-send-email-segooon@gmail.com> <AANLkTik15Z2_wyDRDOHOnpKKPgb+PHWs477esndgWmex@mail.gmail.com>
In-Reply-To: <AANLkTik15Z2_wyDRDOHOnpKKPgb+PHWs477esndgWmex@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Dan Williams <dan.j.williams@intel.com>
Cc: Vasiliy Kulikov <segooon@gmail.com>, kernel-janitors@vger.kernel.org, Linus Walleij <linus.walleij@stericsson.com>, linux-kernel@vger.kernel.org

On Tue, Oct 19, 2010 at 03:26:05PM -0700, Dan Williams wrote:
> On Sun, Oct 17, 2010 at 7:51 AM, Vasiliy Kulikov <segooon@gmail.com> wrot=
e:
> > mxdmac->channel was unsigned, so check (imxdmac->channel < 0) for
> > failed imx_dma_request_by_prio() made no sence. =A0Explicitly check
> > signed values.
> >
> > Signed-off-by: Vasiliy Kulikov <segooon@gmail.com>
> > ---
> > =A0drivers/dma/imx-dma.c | =A0 =A02 +-
> > =A01 files changed, 1 insertions(+), 1 deletions(-)
> >
> > diff --git a/drivers/dma/imx-dma.c b/drivers/dma/imx-dma.c
> > index 346be62..75d870f 100644
> > --- a/drivers/dma/imx-dma.c
> > +++ b/drivers/dma/imx-dma.c
> > @@ -335,7 +335,7 @@ static int __init imxdma_probe(struct platform_devi=
ce *pdev)
> >
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0imxdmac->imxdma_channel =3D imx_dma_requ=
est_by_prio("dmaengine",
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0DMA_PRIO=
_MEDIUM);
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (imxdmac->channel < 0)
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if ((int)imxdmac->channel < 0)
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0goto err_init;
>=20
> Should this be:
>=20
>                if ((int)imxdmac->channel < 0) {
>                        ret =3D -ENODEV;
>                        goto err_init;
>                }
>=20
> ...because I get the following in my compilation tests.

Yes, ret is clearly used uninitialized. I wonder why my gcc-4.3.2 compiler
does not warn me about this :(

Sascha

--=20
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
