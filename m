From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 01 Jan 2018 21:07:44 +0000
Subject: Re: [PATCH 11/12] drm/amd/powerplay: drop unneeded newline
Message-Id: <CADnq5_OwRm41P4i_sQ0u8HvA_9YA-v13UCbpm20hbAgx+nuNjw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1514386305-7402-1-git-send-email-Julia.Lawall@lip6.fr>
 <1514386305-7402-12-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1514386305-7402-12-git-send-email-Julia.Lawall-L2FTfq7BK8M@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall-L2FTfq7BK8M@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, amd-gfx list <amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Maling list - DRI developers <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Alex Deucher <alexander.deucher-5C7GfCeVMHo@public.gmane.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig-5C7GfCeVMHo@public.gmane.org>

On Wed, Dec 27, 2017 at 9:51 AM, Julia Lawall <Julia.Lawall@lip6.fr> wrote:
> PP_ASSERT_WITH_CODE prints a newline at the end of the message string,
> so the message string does not need to include a newline explicitly.
> Done using Coccinelle.
>
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Applied.  thanks!

Alex

>
> ---
>
> I couldn't figure out how to configure the kernel to get any of this code
> to compile.
>
>  drivers/gpu/drm/amd/powerplay/hwmgr/smu7_hwmgr.c        |   12 ++++++++----
>  drivers/gpu/drm/amd/powerplay/smumgr/fiji_smumgr.c      |    2 +-
>  drivers/gpu/drm/amd/powerplay/smumgr/iceland_smumgr.c   |    2 +-
>  drivers/gpu/drm/amd/powerplay/smumgr/polaris10_smumgr.c |    2 +-
>  drivers/gpu/drm/amd/powerplay/smumgr/tonga_smumgr.c     |    2 +-
>  5 files changed, 12 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/powerplay/hwmgr/smu7_hwmgr.c b/drivers/gpu/drm/amd/powerplay/hwmgr/smu7_hwmgr.c
> index 40adc85..8d7fd06 100644
> --- a/drivers/gpu/drm/amd/powerplay/hwmgr/smu7_hwmgr.c
> +++ b/drivers/gpu/drm/amd/powerplay/hwmgr/smu7_hwmgr.c
> @@ -2266,14 +2266,18 @@ static int smu7_set_private_data_based_on_pptable_v0(struct pp_hwmgr *hwmgr)
>         struct phm_clock_voltage_dependency_table *allowed_mclk_vddci_table = hwmgr->dyn_state.vddci_dependency_on_mclk;
>
>         PP_ASSERT_WITH_CODE(allowed_sclk_vddc_table != NULL,
> -               "VDDC dependency on SCLK table is missing. This table is mandatory\n", return -EINVAL);
> +               "VDDC dependency on SCLK table is missing. This table is mandatory",
> +               return -EINVAL);
>         PP_ASSERT_WITH_CODE(allowed_sclk_vddc_table->count >= 1,
> -               "VDDC dependency on SCLK table has to have is missing. This table is mandatory\n", return -EINVAL);
> +               "VDDC dependency on SCLK table has to have is missing. This table is mandatory",
> +               return -EINVAL);
>
>         PP_ASSERT_WITH_CODE(allowed_mclk_vddc_table != NULL,
> -               "VDDC dependency on MCLK table is missing. This table is mandatory\n", return -EINVAL);
> +               "VDDC dependency on MCLK table is missing. This table is mandatory",
> +               return -EINVAL);
>         PP_ASSERT_WITH_CODE(allowed_mclk_vddc_table->count >= 1,
> -               "VDD dependency on MCLK table has to have is missing. This table is mandatory\n", return -EINVAL);
> +               "VDD dependency on MCLK table has to have is missing. This table is mandatory",
> +               return -EINVAL);
>
>         data->min_vddc_in_pptable = (uint16_t)allowed_sclk_vddc_table->entries[0].v;
>         data->max_vddc_in_pptable = (uint16_t)allowed_sclk_vddc_table->entries[allowed_sclk_vddc_table->count - 1].v;
> diff --git a/drivers/gpu/drm/amd/powerplay/smumgr/fiji_smumgr.c b/drivers/gpu/drm/amd/powerplay/smumgr/fiji_smumgr.c
> index 085d81c..427daa6 100644
> --- a/drivers/gpu/drm/amd/powerplay/smumgr/fiji_smumgr.c
> +++ b/drivers/gpu/drm/amd/powerplay/smumgr/fiji_smumgr.c
> @@ -1799,7 +1799,7 @@ static int fiji_populate_clock_stretcher_data_table(struct pp_hwmgr *hwmgr)
>                 phm_cap_unset(hwmgr->platform_descriptor.platformCaps,
>                                 PHM_PlatformCaps_ClockStretcher);
>                 PP_ASSERT_WITH_CODE(false,
> -                               "Stretch Amount in PPTable not supported\n",
> +                               "Stretch Amount in PPTable not supported",
>                                 return -EINVAL);
>         }
>
> diff --git a/drivers/gpu/drm/amd/powerplay/smumgr/iceland_smumgr.c b/drivers/gpu/drm/amd/powerplay/smumgr/iceland_smumgr.c
> index 1253126..6400065 100644
> --- a/drivers/gpu/drm/amd/powerplay/smumgr/iceland_smumgr.c
> +++ b/drivers/gpu/drm/amd/powerplay/smumgr/iceland_smumgr.c
> @@ -546,7 +546,7 @@ static int iceland_get_std_voltage_value_sidd(struct pp_hwmgr *hwmgr,
>
>         /* SCLK/VDDC Dependency Table has to exist. */
>         PP_ASSERT_WITH_CODE(NULL != hwmgr->dyn_state.vddc_dependency_on_sclk,
> -                       "The SCLK/VDDC Dependency Table does not exist.\n",
> +                       "The SCLK/VDDC Dependency Table does not exist.",
>                         return -EINVAL);
>
>         if (NULL = hwmgr->dyn_state.cac_leakage_table) {
> diff --git a/drivers/gpu/drm/amd/powerplay/smumgr/polaris10_smumgr.c b/drivers/gpu/drm/amd/powerplay/smumgr/polaris10_smumgr.c
> index cdb4765..fd874f7 100644
> --- a/drivers/gpu/drm/amd/powerplay/smumgr/polaris10_smumgr.c
> +++ b/drivers/gpu/drm/amd/powerplay/smumgr/polaris10_smumgr.c
> @@ -1652,7 +1652,7 @@ static int polaris10_populate_clock_stretcher_data_table(struct pp_hwmgr *hwmgr)
>                 phm_cap_unset(hwmgr->platform_descriptor.platformCaps,
>                                 PHM_PlatformCaps_ClockStretcher);
>                 PP_ASSERT_WITH_CODE(false,
> -                               "Stretch Amount in PPTable not supported\n",
> +                               "Stretch Amount in PPTable not supported",
>                                 return -EINVAL);
>         }
>
> diff --git a/drivers/gpu/drm/amd/powerplay/smumgr/tonga_smumgr.c b/drivers/gpu/drm/amd/powerplay/smumgr/tonga_smumgr.c
> index 79e5c05..5eb719e 100644
> --- a/drivers/gpu/drm/amd/powerplay/smumgr/tonga_smumgr.c
> +++ b/drivers/gpu/drm/amd/powerplay/smumgr/tonga_smumgr.c
> @@ -1699,7 +1699,7 @@ static int tonga_populate_clock_stretcher_data_table(struct pp_hwmgr *hwmgr)
>                 phm_cap_unset(hwmgr->platform_descriptor.platformCaps,
>                                 PHM_PlatformCaps_ClockStretcher);
>                 PP_ASSERT_WITH_CODE(false,
> -                               "Stretch Amount in PPTable not supported\n",
> +                               "Stretch Amount in PPTable not supported",
>                                 return -EINVAL);
>         }
>
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
