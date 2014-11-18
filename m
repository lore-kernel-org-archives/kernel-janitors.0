From: Lee Jones <lee.jones@linaro.org>
Date: Tue, 18 Nov 2014 15:53:57 +0000
Subject: Re: [patch 2/2 -next] mfd: dln2: a couple endian fixes
Message-Id: <20141118155357.GC13959@x1>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20141113103607.GB17038@mwanda>
In-Reply-To: <20141113103607.GB17038@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Samuel Ortiz <sameo@linux.intel.com>, Octavian Purdila <octavian.purdila@intel.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, 13 Nov 2014, Dan Carpenter wrote:

> Sparse catches a couple endian bugs.
>=20
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> Not tested.

Applied until someone screams.

> diff --git a/drivers/mfd/dln2.c b/drivers/mfd/dln2.c
> index 3101e5e..babf7b6 100644
> --- a/drivers/mfd/dln2.c
> +++ b/drivers/mfd/dln2.c
> @@ -437,6 +437,7 @@ static int _dln2_transfer(struct dln2_dev *dln2, u16 =
handle, u16 cmd,
>  	struct device *dev =3D &dln2->interface->dev;
>  	const unsigned long timeout =3D DLN2_USB_TIMEOUT * HZ / 1000;
>  	struct dln2_mod_rx_slots *rxs =3D &dln2->mod_rx_slots[handle];
> +	int size;
> =20
>  	spin_lock(&dln2->disconnect_lock);
>  	if (!dln2->disconnect)
> @@ -476,8 +477,9 @@ static int _dln2_transfer(struct dln2_dev *dln2, u16 =
handle, u16 cmd,
> =20
>  	/* if we got here we know that the response header has been checked */
>  	rsp =3D rxc->urb->transfer_buffer;
> +	size =3D le16_to_cpu(rsp->hdr.size);
> =20
> -	if (rsp->hdr.size < sizeof(*rsp)) {
> +	if (size < sizeof(*rsp)) {
>  		ret =3D -EPROTO;
>  		goto out_free_rx_slot;
>  	}
> @@ -494,8 +496,8 @@ static int _dln2_transfer(struct dln2_dev *dln2, u16 =
handle, u16 cmd,
>  		goto out_free_rx_slot;
>  	}
> =20
> -	if (*ibuf_len > rsp->hdr.size - sizeof(*rsp))
> -		*ibuf_len =3D rsp->hdr.size - sizeof(*rsp);
> +	if (*ibuf_len > size - sizeof(*rsp))
> +		*ibuf_len =3D size - sizeof(*rsp);
> =20
>  	memcpy(ibuf, rsp + 1, *ibuf_len);
> =20

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
