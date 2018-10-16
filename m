From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 16 Oct 2018 12:35:41 +0000
Subject: Re: [PATCH v2] drm/drm_vblank: Change EINVAL by the correct errno
Message-Id: <20181016123541.GW31561@phenom.ffwll.local>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181015170529.dgzpbm37hbuvqatc@smtp.gmail.com>
In-Reply-To: <20181015170529.dgzpbm37hbuvqatc@smtp.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Cc: Gustavo Padovan <gustavo@padovan.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, Oct 15, 2018 at 02:05:29PM -0300, Rodrigo Siqueira wrote:
> For historical reason, the function drm_wait_vblank_ioctl always return
> -EINVAL if something gets wrong. This scenario limits the flexibility
> for the userspace make detailed verification of the problem and take
> some action. In particular, the validation of “if (!dev->irq_enabled)”
> in the drm_wait_vblank_ioctl is responsible for checking if the driver
> support vblank or not. If the driver does not support VBlank, the
> function drm_wait_vblank_ioctl returns EINVAL which does not represent
> the real issue; this patch changes this behavior by return EOPNOTSUPP.
> Additionally, some operations are unsupported by this function, and
> returns EINVAL; this patch also changes the return value to EOPNOTSUPP
> in this case. Lastly, the function drm_wait_vblank_ioctl is invoked by
> libdrm, which is used by many compositors; because of this, it is
> important to check if this change breaks any compositor. In this sense,
> the following projects were examined:
> 
> * Drm-hwcomposer
> * Kwin
> * Sway
> * Wlroots
> * Wayland-core
> * Weston
> * Xorg (67 different drivers)
> 
> For each repository the verification happened in three steps:
> 
> * Update the main branch
> * Look for any occurrence "drmWaitVBlank" with the command:
>   git grep -n "drmWaitVBlank"
> * Look in the git history of the project with the command:
>   git log -SdrmWaitVBlank
> 
> Finally, none of the above projects validate the use of EINVAL which
> make safe, at least for these projects, to change the return values.
> 
> Change since V1:
>  Daniel Vetter and Chris Wilson
>  - Replace ENOTTY by EOPNOTSUPP
>  - Return EINVAL if the parameters are wrong
> 
> Signed-off-by: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Can you pls also let intel-gfx-ci test this patch? You just need to
include intel-gfx@lists.freedesktop.org in your recipient list.

For merging, since you plan to stick around doing kms stuff a bit: Want
commit rights for drm-misc?

https://drm.pages.freedesktop.org/maintainer-tools/getting-started.html

Cheers, Daniel

> ---
>  drivers/gpu/drm/drm_vblank.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
> index 98e091175921..80f5a3bb427e 100644
> --- a/drivers/gpu/drm/drm_vblank.c
> +++ b/drivers/gpu/drm/drm_vblank.c
> @@ -1533,10 +1533,10 @@ int drm_wait_vblank_ioctl(struct drm_device *dev, void *data,
>  	unsigned int flags, pipe, high_pipe;
>  
>  	if (!dev->irq_enabled)
> -		return -EINVAL;
> +		return -EOPNOTSUPP;
>  
>  	if (vblwait->request.type & _DRM_VBLANK_SIGNAL)
> -		return -EINVAL;
> +		return -EOPNOTSUPP;
>  
>  	if (vblwait->request.type &
>  	    ~(_DRM_VBLANK_TYPES_MASK | _DRM_VBLANK_FLAGS_MASK |
> -- 
> 2.19.1

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
