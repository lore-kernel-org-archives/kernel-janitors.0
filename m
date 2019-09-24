From: Paul Cercueil <paul@crapouillou.net>
Date: Tue, 24 Sep 2019 19:32:32 +0000
Subject: Re: [PATCH] dmaengine: jz4780: Use devm_platform_ioremap_resource() in jz4780_dma_probe()
Message-Id: <1569353552.1911.0@crapouillou.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5dd19f28-349a-4957-ea3a-6aebbd7c97e2@web.de>
In-Reply-To: <5dd19f28-349a-4957-ea3a-6aebbd7c97e2@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Markus Elfring <Markus.Elfring@web.de>
Cc: dmaengine@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>, Vinod Koul <vkoul@kernel.org>, Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Alex Smith <alex.smith@imgtec.com>

Hi Markus,


Le dim. 22 sept. 2019 =E0 11:25, Markus Elfring <Markus.Elfring@web.de>=20
a =E9crit :
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sun, 22 Sep 2019 11:18:27 +0200
>=20
> Simplify this function implementation a bit by using
> a known wrapper function.
>=20
> This issue was detected by using the Coccinelle software.
>=20
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Looks good to me.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>


> ---
>  drivers/dma/dma-jz4780.c | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
>=20
> diff --git a/drivers/dma/dma-jz4780.c b/drivers/dma/dma-jz4780.c
> index cafb1cc065bb..f42b3ef8e036 100644
> --- a/drivers/dma/dma-jz4780.c
> +++ b/drivers/dma/dma-jz4780.c
> @@ -858,13 +858,7 @@ static int jz4780_dma_probe(struct=20
> platform_device *pdev)
>  	jzdma->soc_data =3D soc_data;
>  	platform_set_drvdata(pdev, jzdma);
>=20
> -	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	if (!res) {
> -		dev_err(dev, "failed to get I/O memory\n");
> -		return -EINVAL;
> -	}
> -
> -	jzdma->chn_base =3D devm_ioremap_resource(dev, res);
> +	jzdma->chn_base =3D devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(jzdma->chn_base))
>  		return PTR_ERR(jzdma->chn_base);
>=20
> --
> 2.23.0
>=20
