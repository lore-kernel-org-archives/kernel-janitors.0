From: "Michael S. Tsirkin" <mst@redhat.com>
Date: Thu, 25 Feb 2016 09:28:54 +0000
Subject: Re: [patch] vfio/pci: return -EFAULT if copy_to_user fails
Message-Id: <20160225111630-mutt-send-email-mst@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160225075212.GD7333@mwanda>
In-Reply-To: <20160225075212.GD7333@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Alex Williamson <alex.williamson@redhat.com>, Eric Auger <eric.auger@linaro.org>, Baptiste Reynal <b.reynal@virtualopensystems.com>, Antonios Motakis <a.motakis@virtualopensystems.com>, kvm@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Feb 25, 2016 at 10:52:12AM +0300, Dan Carpenter wrote:
> The copy_to_user() function returns the number of bytes that were not
> copied but we want to return -EFAULT on error here.
> 
> Fixes: 188ad9d6cbbc ('vfio/pci: Include sparse mmap capability for MSI-X table regions')

Where's this commit? In which tree?

> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/vfio/pci/vfio_pci.c b/drivers/vfio/pci/vfio_pci.c
> index 1ce1d36..98059df 100644
> --- a/drivers/vfio/pci/vfio_pci.c
> +++ b/drivers/vfio/pci/vfio_pci.c
> @@ -664,12 +664,11 @@ static long vfio_pci_ioctl(void *device_data,
>  				info.cap_offset = 0;
>  			} else {
>  				vfio_info_cap_shift(&caps, sizeof(info));
> -				ret = copy_to_user((void __user *)arg +
> -						   sizeof(info), caps.buf,
> -						   caps.size);
> -				if (ret) {
> +				if (copy_to_user((void __user *)arg +
> +						  sizeof(info), caps.buf,
> +						  caps.size)) {
>  					kfree(caps.buf);
> -					return ret;
> +					return -EFAULT;
>  				}
>  				info.cap_offset = sizeof(info);
>  			}
