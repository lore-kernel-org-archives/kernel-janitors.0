From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Date: Tue, 26 Nov 2019 13:31:55 +0000
Subject: Re: [PATCH] spi: pic32: Fix an error code in pic32_spi_dma_prep()
Message-Id: <a22ba950-f65b-b80e-948a-eddfa0a7d431@ti.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191126122324.v3rj7oscvjobhjxo@kili.mountain>
In-Reply-To: <20191126122324.v3rj7oscvjobhjxo@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org



On 26/11/2019 15.27, Geert Uytterhoeven wrote:
> Hi Dan,
>=20
> On Tue, Nov 26, 2019 at 1:51 PM Dan Carpenter <dan.carpenter@oracle.com> =
wrote:
>> We accidentally return success on this error path.
>>
>> Fixes: eb7e6dc6d9ff ("spi: pic32: Retire dma_request_slave_channel_compa=
t()")
>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>> ---
>>  drivers/spi/spi-pic32.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/spi/spi-pic32.c b/drivers/spi/spi-pic32.c
>> index 156961b4ca86..93fb95073522 100644
>> --- a/drivers/spi/spi-pic32.c
>> +++ b/drivers/spi/spi-pic32.c
>> @@ -633,7 +633,8 @@ static int pic32_spi_dma_prep(struct pic32_spi *pic3=
2s, struct device *dev)
>>                 goto out_err;
>>         }
>>
>> -       if (pic32_spi_dma_config(pic32s, DMA_SLAVE_BUSWIDTH_1_BYTE))
>> +       ret =3D pic32_spi_dma_config(pic32s, DMA_SLAVE_BUSWIDTH_1_BYTE);
>> +       if (ret)
>>                 goto out_err;
>=20
> This used to be non-fatal, as DMA was optional, cfr. the comment:
>=20
>         /* optional DMA support */
>         ret =3D pic32_spi_dma_prep(pic32s, &pdev->dev);
>         if (ret)
>                 goto err_bailout;
>=20
> However, as of the aforementioned commit, DMA is no longer optional,
> and probe will fail instead of falling back to PIO on DMA init failure...

It is still optional. It only handles deferred probing. If the DMA
request fails then it returns 0 and the driver falls back to PIO.

And this is why I have not changed the pic32_spi_dma_config() error
handling.

>=20
> Gr{oetje,eeting}s,
>=20
>                         Geert
>=20
>=20
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>=20
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds
>=20

- P=C3=A9ter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
