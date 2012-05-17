From: walter harms <wharms@bfs.de>
Date: Thu, 17 May 2012 10:06:45 +0000
Subject: Re: [patch] drm: checking the wrong variable in savage_do_init_bci()
Message-Id: <4FB4CDB5.8010602@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120517070944.GE14660@elgon.mountain>
In-Reply-To: <20120517070944.GE14660@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Nicolas Kaiser <nikai@nikai.net>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, Dave Airlie <airlied@redhat.com>, Greg Dietsche <Gregory.Dietsche@cuw.edu>



Am 17.05.2012 09:09, schrieb Dan Carpenter:
> drm_core_ioremap() initializes ->handle.  We already know
> "dev->agp_buffer_map" is a valid pointer.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/gpu/drm/savage/savage_bci.c b/drivers/gpu/drm/savage/savage_bci.c
> index cb1ee4e..6eb507a 100644
> --- a/drivers/gpu/drm/savage/savage_bci.c
> +++ b/drivers/gpu/drm/savage/savage_bci.c
> @@ -735,7 +735,7 @@ static int savage_do_init_bci(struct drm_device * dev, drm_savage_init_t * init)
>  			return -EINVAL;
>  		}
>  		drm_core_ioremap(dev->agp_buffer_map, dev);
> -		if (!dev->agp_buffer_map) {
> +		if (!dev->agp_buffer_map->handle) {
>  			DRM_ERROR("failed to ioremap DMA buffer region!\n");
>  			savage_do_cleanup_bci(dev);
>  			return -ENOMEM;


ok, the interface asks for that type of error :)

re,
 wh
