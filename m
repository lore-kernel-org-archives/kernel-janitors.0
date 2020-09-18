From: Guido =?iso-8859-1?Q?G=FCnther?= <guido.gunther@puri.sm>
Date: Fri, 18 Sep 2020 16:22:49 +0000
Subject: Re: [PATCH][next] drm/panel: fix null pointer dereference on pointer mode
Message-Id: <20200918162249.GA292461@bogon.m.sigxcpu.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200918155136.28958-1-colin.king@canonical.com>
In-Reply-To: <20200918155136.28958-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Purism Kernel Team <kernel@puri.sm>, David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>

Hi,
On Fri, Sep 18, 2020 at 04:51:36PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently a null pointer check on pointer mode is passing mode to
> function drm_mode_vrefresh and this causes a null pointer dereference
> on mode.  Fix this by not calling drm_mode_vrefresh since the call
> is only required for error reporting.
> 
> Addresses-Coverity: ("Dereference after null check")
> Fixes: 72967d5616d3 ("drm/panel: Add panel driver for the Mantix MLAF057WE51-X DSI panel")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c b/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c
> index 3482e28e30fc..be4761a643f9 100644
> --- a/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c
> +++ b/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c
> @@ -202,9 +202,8 @@ static int mantix_get_modes(struct drm_panel *panel,
>  
>  	mode = drm_mode_duplicate(connector->dev, &default_mode);
>  	if (!mode) {
> -		dev_err(ctx->dev, "Failed to add mode %ux%u@%u\n",
> -			default_mode.hdisplay, default_mode.vdisplay,
> -			drm_mode_vrefresh(mode));
> +		dev_err(ctx->dev, "Failed to add mode %ux%u\n",
> +			default_mode.hdisplay, default_mode.vdisplay);
>  		return -ENOMEM;
>  	}

drm_mode_vrefresh(&default_mode) gives some more clue what's going on -
I have had a fix queued up in my tree already but if you send a v2
that's fine.

Thanks!
 -- Guido

>  
> -- 
> 2.27.0
> 
