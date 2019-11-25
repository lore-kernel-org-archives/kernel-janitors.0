From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 25 Nov 2019 14:39:21 +0000
Subject: Re: [PATCH] drm/amd/powerplay: remove redundant assignment to variables HiSidd and LoSidd
Message-Id: <CADnq5_PN99cigjruAv38y2KHHdrNY2VAqKhD_K3yUoO01Q4b_w@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191122230407.109636-1-colin.king@canonical.com>
In-Reply-To: <20191122230407.109636-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, amd-gfx list <amd-gfx@lists.freedesktop.org>, Maling list - DRI developers <dri-devel@lists.freedesktop.org>, Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>, Rex Zhu <rex.zhu@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>

On Fri, Nov 22, 2019 at 6:04 PM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> The variables HiSidd and LoSidd are being initialized with values that
> are never read and are being updated a little later with a new value.
> The initialization is redundant and can be removed.
>
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.  Thanks!

Alex

> ---
>  drivers/gpu/drm/amd/powerplay/smumgr/ci_smumgr.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/powerplay/smumgr/ci_smumgr.c b/drivers/gpu/drm/amd/powerplay/smumgr/ci_smumgr.c
> index 15590fd86ef4..868e2d5f6e62 100644
> --- a/drivers/gpu/drm/amd/powerplay/smumgr/ci_smumgr.c
> +++ b/drivers/gpu/drm/amd/powerplay/smumgr/ci_smumgr.c
> @@ -653,8 +653,8 @@ static int ci_min_max_v_gnbl_pm_lid_from_bapm_vddc(struct pp_hwmgr *hwmgr)
>  static int ci_populate_bapm_vddc_base_leakage_sidd(struct pp_hwmgr *hwmgr)
>  {
>         struct ci_smumgr *smu_data = (struct ci_smumgr *)(hwmgr->smu_backend);
> -       uint16_t HiSidd = smu_data->power_tune_table.BapmVddCBaseLeakageHiSidd;
> -       uint16_t LoSidd = smu_data->power_tune_table.BapmVddCBaseLeakageLoSidd;
> +       uint16_t HiSidd;
> +       uint16_t LoSidd;
>         struct phm_cac_tdp_table *cac_table = hwmgr->dyn_state.cac_dtp_table;
>
>         HiSidd = (uint16_t)(cac_table->usHighCACLeakage / 100 * 256);
> --
> 2.24.0
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
