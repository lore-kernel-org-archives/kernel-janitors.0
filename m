From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 24 Oct 2019 12:49:36 +0000
Subject: Re: [PATCH][next] drm/v3d: fix double free of bin
Message-Id: <CAKMK7uGbMx21+g2kQyGu5H-L7N-guKJhsZ6b1ROnz5+kDRt3LA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191024104801.3122-1-colin.king@canonical.com>
 <20191024123853.GH11828@phenom.ffwll.local> <821f0799-1f37-c853-d2c6-dd95883e02d8@canonical.com>
In-Reply-To: <821f0799-1f37-c853-d2c6-dd95883e02d8@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin Ian King <colin.king@canonical.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Sean Paul <sean@poorly.run>, Maxime Ripard <mripard@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Eric Anholt <eric@anholt.net>, David Airlie <airlied@linux.ie>, Navid Emamdoost <navid.emamdoost@gmail.com>, Iago Toral Quiroga <itoral@igalia.com>, dri-devel <dri-devel@lists.freedesktop.org>, kernel-janitors@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Thu, Oct 24, 2019 at 2:43 PM Colin Ian King <colin.king@canonical.com> wrote:
>
> On 24/10/2019 13:38, Daniel Vetter wrote:
> > On Thu, Oct 24, 2019 at 11:48:01AM +0100, Colin King wrote:
> >> From: Colin Ian King <colin.king@canonical.com>
> >>
> >> Two different fixes have addressed the same memory leak of bin and
> >> this now causes a double free of bin.  While the individual memory
> >> leak fixes are fine, both fixes together are problematic.
> >>
> >> Addresses-Coverity: ("Double free")
> >> Fixes: 29cd13cfd762 ("drm/v3d: Fix memory leak in v3d_submit_cl_ioctl")
> >> Fixes: 0d352a3a8a1f (" rm/v3d: don't leak bin job if v3d_job_init fails.")
> >> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> >
> > That sounds like wrong merge resolution somewhere, and we don't have those
> > patches merged together in any final tree yet anywhere. What's this based
> > on?
> > -Daniel
>
> linux-next

Ok adding Stephen. There's a merge conflict between drm-misc-fixes and
drm-next (I think) and the merge double-added the kfree(bin). See
above for the relevant sha1. Dave is already on here as a heads-up,
but also adding drm-misc maintainers.

Cheers, Daniel

>
> Colin
> >
> >> ---
> >>  drivers/gpu/drm/v3d/v3d_gem.c | 1 -
> >>  1 file changed, 1 deletion(-)
> >>
> >> diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
> >> index 549dde83408b..37515e47b47e 100644
> >> --- a/drivers/gpu/drm/v3d/v3d_gem.c
> >> +++ b/drivers/gpu/drm/v3d/v3d_gem.c
> >> @@ -568,7 +568,6 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void *data,
> >>              ret = v3d_job_init(v3d, file_priv, &bin->base,
> >>                                 v3d_job_free, args->in_sync_bcl);
> >>              if (ret) {
> >> -                    kfree(bin);
> >>                      v3d_job_put(&render->base);
> >>                      kfree(bin);
> >>                      return ret;
> >> --
> >> 2.20.1
> >>
> >
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel



-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
