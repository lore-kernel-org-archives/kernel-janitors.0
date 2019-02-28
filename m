From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 28 Feb 2019 02:47:23 +0000
Subject: Re: [PATCH -next] drm/amdgpu: remove set but not used variable 'vbi_time_out'
Message-Id: <CADnq5_McbtEZVjyrP+E1ORx8UKMhmPmK2C5rSmcbDCothx0g-w@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190226054828.120809-1-yuehaibing@huawei.com>
In-Reply-To: <20190226054828.120809-1-yuehaibing-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Cc: Chunming Zhou <David1.Zhou-5C7GfCeVMHo@public.gmane.org>, Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, "Gustavo A. R. Silva" <gustavo-L1vi/lXTdts+Va1GwOuvDg@public.gmane.org>, Dave Airlie <airlied-cv59FeDIM0c@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Maling list - DRI developers <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Huang Rui <ray.huang-5C7GfCeVMHo@public.gmane.org>, amd-gfx list <amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, "Deucher,
 Alexander" <alexander.deucher-5C7GfCeVMHo@public.gmane.org>, "Quan, Evan" <evan.quan-5C7GfCeVMHo@public.gmane.org>, Rex Zhu <Rex.Zhu-5C7GfCeVMHo@public.gmane.org>, Christian Koenig <christian.koenig-5C7GfCeVMHo@public.gmane.org>

Applied.  thanks!

On Tue, Feb 26, 2019 at 12:36 AM YueHaibing <yuehaibing@huawei.com> wrote:
>
> Fixes gcc '-Wunused-but-set-variable' warning:
>
> drivers/gpu/drm/amd/amdgpu/si_dpm.c: In function 'si_program_response_times':
> drivers/gpu/drm/amd/amdgpu/si_dpm.c:4101:29: warning:
>  variable 'backbias_response_time' set but not used [-Wunused-but-set-variable]
>
> It's never used since introduction in 841686df9f7d ("drm/amdgpu: add SI DPM
> support (v4)"), so can be removed
>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/si_dpm.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/si_dpm.c b/drivers/gpu/drm/amd/amdgpu/si_dpm.c
> index 41e01a7f57a4..d57e75e5c71f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/si_dpm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/si_dpm.c
> @@ -4098,14 +4098,13 @@ static int si_notify_smc_display_change(struct amdgpu_device *adev,
>
>  static void si_program_response_times(struct amdgpu_device *adev)
>  {
> -       u32 voltage_response_time, backbias_response_time, acpi_delay_time, vbi_time_out;
> +       u32 voltage_response_time, acpi_delay_time, vbi_time_out;
>         u32 vddc_dly, acpi_dly, vbi_dly;
>         u32 reference_clock;
>
>         si_write_smc_soft_register(adev, SI_SMC_SOFT_REGISTER_mvdd_chg_time, 1);
>
>         voltage_response_time = (u32)adev->pm.dpm.voltage_response_time;
> -       backbias_response_time = (u32)adev->pm.dpm.backbias_response_time;
>
>         if (voltage_response_time = 0)
>                 voltage_response_time = 1000;
>
>
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
