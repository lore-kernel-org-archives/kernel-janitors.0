From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Date: Thu, 27 Feb 2020 07:33:26 +0000
Subject: Re: [PATCH][next] dmaengine: ti: edma: fix null dereference because of a typo in pointer name
Message-Id: <d7b23176-2e0c-e771-74a7-432123f74dcb@ti.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200226185921.351693-1-colin.king@canonical.com>
In-Reply-To: <20200226185921.351693-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Colin King <colin.king@canonical.com>, Dan Williams <dan.j.williams@intel.com>, Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Colin,

On 26/02/2020 20.59, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>=20
> Currently there is a dereference of the null pointer m_ddev.  This appears
> to be a typo on the pointer, I believe s_ddev should be used instead.
> Fix this by using the correct pointer.

Thank you for catching it!
This is a mostly unused case to keep supporting the legacy EDMA binding
which should be gone by now for some time, but there might be boards out
there still booting in that way...

I have copied the dma_cap_set() line from the testable code path.

Acked-by: Peter Ujfalusi <peter.ujfalusi@ti.com>

> Addresses-Coverity: ("Explicit null dereferenced")
> Fixes: eb0249d50153 ("dmaengine: ti: edma: Support for interleaved mem to=
 mem transfer")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/dma/ti/edma.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/dma/ti/edma.c b/drivers/dma/ti/edma.c
> index 2b1fdd438e7f..c4a5c170c1f9 100644
> --- a/drivers/dma/ti/edma.c
> +++ b/drivers/dma/ti/edma.c
> @@ -1992,7 +1992,7 @@ static void edma_dma_init(struct edma_cc *ecc, bool=
 legacy_mode)
>  			 "Legacy memcpy is enabled, things might not work\n");
> =20
>  		dma_cap_set(DMA_MEMCPY, s_ddev->cap_mask);
> -		dma_cap_set(DMA_INTERLEAVE, m_ddev->cap_mask);
> +		dma_cap_set(DMA_INTERLEAVE, s_ddev->cap_mask);
>  		s_ddev->device_prep_dma_memcpy =3D edma_prep_dma_memcpy;
>  		s_ddev->device_prep_interleaved_dma =3D edma_prep_dma_interleaved;
>  		s_ddev->directions =3D BIT(DMA_MEM_TO_MEM);
>=20

- P=C3=A9ter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
