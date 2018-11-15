From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 15 Nov 2018 20:36:57 +0000
Subject: Re: [PATCH v2 -next] drm/amdgpu: remove set but not used variable 'ring'
Message-Id: <CADnq5_Ns03NWNzmgnXS-vm9TG_YW-V2HLRmEctJLdMcP3PoqqA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181115120035.4328-1-yuehaibing@huawei.com>
In-Reply-To: <20181115120035.4328-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: yuehaibing@huawei.com
Cc: Dave Airlie <airlied@linux.ie>, Feifei Xu <Feifei.Xu@amd.com>, David Francis <David.Francis@amd.com>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Maling list - DRI developers <dri-devel@lists.freedesktop.org>, Huang Rui <ray.huang@amd.com>, amd-gfx list <amd-gfx@lists.freedesktop.org>, "Deucher, Alexander" <alexander.deucher@amd.com>, Likun Gao <Likun.Gao@amd.com>, Christian Koenig <christian.koenig@amd.com>, Shaoyun Liu <Shaoyun.Liu@amd.com>

On Thu, Nov 15, 2018 at 11:12 AM YueHaibing <yuehaibing@huawei.com> wrote:
>
> Fixes gcc '-Wunused-but-set-variable' warning:
>
> drivers/gpu/drm/amd/amdgpu/psp_v10_0.c: In function 'psp_v10_0_ring_stop':
> drivers/gpu/drm/amd/amdgpu/psp_v10_0.c:230:19: warning:
>  variable 'ring' set but not used [-Wunused-but-set-variable]
>
> drivers/gpu/drm/amd/amdgpu/psp_v3_1.c: In function 'psp_v3_1_ring_stop':
> drivers/gpu/drm/amd/amdgpu/psp_v3_1.c:359:19: warning:
>  variable ‘ring’ set but not used [-Wunused-but-set-variable]
>
> It not used since commit
> 4ef72453311a ("drm/amdgpu: added api for stopping psp ring (v2)")
>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> Reviewed-by: Huang Rui <ray.huang@amd.com>

Applied.  thanks!


> ---
> v2:also remove it in psp_v3_1_ring_stop
> ---
>  drivers/gpu/drm/amd/amdgpu/psp_v10_0.c | 3 ---
>  drivers/gpu/drm/amd/amdgpu/psp_v3_1.c  | 3 ---
>  2 files changed, 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/psp_v10_0.c b/drivers/gpu/drm/amd/amdgpu/psp_v10_0.c
> index 295c220..d78b430 100644
> --- a/drivers/gpu/drm/amd/amdgpu/psp_v10_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/psp_v10_0.c
> @@ -240,12 +240,9 @@ static int psp_v10_0_ring_stop(struct psp_context *psp,
>                                enum psp_ring_type ring_type)
>  {
>         int ret = 0;
> -       struct psp_ring *ring;
>         unsigned int psp_ring_reg = 0;
>         struct amdgpu_device *adev = psp->adev;
>
> -       ring = &psp->km_ring;
> -
>         /* Write the ring destroy command to C2PMSG_64 */
>         psp_ring_reg = 3 << 16;
>         WREG32_SOC15(MP0, 0, mmMP0_SMN_C2PMSG_64, psp_ring_reg);
> diff --git a/drivers/gpu/drm/amd/amdgpu/psp_v3_1.c b/drivers/gpu/drm/amd/amdgpu/psp_v3_1.c
> index e1ebf77..cc5e3ac 100644
> --- a/drivers/gpu/drm/amd/amdgpu/psp_v3_1.c
> +++ b/drivers/gpu/drm/amd/amdgpu/psp_v3_1.c
> @@ -356,12 +356,9 @@ static int psp_v3_1_ring_stop(struct psp_context *psp,
>                               enum psp_ring_type ring_type)
>  {
>         int ret = 0;
> -       struct psp_ring *ring;
>         unsigned int psp_ring_reg = 0;
>         struct amdgpu_device *adev = psp->adev;
>
> -       ring = &psp->km_ring;
> -
>         /* Write the ring destroy command to C2PMSG_64 */
>         psp_ring_reg = 3 << 16;
>         WREG32_SOC15(MP0, 0, mmMP0_SMN_C2PMSG_64, psp_ring_reg);
> --
> 2.7.0
>
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
