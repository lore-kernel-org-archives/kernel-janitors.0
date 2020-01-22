From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Date: Wed, 22 Jan 2020 11:09:50 +0000
Subject: Re: [PATCH][next] dmaengine: ti: k3-udma: fix spelling mistake "limted" -> "limited"
Message-Id: <e642e0c4-b712-a3de-1444-0c7de6243284@ti.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200122093818.2800743-1-colin.king@canonical.com>
In-Reply-To: <20200122093818.2800743-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Colin King <colin.king@canonical.com>, Vinod Koul <vkoul@kernel.org>, Dan Williams <dan.j.williams@intel.com>, Grygorii Strashko <grygorii.strashko@ti.com>, dmaengine@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Colin,

On 22/01/2020 11.38, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>=20
> There are spelling mistakes in dev_err messages. Fix them.

This slipped through, thanks for catching it!

Acked-by: Peter Ujfalusi <peter.ujfalusi@ti.com>

> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/dma/ti/k3-udma.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/dma/ti/k3-udma.c b/drivers/dma/ti/k3-udma.c
> index 9974e72cdc50..ea79c2df28e0 100644
> --- a/drivers/dma/ti/k3-udma.c
> +++ b/drivers/dma/ti/k3-udma.c
> @@ -2300,7 +2300,7 @@ udma_prep_slave_sg(struct dma_chan *chan, struct sc=
atterlist *sgl,
>  	/* static TR for remote PDMA */
>  	if (udma_configure_statictr(uc, d, dev_width, burst)) {
>  		dev_err(uc->ud->dev,
> -			"%s: StaticTR Z is limted to maximum 4095 (%u)\n",
> +			"%s: StaticTR Z is limited to maximum 4095 (%u)\n",
>  			__func__, d->static_tr.bstcnt);
> =20
>  		udma_free_hwdesc(uc, d);
> @@ -2483,7 +2483,7 @@ udma_prep_dma_cyclic(struct dma_chan *chan, dma_add=
r_t buf_addr, size_t buf_len,
>  	/* static TR for remote PDMA */
>  	if (udma_configure_statictr(uc, d, dev_width, burst)) {
>  		dev_err(uc->ud->dev,
> -			"%s: StaticTR Z is limted to maximum 4095 (%u)\n",
> +			"%s: StaticTR Z is limited to maximum 4095 (%u)\n",
>  			__func__, d->static_tr.bstcnt);
> =20
>  		udma_free_hwdesc(uc, d);
>=20

- P=C3=A9ter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
