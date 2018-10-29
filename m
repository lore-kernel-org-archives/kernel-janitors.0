From: Daniel Vetter <daniel@ffwll.ch>
Date: Mon, 29 Oct 2018 08:04:39 +0000
Subject: Re: [PATCH] gpu: drm/lease: fix spelling mistake, EACCESS -> EACCES
Message-Id: <20181029080439.GP21967@phenom.ffwll.local>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181026180512.4908-1-colin.king@canonical.com>
In-Reply-To: <20181026180512.4908-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Oct 26, 2018 at 07:05:12PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Trivial fix to a spelling mistake of the error access name EACCESS,
> rename to EACCES
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Thanks for your patch, applied to drm-misc-next.
-Daniel

> ---
>  drivers/gpu/drm/drm_lease.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_lease.c b/drivers/gpu/drm/drm_lease.c
> index 24a177ea5417..9ab88db8fad0 100644
> --- a/drivers/gpu/drm/drm_lease.c
> +++ b/drivers/gpu/drm/drm_lease.c
> @@ -195,7 +195,7 @@ EXPORT_SYMBOL(drm_lease_filter_crtcs);
>   * make sure all of the desired objects can be leased, atomically
>   * leasing them to the new drmmaster.
>   *
> - * 	ERR_PTR(-EACCESS)	some other master holds the title to any object
> + * 	ERR_PTR(-EACCES)	some other master holds the title to any object
>   * 	ERR_PTR(-ENOENT)	some object is not a valid DRM object for this device
>   * 	ERR_PTR(-EBUSY)		some other lessee holds title to this object
>   *	ERR_PTR(-EEXIST)	same object specified more than once in the provided list
> -- 
> 2.19.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
