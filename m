From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Date: Thu, 09 Jan 2020 15:33:07 +0000
Subject: Re: [PATCH][next][V2] dmaengine: ti: omap-dma: don't allow a null od->plat pointer to be dereference
Message-Id: <7e396a66-41d0-ace8-41b5-1018e6d9d095@ti.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200109131953.157154-1-colin.king@canonical.com>
In-Reply-To: <20200109131953.157154-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Colin King <colin.king@canonical.com>, Vinod Koul <vkoul@kernel.org>, Dan Williams <dan.j.williams@intel.com>, Tony Lindgren <tony@atomide.com>, dmaengine@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Colin,

On 09/01/2020 15.19, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>=20
> Currently when the call to dev_get_platdata returns null the driver issues
> a warning and then later dereferences the null pointer.  Avoid this issue
> by returning -ENODEV errror rather when the platform data is null and
> change the warning to an appropriate error message.

Thank you for the update!

Acked-by: Peter Ujfalusi <peter.ujfalusi@ti.com>

> Addresses-Coverity: ("Dereference after null check")
> Fixes: 211010aeb097 ("dmaengine: ti: omap-dma: Pass sdma auxdata to drive=
r and use it")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>=20
> V2: return -ENODEV and change warning to an error message as suggested by
>     Peter Ujfalusi.
> ---
>  drivers/dma/ti/omap-dma.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/dma/ti/omap-dma.c b/drivers/dma/ti/omap-dma.c
> index fc8f7b2fc7b3..a93515015dce 100644
> --- a/drivers/dma/ti/omap-dma.c
> +++ b/drivers/dma/ti/omap-dma.c
> @@ -1658,8 +1658,10 @@ static int omap_dma_probe(struct platform_device *=
pdev)
>  	if (conf) {
>  		od->cfg =3D conf;
>  		od->plat =3D dev_get_platdata(&pdev->dev);
> -		if (!od->plat)
> -			dev_warn(&pdev->dev, "no sdma auxdata needed?\n");
> +		if (!od->plat) {
> +			dev_err(&pdev->dev, "omap_system_dma_plat_info is missing");
> +			return -ENODEV;
> +		}
>  	} else {
>  		od->cfg =3D &default_cfg;
> =20
>=20

- P=C3=A9ter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
