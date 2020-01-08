From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 08 Jan 2020 18:51:25 +0000
Subject: Re: [PATCH] gpu/drm: clean up white space in drm_legacy_lock_master_cleanup()
Message-Id: <20200108185125.GJ43062@phenom.ffwll.local>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200108054312.yzlj5wmbdktejgob@kili.mountain>
In-Reply-To: <20200108054312.yzlj5wmbdktejgob@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

On Wed, Jan 08, 2020 at 08:43:12AM +0300, Dan Carpenter wrote:
> We moved this code to a different file and accidentally deleted a
> newline.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Oops, thanks for catching, patch applied!
-Daniel

> ---
>  drivers/gpu/drm/drm_lock.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_lock.c b/drivers/gpu/drm/drm_lock.c
> index 2e8ce99d0baa..2c79e8199e3c 100644
> --- a/drivers/gpu/drm/drm_lock.c
> +++ b/drivers/gpu/drm/drm_lock.c
> @@ -360,7 +360,8 @@ void drm_legacy_lock_master_cleanup(struct drm_device *dev, struct drm_master *m
>  	/*
>  	 * Since the master is disappearing, so is the
>  	 * possibility to lock.
> -	 */	mutex_lock(&dev->struct_mutex);
> +	 */
> +	mutex_lock(&dev->struct_mutex);
>  	if (master->lock.hw_lock) {
>  		if (dev->sigdata.lock = master->lock.hw_lock)
>  			dev->sigdata.lock = NULL;
> -- 
> 2.11.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
