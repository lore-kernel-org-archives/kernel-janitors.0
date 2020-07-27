From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 27 Jul 2020 19:00:55 +0000
Subject: Re: [PATCH] drm/amd/powerplay: off by one bugs in smu_cmn_to_asic_specific_index()
Message-Id: <CADnq5_MDcYC08SRMhPPRR0QK70_ZeywtSY4f8ztAP3qCBkwTsA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200727133940.GA391897@mwanda>
In-Reply-To: <20200727133940.GA391897@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, amd-gfx list <amd-gfx@lists.freedesktop.org>, Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>

On Mon, Jul 27, 2020 at 9:42 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> These tables have _COUNT number of elements so the comparisons should be
> >= instead of > to prevent reading one element beyond the end of the
> array.
>
> Fixes: 8264ee69f0d8 ("drm/amd/powerplay: drop unused code")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.  Thanks!

Alex

> ---
>  drivers/gpu/drm/amd/powerplay/smu_cmn.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/powerplay/smu_cmn.c b/drivers/gpu/drm/amd/powerplay/smu_cmn.c
> index be4b678d0e60..5c23c44c33bd 100644
> --- a/drivers/gpu/drm/amd/powerplay/smu_cmn.c
> +++ b/drivers/gpu/drm/amd/powerplay/smu_cmn.c
> @@ -166,7 +166,7 @@ int smu_cmn_to_asic_specific_index(struct smu_context *smu,
>
>         switch (type) {
>         case CMN2ASIC_MAPPING_MSG:
> -               if (index > SMU_MSG_MAX_COUNT ||
> +               if (index >= SMU_MSG_MAX_COUNT ||
>                     !smu->message_map)
>                         return -EINVAL;
>
> @@ -181,7 +181,7 @@ int smu_cmn_to_asic_specific_index(struct smu_context *smu,
>                 return msg_mapping.map_to;
>
>         case CMN2ASIC_MAPPING_CLK:
> -               if (index > SMU_CLK_COUNT ||
> +               if (index >= SMU_CLK_COUNT ||
>                     !smu->clock_map)
>                         return -EINVAL;
>
> @@ -192,7 +192,7 @@ int smu_cmn_to_asic_specific_index(struct smu_context *smu,
>                 return mapping.map_to;
>
>         case CMN2ASIC_MAPPING_FEATURE:
> -               if (index > SMU_FEATURE_COUNT ||
> +               if (index >= SMU_FEATURE_COUNT ||
>                     !smu->feature_map)
>                         return -EINVAL;
>
> @@ -203,7 +203,7 @@ int smu_cmn_to_asic_specific_index(struct smu_context *smu,
>                 return mapping.map_to;
>
>         case CMN2ASIC_MAPPING_TABLE:
> -               if (index > SMU_TABLE_COUNT ||
> +               if (index >= SMU_TABLE_COUNT ||
>                     !smu->table_map)
>                         return -EINVAL;
>
> @@ -214,7 +214,7 @@ int smu_cmn_to_asic_specific_index(struct smu_context *smu,
>                 return mapping.map_to;
>
>         case CMN2ASIC_MAPPING_PWR:
> -               if (index > SMU_POWER_SOURCE_COUNT ||
> +               if (index >= SMU_POWER_SOURCE_COUNT ||
>                     !smu->pwr_src_map)
>                         return -EINVAL;
>
> --
> 2.27.0
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
