From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Date: Mon, 08 Oct 2018 16:52:13 +0000
Subject: Re: [PATCH] drm/drm_vblank: Change EINVAL by the correct errno
Message-Id: <20181008165213.vejfqe6ohiejeeq2@smtp.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181008145220.p34dllgsiw6rlpod@smtp.gmail.com>
 <153901080237.31254.10116385737520796385@skylake-alporthouse-com>
In-Reply-To: <153901080237.31254.10116385737520796385@skylake-alporthouse-com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, Gustavo Padovan <gustavo@padovan.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Sean Paul <sean@poorly.run>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org

On 10/08, Chris Wilson wrote:
> Quoting Rodrigo Siqueira (2018-10-08 15:52:20)
> > For historical reason, the function drm_wait_vblank_ioctl always return
> > -EINVAL if something gets wrong. This scenario limits the flexibility
> > for the userspace make detailed verification of the problem and take
> > some action. In particular, the validation of “if (!dev->irq_enabled)”
> > in the drm_wait_vblank_ioctl is responsible for checking if the driver
> > support vblank or not. If the driver does not support VBlank, the
> > function drm_wait_vblank_ioctl returns EINVAL which does not represent
> > the real issue; this patch changes this behavior by return ENOTTY
> > (Inappropriate ioctl for device). Additionally, some operations are
> > unsupported by this function, and returns EINVAL; this patch changes the
> > return value to EOPNOTSUPP (Operation not supported). Lastly, the
> > function drm_wait_vblank_ioctl is invoked by libdrm, which is used by
> > many compositors; because of this, it is important to check if this
> > change breaks any compositor. In this sense, the following projects were
> > examined:
> > 
> > * Drm-hwcomposer
> > * Kwin
> > * Sway
> > * Wlroots
> > * Wayland-core
> > * Weston
> > * Xorg (67 different drivers)
> > 
> > For each repository the verification happened in three steps:
> > 
> > * Update the main branch
> > * Look for any occurrence "drmWaitVBlank" with the command:
> >   git grep -n "drmWaitVBlank"
> > * Look in the git history of the project with the command:
> >   git log -SdrmWaitVBlank
> > 
> > Finally, none of the above projects validate the use of EINVAL which
> > make safe, at least for these projects, to change the return values.
> > 
> > Signed-off-by: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
> > ---
> >  drivers/gpu/drm/drm_vblank.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
> > index 98e091175921..88ec6fb49afb 100644
> > --- a/drivers/gpu/drm/drm_vblank.c
> > +++ b/drivers/gpu/drm/drm_vblank.c
> > @@ -1533,10 +1533,10 @@ int drm_wait_vblank_ioctl(struct drm_device *dev, void *data,
> >         unsigned int flags, pipe, high_pipe;
> >  
> >         if (!dev->irq_enabled)
> > -               return -EINVAL;
> > +               return -ENOTTY;
> 
> Arguable.

Hi Chris, thanks for your review :)

Originally, I noticed that DRM does not provide a mechanism for checking
if VBlank is supported or not by the driver. IMHO return ENOTTY can be
useful for virtual drivers and some specific devices; the userspace can
take this information and infer some information about the device,
consequently, handling different scenarios. This issue was raised when I
was working to implement the virtual mode in the VKMS (no vblank) and
tried to patch IGT to handle modules that do not support Vblank.
Finally, I believe that  ENOTTY precisely describes the condition
"if (!dev->irq_enabled)". Make sense?

> >  
> >         if (vblwait->request.type & _DRM_VBLANK_SIGNAL)
> > -               return -EINVAL;
> 
> User error -> einval.

Here, my primary motivation to add EOPNOTSUPP came from the comment in
_DRM_VBLANK_SIGNAL, which says:

_DRM_VBLANK_SIGNAL = 0x40000000 /**< Send signal instead of blocking, unsupported */

Then I thought that EOPNOTSUPP could better describe this situation.
 
> > +               return -EOPNOTSUPP;
> >  
> >         if (vblwait->request.type &
> >             ~(_DRM_VBLANK_TYPES_MASK | _DRM_VBLANK_FLAGS_MASK |
> > @@ -1545,7 +1545,7 @@ int drm_wait_vblank_ioctl(struct drm_device *dev, void *data,
> >                           vblwait->request.type,
> >                           (_DRM_VBLANK_TYPES_MASK | _DRM_VBLANK_FLAGS_MASK |
> >                            _DRM_VBLANK_HIGH_CRTC_MASK));
> > -               return -EINVAL;
> > +               return -EOPNOTSUPP;
> 
> User error -> einval.

About this one, you are right. Sorry, I misunderstood that part of the
code.

Thanks again.

> -Chris
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Rodrigo Siqueira
http://siqueira.tech
Graduate Student
Department of Computer Science
University of São Paulo
