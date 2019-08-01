From: walter harms <wharms@bfs.de>
Date: Thu, 01 Aug 2019 10:20:08 +0000
Subject: Re: [PATCH][drm-next] drm/amd/powerplay: fix a few spelling mistakes
Message-Id: <5D42BCD8.2050708@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190801083941.4230-1-colin.king@canonical.com>
In-Reply-To: <20190801083941.4230-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>, Colin King <colin.king@canonical.com>, Evan Quan <evan.quan@amd.com>, Rex Zhu <rex.zhu@amd.com>, =?UTF-8?B?Q2hyaXN0aWFuIEvDtm5p?= =?UTF-8?B?Zw==?= <christian.koenig@amd.com>



Am 01.08.2019 10:39, schrieb Colin King:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There are a few spelling mistakes "unknow" -> "unknown" and
> "enabeld" -> "enabled". Fix these.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/gpu/drm/amd/powerplay/amdgpu_smu.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c b/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
> index 13b2c8a60232..d029a99e600e 100644
> --- a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
> +++ b/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
> @@ -39,7 +39,7 @@ static const char* __smu_message_names[] = {
>  const char *smu_get_message_name(struct smu_context *smu, enum smu_message_type type)
>  {
>  	if (type < 0 || type > SMU_MSG_MAX_COUNT)
> -		return "unknow smu message";
> +		return "unknown smu message";
>  	return __smu_message_names[type];
>  }
>  
> @@ -52,7 +52,7 @@ static const char* __smu_feature_names[] = {
>  const char *smu_get_feature_name(struct smu_context *smu, enum smu_feature_mask feature)
>  {
>  	if (feature < 0 || feature > SMU_FEATURE_COUNT)
> -		return "unknow smu feature";
> +		return "unknown smu feature";
>  	return __smu_feature_names[feature];
>  }
>  
> @@ -79,7 +79,7 @@ size_t smu_sys_get_pp_feature_mask(struct smu_context *smu, char *buf)
>  			       count++,
>  			       smu_get_feature_name(smu, i),
>  			       feature_index,
> -			       !!smu_feature_is_enabled(smu, i) ? "enabeld" : "disabled");
> +			       !!smu_feature_is_enabled(smu, i) ? "enabled" : "disabled");

i am wondering,
is that !! really needed in front of smu_feature_is_enabled ?

re,
 wh

>  	}
>  
>  failed:
