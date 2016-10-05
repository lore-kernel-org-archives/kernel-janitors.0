From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 05 Oct 2016 13:17:50 +0000
Subject: Re: [PATCH] drm: Release resources with a safer function
Message-Id: <20161005131750.GC20761@phenom.ffwll.local>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1475388082-12656-1-git-send-email-christophe.jaillet@wanadoo.fr>
In-Reply-To: <1475388082-12656-1-git-send-email-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: airlied@linux.ie, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org

On Sun, Oct 02, 2016 at 08:01:22AM +0200, Christophe JAILLET wrote:
> We should use 'ida_simple_remove()' instead of 'ida_remove()' when freeing
> resources allocated with 'ida_simple_get()'.
> 
> This as been spotted with the following coccinelle script which tries to
> detect missing 'ida_simple_remove()' call in error handling paths.
> 
> ///////////////
> @@
> expression x;
> identifier l;
> @@
> 
> *   x = ida_simple_get(...);
>     ...
>     if (...) {
>     ...
>     }
>     ...
>     if (...) {
>        ...
>        goto l;
>     }
>     ...
> *   l: ... when != ida_simple_remove(...);
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

kerneldoc for ida_simple_get/remove is rather sparse, would be great to
improve that a bit. Merged this one to drm-misc now, follow-up patch for
the place Ville spotted would be great too.
-Daniel

> ---
>  drivers/gpu/drm/drm_connector.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> index 26bb78c76481..2e7430283043 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -250,10 +250,10 @@ int drm_connector_init(struct drm_device *dev,
>  	connector->debugfs_entry = NULL;
>  out_put_type_id:
>  	if (ret)
> -		ida_remove(connector_ida, connector->connector_type_id);
> +		ida_simple_remove(connector_ida, connector->connector_type_id);
>  out_put_id:
>  	if (ret)
> -		ida_remove(&config->connector_ida, connector->index);
> +		ida_simple_remove(&config->connector_ida, connector->index);
>  out_put:
>  	if (ret)
>  		drm_mode_object_unregister(dev, &connector->base);
> -- 
> 2.7.4
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
