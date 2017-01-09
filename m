From: Kirti Wankhede <kwankhede@nvidia.com>
Date: Mon, 09 Jan 2017 18:51:36 +0000
Subject: Re: [patch 2/3] vfio-mdev: buffer overflow in ioctl()
Message-Id: <f81db85d-6122-93ea-bcfd-bc899e9eea68@nvidia.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170107062840.GB26959@elgon.mountain>
In-Reply-To: <20170107062840.GB26959@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: kvm@vger.kernel.org, kernel-janitors@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>


CC+= Alex

Thanks Dan for fixing.

Reviewed by: Kirti Wankhede <kwankhede@nvidia.com>

Thanks,
Kirti

On 1/7/2017 11:58 AM, Dan Carpenter wrote:
> This is a sample driver for documentation so the impact is probably
> pretty low.  But we should check that bar_index is valid so we
> don't write beyond the end of the mdev_state->region_info[] array.
> 
> Fixes: 9d1a546c53b4 ("docs: Sample driver to demonstrate how to use Mediated device framework.")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/samples/vfio-mdev/mtty.c b/samples/vfio-mdev/mtty.c
> index d2656ff569c1..353666d68207 100644
> --- a/samples/vfio-mdev/mtty.c
> +++ b/samples/vfio-mdev/mtty.c
> @@ -1073,7 +1073,7 @@ int mtty_get_region_info(struct mdev_device *mdev,
>  {
>  	unsigned int size = 0;
>  	struct mdev_state *mdev_state;
> -	int bar_index;
> +	u32 bar_index;
>  
>  	if (!mdev)
>  		return -EINVAL;
> @@ -1082,8 +1082,11 @@ int mtty_get_region_info(struct mdev_device *mdev,
>  	if (!mdev_state)
>  		return -EINVAL;
>  
> -	mutex_lock(&mdev_state->ops_lock);
>  	bar_index = region_info->index;
> +	if (bar_index >= VFIO_PCI_NUM_REGIONS)
> +		return -EINVAL;
> +
> +	mutex_lock(&mdev_state->ops_lock);
>  
>  	switch (bar_index) {
>  	case VFIO_PCI_CONFIG_REGION_INDEX:
> 
