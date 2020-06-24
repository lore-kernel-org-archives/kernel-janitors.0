From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 24 Jun 2020 15:11:45 +0000
Subject: Re: [PATCH][next] drm: amdgpu: fix premature goto because of missing braces
Message-Id: <CADnq5_PA+Qs=oBkWwSneD1ptAVMdLcN3zL=UrjsNQFnaA2wLYQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200624141423.6307-1-colin.king@canonical.com>
 <f9ceecb4-2679-c0e2-8f64-4dd2a4f5401f@amd.com>
In-Reply-To: <f9ceecb4-2679-c0e2-8f64-4dd2a4f5401f@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nirmoy <nirmodas@amd.com>
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, amd-gfx list <amd-gfx@lists.freedesktop.org>, Sonny Jiang <sonny.jiang@amd.com>, Nirmoy Das <nirmoy.das@amd.com>, Maling list - DRI developers <dri-devel@lists.freedesktop.org>, Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>, Colin King <colin.king@canonical.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>

Applied.  Thanks!

Alex

On Wed, Jun 24, 2020 at 10:32 AM Nirmoy <nirmodas@amd.com> wrote:
>
> Acked-by: Nirmoy Das <nirmoy.das@amd.com>
>
>
> Thanks,
>
> Nirmoy
>
> On 6/24/20 4:14 PM, Colin King wrote:
> > From: Colin Ian King <colin.king@canonical.com>
> >
> > Currently the goto statement is skipping over a lot of setup code
> > because it is outside of an if-block and should be inside it. Fix
> > this by adding missing if statement braces.
> >
> > Addresses-Coverity: ("Structurally dead code")
> > Fixes: fd151ca5396d ("drm amdgpu: SI UVD v3_1")
> > Signed-off-by: Colin Ian King <colin.king@canonical.com>
> > ---
> >   drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c | 5 +++--
> >   1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c b/drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c
> > index 599719e89c31..7cf4b11a65c5 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c
> > @@ -642,9 +642,10 @@ static int uvd_v3_1_hw_init(void *handle)
> >       uvd_v3_1_start(adev);
> >
> >       r = amdgpu_ring_test_helper(ring);
> > -     if (r)
> > +     if (r) {
> >               DRM_ERROR("amdgpu: UVD ring test fail (%d).\n", r);
> > -     goto done;
> > +             goto done;
> > +     }
> >
> >       r = amdgpu_ring_alloc(ring, 10);
> >       if (r) {
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
