From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 23 Aug 2013 22:53:29 +0000
Subject: Re: [patch -next] drm/prime: double lock typo
Message-Id: <20130823225329.GA26909@phenom.ffwll.local>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130823204602.GA10229@elgon.mountain>
In-Reply-To: <20130823204602.GA10229@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>, kernel-janitors@vger.kernel.org

On Fri, Aug 23, 2013 at 11:46:02PM +0300, Dan Carpenter wrote:
> There is a typo so deadlocks on error instead of unlocking.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
> index 7ae2bfc..276d470 100644
> --- a/drivers/gpu/drm/drm_prime.c
> +++ b/drivers/gpu/drm/drm_prime.c
> @@ -552,7 +552,7 @@ fail:
>  	 */
>  	drm_gem_handle_delete(file_priv, *handle);
>  out_unlock:
> -	mutex_lock(&dev->object_name_lock);
> +	mutex_unlock(&dev->object_name_lock);

Duh. Unfortunately exercising error paths is pretty hard :( So thanks for
catching this.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
