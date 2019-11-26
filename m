From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Date: Tue, 26 Nov 2019 13:55:25 +0000
Subject: Re: [PATCH] spi: pic32: Add a comment in pic32_spi_dma_prep()
Message-Id: <67ddc7f2-c67e-708b-0932-af425db04604@ti.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191126135025.mligekonmv2u6dcl@kili.mountain>
In-Reply-To: <20191126135025.mligekonmv2u6dcl@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

Hi Dan,

On 26/11/2019 15.50, Dan Carpenter wrote:
> This code triggers a static checker warning about missed error codes.
> It's slightly tricky that we fall back to PIO so let's silence the
> checker and add a comment for anyone who is confused.
>=20
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> I won't feel offended at all if people don't think it's worth applying
> this patch.
>=20
>  drivers/spi/spi-pic32.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/spi/spi-pic32.c b/drivers/spi/spi-pic32.c
> index 156961b4ca86..835380ab8bf2 100644
> --- a/drivers/spi/spi-pic32.c
> +++ b/drivers/spi/spi-pic32.c
> @@ -633,8 +633,10 @@ static int pic32_spi_dma_prep(struct pic32_spi *pic3=
2s, struct device *dev)
>  		goto out_err;
>  	}
> =20
> -	if (pic32_spi_dma_config(pic32s, DMA_SLAVE_BUSWIDTH_1_BYTE))
> +	if (pic32_spi_dma_config(pic32s, DMA_SLAVE_BUSWIDTH_1_BYTE)) {
> +		ret =3D 0;  /* Fall back to PIO if DMA fails. */

The 'ret' is initialized to 0 in the function to handle this.
After looking at the code again I see that pic32_spi_dma_config() does
error prints for failures.

A comment might be enough here if it is even needed.

>  		goto out_err;
> +	}
> =20
>  	/* DMA chnls allocated and prepared */
>  	set_bit(PIC32F_DMA_PREP, &pic32s->flags);
>=20

- P=C3=A9ter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
