From: Julia Lawall <julia.lawall@lip6.fr>
Date: Mon, 08 Dec 2014 16:17:57 +0000
Subject: Re: [PATCH 20/20] drm/radeon: fix misspelling of current function in string
Message-Id: <alpine.DEB.2.10.1412081716380.2560@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1417980062-25151-1-git-send-email-Julia.Lawall@lip6.fr> <1417980062-25151-21-git-send-email-Julia.Lawall@lip6.fr> <CADnq5_PW=xeQ=DxdoNxwvVxYjkav1qx1wL13OF92QwY6uX3gGg@mail.gmail.com>
In-Reply-To: <CADnq5_PW=xeQ=DxdoNxwvVxYjkav1qx1wL13OF92QwY6uX3gGg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, kernel-janitors@vger.kernel.org, linux@rasmusvillemoes.dk, LKML <linux-kernel@vger.kernel.org>, Maling list - DRI developers <dri-devel@lists.freedesktop.org>, Joe Perches <joe@perches.com>, =?ISO-8859-15?Q?Christian_K=F6nig?= <christian.koenig@amd.com>

On Mon, 8 Dec 2014, Alex Deucher wrote:

> On Sun, Dec 7, 2014 at 2:21 PM, Julia Lawall <Julia.Lawall@lip6.fr> wrote:
> > Replace a misspelled function name by %s and then __func__.
> >
> > This was done using Coccinelle, including the use of Levenshtein distance,
> > as proposed by Rasmus Villemoes.
> >
> > Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
>
> Looks fine to me.  For consistency, any chance you'd want to fix up
> the other places that use function names directly with this style
> patch?

I will try to do that soon.

julia

>
> Alex
>
> >
> > ---
> > The semantic patch is difficult to summarize, but is available in the cover
> > letter of this patch series.
> >
> >  drivers/gpu/drm/radeon/cik.c |   16 ++++++++++------
> >  1 file changed, 10 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/radeon/cik.c b/drivers/gpu/drm/radeon/cik.c
> > index 6dcde37..24d5e43 100644
> > --- a/drivers/gpu/drm/radeon/cik.c
> > +++ b/drivers/gpu/drm/radeon/cik.c
> > @@ -7367,34 +7367,38 @@ int cik_irq_set(struct radeon_device *rdev)
> >         }
> >         if (atomic_read(&rdev->irq.ring_int[CAYMAN_RING_TYPE_CP1_INDEX])) {
> >                 struct radeon_ring *ring = &rdev->ring[CAYMAN_RING_TYPE_CP1_INDEX];
> > -               DRM_DEBUG("si_irq_set: sw int cp1\n");
> > +               DRM_DEBUG("%s: sw int cp1\n", __func__);
> >                 if (ring->me = 1) {
> >                         switch (ring->pipe) {
> >                         case 0:
> >                                 cp_m1p0 |= TIME_STAMP_INT_ENABLE;
> >                                 break;
> >                         default:
> > -                               DRM_DEBUG("si_irq_set: sw int cp1 invalid pipe %d\n", ring->pipe);
> > +                               DRM_DEBUG("%s: sw int cp1 invalid pipe %d\n",
> > +                                         __func__, ring->pipe);
> >                                 break;
> >                         }
> >                 } else {
> > -                       DRM_DEBUG("si_irq_set: sw int cp1 invalid me %d\n", ring->me);
> > +                       DRM_DEBUG("%s: sw int cp1 invalid me %d\n", __func__,
> > +                                 ring->me);
> >                 }
> >         }
> >         if (atomic_read(&rdev->irq.ring_int[CAYMAN_RING_TYPE_CP2_INDEX])) {
> >                 struct radeon_ring *ring = &rdev->ring[CAYMAN_RING_TYPE_CP2_INDEX];
> > -               DRM_DEBUG("si_irq_set: sw int cp2\n");
> > +               DRM_DEBUG("%s: sw int cp2\n", __func__);
> >                 if (ring->me = 1) {
> >                         switch (ring->pipe) {
> >                         case 0:
> >                                 cp_m1p0 |= TIME_STAMP_INT_ENABLE;
> >                                 break;
> >                         default:
> > -                               DRM_DEBUG("si_irq_set: sw int cp2 invalid pipe %d\n", ring->pipe);
> > +                               DRM_DEBUG("%s: sw int cp2 invalid pipe %d\n",
> > +                                         __func__, ring->pipe);
> >                                 break;
> >                         }
> >                 } else {
> > -                       DRM_DEBUG("si_irq_set: sw int cp2 invalid me %d\n", ring->me);
> > +                       DRM_DEBUG("%s: sw int cp2 invalid me %d\n", __func__,
> > +                                 ring->me);
> >                 }
> >         }
> >
> >
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > http://lists.freedesktop.org/mailman/listinfo/dri-devel
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
