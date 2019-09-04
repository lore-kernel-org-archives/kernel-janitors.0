From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Date: Wed, 04 Sep 2019 11:50:57 +0000
Subject: Re: [PATCH] drm: panel-lvds: Potential Oops in probe error handling
Message-Id: <20190904115057.GC4811@pendragon.ideasonboard.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190904100329.GE7007@mwanda>
In-Reply-To: <20190904100329.GE7007@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, David Airlie <airlied@linux.ie>, Mark Brown <broonie@kernel.org>, kernel-janitors@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>

Hi Dan,

Thank you for the patch.

On Wed, Sep 04, 2019 at 01:03:29PM +0300, Dan Carpenter wrote:
> The "lvds->backlight" pointer could be NULl if of_parse_phandle()
> returns NULL.
> 
> Fixes: 7c9dff5bd643 ("drm: panels: Add LVDS panel driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/gpu/drm/panel/panel-lvds.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-lvds.c b/drivers/gpu/drm/panel/panel-lvds.c
> index ad47cc95459e..3b4eb959e994 100644
> --- a/drivers/gpu/drm/panel/panel-lvds.c
> +++ b/drivers/gpu/drm/panel/panel-lvds.c
> @@ -272,7 +272,8 @@ static int panel_lvds_probe(struct platform_device *pdev)
>  	return 0;
>  
>  error:
> -	put_device(&lvds->backlight->dev);
> +	if (lvds->backlight)
> +		put_device(&lvds->backlight->dev);

How about simply

-	put_device(&lvds->backlight->dev);
+	backlight_put(lvds->backlight);

?

>  	return ret;
>  }
>  

-- 
Regards,

Laurent Pinchart
