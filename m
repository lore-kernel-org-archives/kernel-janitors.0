From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 11 Jan 2021 16:08:15 +0000
Subject: Re: [PATCH -next] drm/amd/display: tweak the kerneldoc for active_vblank_irq_count
Message-Id: <CADnq5_OswDHBTHrGJUR58WphBvi5sS7uBcCj5uyBVgweA1tHpA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210111084640.28500-1-lukas.bulwahn@gmail.com>
 <MW3PR12MB45540B2E1C07A2A666D4A938F9AB0@MW3PR12MB4554.namprd12.prod.outlook.com>
In-Reply-To: <MW3PR12MB45540B2E1C07A2A666D4A938F9AB0@MW3PR12MB4554.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Lakha, Bhawanpreet" <Bhawanpreet.Lakha@amd.com>
Cc: "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Koenig,
 Christian" <Christian.Koenig@amd.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, "Kazlauskas,
 Nicholas" <Nicholas.Kazlauskas@amd.com>

Applied.  Thanks!

Alex

On Mon, Jan 11, 2021 at 10:54 AM Lakha, Bhawanpreet
<Bhawanpreet.Lakha@amd.com> wrote:
>
> [AMD Official Use Only - Internal Distribution Only]
>
>
> Thanks,
>
> Reviewed-by: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
> ________________________________
> From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> Sent: January 11, 2021 3:46 AM
> To: Lakha, Bhawanpreet <Bhawanpreet.Lakha@amd.com>; Kazlauskas, Nicholas <Nicholas.Kazlauskas@amd.com>; Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christian <Christian.Koenig@amd.com>; amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>
> Cc: dri-devel@lists.freedesktop.org <dri-devel@lists.freedesktop.org>; linux-kernel@vger.kernel.org <linux-kernel@vger.kernel.org>; linux-doc@vger.kernel.org <linux-doc@vger.kernel.org>; kernel-janitors@vger.kernel.org <kernel-janitors@vger.kernel.org>; Lukas Bulwahn <lukas.bulwahn@gmail.com>
> Subject: [PATCH -next] drm/amd/display: tweak the kerneldoc for active_vblank_irq_count
>
> Commit 71338cb4a7c2 ("drm/amd/display: enable idle optimizations for linux
> (MALL stutter)") adds active_vblank_irq_count to amdgpu_display_manager
> in ./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h.
>
> The kerneldoc is incorrectly formatted, and make htmldocs warns:
>
>   ./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:
>     340: warning: Incorrect use of kernel-doc format:          * @active_vblank_irq_count
>     379: warning: Function parameter or member 'active_vblank_irq_count' not described in 'amdgpu_display_manager'
>
> Tweak the kerneldoc for active_vblank_irq_count.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
> applies on amdgpu's -next and next-20210111
>
> Bhawanpreet, Nick, please review and ack.
>
> Alex, Christian, please pick on top of the commit above.
>
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> index f084e2fc9569..5ee1b766884e 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> @@ -337,7 +337,7 @@ struct amdgpu_display_manager {
>          const struct gpu_info_soc_bounding_box_v1_0 *soc_bounding_box;
>
>          /**
> -        * @active_vblank_irq_count
> +        * @active_vblank_irq_count:
>           *
>           * number of currently active vblank irqs
>           */
> --
> 2.17.1
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
