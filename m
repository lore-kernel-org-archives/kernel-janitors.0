From: "Bounine, Alexandre" <Alexandre.Bounine@idt.com>
Date: Fri, 12 Feb 2016 12:55:46 +0000
Subject: RE: [patch] rapidio: mport_cdev: fix some error codes
Message-Id: <8D983423E7EDF846BB3056827B8CC5D15CFB9CF1@corpmail1.na.ads.idt.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160212063709.GA22756@mwanda>
In-Reply-To: <20160212063709.GA22756@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Matt Porter <mporter@kernel.crashing.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

Thank you.

Acked


> -----Original Message-----
> From: Dan Carpenter [mailto:dan.carpenter@oracle.com]
> Sent: Friday, February 12, 2016 1:37 AM
> To: Matt Porter; Bounine, Alexandre
> Cc: Andrew Morton; linux-kernel@vger.kernel.org; kernel-
> janitors@vger.kernel.org
> Subject: [patch] rapidio: mport_cdev: fix some error codes
> 
> copy_to_user() returns the number of bytes not copied but we want to
> return an error code.
> 
> Fixes: a45bfc36bf0d ('rapidio: add mport char device driver')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/rapidio/devices/rio_mport_cdev.c
> b/drivers/rapidio/devices/rio_mport_cdev.c
> index 6d56725..a3369d1 100644
> --- a/drivers/rapidio/devices/rio_mport_cdev.c
> +++ b/drivers/rapidio/devices/rio_mport_cdev.c
> @@ -2140,9 +2140,10 @@ static long mport_cdev_ioctl(struct file *filp,
>  		return maint_port_idx_get(data, (void __user *)arg);
>  	case RIO_MPORT_GET_PROPERTIES:
>  		md->properties.hdid = md->mport->host_deviceid;
> -		err = copy_to_user((void __user *)arg, &(data->md-
> >properties),
> -				   sizeof(data->md->properties));
> -		break;
> +		if (copy_to_user((void __user *)arg, &(data->md-
> >properties),
> +				 sizeof(data->md->properties)))
> +			return -EFAULT;
> +		return 0;
>  	case RIO_ENABLE_DOORBELL_RANGE:
>  		return rio_mport_add_db_filter(data, (void __user *)arg);
>  	case RIO_DISABLE_DOORBELL_RANGE:
> @@ -2155,8 +2156,10 @@ static long mport_cdev_ioctl(struct file *filp,
>  		data->event_mask = arg;
>  		return 0;
>  	case RIO_GET_EVENT_MASK:
> -		return copy_to_user((void __user *)arg, &data->event_mask,
> -				    sizeof(data->event_mask));
> +		if (copy_to_user((void __user *)arg, &data->event_mask,
> +				    sizeof(data->event_mask)))
> +			return -EFAULT;
> +		return 0;
>  	case RIO_MAP_OUTBOUND:
>  		return rio_mport_obw_map(filp, (void __user *)arg);
>  	case RIO_MAP_INBOUND:
