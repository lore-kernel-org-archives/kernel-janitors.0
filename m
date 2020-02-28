From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 28 Feb 2020 23:40:17 +0000
Subject: Re: [PATCH] drm: prevent a harmless integer overflow in drm_legacy_sg_alloc()
Message-Id: <20200228234017.GB2363188@phenom.ffwll.local>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200228092321.axulddmkxrujkmas@kili.mountain>
In-Reply-To: <20200228092321.axulddmkxrujkmas@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org

On Fri, Feb 28, 2020 at 12:23:21PM +0300, Dan Carpenter wrote:
> There is an integer overflow when we round up to PAGE_SIZE, but it's
> harmless because we never re-use "request->size" for anything meaningful.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> This code predates git.

Also not compiled without CONFIG_DRM_LEGACY, which we tell everyone is to
enable the root holes in drm :-)

Thanks for your patch, queued in drm-misc-next.
-Daniel

> 
>  drivers/gpu/drm/drm_scatter.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_scatter.c b/drivers/gpu/drm/drm_scatter.c
> index d5c386154246..ca520028b2cb 100644
> --- a/drivers/gpu/drm/drm_scatter.c
> +++ b/drivers/gpu/drm/drm_scatter.c
> @@ -99,6 +99,9 @@ int drm_legacy_sg_alloc(struct drm_device *dev, void *data,
>  	if (!drm_core_check_feature(dev, DRIVER_SG))
>  		return -EOPNOTSUPP;
>  
> +	if (request->size > SIZE_MAX - PAGE_SIZE)
> +		return -EINVAL;
> +
>  	if (dev->sg)
>  		return -EINVAL;
>  
> -- 
> 2.11.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
