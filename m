From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 19 Apr 2019 15:03:45 +0000
Subject: Re: [PATCH] drm/amdgpu: fix spelling mistake "gateing" -> "gating"
Message-Id: <CADnq5_M-bLsJH9VCE17xBSgnay5CKfVhGDQxm5H7vH=NkVVe2w@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190416115926.32669-1-colin.king@canonical.com>
 <2849eabb-6f89-08b9-4537-b75971b205bd@codeaurora.org>
In-Reply-To: <2849eabb-6f89-08b9-4537-b75971b205bd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mukesh Ojha <mojha-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: David Zhou <David1.Zhou-5C7GfCeVMHo@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, amd-gfx list <amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Maling list - DRI developers <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Colin King <colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig-5C7GfCeVMHo@public.gmane.org>

On Wed, Apr 17, 2019 at 3:04 AM Mukesh Ojha <mojha@codeaurora.org> wrote:
>
>
> On 4/16/2019 5:29 PM, Colin King wrote:
> > From: Colin Ian King <colin.king@canonical.com>
> >
> > There is a spelling mistake in a DRM_INFO message. Fix it.
> >
> > Signed-off-by: Colin Ian King <colin.king@canonical.com>
> Reviewed-by: Mukesh Ojha <mojha@codeaurora.org>


Applied.  thanks!

Alex

>
> Cheers,
> -Mukesh
> > ---
> >   drivers/gpu/drm/amd/amdgpu/vce_v2_0.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/vce_v2_0.c b/drivers/gpu/drm/amd/amdgpu/vce_v2_0.c
> > index bed78a778e3f..40363ca6c5f1 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/vce_v2_0.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/vce_v2_0.c
> > @@ -283,7 +283,7 @@ static int vce_v2_0_stop(struct amdgpu_device *adev)
> >       }
> >
> >       if (vce_v2_0_wait_for_idle(adev)) {
> > -             DRM_INFO("VCE is busy, Can't set clock gateing");
> > +             DRM_INFO("VCE is busy, Can't set clock gating");
> >               return 0;
> >       }
> >
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
