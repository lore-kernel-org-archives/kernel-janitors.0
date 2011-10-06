From: Jonathan Cameron <jic23@cam.ac.uk>
Date: Thu, 06 Oct 2011 11:24:20 +0000
Subject: Re: [patch 1/2] Staging: iio/light/tsl2563: unlock on an error path
Message-Id: <4E8D8FE4.9080907@cam.ac.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20111006061503.GA14701@elgon.mountain>
In-Reply-To: <20111006061503.GA14701@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Greg Kroah-Hartman <gregkh@suse.de>, Bryan Freed <bfreed@chromium.org>, Michael Hennerich <Michael.Hennerich@analog.com>, Arnd Bergmann <arnd@arndb.de>, linux-iio@vger.kernel.org, devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org

On 10/06/11 07:15, Dan Carpenter wrote:
> We need to unlock here before returning.
Thanks
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Acked-by: Jonathan Cameron <jic23@cam.ac.uk>
> 
> diff --git a/drivers/staging/iio/light/tsl2563.c b/drivers/staging/iio/light/tsl2563.c
> index 3707772..8977f58 100644
> --- a/drivers/staging/iio/light/tsl2563.c
> +++ b/drivers/staging/iio/light/tsl2563.c
> @@ -518,7 +518,8 @@ static int tsl2563_read_raw(struct iio_dev *indio_dev,
>  		ret = IIO_VAL_INT;
>  		break;
>  	default:
> -		return -EINVAL;
> +		ret = -EINVAL;
> +		goto error_ret;
>  	}
>  
>  error_ret:
> 

