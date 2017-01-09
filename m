From: Kirti Wankhede <kwankhede@nvidia.com>
Date: Mon, 09 Jan 2017 18:49:23 +0000
Subject: Re: [patch 1/3] vfio-mdev: return -EFAULT if copy_to_user() fails
Message-Id: <c6c454ab-0df8-d76f-90d7-0585fe80f2d3@nvidia.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170107062749.GA26959@elgon.mountain>
In-Reply-To: <20170107062749.GA26959@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: kvm@vger.kernel.org, kernel-janitors@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>


CC+= Alex to pull this change.

Reviewed by: Kirti Wankhede <kwankhede@nvidia.com>

Thanks,
Kirti

On 1/7/2017 11:57 AM, Dan Carpenter wrote:
> The copy_to_user() function returns the number of bytes which it wasn't
> able to copy but we want to return a negative error code.
> 
> Fixes: 9d1a546c53b4 ("docs: Sample driver to demonstrate how to use Mediated device framework.")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/samples/vfio-mdev/mtty.c b/samples/vfio-mdev/mtty.c
> index 919c10d5b12e..d2656ff569c1 100644
> --- a/samples/vfio-mdev/mtty.c
> +++ b/samples/vfio-mdev/mtty.c
> @@ -1180,7 +1180,10 @@ static long mtty_ioctl(struct mdev_device *mdev, unsigned int cmd,
>  
>  		memcpy(&mdev_state->dev_info, &info, sizeof(info));
>  
> -		return copy_to_user((void __user *)arg, &info, minsz);
> +		if (copy_to_user((void __user *)arg, &info, minsz))
> +			return -EFAULT;
> +
> +		return 0;
>  	}
>  	case VFIO_DEVICE_GET_REGION_INFO:
>  	{
> @@ -1201,7 +1204,10 @@ static long mtty_ioctl(struct mdev_device *mdev, unsigned int cmd,
>  		if (ret)
>  			return ret;
>  
> -		return copy_to_user((void __user *)arg, &info, minsz);
> +		if (copy_to_user((void __user *)arg, &info, minsz))
> +			return -EFAULT;
> +
> +		return 0;
>  	}
>  
>  	case VFIO_DEVICE_GET_IRQ_INFO:
> @@ -1224,7 +1230,10 @@ static long mtty_ioctl(struct mdev_device *mdev, unsigned int cmd,
>  		if (info.count = -1)
>  			return -EINVAL;
>  
> -		return copy_to_user((void __user *)arg, &info, minsz);
> +		if (copy_to_user((void __user *)arg, &info, minsz))
> +			return -EFAULT;
> +
> +		return 0;
>  	}
>  	case VFIO_DEVICE_SET_IRQS:
>  	{
> 
