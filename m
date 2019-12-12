From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 12 Dec 2019 22:35:48 +0000
Subject: Re: [PATCH][next] drm/amd/powerplay: fix various dereferences of a pointer before it is null checked
Message-Id: <CADnq5_PXb035J7yyfX1gB3oNsVQb-L=KZHR31KxLEH-VUZfT8g@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191212181657.101381-1-colin.king@canonical.com>
In-Reply-To: <20191212181657.101381-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: David Zhou <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, amd-gfx list <amd-gfx@lists.freedesktop.org>, Maling list - DRI developers <dri-devel@lists.freedesktop.org>, Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>, Kenneth Feng <kenneth.feng@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, Yintian Tao <yttao@amd.com>

On Thu, Dec 12, 2019 at 1:17 PM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> There are several occurrances of the pointer hwmgr being dereferenced
> before it is null checked.  Fix these by performing the dereference
> of hwmgr after it has been null checked.
>
> Addresses-Coverity: ("Dereference before null check")
> Fixes: 8497d2bcdee1 ("drm/amd/powerplay: enable pp one vf mode for vega10")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.  thanks!

Alex

> ---
>  drivers/gpu/drm/amd/powerplay/amd_powerplay.c |  6 +++---
>  drivers/gpu/drm/amd/powerplay/hwmgr/hwmgr.c   | 15 +++------------
>  2 files changed, 6 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/powerplay/amd_powerplay.c b/drivers/gpu/drm/amd/powerplay/amd_powerplay.c
> index 5087d6bdba60..322c2015d3a0 100644
> --- a/drivers/gpu/drm/amd/powerplay/amd_powerplay.c
> +++ b/drivers/gpu/drm/amd/powerplay/amd_powerplay.c
> @@ -275,12 +275,12 @@ static int pp_dpm_load_fw(void *handle)
>  {
>         struct pp_hwmgr *hwmgr = handle;
>
> -       if (!hwmgr->not_vf)
> -               return 0;
> -
>         if (!hwmgr || !hwmgr->smumgr_funcs || !hwmgr->smumgr_funcs->start_smu)
>                 return -EINVAL;
>
> +       if (!hwmgr->not_vf)
> +               return 0;
> +
>         if (hwmgr->smumgr_funcs->start_smu(hwmgr)) {
>                 pr_err("fw load failed\n");
>                 return -EINVAL;
> diff --git a/drivers/gpu/drm/amd/powerplay/hwmgr/hwmgr.c b/drivers/gpu/drm/amd/powerplay/hwmgr/hwmgr.c
> index e2b82c902948..f48fdc7f0382 100644
> --- a/drivers/gpu/drm/amd/powerplay/hwmgr/hwmgr.c
> +++ b/drivers/gpu/drm/amd/powerplay/hwmgr/hwmgr.c
> @@ -282,10 +282,7 @@ int hwmgr_hw_init(struct pp_hwmgr *hwmgr)
>
>  int hwmgr_hw_fini(struct pp_hwmgr *hwmgr)
>  {
> -       if (!hwmgr->not_vf)
> -               return 0;
> -
> -       if (!hwmgr || !hwmgr->pm_en)
> +       if (!hwmgr || !hwmgr->pm_en || !hwmgr->not_vf)
>                 return 0;
>
>         phm_stop_thermal_controller(hwmgr);
> @@ -305,10 +302,7 @@ int hwmgr_suspend(struct pp_hwmgr *hwmgr)
>  {
>         int ret = 0;
>
> -       if (!hwmgr->not_vf)
> -               return 0;
> -
> -       if (!hwmgr || !hwmgr->pm_en)
> +       if (!hwmgr || !hwmgr->pm_en || !hwmgr->not_vf)
>                 return 0;
>
>         phm_disable_smc_firmware_ctf(hwmgr);
> @@ -327,13 +321,10 @@ int hwmgr_resume(struct pp_hwmgr *hwmgr)
>  {
>         int ret = 0;
>
> -       if (!hwmgr->not_vf)
> -               return 0;
> -
>         if (!hwmgr)
>                 return -EINVAL;
>
> -       if (!hwmgr->pm_en)
> +       if (!hwmgr->not_vf || !hwmgr->pm_en)
>                 return 0;
>
>         ret = phm_setup_asic(hwmgr);
> --
> 2.24.0
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
