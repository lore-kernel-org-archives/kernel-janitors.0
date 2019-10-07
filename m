From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 07 Oct 2019 16:23:27 +0000
Subject: Re: [PATCH] drm/amd/powerplay: unlock on error in smu_resume()
Message-Id: <CADnq5_N3=qpKJ2YaP4h=SMnNU1jP8Y9VhwqfhzYZos7txQgcMw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191007090454.GE3865@mwanda>
 <MN2PR12MB3296695EB3D9799B10971184A29B0@MN2PR12MB3296.namprd12.prod.outlook.com>
In-Reply-To: <MN2PR12MB3296695EB3D9799B10971184A29B0@MN2PR12MB3296.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>
Cc: David Airlie <airlied@linux.ie>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Quan, Evan" <Evan.Quan@amd.com>, Rex Zhu <rex.zhu@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>, Dan Carpenter <dan.carpenter@oracle.com>

Applied.  thanks!

Alex

On Mon, Oct 7, 2019 at 6:29 AM Wang, Kevin(Yang) <Kevin1.Wang@amd.com> wrote:
>
> Reviewed-by: Kevin Wang <kevin1.wang@amd.com>
>
> Best Regards,
> Kevin
> ________________________________
> From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Dan Carpenter <dan.carpenter@oracle.com>
> Sent: Monday, October 7, 2019 5:04 PM
> To: Rex Zhu <rex.zhu@amd.com>; Quan, Evan <Evan.Quan@amd.com>
> Cc: Zhou, David(ChunMing) <David1.Zhou@amd.com>; David Airlie <airlied@linux.ie>; kernel-janitors@vger.kernel.org <kernel-janitors@vger.kernel.org>; amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>; dri-devel@lists.freedesktop.org <dri-devel@lists.freedesktop.org>; Daniel Vetter <daniel@ffwll.ch>; Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christian <Christian.Koenig@amd.com>
> Subject: [PATCH] drm/amd/powerplay: unlock on error in smu_resume()
>
> This function needs to drop the mutex before returning.
>
> Fixes: f7e3a5776fa6 ("drm/amd/powerplay: check SMU engine readiness before proceeding on S3 resume")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/gpu/drm/amd/powerplay/amdgpu_smu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c b/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
> index 6a64f765fcd4..f1fbbc8b77ee 100644
> --- a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
> +++ b/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
> @@ -1384,7 +1384,7 @@ static int smu_resume(void *handle)
>          ret = smu_start_smc_engine(smu);
>          if (ret) {
>                  pr_err("SMU is not ready yet!\n");
> -               return ret;
> +               goto failed;
>          }
>
>          ret = smu_smc_table_hw_init(smu, false);
> --
> 2.20.1
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
