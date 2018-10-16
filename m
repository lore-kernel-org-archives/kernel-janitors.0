From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 16 Oct 2018 17:53:56 +0000
Subject: Re: [PATCH v2] drm/drm_vblank: Change EINVAL by the correct errno
Message-Id: <CAKMK7uEYM2nfPV5NmcxD12oVEWLmTd0-4Ox+A570SGRVULFAmw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181015170529.dgzpbm37hbuvqatc@smtp.gmail.com>
 <57b40f9f-24d2-27de-4895-5a76ff267643@linux.intel.com> <20181016163831.GA31561@phenom.ffwll.local>
 <20181016172803.GH9144@intel.com>
In-Reply-To: <20181016172803.GH9144@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: "Syrjala, Ville" <ville.syrjala@linux.intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, Gustavo Padovan <gustavo@padovan.org>, Sean Paul <sean@poorly.run>, Dave Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Tue, Oct 16, 2018 at 7:28 PM Ville Syrjälä
<ville.syrjala@linux.intel.com> wrote:
>
> On Tue, Oct 16, 2018 at 06:38:31PM +0200, Daniel Vetter wrote:
> > On Tue, Oct 16, 2018 at 03:36:20PM +0200, Maarten Lankhorst wrote:
> > > Op 15-10-18 om 19:05 schreef Rodrigo Siqueira:
> > > > For historical reason, the function drm_wait_vblank_ioctl always return
> > > > -EINVAL if something gets wrong. This scenario limits the flexibility
> > > > for the userspace make detailed verification of the problem and take
> > > > some action. In particular, the validation of “if (!dev->irq_enabled)”
> > > > in the drm_wait_vblank_ioctl is responsible for checking if the driver
> > > > support vblank or not. If the driver does not support VBlank, the
> > > > function drm_wait_vblank_ioctl returns EINVAL which does not represent
> > > > the real issue; this patch changes this behavior by return EOPNOTSUPP.
> > > > Additionally, some operations are unsupported by this function, and
> > > > returns EINVAL; this patch also changes the return value to EOPNOTSUPP
> > > > in this case. Lastly, the function drm_wait_vblank_ioctl is invoked by
> > > > libdrm, which is used by many compositors; because of this, it is
> > > > important to check if this change breaks any compositor. In this sense,
> > > > the following projects were examined:
> > > >
> > > > * Drm-hwcomposer
> > > > * Kwin
> > > > * Sway
> > > > * Wlroots
> > > > * Wayland-core
> > > > * Weston
> > > > * Xorg (67 different drivers)
> > > >
> > > > For each repository the verification happened in three steps:
> > > >
> > > > * Update the main branch
> > > > * Look for any occurrence "drmWaitVBlank" with the command:
> > > >   git grep -n "drmWaitVBlank"
> > > > * Look in the git history of the project with the command:
> > > >   git log -SdrmWaitVBlank
> > > >
> > > > Finally, none of the above projects validate the use of EINVAL which
> > > > make safe, at least for these projects, to change the return values.
> > > >
> > > > Change since V1:
> > > >  Daniel Vetter and Chris Wilson
> > > >  - Replace ENOTTY by EOPNOTSUPP
> > > >  - Return EINVAL if the parameters are wrong
> > > >
> > > > Signed-off-by: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
> > > > ---
> > > >  drivers/gpu/drm/drm_vblank.c | 4 ++--
> > > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
> > > > index 98e091175921..80f5a3bb427e 100644
> > > > --- a/drivers/gpu/drm/drm_vblank.c
> > > > +++ b/drivers/gpu/drm/drm_vblank.c
> > > > @@ -1533,10 +1533,10 @@ int drm_wait_vblank_ioctl(struct drm_device *dev, void *data,
> > > >   unsigned int flags, pipe, high_pipe;
> > > >
> > > >   if (!dev->irq_enabled)
> > > > -         return -EINVAL;
> > > > +         return -EOPNOTSUPP;
> > > Change to -EIO?
> > >
> > > If userspace would ever print this out, it would print the following
> > > confusing message to userspace:
> > > "Operation not supported on transport endpoint"
> >
> > You're a bit late, EOPNOTSUPP is not established already in upstream for
> > this. And -EIO is taken already for "the gpu is dead".
> >
> > > >
> > > >   if (vblwait->request.type & _DRM_VBLANK_SIGNAL)
> > > > -         return -EINVAL;
> > > > +         return -EOPNOTSUPP;
> > > I would keep this -EINVAL, tbh and making it part of the below if statement..
> >
> > We discussed this, it's different: This here is an ioctl flag that's no
> > longer supported, the below is just an invalid request. Hence different
> > errno.
> >
> > I think you missed a bit with your bikeshed :-)
>
> I think I too agree with the -EINVAL here as this flag is never
> supported, whereas -EOPNOTSUPP seems to mean "this flag is still
> valid, but not supported by your current hardware/driver
> configuration".

Michel Dänzer claims this was support way back in 2.6.29 or so :-)

> Also drm_invalid_op() uses -EINVAL for deprecated features as well.

Should probably adjust that too. The entire EOPNOTSUPP color choice is
very brand new ...
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
