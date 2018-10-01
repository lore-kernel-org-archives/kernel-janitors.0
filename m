From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Date: Mon, 01 Oct 2018 23:50:45 +0000
Subject: Re: [PATCH] drm/omap: Use after free in omap_connector_destroy()
Message-Id: <8319740.4GPcRUpbZa@avalon>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181001164505.GB29248@mwanda>
In-Reply-To: <20181001164505.GB29248@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: David Airlie <airlied@linux.ie>, Tomi Valkeinen <tomi.valkeinen@ti.com>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

Hi Dan,

Thank you for the patch.

On Monday, 1 October 2018 19:45:05 EEST Dan Carpenter wrote:
> We can free "omap_connector" until the end of the function.
> 
> Fixes: 949ea2ef3fed ("drm/omap: Don't call HPD registration operations
> recursively") Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

This has already been fixed by https://www.spinics.net/lists/dri-devel/
msg190817.html.

> diff --git a/drivers/gpu/drm/omapdrm/omap_connector.c
> b/drivers/gpu/drm/omapdrm/omap_connector.c index 98f5ca29444a..b81302c4bf9e
> 100644
> --- a/drivers/gpu/drm/omapdrm/omap_connector.c
> +++ b/drivers/gpu/drm/omapdrm/omap_connector.c
> @@ -164,10 +164,11 @@ static void omap_connector_destroy(struct
> drm_connector *connector)
> 
>  	drm_connector_unregister(connector);
>  	drm_connector_cleanup(connector);
> -	kfree(omap_connector);
> 
>  	omapdss_device_put(omap_connector->output);
>  	omapdss_device_put(omap_connector->display);
> +
> +	kfree(omap_connector);
>  }
> 
>  #define MAX_EDID  512


-- 
Regards,

Laurent Pinchart
