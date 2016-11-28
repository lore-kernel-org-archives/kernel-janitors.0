From: Kirti Wankhede <kwankhede@nvidia.com>
Date: Mon, 28 Nov 2016 12:29:52 +0000
Subject: Re: [patch] vfio: vfio_group_get_from_dev() doesn't return error pointers
Message-Id: <8fff4459-6cd2-d270-ee8c-436c20b94bbb@nvidia.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161124110849.GF17225@mwanda>
In-Reply-To: <20161124110849.GF17225@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Alex Williamson <alex.williamson@redhat.com>
Cc: kvm@vger.kernel.org, kernel-janitors@vger.kernel.org



On 11/24/2016 4:38 PM, Dan Carpenter wrote:
> These are all checking for IS_ERR() but vfio_group_get_from_dev()
> returns NULL pointers on error.
> 
> Fixes: c086de818dd8 ("vfio iommu: Add blocking notifier to notify DMA_UNMAP")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/vfio/vfio.c b/drivers/vfio/vfio.c
> index 0aac3ca..952e68c 100644
> --- a/drivers/vfio/vfio.c
> +++ b/drivers/vfio/vfio.c
> @@ -1933,8 +1933,8 @@ int vfio_pin_pages(struct device *dev, unsigned long *user_pfn, int npage,
>  		return -E2BIG;
>  
>  	group = vfio_group_get_from_dev(dev);
> -	if (IS_ERR(group))
> -		return PTR_ERR(group);
> +	if (!group)
> +		return -EINVAL;
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
> +		return -EINVAL;
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
> +		return -EINVAL;
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
> +		return -EINVAL;
>  
>  	ret = vfio_group_add_container_user(group);
>  	if (ret)
> --

This makes sense. Thanks for fixing this.
Reviewed by: Kirti Wankhede <kwankhede@nvidia.com>

