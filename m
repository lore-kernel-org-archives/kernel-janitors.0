From: Jonathan Cameron <jic23@cam.ac.uk>
Date: Thu, 06 Oct 2011 11:11:29 +0000
Subject: Re: [patch 2/2] Staging: iio/light/tsl2563: fix compile warning
Message-Id: <4E8D8CE1.4070201@cam.ac.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20111006061536.GB14701@elgon.mountain>
In-Reply-To: <20111006061536.GB14701@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Greg Kroah-Hartman <gregkh@suse.de>, Bryan Freed <bfreed@chromium.org>, Michael Hennerich <Michael.Hennerich@analog.com>, Arnd Bergmann <arnd@arndb.de>, linux-iio@vger.kernel.org, devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org

On 10/06/11 07:15, Dan Carpenter wrote:
> This fixes a compile warning:
> drivers/staging/iio/light/tsl2563.c:696:2:
> 	warning: initialization from incompatible pointer type [enabled by default]
> drivers/staging/iio/light/tsl2563.c:696:2:
> 	warning: (near initialization for ‘tsl2563_info.write_event_value’) [enabled by default]
> 
> The tsl2563_write_thresh() function returns zero on success and error
> codes on failure, so nothing is lost by making the return type int
> instead of ssize_t.
You are quite right. This is a silly cut and paste mistake on my part.
Thanks.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Acked-by: Jonathan Cameron <jic23@cam.ac.uk>
> 
> diff --git a/drivers/staging/iio/light/tsl2563.c b/drivers/staging/iio/light/tsl2563.c
> index 8977f58..a5e08b3 100644
> --- a/drivers/staging/iio/light/tsl2563.c
> +++ b/drivers/staging/iio/light/tsl2563.c
> @@ -569,7 +569,7 @@ static int tsl2563_read_thresh(struct iio_dev *indio_dev,
>  	return 0;
>  }
>  
> -static ssize_t tsl2563_write_thresh(struct iio_dev *indio_dev,
> +static int tsl2563_write_thresh(struct iio_dev *indio_dev,
>  				  u64 event_code,
>  				  int val)
>  {
> 

