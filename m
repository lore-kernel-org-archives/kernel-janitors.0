From: Joe Perches <joe@perches.com>
Date: Wed, 05 Aug 2020 22:19:38 +0000
Subject: Re: [PATCH] drm/amdgpu: fix spelling mistake "Falied" -> "Failed"
Message-Id: <d720b466a2b4b7507a963f9a2605c7f81e82e7ba.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200805113510.18277-1-colin.king@canonical.com>
 <CADnq5_NA9f2N3xkH4WAdDEP+0-5W0LkmTRy3yXqFdnWQmfsVmQ@mail.gmail.com>
 <a8ab7d75ef9df54bd193fc88e0670b30026e7e67.camel@perches.com>
 <CADnq5_P9hfv=Zt9+m47sFC0z202x+q-Otifv7a5z4afJamtQ2Q@mail.gmail.com>
In-Reply-To: <CADnq5_P9hfv=Zt9+m47sFC0z202x+q-Otifv7a5z4afJamtQ2Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Deucher <alexdeucher@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, amd-gfx list <amd-gfx@lists.freedesktop.org>, Maling list - DRI developers <dri-devel@lists.freedesktop.org>, Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>, Colin King <colin.king@canonical.com>, Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>

On Wed, 2020-08-05 at 17:27 -0400, Alex Deucher wrote:
> On Wed, Aug 5, 2020 at 4:53 PM Joe Perches <joe@perches.com> wrote:
> > On Wed, 2020-08-05 at 16:01 -0400, Alex Deucher wrote:
> > > On Wed, Aug 5, 2020 at 7:35 AM Colin King <colin.king@canonical.com> wrote:
> > > > From: Colin Ian King <colin.king@canonical.com>
> > > > 
> > > > There is a spelling mistake in a DRM_ERROR message. Fix it.
> > > > 
> > > > Signed-off-by: Colin Ian King <colin.king@canonical.com>
> > > 
> > > This is already fixed.
> > 
> > This fix is not in today's -next.
> > 
> > Perhaps whatever tree it's fixed in should be in -next.
> > 
> 
> Weird.  It's in the drm-next tree as:
> 
> commit 4afaa61db9cf5250b5734c2531b226e7b3a3d691
> Author: Colin Ian King <colin.king@canonical.com>
> Date:   Fri Jul 10 09:37:58 2020 +0100
> 
>     drm/amdgpu: fix spelling mistake "Falied" -> "Failed"
> 
>     There is a spelling mistake in a DRM_ERROR error message. Fix it.
> 
>     Signed-off-by: Colin Ian King <colin.king@canonical.com>
>     Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> 
> Alex
> 
> > $ git show --oneline -s
> > d15fe4ec0435 (HEAD, tag: next-20200805, origin/master, origin/HEAD) Add linux-next specific files for 20200805
> > 
> > $ git grep -i falied drivers
> > drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:                DRM_ERROR("Falied to terminate tmr\n");
> > 
> > > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
> > []
> > > > @@ -2010,7 +2010,7 @@ static int psp_suspend(void *handle)
> > > > 
> > > >         ret = psp_tmr_terminate(psp);
> > > >         if (ret) {
> > > > -               DRM_ERROR("Falied to terminate tmr\n");
> > > > +               DRM_ERROR("Failed to terminate tmr\n");
> > > >                 return ret;
> > > >         }

Dunno.

Maybe it's due to some ordering of trees in
how -next accumulates patches?
