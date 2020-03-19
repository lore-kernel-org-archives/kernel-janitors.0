From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Date: Thu, 19 Mar 2020 19:43:01 +0000
Subject: Re: [PATCH V2] dmaengine: ti: k3-udma-glue: Fix an error handling path in 'k3_udma_glue_cfg_rx_flow(
Message-Id: <6dbe8b04-a64b-f9c7-e620-a6002045ccb6@ti.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200318191209.1267-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200318191209.1267-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, vkoul@kernel.org, dan.j.williams@intel.com, grygorii.strashko@ti.com
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi Christophe,

On 18/03/2020 21.12, Christophe JAILLET wrote:
> All but one error handling paths in the 'k3_udma_glue_cfg_rx_flow()'
> function 'goto err' and call 'k3_udma_glue_release_rx_flow()'.
>=20
> This not correct because this function has a 'channel->flows_ready--;' at
> the end, but 'flows_ready' has not been incremented here, when we branch =
to
> the error handling path.
>=20
> In order to keep a correct value in 'flows_ready', un-roll
> 'k3_udma_glue_release_rx_flow()', simplify it, add some labels and branch
> at the correct places when an error is detected.
>=20
> Doing so, we also NULLify 'flow->udma_rflow' in a path that was lacking i=
t.
>=20
> Fixes: d70241913413 ("dmaengine: ti: k3-udma: Add glue layer for non DMAe=
ngine user")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> V2: adjust subject
>     direct return in the first error handling path

Thank you!

Acked-by: Peter Ujfalusi <peter.ujfalusi@ti.com>

> ---
>  drivers/dma/ti/k3-udma-glue.c | 30 ++++++++++++++++++++----------
>  1 file changed, 20 insertions(+), 10 deletions(-)
>=20
> diff --git a/drivers/dma/ti/k3-udma-glue.c b/drivers/dma/ti/k3-udma-glue.c
> index dbccdc7c0ed5..890573eb1625 100644
> --- a/drivers/dma/ti/k3-udma-glue.c
> +++ b/drivers/dma/ti/k3-udma-glue.c
> @@ -578,12 +578,12 @@ static int k3_udma_glue_cfg_rx_flow(struct k3_udma_=
glue_rx_channel *rx_chn,
>  	if (IS_ERR(flow->udma_rflow)) {
>  		ret =3D PTR_ERR(flow->udma_rflow);
>  		dev_err(dev, "UDMAX rflow get err %d\n", ret);
> -		goto err;
> +		return ret;
>  	}
> =20
>  	if (flow->udma_rflow_id !=3D xudma_rflow_get_id(flow->udma_rflow)) {
> -		xudma_rflow_put(rx_chn->common.udmax, flow->udma_rflow);
> -		return -ENODEV;
> +		ret =3D -ENODEV;
> +		goto err_rflow_put;
>  	}
> =20
>  	/* request and cfg rings */
> @@ -592,7 +592,7 @@ static int k3_udma_glue_cfg_rx_flow(struct k3_udma_gl=
ue_rx_channel *rx_chn,
>  	if (!flow->ringrx) {
>  		ret =3D -ENODEV;
>  		dev_err(dev, "Failed to get RX ring\n");
> -		goto err;
> +		goto err_rflow_put;
>  	}
> =20
>  	flow->ringrxfdq =3D k3_ringacc_request_ring(rx_chn->common.ringacc,
> @@ -600,19 +600,19 @@ static int k3_udma_glue_cfg_rx_flow(struct k3_udma_=
glue_rx_channel *rx_chn,
>  	if (!flow->ringrxfdq) {
>  		ret =3D -ENODEV;
>  		dev_err(dev, "Failed to get RXFDQ ring\n");
> -		goto err;
> +		goto err_ringrx_free;
>  	}
> =20
>  	ret =3D k3_ringacc_ring_cfg(flow->ringrx, &flow_cfg->rx_cfg);
>  	if (ret) {
>  		dev_err(dev, "Failed to cfg ringrx %d\n", ret);
> -		goto err;
> +		goto err_ringrxfdq_free;
>  	}
> =20
>  	ret =3D k3_ringacc_ring_cfg(flow->ringrxfdq, &flow_cfg->rxfdq_cfg);
>  	if (ret) {
>  		dev_err(dev, "Failed to cfg ringrxfdq %d\n", ret);
> -		goto err;
> +		goto err_ringrxfdq_free;
>  	}
> =20
>  	if (rx_chn->remote) {
> @@ -662,7 +662,7 @@ static int k3_udma_glue_cfg_rx_flow(struct k3_udma_gl=
ue_rx_channel *rx_chn,
>  	if (ret) {
>  		dev_err(dev, "flow%d config failed: %d\n", flow->udma_rflow_id,
>  			ret);
> -		goto err;
> +		goto err_ringrxfdq_free;
>  	}
> =20
>  	rx_chn->flows_ready++;
> @@ -670,8 +670,17 @@ static int k3_udma_glue_cfg_rx_flow(struct k3_udma_g=
lue_rx_channel *rx_chn,
>  		flow->udma_rflow_id, rx_chn->flows_ready);
> =20
>  	return 0;
> -err:
> -	k3_udma_glue_release_rx_flow(rx_chn, flow_idx);
> +
> +err_ringrxfdq_free:
> +	k3_ringacc_ring_free(flow->ringrxfdq);
> +
> +err_ringrx_free:
> +	k3_ringacc_ring_free(flow->ringrx);
> +
> +err_rflow_put:
> +	xudma_rflow_put(rx_chn->common.udmax, flow->udma_rflow);
> +	flow->udma_rflow =3D NULL;
> +
>  	return ret;
>  }
> =20
>=20

- P=C3=A9ter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
