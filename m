From: Sam Ravnborg <sam@ravnborg.org>
Date: Sun, 01 Dec 2019 09:09:41 +0000
Subject: Re: [PATCH] drm/panel: clean up indentation issue
Message-Id: <20191201090941.GA8753@ravnborg.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190925120357.10408-1-colin.king@canonical.com>
In-Reply-To: <20190925120357.10408-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Stefan Mavrodiev <stefan@olimex.com>, David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>

Hi Colin.

On Wed, Sep 25, 2019 at 01:03:57PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a continue statement that is indented one level too deeply,
> remove the extraneous tab.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/gpu/drm/panel/panel-olimex-lcd-olinuxino.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-olimex-lcd-olinuxino.c b/drivers/gpu/drm/panel/panel-olimex-lcd-olinuxino.c
> index 2bae1db3ff34..7dd67262a2ed 100644
> --- a/drivers/gpu/drm/panel/panel-olimex-lcd-olinuxino.c
> +++ b/drivers/gpu/drm/panel/panel-olimex-lcd-olinuxino.c
> @@ -161,7 +161,7 @@ static int lcd_olinuxino_get_modes(struct drm_panel *panel)
>  				lcd_mode->hactive,
>  				lcd_mode->vactive,
>  				lcd_mode->refresh);
> -				continue;
> +			continue;
>  		}
>  
>  		mode->clock = lcd_mode->pixelclock;

Thanks, this is the kind of issues that can fool one or take
focus away when reading code.

Applied to drm-misc-next.

	Sam
