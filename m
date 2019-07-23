From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 23 Jul 2019 18:45:07 +0000
Subject: Re: [PATCH][next] drm/amdgpu: remove redundant assignment to pointer 'ring'
Message-Id: <CADnq5_PE1rDzqd13MPWJmeK_BUS0EthH=WcZ0wruTy55yarnpw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190723134120.28441-1-colin.king@canonical.com>
In-Reply-To: <20190723134120.28441-1-colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Cc: David Zhou <David1.Zhou-5C7GfCeVMHo@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, amd-gfx list <amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Maling list - DRI developers <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Alex Deucher <alexander.deucher-5C7GfCeVMHo@public.gmane.org>, Leo Liu <leo.liu-5C7GfCeVMHo@public.gmane.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig-5C7GfCeVMHo@public.gmane.org>

On Tue, Jul 23, 2019 at 9:41 AM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> The pointer 'ring' is being assigned a value that is never
> read, hence the assignment is redundant and can be removed.
>
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c
> index 93b3500e522b..a2a8ca942f34 100644
> --- a/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c
> @@ -1331,7 +1331,6 @@ static int vcn_v1_0_pause_dpg_mode(struct amdgpu_device *adev,
>                                 WREG32_SOC15(UVD, 0, mmUVD_JRBC_RB_CNTL,
>                                                         UVD_JRBC_RB_CNTL__RB_RPTR_WR_EN_MASK);
>
> -                               ring = &adev->vcn.inst->ring_dec;
>                                 WREG32_SOC15(UVD, 0, mmUVD_RBC_RB_WPTR,
>                                                    RREG32_SOC15(UVD, 0, mmUVD_SCRATCH2) & 0x7FFFFFFF);
>                                 SOC15_WAIT_ON_RREG(UVD, 0, mmUVD_POWER_STATUS,

While we don't use ring here, I think the assignment is useful to
delineate that we are no longer working with the jpeg ring, but rather
the decode ring.  The mmUVD_RBC_RB_WPTR register is part of the decode
ring, not jpeg.  We would normally use the ring->wptr like we do for
the other rings, but in this particular case, the value happens to be
shadowed to a scratch register due to the way the dynamic power gating
works on that ring.

Alex

> --
> 2.20.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
