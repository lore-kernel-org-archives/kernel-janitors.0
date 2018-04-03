From: Jani Nikula <jani.nikula@linux.intel.com>
Date: Tue, 03 Apr 2018 09:37:14 +0000
Subject: Re: [PATCH] drm/amd/display: fix spelling mistake: "Usupported" -> "Unsupported"
Message-Id: <87tvssaawl.fsf@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180330160047.7368-1-colin.king@canonical.com>
In-Reply-To: <20180330160047.7368-1-colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, Alex Deucher <alexander.deucher-5C7GfCeVMHo@public.gmane.org>, Christian =?utf-8?Q?K=C3=B6nig?= <christian.koenig-5C7GfCeVMHo@public.gmane.org>, David Zhou <David1.Zhou-5C7GfCeVMHo@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Harry Wentland <harry.wentland-5C7GfCeVMHo@public.gmane.org>, amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Fri, 30 Mar 2018, Colin King <colin.king@canonical.com> wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> Trivial fix to spelling mistake in DRM_ERROR error message text

Thanks for the patch.

Please do consider limiting the distribution in the future,
though. There's no need to include lkml or even dri-devel for trivial
patches like this.

Thanks,
Jani.

>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
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

-- 
Jani Nikula, Intel Open Source Technology Center
