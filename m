From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 21 Sep 2016 11:22:15 +0000
Subject: Re: [PATCH 4/5] GPU-DRM: Replace a kzalloc() call by kcalloc() in drm_legacy_addbufs_sg()
Message-Id: <20160921112215.GJ4714@dvetter-linux.ger.corp.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <2fd2da19-d57e-5017-0594-fd52e78493fa@users.sourceforge.net>
 <b340d1ca-f114-a523-e6d1-afe7fd6c3826@users.sourceforge.net>
In-Reply-To: <b340d1ca-f114-a523-e6d1-afe7fd6c3826@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>, David Airlie <airlied@linux.ie>, Julia Lawall <julia.lawall@lip6.fr>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Mon, Sep 19, 2016 at 05:56:49PM +0200, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Mon, 19 Sep 2016 17:30:31 +0200
> 
> The script "checkpatch.pl" can point information out like the following.
> 
> WARNING: Prefer kcalloc over kzalloc with multiply
> 
> Thus fix the affected source code place.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Merged patches 1-4. I agree with Jani that changing jump labels is a pure
bikeshed, so didn't apply them.

Also I'll repeat that imo checkpatch patches are great to get started, but
it's much better to do more involved work. Both since that tends to be
more interesting, and fixing all the checkpatch issues will rob the next
newbies of some great starting opportunity. Which means from now on I'll
only selectively apply your checkpatch patches.

We have todo list with some ideas at:

https://www.x.org/wiki/DRMJanitors/

Thanks, Daniel
> ---
>  drivers/gpu/drm/drm_bufs.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_bufs.c b/drivers/gpu/drm/drm_bufs.c
> index 36dd685..adb1dd7 100644
> --- a/drivers/gpu/drm/drm_bufs.c
> +++ b/drivers/gpu/drm/drm_bufs.c
> @@ -1117,8 +1117,7 @@ static int drm_legacy_addbufs_sg(struct drm_device *dev,
>  		return -EINVAL;
>  	}
>  
> -	entry->buflist = kzalloc(count * sizeof(*entry->buflist),
> -				GFP_KERNEL);
> +	entry->buflist = kcalloc(count, sizeof(*entry->buflist), GFP_KERNEL);
>  	if (!entry->buflist) {
>  		mutex_unlock(&dev->struct_mutex);
>  		atomic_dec(&dev->buf_alloc);
> -- 
> 2.10.0
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
