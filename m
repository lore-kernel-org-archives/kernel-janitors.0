From: Daniel Vetter <daniel@ffwll.ch>
Date: Mon, 25 May 2020 14:35:38 +0000
Subject: Re: [PATCH][next] drm/auth: remove redundant assignment to variable ret
Message-Id: <20200525143538.GH206103@phenom.ffwll.local>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200524222715.27305-1-colin.king@canonical.com>
In-Reply-To: <20200524222715.27305-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org

On Sun, May 24, 2020 at 11:27:15PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable ret is being initialized with a value that is
> never read and it is being updated later with a new value. The
> initialization is redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Queued up, but probably for 5.9. Thanks for your patch.
-Daniel

> ---
>  drivers/gpu/drm/drm_auth.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
> index 800ac39f3213..74ce0c29c960 100644
> --- a/drivers/gpu/drm/drm_auth.c
> +++ b/drivers/gpu/drm/drm_auth.c
> @@ -282,7 +282,7 @@ static void drm_drop_master(struct drm_device *dev,
>  int drm_dropmaster_ioctl(struct drm_device *dev, void *data,
>  			 struct drm_file *file_priv)
>  {
> -	int ret = -EINVAL;
> +	int ret;
>  
>  	mutex_lock(&dev->master_mutex);
>  
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
