From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 17 Nov 2020 18:42:46 +0000
Subject: Re: [PATCH][next] drm/amd/pm: fix spelling mistakes in dev_warn messages
Message-Id: <CADnq5_PK_Z3eAwK6gNOu-KP1nV2=xiMS3O3RbQbYuRaQUOn7qA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201117131137.420396-1-colin.king@canonical.com>
In-Reply-To: <20201117131137.420396-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Xiaojian Du <Xiaojian.Du@amd.com>, David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, amd-gfx list <amd-gfx@lists.freedesktop.org>, Maling list - DRI developers <dri-devel@lists.freedesktop.org>, Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>

On Tue, Nov 17, 2020 at 8:11 AM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> There are two spelling mistakes in dev_warn messages. Fix these.
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.  Thanks!

Alex

> ---
>  drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c
> index afa542a5af5f..9a2f72f21ed8 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c
> +++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c
> @@ -689,14 +689,14 @@ static int vangogh_od_edit_dpm_table(struct smu_context *smu, enum PP_OD_DPM_TAB
>
>                 if (input[0] = 0) {
>                         if (input[1] < smu->gfx_default_hard_min_freq) {
> -                               dev_warn(smu->adev->dev, "Fine grain setting minimun sclk (%ld) MHz is less than the minimum allowed (%d) MHz\n",
> +                               dev_warn(smu->adev->dev, "Fine grain setting minimum sclk (%ld) MHz is less than the minimum allowed (%d) MHz\n",
>                                         input[1], smu->gfx_default_hard_min_freq);
>                                 return -EINVAL;
>                         }
>                         smu->gfx_actual_hard_min_freq = input[1];
>                 } else if (input[0] = 1) {
>                         if (input[1] > smu->gfx_default_soft_max_freq) {
> -                               dev_warn(smu->adev->dev, "Fine grain setting maximun sclk (%ld) MHz is greater than the maximum allowed (%d) MHz\n",
> +                               dev_warn(smu->adev->dev, "Fine grain setting maximum sclk (%ld) MHz is greater than the maximum allowed (%d) MHz\n",
>                                         input[1], smu->gfx_default_soft_max_freq);
>                                 return -EINVAL;
>                         }
> --
> 2.28.0
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
