From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 22 Sep 2020 13:19:16 +0000
Subject: Re: [PATCH] drm/gma500: clean up indentation issues
Message-Id: <20200922131916.GM438822@phenom.ffwll.local>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200920141407.32672-1-colin.king@canonical.com>
In-Reply-To: <20200920141407.32672-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org

On Sun, Sep 20, 2020 at 03:14:07PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There are a couple of statements that are indented too deeply,
> remove the extraneous tabs and also an empty line.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Pushed to drm-misc-next, thanks for your patch.
-Daniel

> ---
>  drivers/gpu/drm/gma500/cdv_intel_dp.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/gma500/cdv_intel_dp.c b/drivers/gpu/drm/gma500/cdv_intel_dp.c
> index 720a767118c9..50016a754172 100644
> --- a/drivers/gpu/drm/gma500/cdv_intel_dp.c
> +++ b/drivers/gpu/drm/gma500/cdv_intel_dp.c
> @@ -1501,8 +1501,7 @@ cdv_intel_dp_start_link_train(struct gma_encoder *encoder)
>  	clock_recovery = false;
>  
>  	DRM_DEBUG_KMS("Start train\n");
> -		reg = DP | DP_LINK_TRAIN_PAT_1;
> -
> +	reg = DP | DP_LINK_TRAIN_PAT_1;
>  
>  	for (;;) {
>  		/* Use intel_dp->train_set[0] to set the voltage and pre emphasis values */
> @@ -1575,7 +1574,7 @@ cdv_intel_dp_complete_link_train(struct gma_encoder *encoder)
>  	cr_tries = 0;
>  
>  	DRM_DEBUG_KMS("\n");
> -		reg = DP | DP_LINK_TRAIN_PAT_2;
> +	reg = DP | DP_LINK_TRAIN_PAT_2;
>  
>  	for (;;) {
>  
> -- 
> 2.27.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
