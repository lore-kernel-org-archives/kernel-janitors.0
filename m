From: Sean Paul <sean@poorly.run>
Date: Tue, 18 Jun 2019 17:16:29 +0000
Subject: Re: [PATCH v2] drm: return -EFAULT if copy_to_user() fails
Message-Id: <20190618171629.GB25413@art_vandelay>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190618125623.GA24896@mwanda>
 <20190618131843.GA29463@mwanda>
In-Reply-To: <20190618131843.GA29463@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>, Al Viro <viro@zeniv.linux.org.uk>, Sean Paul <sean@poorly.run>

On Tue, Jun 18, 2019 at 04:18:43PM +0300, Dan Carpenter wrote:
> The copy_from_user() function returns the number of bytes remaining
> to be copied but we want to return a negative error code.  Otherwise
> the callers treat it as a successful copy.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks Dan, I've applied this to drm-misc-fixes.

Sean

> ---
> v2: The first version was missing a chunk
> 
>  drivers/gpu/drm/drm_bufs.c  | 5 ++++-
>  drivers/gpu/drm/drm_ioc32.c | 5 ++++-
>  2 files changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_bufs.c b/drivers/gpu/drm/drm_bufs.c
> index 68dacf8422c6..8ce9d73fab4f 100644
> --- a/drivers/gpu/drm/drm_bufs.c
> +++ b/drivers/gpu/drm/drm_bufs.c
> @@ -1351,7 +1351,10 @@ static int copy_one_buf(void *data, int count, struct drm_buf_entry *from)
>  				 .size = from->buf_size,
>  				 .low_mark = from->low_mark,
>  				 .high_mark = from->high_mark};
> -	return copy_to_user(to, &v, offsetof(struct drm_buf_desc, flags));
> +
> +	if (copy_to_user(to, &v, offsetof(struct drm_buf_desc, flags)))
> +		return -EFAULT;
> +	return 0;
>  }
>  
>  int drm_legacy_infobufs(struct drm_device *dev, void *data,
> diff --git a/drivers/gpu/drm/drm_ioc32.c b/drivers/gpu/drm/drm_ioc32.c
> index 586aa28024c5..a16b6dc2fa47 100644
> --- a/drivers/gpu/drm/drm_ioc32.c
> +++ b/drivers/gpu/drm/drm_ioc32.c
> @@ -378,7 +378,10 @@ static int copy_one_buf32(void *data, int count, struct drm_buf_entry *from)
>  			      .size = from->buf_size,
>  			      .low_mark = from->low_mark,
>  			      .high_mark = from->high_mark};
> -	return copy_to_user(to + count, &v, offsetof(drm_buf_desc32_t, flags));
> +
> +	if (copy_to_user(to + count, &v, offsetof(drm_buf_desc32_t, flags)))
> +		return -EFAULT;
> +	return 0;
>  }
>  
>  static int drm_legacy_infobufs32(struct drm_device *dev, void *data,
> -- 
> 2.20.1
> 

-- 
Sean Paul, Software Engineer, Google / Chromium OS
