From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 11 Jan 2021 16:19:45 +0000
Subject: Re: [PATCH][next] drm/amdgpu: Add missing BOOTUP_DEFAULT to profile_name[]
Message-Id: <CADnq5_PoOSL3XMrK+ZTwppU0wqV3+uOHptA7=GN=EPDRqMZkSQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210111114638.16530-1-colin.king@canonical.com>
In-Reply-To: <20210111114638.16530-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Xiaojian Du <Xiaojian.Du@amd.com>, David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, amd-gfx list <amd-gfx@lists.freedesktop.org>, Maling list - DRI developers <dri-devel@lists.freedesktop.org>, Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>

On Mon, Jan 11, 2021 at 6:46 AM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> A recent change added a new BOOTUP_DEFAULT power profile mode
> to the PP_SMC_POWER_PROFILE enum but omitted updating the
> corresponding profile_name array.  Fix this by adding in the
> missing BOOTUP_DEFAULT to profile_name[].
>
> Addresses-Coverity: ("Out-of-bounds read")
> Fixes: c27c9778a19e ("drm/amd/powerplay: support BOOTUP_DEFAULT power profile mode")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.  Thanks!

Alex

> ---
>  drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c
> index 75ddcadf3802..4763cb095820 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c
> +++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c
> @@ -774,6 +774,7 @@ static int vangogh_get_power_profile_mode(struct smu_context *smu,
>                                            char *buf)
>  {
>         static const char *profile_name[] = {
> +                                       "BOOTUP_DEFAULT",
>                                         "FULL_SCREEN_3D",
>                                         "VIDEO",
>                                         "VR",
> --
> 2.29.2
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
