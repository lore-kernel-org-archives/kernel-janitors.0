From: Jani Nikula <jani.nikula@linux.intel.com>
Date: Mon, 27 Apr 2015 08:56:00 +0000
Subject: Re: [PATCH 2/2] drm: fix a memleak on mutex failure path
Message-Id: <87d22qc5lr.fsf@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1430025269-26243-1-git-send-email-green@linuxhacker.ru> <1430025269-26243-3-git-send-email-green@linuxhacker.ru>
In-Reply-To: <1430025269-26243-3-git-send-email-green@linuxhacker.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, kernel-janitors@vger.kernel.org, open list <linux-kernel@vger.kernel.org>, Oleg Drokin <green@linuxhacker.ru>

On Sun, 26 Apr 2015, green@linuxhacker.ru wrote:
> From: Oleg Drokin <green@linuxhacker.ru>
>
> Need to free just allocated ctx allocation if we cannot
> get our config mutex.
>
> This one has been flagged by kbuild bot all the way back in August,
> but somehow nobody picked it up:
> https://lists.01.org/pipermail/kbuild/2014-August/001691.html
>
> Found with smatch.
>
> Signed-off-by: Oleg Drokin <green@linuxhacker.ru>
> CC: Daniel Vetter <daniel.vetter@ffwll.ch>

The function has another leaking failure path, would be nice to have
that fixed too. Maybe with a common out label.

BR,
Jani.



> ---
>  drivers/gpu/drm/drm_modeset_lock.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/drm_modeset_lock.c b/drivers/gpu/drm/drm_modeset_lock.c
> index 51cc47d..1e8c52f 100644
> --- a/drivers/gpu/drm/drm_modeset_lock.c
> +++ b/drivers/gpu/drm/drm_modeset_lock.c
> @@ -80,8 +80,10 @@ int __drm_modeset_lock_all(struct drm_device *dev,
>  		return -ENOMEM;
>  
>  	if (trylock) {
> -		if (!mutex_trylock(&config->mutex))
> +		if (!mutex_trylock(&config->mutex)) {
> +			kfree(ctx);
>  			return -EBUSY;
> +		}
>  	} else {
>  		mutex_lock(&config->mutex);
>  	}
> -- 
> 2.1.0
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Jani Nikula, Intel Open Source Technology Center
