From: johannes thumshirn <morbidrsa@gmail.com>
Date: Fri, 28 Mar 2014 14:07:22 +0000
Subject: Re: [patch] iio: adc: checking for NULL instead of IS_ERR() in probe
Message-Id: <CAGH8bx77dKAm7w53F5MfTXaPm6KxQcVCXERnW-oXmR5Ww-HLTw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140328083126.GO25192@mwanda>
In-Reply-To: <20140328083126.GO25192@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-iio@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Mar 28, 2014 at 9:33 AM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> mcb_request_mem() returns an ERR_PTR(), it doesn't return NULL.
>
> Fixes: 74aeac4da66f ('iio: adc: Add MEN 16z188 ADC driver')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> diff --git a/drivers/iio/adc/men_z188_adc.c b/drivers/iio/adc/men_z188_adc.c
> index 6989c16..b58d630 100644
> --- a/drivers/iio/adc/men_z188_adc.c
> +++ b/drivers/iio/adc/men_z188_adc.c
> @@ -121,8 +121,8 @@ static int men_z188_probe(struct mcb_device *dev,
>         indio_dev->num_channels = ARRAY_SIZE(z188_adc_iio_channels);
>
>         mem = mcb_request_mem(dev, "z188-adc");
> -       if (!mem)
> -               return -ENOMEM;
> +       if (IS_ERR(mem))
> +               return PTR_ERR(mem);
>
>         adc->base = ioremap(mem->start, resource_size(mem));
>         if (adc->base = NULL)

Acked-by: Johannes Thumshirn <johannes.thumshirn@men.de>
