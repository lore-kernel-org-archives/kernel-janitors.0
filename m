From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Date: Fri, 16 Jun 2017 09:07:27 +0000
Subject: Re: [PATCH][drm-next] drm/amdgpu: fix some spelling mistakes and break overly wide lines
Message-Id: <f5ff18f1-0487-39d8-f941-2431c4f806c7@amd.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170616084610.22861-1-colin.king@canonical.com>
In-Reply-To: <20170616084610.22861-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

Am 16.06.2017 um 10:46 schrieb Colin King:
> From: Colin Ian King <colin.king@canonical.com>
>
> Trivial fixes to spelling mistakes in DRM_INFO, dev_info and
> WARN_ONCE messages.  Also break overly wide lines and add some
> white spacing where appropriate in ternary operator.
>
> Fixes:
>    "successed" -> "succeeded"
>    "suuport" -> "support"
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 12 ++++++++----
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c     |  2 +-
>   2 files changed, 9 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_device.c
> index 875cde414be7..990c427233f8 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -1885,7 +1885,9 @@ static int amdgpu_sriov_reinit_early(struct amdgpu_=
device *adev)
>   				continue;
>  =20
>   			r =3D block->version->funcs->hw_init(adev);
> -			DRM_INFO("RE-INIT: %s %s\n", block->version->funcs->name, r?"failed":=
"successed");
> +			DRM_INFO("RE-INIT: %s %s\n",
> +				 block->version->funcs->name,
> +				 r ? "failed" : "succeeded");
>   		}
>   	}
>  =20
> @@ -1916,7 +1918,9 @@ static int amdgpu_sriov_reinit_late(struct amdgpu_d=
evice *adev)
>   				continue;
>  =20
>   			r =3D block->version->funcs->hw_init(adev);
> -			DRM_INFO("RE-INIT: %s %s\n", block->version->funcs->name, r?"failed":=
"successed");
> +			DRM_INFO("RE-INIT: %s %s\n",
> +				 block->version->funcs->name,
> +				 r ? "failed" : "succeeded");
>   		}
>   	}
>  =20
> @@ -2800,7 +2804,7 @@ int amdgpu_sriov_gpu_reset(struct amdgpu_device *ad=
ev, struct amdgpu_job *job)
>   		/* bad news, how to tell it to userspace ? */
>   		dev_info(adev->dev, "GPU reset failed\n");
>   	} else {
> -		dev_info(adev->dev, "GPU reset successed!\n");
> +		dev_info(adev->dev, "GPU reset succeeded!\n");
>   	}
>  =20
>   	adev->gfx.in_reset =3D false;
> @@ -2966,7 +2970,7 @@ int amdgpu_gpu_reset(struct amdgpu_device *adev)
>   		/* bad news, how to tell it to userspace ? */
>   		dev_info(adev->dev, "GPU reset failed\n");
>   	else
> -		dev_info(adev->dev, "GPU reset successed!\n");
> +		dev_info(adev->dev, "GPU reset succeeded!\n");
>  =20
>   	return r;
>   }
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd=
/amdgpu/amdgpu_vm.c
> index 5795f81369f0..06f11e2a32af 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> @@ -1301,7 +1301,7 @@ static int amdgpu_vm_update_ptes(struct amdgpu_pte_=
update_params *params,
>  =20
>   		if (params->shadow) {
>   			if (WARN_ONCE(use_cpu_update,
> -				"CPU VM update doesn't suuport shadow pages"))
> +				"CPU VM update doesn't support shadow pages"))
>   				return 0;
>  =20
>   			if (!pt->shadow)


--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
