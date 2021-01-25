From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 25 Jan 2021 15:06:58 +0000
Subject: Re: [PATCH][next] drm/amdgpu: Fix masking binary not operator on two mask operations
Message-Id: <CADnq5_PgXRv5LKO=yhx6NnYE4Et_PHa45JArAjorJ6W-GiDG2A@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210122150022.209454-1-colin.king@canonical.com>
 <20210125043623.GD610615@hr-amd>
In-Reply-To: <20210125043623.GD610615@hr-amd>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Huang Rui <ray.huang@amd.com>
Cc: David Airlie <airlied@linux.ie>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "Liu,
 Aaron" <Aaron.Liu@amd.com>, "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Daniel Vetter <daniel@ffwll.ch>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, Colin King <colin.king@canonical.com>, "Koenig, Christian" <Christian.Koenig@amd.com>

Applied.  Thanks!

Alex

On Sun, Jan 24, 2021 at 11:36 PM Huang Rui <ray.huang@amd.com> wrote:
>
> On Fri, Jan 22, 2021 at 11:00:22PM +0800, Colin King wrote:
> > From: Colin Ian King <colin.king@canonical.com>
> >
> > Currently the ! operator is incorrectly being used to flip bits on
> > mask values. Fix this by using the bit-wise ~ operator instead.
> >
> > Addresses-Coverity: ("Logical vs. bitwise operator")
> > Fixes: 3c9a7b7d6e75 ("drm/amdgpu: update mmhub mgcg&ls for mmhub_v2_3")
> > Signed-off-by: Colin Ian King <colin.king@canonical.com>
>
> Thanks.
>
> Reviewed-by: Huang Rui <ray.huang@amd.com>
>
> > ---
> >  drivers/gpu/drm/amd/amdgpu/mmhub_v2_3.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/mmhub_v2_3.c b/drivers/gpu/drm/amd/amdgpu/mmhub_v2_3.c
> > index 1961745e89c7..ab9be5ad5a5f 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/mmhub_v2_3.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/mmhub_v2_3.c
> > @@ -531,12 +531,12 @@ mmhub_v2_3_update_medium_grain_light_sleep(struct amdgpu_device *adev,
> >
> >       if (enable && (adev->cg_flags & AMD_CG_SUPPORT_MC_LS)) {
> >               data &= ~MM_ATC_L2_CGTT_CLK_CTRL__MGLS_OVERRIDE_MASK;
> > -             data1 &= !(DAGB0_WR_CGTT_CLK_CTRL__LS_OVERRIDE_MASK |
> > +             data1 &= ~(DAGB0_WR_CGTT_CLK_CTRL__LS_OVERRIDE_MASK |
> >                       DAGB0_WR_CGTT_CLK_CTRL__LS_OVERRIDE_WRITE_MASK |
> >                       DAGB0_WR_CGTT_CLK_CTRL__LS_OVERRIDE_READ_MASK |
> >                       DAGB0_WR_CGTT_CLK_CTRL__LS_OVERRIDE_RETURN_MASK |
> >                       DAGB0_WR_CGTT_CLK_CTRL__LS_OVERRIDE_REGISTER_MASK);
> > -             data2 &= !(DAGB0_RD_CGTT_CLK_CTRL__LS_OVERRIDE_MASK |
> > +             data2 &= ~(DAGB0_RD_CGTT_CLK_CTRL__LS_OVERRIDE_MASK |
> >                       DAGB0_RD_CGTT_CLK_CTRL__LS_OVERRIDE_WRITE_MASK |
> >                       DAGB0_RD_CGTT_CLK_CTRL__LS_OVERRIDE_READ_MASK |
> >                       DAGB0_RD_CGTT_CLK_CTRL__LS_OVERRIDE_RETURN_MASK |
> > --
> > 2.29.2
> >
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
