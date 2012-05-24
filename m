From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 24 May 2012 10:59:26 +0000
Subject: Re: [patch] drm/udl: unlock before returning in udl_gem_mmap()
Message-Id: <20120524110041.GR4629@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120322063056.GB7369@elgon.mountain>
In-Reply-To: <20120322063056.GB7369@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>
Cc: Dave Airlie <airlied@redhat.com>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

On Thu, Mar 22, 2012 at 09:30:56AM +0300, Dan Carpenter wrote:
> If we hit an error here, then we should unlock and unreference obj
> before returning.
> 

This is still present in linux-next.

regards,
dan carpenter

> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/gpu/drm/udl/udl_gem.c b/drivers/gpu/drm/udl/udl_gem.c
> index 852642d..6de6130 100644
> --- a/drivers/gpu/drm/udl/udl_gem.c
> +++ b/drivers/gpu/drm/udl/udl_gem.c
> @@ -210,7 +210,7 @@ int udl_gem_mmap(struct drm_file *file, struct drm_device *dev,
>  
>  	ret = udl_gem_get_pages(gobj, GFP_KERNEL);
>  	if (ret)
> -		return ret;
> +		goto out;
>  	if (!gobj->base.map_list.map) {
>  		ret = drm_gem_create_mmap_offset(obj);
>  		if (ret)
