From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Date: Mon, 23 Oct 2017 08:22:34 +0000
Subject: Re: [PATCH] dmaengine: edma: Use common error handling code in three functions
Message-Id: <8f0f98be-fc6b-cdce-acf6-22852fda02a1@ti.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cb8f32ef-14c1-35cb-39aa-d3efa265dccf@users.sourceforge.net>
In-Reply-To: <cb8f32ef-14c1-35cb-39aa-d3efa265dccf@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: SF Markus Elfring <elfring@users.sourceforge.net>, dmaengine@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>, Vinod Koul <vinod.koul@intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org



On 2017-10-22 17:54, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sun, 22 Oct 2017 16:46:34 +0200
>=20
> Add a jump target so that a bit of exception handling can be better reused
> at the end of these functions.
>=20
> This issue was detected by using the Coccinelle software.

Acked-by: Peter Ujfalusi <peter.ujfalusi@ti.com>

> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/dma/edma.c | 45 +++++++++++++++++++++++----------------------
>  1 file changed, 23 insertions(+), 22 deletions(-)
>=20
> diff --git a/drivers/dma/edma.c b/drivers/dma/edma.c
> index a7ea20e7b8e9..c973ea97467f 100644
> --- a/drivers/dma/edma.c
> +++ b/drivers/dma/edma.c
> @@ -1091,10 +1091,9 @@ static struct dma_async_tx_descriptor *edma_prep_s=
lave_sg(
>  			echan->slot[i] >  				edma_alloc_slot(echan->ecc, EDMA_SLOT_ANY);
>  			if (echan->slot[i] < 0) {
> -				kfree(edesc);
>  				dev_err(dev, "%s: Failed to allocate slot\n",
>  					__func__);
> -				return NULL;
> +				goto free_desc;
>  			}
>  		}
>  	}
> @@ -1110,10 +1109,8 @@ static struct dma_async_tx_descriptor *edma_prep_s=
lave_sg(
>  		ret =3D edma_config_pset(chan, &edesc->pset[i], src_addr,
>  				       dst_addr, burst, dev_width,
>  				       sg_dma_len(sg), direction);
> -		if (ret < 0) {
> -			kfree(edesc);
> -			return NULL;
> -		}
> +		if (ret < 0)
> +			goto free_desc;
> =20
>  		edesc->absync =3D ret;
>  		edesc->residue +=3D sg_dma_len(sg);
> @@ -1133,6 +1130,10 @@ static struct dma_async_tx_descriptor *edma_prep_s=
lave_sg(
>  	edesc->residue_stat =3D edesc->residue;
> =20
>  	return vchan_tx_prep(&echan->vchan, &edesc->vdesc, tx_flags);
> +
> +free_desc:
> +	kfree(edesc);
> +	return NULL;
>  }
> =20
>  static struct dma_async_tx_descriptor *edma_prep_dma_memcpy(
> @@ -1203,10 +1204,8 @@ static struct dma_async_tx_descriptor *edma_prep_d=
ma_memcpy(
> =20
>  	ret =3D edma_config_pset(chan, &edesc->pset[0], src, dest, 1,
>  			       width, pset_len, DMA_MEM_TO_MEM);
> -	if (ret < 0) {
> -		kfree(edesc);
> -		return NULL;
> -	}
> +	if (ret < 0)
> +		goto free_desc;
> =20
>  	edesc->absync =3D ret;
> =20
> @@ -1222,10 +1221,9 @@ static struct dma_async_tx_descriptor *edma_prep_d=
ma_memcpy(
>  			echan->slot[1] =3D edma_alloc_slot(echan->ecc,
>  							 EDMA_SLOT_ANY);
>  			if (echan->slot[1] < 0) {
> -				kfree(edesc);
>  				dev_err(dev, "%s: Failed to allocate slot\n",
>  					__func__);
> -				return NULL;
> +				goto free_desc;
>  			}
>  		}
>  		dest +=3D pset_len;
> @@ -1234,16 +1232,18 @@ static struct dma_async_tx_descriptor *edma_prep_=
dma_memcpy(
> =20
>  		ret =3D edma_config_pset(chan, &edesc->pset[1], src, dest, 1,
>  				       width, pset_len, DMA_MEM_TO_MEM);
> -		if (ret < 0) {
> -			kfree(edesc);
> -			return NULL;
> -		}
> +		if (ret < 0)
> +			goto free_desc;
> =20
>  		edesc->pset[1].param.opt |=3D ITCCHEN;
>  		edesc->pset[1].param.opt |=3D TCINTEN;
>  	}
> =20
>  	return vchan_tx_prep(&echan->vchan, &edesc->vdesc, tx_flags);
> +
> +free_desc:
> +	kfree(edesc);
> +	return NULL;
>  }
> =20
>  static struct dma_async_tx_descriptor *edma_prep_dma_cyclic(
> @@ -1334,10 +1334,9 @@ static struct dma_async_tx_descriptor *edma_prep_d=
ma_cyclic(
>  			echan->slot[i] >  				edma_alloc_slot(echan->ecc, EDMA_SLOT_ANY);
>  			if (echan->slot[i] < 0) {
> -				kfree(edesc);
>  				dev_err(dev, "%s: Failed to allocate slot\n",
>  					__func__);
> -				return NULL;
> +				goto free_desc;
>  			}
>  		}
> =20
> @@ -1350,10 +1349,8 @@ static struct dma_async_tx_descriptor *edma_prep_d=
ma_cyclic(
>  		ret =3D edma_config_pset(chan, &edesc->pset[i], src_addr,
>  				       dst_addr, burst, dev_width, period_len,
>  				       direction);
> -		if (ret < 0) {
> -			kfree(edesc);
> -			return NULL;
> -		}
> +		if (ret < 0)
> +			goto free_desc;
> =20
>  		if (direction =3D DMA_DEV_TO_MEM)
>  			dst_addr +=3D period_len;
> @@ -1402,6 +1399,10 @@ static struct dma_async_tx_descriptor *edma_prep_d=
ma_cyclic(
>  		edma_assign_channel_eventq(echan, EVENTQ_0);
> =20
>  	return vchan_tx_prep(&echan->vchan, &edesc->vdesc, tx_flags);
> +
> +free_desc:
> +	kfree(edesc);
> +	return NULL;
>  }
> =20
>  static void edma_completion_handler(struct edma_chan *echan)
>=20

- P=C3=A9ter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
