From: Aaron Plattner <aplattner@nvidia.com>
Date: Fri, 14 Mar 2014 16:19:30 +0000
Subject: Re: [patch] drm: use after free in drm_pci_exit()
Message-Id: <53232C12.20108@nvidia.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140120103116.GD14233@elgon.mountain>
In-Reply-To: <20140120103116.GD14233@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

On 01/20/2014 02:31 AM, Dan Carpenter wrote:
> We can't use "dev" after we freed it on the line before.
>
> Fixes: b3f2333de8e8 ('drm: restrict the device list for shadow attached drivers')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

I just ran into this same problem, and this change fixes it.

Tested-by: Aaron Plattner <aplattner@nvidia.com>
Reviewed-by: Aaron Plattner <aplattner@nvidia.com>

and since he just sent me an independently-developed identical change,

Reviewed-by: John Hubbard <jhubbard@nvidia.com>

> diff --git a/drivers/gpu/drm/drm_pci.c b/drivers/gpu/drm/drm_pci.c
> index 5736aaa7e86c..f7af69bcf3f4 100644
> --- a/drivers/gpu/drm/drm_pci.c
> +++ b/drivers/gpu/drm/drm_pci.c
> @@ -468,8 +468,8 @@ void drm_pci_exit(struct drm_driver *driver, struct pci_driver *pdriver)
>   	} else {
>   		list_for_each_entry_safe(dev, tmp, &driver->legacy_dev_list,
>   					 legacy_dev_list) {
> -			drm_put_dev(dev);
>   			list_del(&dev->legacy_dev_list);
> +			drm_put_dev(dev);
>   		}
>   	}
>   	DRM_INFO("Module unloaded\n");
> --

