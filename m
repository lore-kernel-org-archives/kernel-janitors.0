From: Diana Craciun OSS <diana.craciun@oss.nxp.com>
Date: Tue, 03 Nov 2020 12:01:32 +0000
Subject: Re: [PATCH 1/2] vfio/fsl-mc: return -EFAULT if copy_to_user() fails
Message-Id: <2f735366-f155-9a1c-e177-be840ea22c7b@oss.nxp.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201023113450.GH282278@mwanda>
In-Reply-To: <20201023113450.GH282278@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Alex Williamson <alex.williamson@redhat.com>, Cornelia Huck <cohuck@redhat.com>, Bharat Bhushan <Bharat.Bhushan@nxp.com>, Eric Auger <eric.auger@redhat.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Acked-by: Diana Craciun <diana.craciun@oss.nxp.com>

On 10/23/2020 2:34 PM, Dan Carpenter wrote:
> The copy_to_user() function returns the number of bytes remaining to be
> copied, but this code should return -EFAULT.
> 
> Fixes: df747bcd5b21 ("vfio/fsl-mc: Implement VFIO_DEVICE_GET_REGION_INFO ioctl call")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>   drivers/vfio/fsl-mc/vfio_fsl_mc.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/vfio/fsl-mc/vfio_fsl_mc.c b/drivers/vfio/fsl-mc/vfio_fsl_mc.c
> index 0113a980f974..21f22e3da11f 100644
> --- a/drivers/vfio/fsl-mc/vfio_fsl_mc.c
> +++ b/drivers/vfio/fsl-mc/vfio_fsl_mc.c
> @@ -248,7 +248,9 @@ static long vfio_fsl_mc_ioctl(void *device_data, unsigned int cmd,
>   		info.size = vdev->regions[info.index].size;
>   		info.flags = vdev->regions[info.index].flags;
>   
> -		return copy_to_user((void __user *)arg, &info, minsz);
> +		if (copy_to_user((void __user *)arg, &info, minsz))
> +			return -EFAULT;
> +		return 0;
>   	}
>   	case VFIO_DEVICE_GET_IRQ_INFO:
>   	{
> @@ -267,7 +269,9 @@ static long vfio_fsl_mc_ioctl(void *device_data, unsigned int cmd,
>   		info.flags = VFIO_IRQ_INFO_EVENTFD;
>   		info.count = 1;
>   
> -		return copy_to_user((void __user *)arg, &info, minsz);
> +		if (copy_to_user((void __user *)arg, &info, minsz))
> +			return -EFAULT;
> +		return 0;
>   	}
>   	case VFIO_DEVICE_SET_IRQS:
>   	{
> 
