From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Date: Tue, 17 Nov 2020 07:24:41 +0000
Subject: Re: [PATCH] dmaengine: fix error codes in channel_register()
Message-Id: <2be1522e-17a8-7d3d-3fdf-f6e729b7740e@ti.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201113101631.GE168908@mwanda>
In-Reply-To: <20201113101631.GE168908@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <dan.carpenter@oracle.com>, Vinod Koul <vkoul@kernel.org>
Cc: Dave Jiang <dave.jiang@intel.com>, dmaengine@vger.kernel.org, kernel-janitors@vger.kernel.org

Dan,

On 13/11/2020 12.16, Dan Carpenter wrote:
> The error codes were not set on some of these error paths.
>=20
> Also the error handling was more confusing than it needed to be so I
> cleaned it up and shuffled it around a bit.

Nice catch,

Reviewed-by: Peter Ujfalusi <peter.ujfalusi@ti.com>

fwiw I did a boot test as well.

- P=C3=A9ter

> Fixes: d2fb0a043838 ("dmaengine: break out channel registration")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/dma/dmaengine.c | 17 +++++++++--------
>  1 file changed, 9 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/dma/dmaengine.c b/drivers/dma/dmaengine.c
> index 7974fa0400d8..962cbb5e5f7f 100644
> --- a/drivers/dma/dmaengine.c
> +++ b/drivers/dma/dmaengine.c
> @@ -1039,16 +1039,15 @@ static int get_dma_id(struct dma_device *device)
>  static int __dma_async_device_channel_register(struct dma_device *device,
>  					       struct dma_chan *chan)
>  {
> -	int rc =3D 0;
> +	int rc;
> =20
>  	chan->local =3D alloc_percpu(typeof(*chan->local));
>  	if (!chan->local)
> -		goto err_out;
> +		return -ENOMEM;
>  	chan->dev =3D kzalloc(sizeof(*chan->dev), GFP_KERNEL);
>  	if (!chan->dev) {
> -		free_percpu(chan->local);
> -		chan->local =3D NULL;
> -		goto err_out;
> +		rc =3D -ENOMEM;
> +		goto err_free_local;
>  	}
> =20
>  	/*
> @@ -1061,7 +1060,8 @@ static int __dma_async_device_channel_register(stru=
ct dma_device *device,
>  	if (chan->chan_id < 0) {
>  		pr_err("%s: unable to alloc ida for chan: %d\n",
>  		       __func__, chan->chan_id);
> -		goto err_out;
> +		rc =3D chan->chan_id;
> +		goto err_free_dev;
>  	}
> =20
>  	chan->dev->device.class =3D &dma_devclass;
> @@ -1082,9 +1082,10 @@ static int __dma_async_device_channel_register(str=
uct dma_device *device,
>  	mutex_lock(&device->chan_mutex);
>  	ida_free(&device->chan_ida, chan->chan_id);
>  	mutex_unlock(&device->chan_mutex);
> - err_out:
> -	free_percpu(chan->local);
> + err_free_dev:
>  	kfree(chan->dev);
> + err_free_local:
> +	free_percpu(chan->local);
>  	return rc;
>  }
> =20
>=20


Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
