From: Dan Murphy <dmurphy@ti.com>
Date: Mon, 17 Aug 2015 15:05:19 +0000
Subject: Re: [patch v2] iio: tsl4531: fix error handling in tsl4531_check_id()
Message-Id: <55D1F82F.8020303@ti.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150817143832.GC23820@mwanda>
In-Reply-To: <20150817143832.GC23820@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Jonathan Cameron <jic23@kernel.org>
Cc: Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald <pmeerw@pmeerw.net>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-iio@vger.kernel.org, kernel-janitors@vger.kernel.org

Dan

On 08/17/2015 09:38 AM, Dan Carpenter wrote:
> tsl4531_check_id() returns 1 on "found", 0 on "not found" and negative
> if there is an error.  The bug here is that the error handling, treats
> errors as "found".
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> v2: slightly different fix
>
> diff --git a/drivers/iio/light/tsl4531.c b/drivers/iio/light/tsl4531.c
> index 2697918..fca0cb0 100644
> --- a/drivers/iio/light/tsl4531.c
> +++ b/drivers/iio/light/tsl4531.c
> @@ -180,7 +180,10 @@ static int tsl4531_probe(struct i2c_client *client,
>  	data->client = client;
>  	mutex_init(&data->lock);
>  
> -	if (!tsl4531_check_id(client)) {
> +	ret = tsl4531_check_id(client);
> +	if (ret < 0)
> +		return ret;
> +	if (ret = 0) {
>  		dev_err(&client->dev, "no TSL4531 sensor\n");
>  		return -ENODEV;
>  	}

Almost but not quite.  The suggestion from Jon and myself was to return 0 on device found and
non-zero on an error or not found.

In the check_id call I would probably do something like

    switch (ret >> TSL4531_ID_SHIFT) {
    case TSL45311_ID:
    case TSL45313_ID:
    case TSL45315_ID:
    case TSL45317_ID:
        return 0;
    default:
        return -ENODEV;
    }

You could probably just drop the default case all together and just have the call return -ENODEV

Then in probe you just need to do

if (tsl4531_check_id(client)) {
    return ret;

This way you will return the exact error.

Dan

-- 
------------------
Dan Murphy

