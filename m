From: Rob Clark <robdclark@gmail.com>
Date: Fri, 15 Feb 2019 22:31:05 +0000
Subject: Re: [Freedreno] [PATCH] drm/msm: fix an error code in the ioctl
Message-Id: <CAF6AEGugHtA1HNWGb85_weBtBHc9Ff5mnenK6yni_EgowWe2DA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190214071927.GC21768@kadam>
 <CAF6AEGtw76LLbEnpkbnLwd5Pt1P1_KiCDYcqr9mfrw=nKMo66A@mail.gmail.com>
 <20190215160106.GB10863@jcrouse1-lnx.qualcomm.com>
In-Reply-To: <20190215160106.GB10863@jcrouse1-lnx.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rob Clark <robdclark@gmail.com>, Dan Carpenter <dan.carpenter@oracle.com>, David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, kernel-janitors@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>, Daniel Vetter <daniel@ffwll.ch>, freedreno <freedreno@lists.freedesktop.org>

On Fri, Feb 15, 2019 at 11:01 AM Jordan Crouse <jcrouse@codeaurora.org> wrote:
>
> On Thu, Feb 14, 2019 at 06:16:01PM -0500, Rob Clark wrote:
> > On Thu, Feb 14, 2019 at 2:19 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> > >
> > > The copy_to/from_user() functions return the number of bytes remaining
> > > to be copied but we should return -EFAULT to the user.
> > >
> > > Fixes: f05c83e77460 ("drm/msm: add uapi to get/set debug name")
> > > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > > ---
> > > If I were reviewing this patch, I would be suspicous that we don't
> > > return immediately after the first copy_from_user() fails but I'm fairly
> > > sure that is the correct behavior.
> >
> > oh, hmm, you are defn right that the current code is incorrect..
>
> This one was Boneheaded-by: me.

come-on, credit where credit is due.. I boneheaded this one, and I
don't want to share the credit :-P

>
> > Although I guess I wonder if maybe in the -EFAULT case we should set a
> > null char at the end of the # of bytes copied in.  I guess the result
> > with your patch as-is is that you'd get part of the new debug name
> > string, and part of the old.  Which is maybe not incorrect or worse
> > than truncated new debug name.  (It is really mostly just for debugfs
> > after all.)
>
> > I guess we could copy_from_user() into a temp buffer to leave the old
> > debug name undisturbed in the -EFAULT case, but I'd accept he argument
> > that that would be overkill.
>
> Right. I think on failure we should just truncate the string back to strlen(0)
> and pretend that nothing happened.  I can toss up a patch for that.

Hmm, yeah, I think truncating by nulling out first byte is a sane
approach..  please remember to include Fixes and Reported-by tags.
Thx

BR,
-R

>
> Jordan
>
> > >
> > >  drivers/gpu/drm/msm/msm_drv.c | 10 ++++++----
> > >  1 file changed, 6 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> > > index b871e2e98129..1d4426cb260d 100644
> > > --- a/drivers/gpu/drm/msm/msm_drv.c
> > > +++ b/drivers/gpu/drm/msm/msm_drv.c
> > > @@ -851,8 +851,9 @@ static int msm_ioctl_gem_info(struct drm_device *dev, void *data,
> > >                         ret = -EINVAL;
> > >                         break;
> > >                 }
> > > -               ret = copy_from_user(msm_obj->name,
> > > -                       u64_to_user_ptr(args->value), args->len);
> > > +               if (copy_from_user(msm_obj->name, u64_to_user_ptr(args->value),
> > > +                                  args->len))
> > > +                       ret = -EFAULT;
> > >                 msm_obj->name[args->len] = '\0';
> > >                 for (i = 0; i < args->len; i++) {
> > >                         if (!isprint(msm_obj->name[i])) {
> > > @@ -868,8 +869,9 @@ static int msm_ioctl_gem_info(struct drm_device *dev, void *data,
> > >                 }
> > >                 args->len = strlen(msm_obj->name);
> > >                 if (args->value) {
> > > -                       ret = copy_to_user(u64_to_user_ptr(args->value),
> > > -                                       msm_obj->name, args->len);
> > > +                       if (copy_to_user(u64_to_user_ptr(args->value),
> > > +                                        msm_obj->name, args->len))
> > > +                               ret = -EFAULT;
> > >                 }
> > >                 break;
> > >         }
> > > --
> > > 2.17.1
> > >
> > _______________________________________________
> > Freedreno mailing list
> > Freedreno@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/freedreno
>
> --
> The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
> a Linux Foundation Collaborative Project
