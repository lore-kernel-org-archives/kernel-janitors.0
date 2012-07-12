From: Jonathan Cameron <jic23@kernel.org>
Date: Thu, 12 Jul 2012 19:24:02 +0000
Subject: Re: [patch] iio: double unlock on error path
Message-Id: <4FFF2452.5050003@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120711063443.GE11812@elgon.mountain>
In-Reply-To: <20120711063443.GE11812@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-iio@vger.kernel.org, kernel-janitors@vger.kernel.org

On 07/11/2012 07:34 AM, Dan Carpenter wrote:
> We should be holding the mutex when we goto error_free_chans.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
merged to fixes-togreg branch of
git://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git

and pull request sent.  Thanks.
> 
> diff --git a/drivers/iio/inkern.c b/drivers/iio/inkern.c
> index e2aded0..b5afc2f 100644
> --- a/drivers/iio/inkern.c
> +++ b/drivers/iio/inkern.c
> @@ -198,11 +198,12 @@ struct iio_channel *iio_channel_get_all(const char *name)
>  		iio_device_get(chans[mapind].indio_dev);
>  		mapind++;
>  	}
> -	mutex_unlock(&iio_map_list_lock);
>  	if (mapind = 0) {
>  		ret = -ENODEV;
>  		goto error_free_chans;
>  	}
> +	mutex_unlock(&iio_map_list_lock);
> +
>  	return chans;
>  
>  error_free_chans:
> 


