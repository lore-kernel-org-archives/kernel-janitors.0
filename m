From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 24 Nov 2020 16:36:52 +0000
Subject: Re: [PATCH] drm/amd/powerplay: fix spelling mistake "smu_state_memroy_block" -> "smu_state_memory_bl
Message-Id: <CADnq5_OHzmR4SE4GXukZX2Z2byqYkMRy-G2EXUTvz+yuwsE6fw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201123105417.198314-1-colin.king@canonical.com>
 <DM6PR12MB26197807564F833B9A2E18E8E4FB0@DM6PR12MB2619.namprd12.prod.outlook.com>
In-Reply-To: <DM6PR12MB26197807564F833B9A2E18E8E4FB0@DM6PR12MB2619.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Quan, Evan" <Evan.Quan@amd.com>
Cc: "Gui, Jack" <Jack.Gui@amd.com>, David Airlie <airlied@linux.ie>, "Wang,
 Kevin(Yang)" <Kevin1.Wang@amd.com>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Daniel Vetter <daniel@ffwll.ch>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, Colin King <colin.king@canonical.com>, "Koenig, Christian" <Christian.Koenig@amd.com>

Applied.  Thanks!

Alex

On Mon, Nov 23, 2020 at 7:42 PM Quan, Evan <Evan.Quan@amd.com> wrote:
>
> [AMD Official Use Only - Internal Distribution Only]
>
> Reviewed-by: Evan Quan <evan.quan@amd.com>
>
> -----Original Message-----
> From: Colin King <colin.king@canonical.com>
> Sent: Monday, November 23, 2020 6:54 PM
> To: Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christian <Christian.Koenig@amd.com>; David Airlie <airlied@linux.ie>; Daniel Vetter <daniel@ffwll.ch>; Quan, Evan <Evan.Quan@amd.com>; Wang, Kevin(Yang) <Kevin1.Wang@amd.com>; Gui, Jack <Jack.Gui@amd.com>; amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
> Cc: kernel-janitors@vger.kernel.org; linux-kernel@vger.kernel.org
> Subject: [PATCH] drm/amd/powerplay: fix spelling mistake "smu_state_memroy_block" -> "smu_state_memory_block"
>
> From: Colin Ian King <colin.king@canonical.com>
>
> The struct name smu_state_memroy_block contains a spelling mistake, rename it to smu_state_memory_block
>
> Fixes: 8554e67d6e22 ("drm/amd/powerplay: implement power_dpm_state sys interface for SMU11")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/gpu/drm/amd/pm/inc/amdgpu_smu.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/inc/amdgpu_smu.h b/drivers/gpu/drm/amd/pm/inc/amdgpu_smu.h
> index 7550757cc059..a559ea2204c1 100644
> --- a/drivers/gpu/drm/amd/pm/inc/amdgpu_smu.h
> +++ b/drivers/gpu/drm/amd/pm/inc/amdgpu_smu.h
> @@ -99,7 +99,7 @@ struct smu_state_display_block {
>  bool              enable_vari_bright;
>  };
>
> -struct smu_state_memroy_block {
> +struct smu_state_memory_block {
>  bool              dll_off;
>  uint8_t                 m3arb;
>  uint8_t                 unused[3];
> @@ -146,7 +146,7 @@ struct smu_power_state {
>  struct smu_state_validation_block             validation;
>  struct smu_state_pcie_block                   pcie;
>  struct smu_state_display_block                display;
> -struct smu_state_memroy_block                 memory;
> +struct smu_state_memory_block                 memory;
>  struct smu_state_software_algorithm_block     software;
>  struct smu_uvd_clocks                         uvd_clocks;
>  struct smu_hw_power_state                     hardware;
> --
> 2.28.0
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
