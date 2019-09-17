From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 17 Sep 2019 12:58:14 +0000
Subject: Re: [PATCH] drm/selftests: fix spelling mistake "misssing" -> "missing"
Message-Id: <20190917125814.GS3958@phenom.ffwll.local>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190911091227.5710-1-colin.king@canonical.com>
In-Reply-To: <20190911091227.5710-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Alexandru-Cosmin Gheorghe <Alexandru-Cosmin.Gheorghe@arm.com>, dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Sep 11, 2019 at 10:12:27AM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a spelling mistake in a literal string, fix it.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied, thanks.
-Daniel

> ---
>  drivers/gpu/drm/selftests/test-drm_framebuffer.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/selftests/test-drm_framebuffer.c b/drivers/gpu/drm/selftests/test-drm_framebuffer.c
> index 74d5561a862b..2d29ea6f92e2 100644
> --- a/drivers/gpu/drm/selftests/test-drm_framebuffer.c
> +++ b/drivers/gpu/drm/selftests/test-drm_framebuffer.c
> @@ -126,7 +126,7 @@ static struct drm_framebuffer_test createbuffer_tests[] = {
>  		 .handles = { 1, 1, 0 }, .pitches = { MAX_WIDTH, MAX_WIDTH - 1, 0 },
>  	}
>  },
> -{ .buffer_created = 0, .name = "NV12 Invalid modifier/misssing DRM_MODE_FB_MODIFIERS flag",
> +{ .buffer_created = 0, .name = "NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag",
>  	.cmd = { .width = MAX_WIDTH, .height = MAX_HEIGHT, .pixel_format = DRM_FORMAT_NV12,
>  		 .handles = { 1, 1, 0 }, .modifier = { DRM_FORMAT_MOD_SAMSUNG_64_32_TILE, 0, 0 },
>  		 .pitches = { MAX_WIDTH, MAX_WIDTH, 0 },
> -- 
> 2.20.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
