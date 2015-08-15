From: Jonathan Cameron <jic23@kernel.org>
Date: Sat, 15 Aug 2015 14:35:36 +0000
Subject: Re: [patch] iio: tsl4531: fix error handling in tsl4531_check_id()
Message-Id: <55CF4E38.70506@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150813202027.GA4385@mwanda>
In-Reply-To: <20150813202027.GA4385@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Peter Meerwald <pmeerw@pmeerw.net>
Cc: Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Dan Murphy <dmurphy@ti.com>, linux-iio@vger.kernel.org, kernel-janitors@vger.kernel.org

On 13/08/15 21:21, Dan Carpenter wrote:
> The caller expect us to return zero if the ID doesn't match.  Negative
> error codes are treated as success.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Whilst this does indeed fix the issue, I think I'd prefer changing the call
site to deal with the error properly. Could return -ENODEV directly
from the function to make the code cleaner.  Not quite the minimal fix
but only slightly worse and avoids reworking it again to pass the
error up correctly as it should do (after the fix is in place).

Jonathan
> 
> diff --git a/drivers/iio/light/tsl4531.c b/drivers/iio/light/tsl4531.c
> index 2697918..730fd2b 100644
> --- a/drivers/iio/light/tsl4531.c
> +++ b/drivers/iio/light/tsl4531.c
> @@ -151,7 +151,7 @@ static int tsl4531_check_id(struct i2c_client *client)
>  {
>  	int ret = i2c_smbus_read_byte_data(client, TSL4531_ID);
>  	if (ret < 0)
> -		return ret;
> +		return 0;
>  
>  	switch (ret >> TSL4531_ID_SHIFT) {
>  	case TSL45311_ID:
> --
> To unsubscribe from this list: send the line "unsubscribe linux-iio" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

