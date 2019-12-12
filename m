From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Date: Thu, 12 Dec 2019 11:54:37 +0000
Subject: Re: [PATCH -next] dmaengine: ti: edma: Fix error return code in edma_probe()
Message-Id: <abdbcd13-eb2f-fb13-2f6b-a748c0b1bc7c@ti.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191212114622.127322-1-weiyongjun1@huawei.com>
In-Reply-To: <20191212114622.127322-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Wei Yongjun <weiyongjun1@huawei.com>, Dan Williams <dan.j.williams@intel.com>, Vinod Koul <vkoul@kernel.org>, Chuhong Yuan <hslester96@gmail.com>, Arnd Bergmann <arnd@arndb.de>, YueHaibing <yuehaibing@huawei.com>
Cc: dmaengine@vger.kernel.org, kernel-janitors@vger.kernel.org



On 12/12/2019 13.46, Wei Yongjun wrote:
> Fix to return negative error code -ENOMEM from the error handling
> case instead of 0, as done elsewhere in this function.

Acked-by: Peter Ujfalusi <peter.ujfalusi@ti.com>

>=20
> Fixes: 2a03c1314506 ("dmaengine: ti: edma: add missed operations")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/dma/ti/edma.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/dma/ti/edma.c b/drivers/dma/ti/edma.c
> index 0628ee4bf1b4..03a7f647f7b2 100644
> --- a/drivers/dma/ti/edma.c
> +++ b/drivers/dma/ti/edma.c
> @@ -2342,8 +2342,10 @@ static int edma_probe(struct platform_device *pdev)
>  	ecc->channels_mask =3D devm_kcalloc(dev,
>  					   BITS_TO_LONGS(ecc->num_channels),
>  					   sizeof(unsigned long), GFP_KERNEL);
> -	if (!ecc->slave_chans || !ecc->slot_inuse || !ecc->channels_mask)
> +	if (!ecc->slave_chans || !ecc->slot_inuse || !ecc->channels_mask) {
> +		ret =3D -ENOMEM;
>  		goto err_disable_pm;
> +	}
> =20
>  	/* Mark all channels available initially */
>  	bitmap_fill(ecc->channels_mask, ecc->num_channels);
>=20
>=20
>=20

- P=C3=A9ter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
