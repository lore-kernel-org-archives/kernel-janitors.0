From: Sean Paul <sean@poorly.run>
Date: Wed, 12 Sep 2018 13:29:20 +0000
Subject: Re: [PATCH -next] drm/fb-helper: Remove set but not used variable 'connector_funcs'
Message-Id: <20180912132920.GJ188300@art_vandelay>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1536722130-108819-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1536722130-108819-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>
Cc: Gustavo Padovan <gustavo@padovan.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Sep 12, 2018 at 03:15:30AM +0000, YueHaibing wrote:
> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/gpu/drm/drm_fb_helper.c: In function 'drm_pick_crtcs':
> drivers/gpu/drm/drm_fb_helper.c:2373:43: warning:
>  variable 'connector_funcs' set but not used [-Wunused-but-set-variable]
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Thanks for your patch, applied to -misc-fixes

Sean

> ---
>  drivers/gpu/drm/drm_fb_helper.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
> index 73cf10a..16e3a59 100644
> --- a/drivers/gpu/drm/drm_fb_helper.c
> +++ b/drivers/gpu/drm/drm_fb_helper.c
> @@ -2370,7 +2370,6 @@ static int drm_pick_crtcs(struct drm_fb_helper *fb_helper,
>  {
>  	int c, o;
>  	struct drm_connector *connector;
> -	const struct drm_connector_helper_funcs *connector_funcs;
>  	int my_score, best_score, score;
>  	struct drm_fb_helper_crtc **crtcs, *crtc;
>  	struct drm_fb_helper_connector *fb_helper_conn;
> @@ -2399,8 +2398,6 @@ static int drm_pick_crtcs(struct drm_fb_helper *fb_helper,
>  	if (drm_has_preferred_mode(fb_helper_conn, width, height))
>  		my_score++;
>  
> -	connector_funcs = connector->helper_private;
> -
>  	/*
>  	 * select a crtc for this connector and then attempt to configure
>  	 * remaining connectors
> 
> 
> 

-- 
Sean Paul, Software Engineer, Google / Chromium OS
