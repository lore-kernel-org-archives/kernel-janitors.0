From: Jonathan Cameron <jic23@cam.ac.uk>
Date: Thu, 06 Oct 2011 11:10:02 +0000
Subject: Re: [patch] Staging: iio/adc/ad7150: release lock on error
Message-Id: <4E8D8C8A.1000309@cam.ac.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20111006061700.GC14701@elgon.mountain>
In-Reply-To: <20111006061700.GC14701@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Greg Kroah-Hartman <gregkh@suse.de>, Michael Hennerich <michael.hennerich@analog.com>, Paul Gortmaker <paul.gortmaker@windriver.com>, Mike Frysinger <vapier@gentoo.org>, linux-iio@vger.kernel.org, devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org

On 10/06/11 07:17, Dan Carpenter wrote:
> The error_ret label should have been before the mutex_unlock().  It's
> a typo.
Good catch thanks!
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Acked-by: Jonathan Cameron <jic23@cam.ac.uk>
> 
> diff --git a/drivers/staging/iio/adc/ad7150.c b/drivers/staging/iio/adc/ad7150.c
> index 8943420..d1767d8 100644
> --- a/drivers/staging/iio/adc/ad7150.c
> +++ b/drivers/staging/iio/adc/ad7150.c
> @@ -332,8 +332,8 @@ static int ad7150_write_event_value(struct iio_dev *indio_dev,
>  	/* write back if active */
>  	ret = ad7150_write_event_params(indio_dev, event_code);
>  
> -	mutex_unlock(&chip->state_lock);
>  error_ret:
> +	mutex_unlock(&chip->state_lock);
>  	return ret;
>  }
>  
> 

