From: Mark yao <mark.yao@rock-chips.com>
Date: Mon, 20 Feb 2017 07:34:31 +0000
Subject: Re: [PATCH v2] drm/rockchip: cdn-dp: Fix error handling
Message-Id: <58AA9C07.5070303@rock-chips.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170220070815.23096-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20170220070815.23096-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, airlied@linux.ie, heiko@sntech.de
Cc: linux-rockchip@lists.infradead.org, kernel-janitors@vger.kernel.org, linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org

On 2017年02月20日 15:08, Christophe JAILLET wrote:
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
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

looks good for me

Reviewed-by: Mark Yao <mark.yao@rock-chips.com>


> ---
> V2: rename label
>      add missing call to 'pm_runtime_put_sync()' in error path
> ---
>   drivers/gpu/drm/rockchip/cdn-dp-core.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/rockchip/cdn-dp-core.c b/drivers/gpu/drm/rockchip/cdn-dp-core.c
> index 9ab67a670885..0fe1ec8b8fb1 100644
> --- a/drivers/gpu/drm/rockchip/cdn-dp-core.c
> +++ b/drivers/gpu/drm/rockchip/cdn-dp-core.c
> @@ -111,7 +111,7 @@ static int cdn_dp_clk_enable(struct cdn_dp_device *dp)
>   	ret = pm_runtime_get_sync(dp->dev);
>   	if (ret < 0) {
>   		DRM_DEV_ERROR(dp->dev, "cannot get pm runtime %d\n", ret);
> -		goto err_pclk;
> +		goto err_pm_runtime_get;
>   	}
>   
>   	reset_control_assert(dp->core_rst);
> @@ -133,6 +133,8 @@ static int cdn_dp_clk_enable(struct cdn_dp_device *dp)
>   	return 0;
>   
>   err_set_rate:
> +	pm_runtime_put(dp->dev);
> +err_pm_runtime_get:
>   	clk_disable_unprepare(dp->core_clk);
>   err_core_clk:
>   	clk_disable_unprepare(dp->pclk);


-- 
Ｍark Yao


