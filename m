From: Alex Williamson <alex.williamson@redhat.com>
Date: Wed, 30 Nov 2016 16:36:46 +0000
Subject: Re: [PATCH] vfio: Fix handling of error returned by 'vfio_group_get_from_dev()'
Message-Id: <20161130093646.0c68f7be@t450s.home>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161130070612.16073-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20161130070612.16073-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Dan Carpenter <dan.carpenter@oracle.com>, Kirti Wankhede <kwankhede@nvidia.com>

On Wed, 30 Nov 2016 08:06:12 +0100
Christophe JAILLET <christophe.jaillet@wanadoo.fr> wrote:

> 'vfio_group_get_from_dev()' seems to return only NULL on error, not an error
> pointer.
> 
> Fixes: 2169037dc322 ("vfio iommu: Added pin and unpin callback functions to vfio_iommu_driver_ops")
> Fixes: c086de818dd8 ("vfio iommu: Add blocking notifier to notify DMA_UNMAP")
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---

Dan Carpenter proposed a nearly identical patch:

http://www.spinics.net/lists/kvm/msg141468.html

The difference is you return -ENODEV while Dan returns -EINVAL.  I tend
to prefer -ENODEV to distinguish this error case versus validation of
the other parameters.  This patch also identifies both commits
introducing these, so I'm inclined to take this one rather than Dan's
version.  Dan & Kirti, I welcome any credits you'd like to apply to
this patch for identifying and reviewing the same issue.  Thanks,

Alex

> This could be split in 2 patches in order to have only one Fixes tag in
> each
> ---
>  drivers/vfio/vfio.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/vfio/vfio.c b/drivers/vfio/vfio.c
> index 0aac3ca54a53..7b39313abf0d 100644
> --- a/drivers/vfio/vfio.c
> +++ b/drivers/vfio/vfio.c
> @@ -1933,8 +1933,8 @@ int vfio_pin_pages(struct device *dev, unsigned long *user_pfn, int npage,
>  		return -E2BIG;
>  
>  	group = vfio_group_get_from_dev(dev);
> -	if (IS_ERR(group))
> -		return PTR_ERR(group);
> +	if (!group)
> +		return -ENODEV;
>  
>  	ret = vfio_group_add_container_user(group);
>  	if (ret)
> @@ -1982,8 +1982,8 @@ int vfio_unpin_pages(struct device *dev, unsigned long *user_pfn, int npage)
>  		return -E2BIG;
>  
>  	group = vfio_group_get_from_dev(dev);
> -	if (IS_ERR(group))
> -		return PTR_ERR(group);
> +	if (!group)
> +		return -ENODEV;
>  
>  	ret = vfio_group_add_container_user(group);
>  	if (ret)
> @@ -2019,8 +2019,8 @@ int vfio_register_notifier(struct device *dev, struct notifier_block *nb)
>  		return -EINVAL;
>  
>  	group = vfio_group_get_from_dev(dev);
> -	if (IS_ERR(group))
> -		return PTR_ERR(group);
> +	if (!group)
> +		return -ENODEV;
>  
>  	ret = vfio_group_add_container_user(group);
>  	if (ret)
> @@ -2055,8 +2055,8 @@ int vfio_unregister_notifier(struct device *dev, struct notifier_block *nb)
>  		return -EINVAL;
>  
>  	group = vfio_group_get_from_dev(dev);
> -	if (IS_ERR(group))
> -		return PTR_ERR(group);
> +	if (!group)
> +		return -ENODEV;
>  
>  	ret = vfio_group_add_container_user(group);
>  	if (ret)

