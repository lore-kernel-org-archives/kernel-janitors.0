From: Harry Wentland <harry.wentland@amd.com>
Date: Mon, 02 Apr 2018 13:47:17 +0000
Subject: Re: [PATCH] drm/amd/display: fix spelling mistake: "Usupported" -> "Unsupported"
Message-Id: <2b8c0ab0-e7c4-89a3-5159-6912a4c18a47@amd.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180330160047.7368-1-colin.king@canonical.com>
In-Reply-To: <20180330160047.7368-1-colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, Alex Deucher <alexander.deucher-5C7GfCeVMHo@public.gmane.org>, =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig-5C7GfCeVMHo@public.gmane.org>, David Zhou <David1.Zhou-5C7GfCeVMHo@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On 2018-03-30 12:00 PM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Trivial fix to spelling mistake in DRM_ERROR error message text
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index e42a28e3adc5..1df1c91b6ae5 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -1521,7 +1521,7 @@ static int amdgpu_dm_initialize_drm_device(struct amdgpu_device *adev)
>  		break;
>  #endif
>  	default:
> -		DRM_ERROR("Usupported ASIC type: 0x%X\n", adev->asic_type);
> +		DRM_ERROR("Unsupported ASIC type: 0x%X\n", adev->asic_type);
>  		goto fail;
>  	}
>  
> @@ -1715,7 +1715,7 @@ static int dm_early_init(void *handle)
>  		break;
>  #endif
>  	default:
> -		DRM_ERROR("Usupported ASIC type: 0x%X\n", adev->asic_type);
> +		DRM_ERROR("Unsupported ASIC type: 0x%X\n", adev->asic_type);
>  		return -EINVAL;
>  	}
>  
> 
