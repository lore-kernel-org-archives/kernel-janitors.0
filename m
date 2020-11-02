From: Alex Williamson <alex.williamson@redhat.com>
Date: Mon, 02 Nov 2020 21:45:36 +0000
Subject: Re: [PATCH 1/2] vfio/fsl-mc: return -EFAULT if copy_to_user() fails
Message-Id: <20201102144536.42a0e066@w520.home>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201023113450.GH282278@mwanda>
In-Reply-To: <20201023113450.GH282278@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Diana Craciun <diana.craciun@oss.nxp.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Cornelia Huck <cohuck@redhat.com>, Bharat Bhushan <Bharat.Bhushan@nxp.com>, Eric Auger <eric.auger@redhat.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org


Thanks, Dan.

Diana, can I get an ack for this?  Thanks,

Alex

On Fri, 23 Oct 2020 14:34:50 +0300
Dan Carpenter <dan.carpenter@oracle.com> wrote:

> The copy_to_user() function returns the number of bytes remaining to be
> copied, but this code should return -EFAULT.
> 
> Fixes: df747bcd5b21 ("vfio/fsl-mc: Implement VFIO_DEVICE_GET_REGION_INFO ioctl call")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/vfio/fsl-mc/vfio_fsl_mc.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/vfio/fsl-mc/vfio_fsl_mc.c b/drivers/vfio/fsl-mc/vfio_fsl_mc.c
> index 0113a980f974..21f22e3da11f 100644
> --- a/drivers/vfio/fsl-mc/vfio_fsl_mc.c
> +++ b/drivers/vfio/fsl-mc/vfio_fsl_mc.c
> @@ -248,7 +248,9 @@ static long vfio_fsl_mc_ioctl(void *device_data, unsigned int cmd,
>  		info.size = vdev->regions[info.index].size;
>  		info.flags = vdev->regions[info.index].flags;
>  
> -		return copy_to_user((void __user *)arg, &info, minsz);
> +		if (copy_to_user((void __user *)arg, &info, minsz))
> +			return -EFAULT;
> +		return 0;
>  	}
>  	case VFIO_DEVICE_GET_IRQ_INFO:
>  	{
> @@ -267,7 +269,9 @@ static long vfio_fsl_mc_ioctl(void *device_data, unsigned int cmd,
>  		info.flags = VFIO_IRQ_INFO_EVENTFD;
>  		info.count = 1;
>  
> -		return copy_to_user((void __user *)arg, &info, minsz);
> +		if (copy_to_user((void __user *)arg, &info, minsz))
> +			return -EFAULT;
> +		return 0;
>  	}
>  	case VFIO_DEVICE_SET_IRQS:
>  	{
