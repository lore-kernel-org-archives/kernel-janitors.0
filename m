From: Daniel Vetter <daniel@ffwll.ch>
Date: Mon, 19 Feb 2018 09:43:57 +0000
Subject: Re: [PATCH] drm/bochs: make structure bochs_bo_driver static
Message-Id: <20180219094357.GL22199@phenom.ffwll.local>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180207111353.30261-1-colin.king@canonical.com>
In-Reply-To: <20180207111353.30261-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org, Gerd Hoffmann <kraxel@redhat.com>

On Wed, Feb 07, 2018 at 11:13:53AM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The structure bochs_bo_driver is local to the source and does not need to
> be in global scope, so make it static.
> 
> Cleans up sparse warning:
> drivers/gpu/drm/bochs/bochs_mm.c:197:22: warning: symbol 'bochs_bo_driver'
> was not declared. Should it be static?
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied to drm-misc-next, thanks.
-Daniel

> ---
>  drivers/gpu/drm/bochs/bochs_mm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bochs/bochs_mm.c b/drivers/gpu/drm/bochs/bochs_mm.c
> index 704e879711e4..b1d5aee46316 100644
> --- a/drivers/gpu/drm/bochs/bochs_mm.c
> +++ b/drivers/gpu/drm/bochs/bochs_mm.c
> @@ -194,7 +194,7 @@ static struct ttm_tt *bochs_ttm_tt_create(struct ttm_bo_device *bdev,
>  	return tt;
>  }
>  
> -struct ttm_bo_driver bochs_bo_driver = {
> +static struct ttm_bo_driver bochs_bo_driver = {
>  	.ttm_tt_create = bochs_ttm_tt_create,
>  	.ttm_tt_populate = ttm_pool_populate,
>  	.ttm_tt_unpopulate = ttm_pool_unpopulate,
> -- 
> 2.15.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
