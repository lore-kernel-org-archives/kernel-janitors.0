From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 17 Oct 2018 12:47:04 +0000
Subject: Re: [PATCH v2] drm/drm_vblank: Change EINVAL by the correct errno
Message-Id: <CAKMK7uF0ucof6gwAiY1SSp5oHt3BZ18Jkui5ugvkZc4u-NOJoA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181015170529.dgzpbm37hbuvqatc@smtp.gmail.com>
 <20181016123541.GW31561@phenom.ffwll.local> <20181017124315.khhlykapxnug6ej6@smtp.gmail.com>
In-Reply-To: <20181017124315.khhlykapxnug6ej6@smtp.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Cc: Gustavo Padovan <gustavo@padovan.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Sean Paul <sean@poorly.run>, Dave Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Wed, Oct 17, 2018 at 2:43 PM Rodrigo Siqueira
<rodrigosiqueiramelo@gmail.com> wrote:
>
> Hi,
>
> First of all, thanks to all for the reviewers and feedbacks.
>
> On 10/16, Daniel Vetter wrote:
> > On Mon, Oct 15, 2018 at 02:05:29PM -0300, Rodrigo Siqueira wrote:
> > > For historical reason, the function drm_wait_vblank_ioctl always return
> > > -EINVAL if something gets wrong. This scenario limits the flexibility
> > > for the userspace make detailed verification of the problem and take
> > > some action. In particular, the validation of “if (!dev->irq_enabled)”
> > > in the drm_wait_vblank_ioctl is responsible for checking if the driver
> > > support vblank or not. If the driver does not support VBlank, the
> > > function drm_wait_vblank_ioctl returns EINVAL which does not represent
> > > the real issue; this patch changes this behavior by return EOPNOTSUPP.
> > > Additionally, some operations are unsupported by this function, and
> > > returns EINVAL; this patch also changes the return value to EOPNOTSUPP
> > > in this case. Lastly, the function drm_wait_vblank_ioctl is invoked by
> > > libdrm, which is used by many compositors; because of this, it is
> > > important to check if this change breaks any compositor. In this sense,
> > > the following projects were examined:
> > >
> > > * Drm-hwcomposer
> > > * Kwin
> > > * Sway
> > > * Wlroots
> > > * Wayland-core
> > > * Weston
> > > * Xorg (67 different drivers)
> > >
> > > For each repository the verification happened in three steps:
> > >
> > > * Update the main branch
> > > * Look for any occurrence "drmWaitVBlank" with the command:
> > >   git grep -n "drmWaitVBlank"
> > > * Look in the git history of the project with the command:
> > >   git log -SdrmWaitVBlank
> > >
> > > Finally, none of the above projects validate the use of EINVAL which
> > > make safe, at least for these projects, to change the return values.
> > >
> > > Change since V1:
> > >  Daniel Vetter and Chris Wilson
> > >  - Replace ENOTTY by EOPNOTSUPP
> > >  - Return EINVAL if the parameters are wrong
> > >
> > > Signed-off-by: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
> >
> > Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> >
> > Can you pls also let intel-gfx-ci test this patch? You just need to
> > include intel-gfx@lists.freedesktop.org in your recipient list.
>
> I did know about intel-gfx-ci, really nice:)
>
> Should I CC this mailing list if I send patches to the DRM core, amdgpu,
> i915, vc4, vgem, and virtio-gpu? I suppose that IGT is running on the
> CI, right?

It's only intel gpus (well and one special amd one) running igt on a
_lot_ of different machines.

> Another question, do I need to send a V3 with intel-gfx-ci?

If the patch-set is unchanged people use the "FOR CI" subject prefix
when resending, instead of incrementing the version number.

> > For merging, since you plan to stick around doing kms stuff a bit: Want
> > commit rights for drm-misc?
> >
> > https://drm.pages.freedesktop.org/maintainer-tools/getting-started.html
>
> Yes, I want :)
> I will need some guidance, in the beginning, to get confident about the
> processes. If you can help me with this, I will be glad to play around
> with 'dim' and the merging tasks.

Sure, just ping me on irc. First you need a freedesktop.org ssh account:

https://www.freedesktop.org/wiki/AccountRequests/

You need to request access to the drm-misc group. Once you have the
bugzilla, pls ping me so I can ack it.

Thanks, Daniel

>
> Best Regards
>
> > Cheers, Daniel
> >
> > > ---
> > >  drivers/gpu/drm/drm_vblank.c | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
> > > index 98e091175921..80f5a3bb427e 100644
> > > --- a/drivers/gpu/drm/drm_vblank.c
> > > +++ b/drivers/gpu/drm/drm_vblank.c
> > > @@ -1533,10 +1533,10 @@ int drm_wait_vblank_ioctl(struct drm_device *dev, void *data,
> > >     unsigned int flags, pipe, high_pipe;
> > >
> > >     if (!dev->irq_enabled)
> > > -           return -EINVAL;
> > > +           return -EOPNOTSUPP;
> > >
> > >     if (vblwait->request.type & _DRM_VBLANK_SIGNAL)
> > > -           return -EINVAL;
> > > +           return -EOPNOTSUPP;
> > >
> > >     if (vblwait->request.type &
> > >         ~(_DRM_VBLANK_TYPES_MASK | _DRM_VBLANK_FLAGS_MASK |
> > > --
> > > 2.19.1
> >
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch
>
> --
> Rodrigo Siqueira
> https://siqueira.tech
> https://twitter.com/siqueirajordao
> Graduate Student
> Department of Computer Science
> University of São Paulo
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel



-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
