From: Jonathan Cameron <jic23@kernel.org>
Date: Sat, 30 Jan 2016 15:39:17 +0000
Subject: Re: [patch] iio: inkern: fix a NULL dereference on error
Message-Id: <56ACD925.3010006@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160126092521.GC15717@mwanda>
In-Reply-To: <20160126092521.GC15717@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Marek Belisko <marek@goldelico.com>
Cc: Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald <pmeerw@pmeerw.net>, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 26/01/16 09:25, Dan Carpenter wrote:
> In twl4030_bci_probe() there are some failure paths where we call
> iio_channel_release() with a NULL pointer.  (Apparently, that driver can
> opperate without a valid channel pointer).  Let's fix it by adding a
> NULL check in iio_channel_release().
> 
> Fixes: 2202e1fc5a29 ('drivers: power: twl4030_charger: fix link problems when building as module')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
Whilst I'd prefer to see the driver calling this have balanced
calls, I can see that having this sanity check in here is
probably sensible.

Applied to the fixes-togreg tree and marked for stable.

Jonathan
> diff --git a/drivers/iio/inkern.c b/drivers/iio/inkern.c
> index 80fbbfd..734a004 100644
> --- a/drivers/iio/inkern.c
> +++ b/drivers/iio/inkern.c
> @@ -349,6 +349,8 @@ EXPORT_SYMBOL_GPL(iio_channel_get);
>  
>  void iio_channel_release(struct iio_channel *channel)
>  {
> +	if (!channel)
> +		return;
>  	iio_device_put(channel->indio_dev);
>  	kfree(channel);
>  }
> --
> To unsubscribe from this list: send the line "unsubscribe linux-iio" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

