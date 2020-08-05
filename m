From: Joe Perches <joe@perches.com>
Date: Wed, 05 Aug 2020 20:53:25 +0000
Subject: Re: [PATCH] drm/amdgpu: fix spelling mistake "Falied" -> "Failed"
Message-Id: <a8ab7d75ef9df54bd193fc88e0670b30026e7e67.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200805113510.18277-1-colin.king@canonical.com>
 <CADnq5_NA9f2N3xkH4WAdDEP+0-5W0LkmTRy3yXqFdnWQmfsVmQ@mail.gmail.com>
In-Reply-To: <CADnq5_NA9f2N3xkH4WAdDEP+0-5W0LkmTRy3yXqFdnWQmfsVmQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Deucher <alexdeucher@gmail.com>, Colin King <colin.king@canonical.com>
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Maling list - DRI developers <dri-devel@lists.freedesktop.org>, amd-gfx list <amd-gfx@lists.freedesktop.org>, Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>, Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>

On Wed, 2020-08-05 at 16:01 -0400, Alex Deucher wrote:
> On Wed, Aug 5, 2020 at 7:35 AM Colin King <colin.king@canonical.com> wrote:
> > From: Colin Ian King <colin.king@canonical.com>
> > 
> > There is a spelling mistake in a DRM_ERROR message. Fix it.
> > 
> > Signed-off-by: Colin Ian King <colin.king@canonical.com>
> 
> This is already fixed.

This fix is not in today's -next.

Perhaps whatever tree it's fixed in should be in -next.


$ git show --oneline -s
d15fe4ec0435 (HEAD, tag: next-20200805, origin/master, origin/HEAD) Add linux-next specific files for 20200805

$ git grep -i falied drivers
drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:                DRM_ERROR("Falied to terminate tmr\n");

> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
[]
> > @@ -2010,7 +2010,7 @@ static int psp_suspend(void *handle)
> > 
> >         ret = psp_tmr_terminate(psp);
> >         if (ret) {
> > -               DRM_ERROR("Falied to terminate tmr\n");
> > +               DRM_ERROR("Failed to terminate tmr\n");
> >                 return ret;
> >         }
