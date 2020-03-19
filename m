From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 19 Mar 2020 03:17:20 +0000
Subject: Re: [PATCH][next] drm: amd: fix spelling mistake "shoudn't" -> "shouldn't"
Message-Id: <CADnq5_MNOCRxe=S2kp7c3miGJ11L35qFhz4S5PDPVX2NoODv9A@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200317114748.388420-1-colin.king@canonical.com>
 <CADnq5_NbdBhz+TQ0Ldng8fLjnRmDiuKDhTrqsC0WDt8-0Vq41g@mail.gmail.com>
In-Reply-To: <CADnq5_NbdBhz+TQ0Ldng8fLjnRmDiuKDhTrqsC0WDt8-0Vq41g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: David Zhou <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>, Felix Kuehling <Felix.Kuehling@amd.com>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, amd-gfx list <amd-gfx@lists.freedesktop.org>, Maling list - DRI developers <dri-devel@lists.freedesktop.org>, Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>

On Wed, Mar 18, 2020 at 11:10 PM Alex Deucher <alexdeucher@gmail.com> wrote:
>
> On Tue, Mar 17, 2020 at 7:47 AM Colin King <colin.king@canonical.com> wrote:
> >
> > From: Colin Ian King <colin.king@canonical.com>
> >
> > There are spelling mistakes in pr_err messages and a comment. Fix these.
> >
> > Signed-off-by: Colin Ian King <colin.king@canonical.com>
>
> The relevant code was recently dropped so no longer applies.

Sorry.  was looking at the wrong branch.  Applied.

Thanks!

Alex

>
> Thanks!
>
> Alex
>
> > ---
> >  drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c       | 2 +-
> >  drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c        | 2 +-
> >  drivers/gpu/drm/amd/amdkfd/kfd_flat_memory.c | 2 +-
> >  3 files changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
> > index d1cdcb404f7c..4bdf425ca6d8 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
> > @@ -246,7 +246,7 @@ static void gfx_v10_rlcg_wreg(struct amdgpu_device *adev, u32 offset, u32 v)
> >         grbm_idx = adev->reg_offset[GC_HWIP][0][mmGRBM_GFX_INDEX_BASE_IDX] + mmGRBM_GFX_INDEX;
> >
> >         if (amdgpu_sriov_runtime(adev)) {
> > -               pr_err("shoudn't call rlcg write register during runtime\n");
> > +               pr_err("shouldn't call rlcg write register during runtime\n");
> >                 return;
> >         }
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
> > index 7bc2486167e7..2dd40f23ce83 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
> > @@ -747,7 +747,7 @@ void gfx_v9_0_rlcg_wreg(struct amdgpu_device *adev, u32 offset, u32 v)
> >         grbm_idx = adev->reg_offset[GC_HWIP][0][mmGRBM_GFX_INDEX_BASE_IDX] + mmGRBM_GFX_INDEX;
> >
> >         if (amdgpu_sriov_runtime(adev)) {
> > -               pr_err("shoudn't call rlcg write register during runtime\n");
> > +               pr_err("shouldn't call rlcg write register during runtime\n");
> >                 return;
> >         }
> >
> > diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_flat_memory.c b/drivers/gpu/drm/amd/amdkfd/kfd_flat_memory.c
> > index bb77b8890e77..78714f9a8b11 100644
> > --- a/drivers/gpu/drm/amd/amdkfd/kfd_flat_memory.c
> > +++ b/drivers/gpu/drm/amd/amdkfd/kfd_flat_memory.c
> > @@ -316,7 +316,7 @@ static void kfd_init_apertures_vi(struct kfd_process_device *pdd, uint8_t id)
> >  {
> >         /*
> >          * node id couldn't be 0 - the three MSB bits of
> > -        * aperture shoudn't be 0
> > +        * aperture shouldn't be 0
> >          */
> >         pdd->lds_base = MAKE_LDS_APP_BASE_VI();
> >         pdd->lds_limit = MAKE_LDS_APP_LIMIT(pdd->lds_base);
> > --
> > 2.25.1
> >
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
