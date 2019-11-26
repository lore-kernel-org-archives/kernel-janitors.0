From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Date: Tue, 26 Nov 2019 13:33:31 +0000
Subject: Re: [PATCH] spi: pic32: Fix an error code in pic32_spi_dma_prep()
Message-Id: <75428132-6ff4-b4c4-466d-6cc0e12f4250@ti.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191126122324.v3rj7oscvjobhjxo@kili.mountain>
In-Reply-To: <20191126122324.v3rj7oscvjobhjxo@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org



On 26/11/2019 14.23, Dan Carpenter wrote:
> We accidentally return success on this error path.
>=20
> Fixes: eb7e6dc6d9ff ("spi: pic32: Retire dma_request_slave_channel_compat=
()")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/spi/spi-pic32.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/spi/spi-pic32.c b/drivers/spi/spi-pic32.c
> index 156961b4ca86..93fb95073522 100644
> --- a/drivers/spi/spi-pic32.c
> +++ b/drivers/spi/spi-pic32.c
> @@ -633,7 +633,8 @@ static int pic32_spi_dma_prep(struct pic32_spi *pic32=
s, struct device *dev)
>  		goto out_err;
>  	}
> =20
> -	if (pic32_spi_dma_config(pic32s, DMA_SLAVE_BUSWIDTH_1_BYTE))
> +	ret =3D pic32_spi_dma_config(pic32s, DMA_SLAVE_BUSWIDTH_1_BYTE);
> +	if (ret)
>  		goto out_err;

I have intentionally left it like this to fall back to PIO mode in case
of an error as the original implementation did.

With commit eb7e6dc6d9ff the driver _only_ handles the -EPROBE_DEFER, in
all other cases it falls back to PIO mode.

> =20
>  	/* DMA chnls allocated and prepared */
>=20

- P=C3=A9ter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
