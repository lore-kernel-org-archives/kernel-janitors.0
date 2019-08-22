From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 22 Aug 2019 20:51:25 +0000
Subject: Re: [PATCH] drm/amdgpu/powerplay: remove redundant assignment to variable baco_state
Message-Id: <CADnq5_O=V0_MNenTdxFsprmrGQiwMQNDFFkzYH-ZWw11VaMYmA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190822130948.32195-1-colin.king@canonical.com>
In-Reply-To: <20190822130948.32195-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, amd-gfx list <amd-gfx@lists.freedesktop.org>, Maling list - DRI developers <dri-devel@lists.freedesktop.org>, Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>, Rex Zhu <rex.zhu@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>

On Thu, Aug 22, 2019 at 9:09 AM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> Variable baco_state is initialized to a value that is never read and it is
> re-assigned later. The initialization is redundant and can be removed.
>
> Addresses-Coverity: ("Unused Value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.  Thanks!

Alex

> ---
>  drivers/gpu/drm/amd/powerplay/smu_v11_0.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/powerplay/smu_v11_0.c b/drivers/gpu/drm/amd/powerplay/smu_v11_0.c
> index 89749b1d2019..a4aba8576900 100644
> --- a/drivers/gpu/drm/amd/powerplay/smu_v11_0.c
> +++ b/drivers/gpu/drm/amd/powerplay/smu_v11_0.c
> @@ -1656,7 +1656,7 @@ static bool smu_v11_0_baco_is_support(struct smu_context *smu)
>  static enum smu_baco_state smu_v11_0_baco_get_state(struct smu_context *smu)
>  {
>         struct smu_baco_context *smu_baco = &smu->smu_baco;
> -       enum smu_baco_state baco_state = SMU_BACO_STATE_EXIT;
> +       enum smu_baco_state baco_state;
>
>         mutex_lock(&smu_baco->mutex);
>         baco_state = smu_baco->state;
> --
> 2.20.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
