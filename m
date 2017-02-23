From: Sean Paul <seanpaul@chromium.org>
Date: Thu, 23 Feb 2017 16:48:12 +0000
Subject: Re: [PATCH v2] drm/rockchip: cdn-dp: Fix error handling
Message-Id: <20170223164812.GB24066@art_vandelay>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170220070815.23096-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20170220070815.23096-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org

On Mon, Feb 20, 2017 at 08:08:15AM +0100, Christophe JAILLET wrote:
> It is likely that both 'clk_disable_unprepare()' should be called if
> 'pm_runtime_get_sync()' fails.
> 
> Add a new label for that, because 'err_set_rate' is not meaningful in this
> case.
> 
> Add a missing call to 'pm_runtime_put()'.
> 
> Fixes: 1a0f7ed3abe2 ("drm/rockchip: cdn-dp: add cdn DP support for rk3399")
> 

Applied to drm-misc-next-fixes

Thanks,

Sean

> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> V2: rename label
>     add missing call to 'pm_runtime_put_sync()' in error path
> ---
>  drivers/gpu/drm/rockchip/cdn-dp-core.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/rockchip/cdn-dp-core.c b/drivers/gpu/drm/rockchip/cdn-dp-core.c
> index 9ab67a670885..0fe1ec8b8fb1 100644
> --- a/drivers/gpu/drm/rockchip/cdn-dp-core.c
> +++ b/drivers/gpu/drm/rockchip/cdn-dp-core.c
> @@ -111,7 +111,7 @@ static int cdn_dp_clk_enable(struct cdn_dp_device *dp)
>  	ret = pm_runtime_get_sync(dp->dev);
>  	if (ret < 0) {
>  		DRM_DEV_ERROR(dp->dev, "cannot get pm runtime %d\n", ret);
> -		goto err_pclk;
> +		goto err_pm_runtime_get;
>  	}
>  
>  	reset_control_assert(dp->core_rst);
> @@ -133,6 +133,8 @@ static int cdn_dp_clk_enable(struct cdn_dp_device *dp)
>  	return 0;
>  
>  err_set_rate:
> +	pm_runtime_put(dp->dev);
> +err_pm_runtime_get:
>  	clk_disable_unprepare(dp->core_clk);
>  err_core_clk:
>  	clk_disable_unprepare(dp->pclk);
> -- 
> 2.9.3

-- 
Sean Paul, Software Engineer, Google / Chromium OS
