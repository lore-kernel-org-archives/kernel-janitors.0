From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 13 Nov 2017 19:21:49 +0000
Subject: Re: [PATCH] drm/amdgpu/virt: remove redundant variable pf2vf_ver
Message-Id: <CADnq5_NXqToFOvrTqVAxSi2QuzRJbbSY694+sjfMzPGrAvpBBA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171111115110.3026-1-colin.king@canonical.com>
 <SN1PR12MB046220FED69C71FF1AB98596842B0@SN1PR12MB0462.namprd12.prod.outlook.com>
 <MWHPR12MB1629A7003BEC52A2399D07DCE12B0@MWHPR12MB1629.namprd12.prod.outlook.com>
In-Reply-To: <MWHPR12MB1629A7003BEC52A2399D07DCE12B0@MWHPR12MB1629.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: "Chen, Horace" <Horace.Chen@amd.com>
Cc: David Airlie <airlied@linux.ie>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Yu,
 Xiangliang" <Xiangliang.Yu@amd.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, Colin King <colin.king@canonical.com>, "Koenig, Christian" <Christian.Koenig@amd.com>, "Liu, Monk" <Monk.Liu@amd.com>

On Mon, Nov 13, 2017 at 9:40 AM, Chen, Horace <Horace.Chen@amd.com> wrote:
> Reivewed-by: Horace Chen <horace.chen@amd.com>

Applied.  thanks!

Alex

>
> -----Original Message-----
> From: Liu, Monk
> Sent: Monday, November 13, 2017 11:43 AM
> To: Chen, Horace <Horace.Chen@amd.com>; Colin King <colin.king@canonical.com>; Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christian <Christian.Koenig@amd.com>; David Airlie <airlied@linux.ie>; Yu, Xiangliang <Xiangliang.Yu@amd.com>; amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
> Cc: kernel-janitors@vger.kernel.org; linux-kernel@vger.kernel.org
> Subject: RE: [PATCH] drm/amdgpu/virt: remove redundant variable pf2vf_ver
> Importance: High
>
> + Horace
>
> -----Original Message-----
> From: Colin King [mailto:colin.king@canonical.com]
> Sent: 2017年11月11日 19:51
> To: Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christian <Christian.Koenig@amd.com>; David Airlie <airlied@linux.ie>; Liu, Monk <Monk.Liu@amd.com>; Yu, Xiangliang <Xiangliang.Yu@amd.com>; amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
> Cc: kernel-janitors@vger.kernel.org; linux-kernel@vger.kernel.org
> Subject: [PATCH] drm/amdgpu/virt: remove redundant variable pf2vf_ver
>
> From: Colin Ian King <colin.king@canonical.com>
>
> Variable pf2vf_ver is assigned but never read, it is redundant and hence can be removed.
>
> Cleans up clang warning:
> drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c:310:3: warning: Value stored to 'pf2vf_ver' is never read
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
> index 6738df836a70..b1cc179512fa 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
> @@ -296,7 +296,6 @@ int amdgpu_virt_fw_reserve_get_checksum(void *obj,
>
>  void amdgpu_virt_init_data_exchange(struct amdgpu_device *adev)  {
> -       uint32_t pf2vf_ver = 0;
>         uint32_t pf2vf_size = 0;
>         uint32_t checksum = 0;
>         uint32_t checkval;
> @@ -309,7 +308,6 @@ void amdgpu_virt_init_data_exchange(struct amdgpu_device *adev)
>                 adev->virt.fw_reserve.p_pf2vf =
>                         (struct amdgim_pf2vf_info_header *)(
>                         adev->fw_vram_usage.va + AMDGIM_DATAEXCHANGE_OFFSET);
> -               pf2vf_ver = adev->virt.fw_reserve.p_pf2vf->version;
>                 AMDGPU_FW_VRAM_PF2VF_READ(adev, header.size, &pf2vf_size);
>                 AMDGPU_FW_VRAM_PF2VF_READ(adev, checksum, &checksum);
>
> --
> 2.14.1
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
