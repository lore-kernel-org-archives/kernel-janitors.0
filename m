From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 07 Dec 2017 08:44:38 +0000
Subject: Re: [PATCH] drm/fb-helper: Fix a potential NULL dereference
Message-Id: <20171207084438.d34a7ggnmy4luctc@phenom.ffwll.local>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171206130749.64efknoi6r7w3jqa@mwanda>
In-Reply-To: <20171206130749.64efknoi6r7w3jqa@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Daniel Vetter <daniel.vetter@intel.com>, Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>, David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

On Wed, Dec 06, 2017 at 04:07:49PM +0300, Dan Carpenter wrote:
> We recently modified drm_fb_helper_single_add_all_connectors() to allow
> NULL "fb_helper" pointers.  But  the problem is that it gets
> dereferenced before we checked for NULL.
> 
> Fixes: c777990fb45b ("drm/fb-helper: Handle function NULL argument")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Just merged a similar patch yesterday (drat yours slightly prettier!):

commit 89f3f35620c7f244880485de11079cb4d98ed604 (HEAD -> drm-misc-next, drm-misc/for-linux-next, drm-misc/drm-misc-next)
Author: Gustavo A. R. Silva <garsilva@embeddedor.com>
Date:   Tue Dec 5 11:46:28 2017 -0600

    drm/fb-helper: Fix potential NULL pointer dereference

Thanks anyway,
-Daniel
> 
> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
> index 6654f2f87775..f73457e5bbbc 100644
> --- a/drivers/gpu/drm/drm_fb_helper.c
> +++ b/drivers/gpu/drm/drm_fb_helper.c
> @@ -178,7 +178,6 @@ EXPORT_SYMBOL(drm_fb_helper_add_one_connector);
>   */
>  int drm_fb_helper_single_add_all_connectors(struct drm_fb_helper *fb_helper)
>  {
> -	struct drm_device *dev = fb_helper->dev;
>  	struct drm_connector *connector;
>  	struct drm_connector_list_iter conn_iter;
>  	int i, ret = 0;
> @@ -187,7 +186,7 @@ int drm_fb_helper_single_add_all_connectors(struct drm_fb_helper *fb_helper)
>  		return 0;
>  
>  	mutex_lock(&fb_helper->lock);
> -	drm_connector_list_iter_begin(dev, &conn_iter);
> +	drm_connector_list_iter_begin(fb_helper->dev, &conn_iter);
>  	drm_for_each_connector_iter(connector, &conn_iter) {
>  		ret = __drm_fb_helper_add_one_connector(fb_helper, connector);
>  		if (ret)
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
