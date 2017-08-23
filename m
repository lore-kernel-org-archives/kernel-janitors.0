From: Felix Kuehling <felix.kuehling@amd.com>
Date: Wed, 23 Aug 2017 18:24:49 +0000
Subject: Re: [PATCH][drm-next] drm/amdgpu: remove duplicate return statement
Message-Id: <8045f72d-34d5-473d-ac9b-56495698dc8f@amd.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170823131740.20930-1-colin.king@canonical.com>
In-Reply-To: <20170823131740.20930-1-colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, Oded Gabbay <oded.gabbay-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alex Deucher <alexander.deucher-5C7GfCeVMHo@public.gmane.org>, =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig-5C7GfCeVMHo@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

I must have added that accidentally when cherry-picking an internal
patch for upstreaming. Thanks for catching it.

Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>

Regards,
  Felix


On 2017-08-23 09:17 AM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> Remove a redundant identical return statement, it has no use.
>
> Detected by CoverityScan, CID#1454586 ("Structurally dead code")
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v8.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v8.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v8.c
> index fb6e5dbd5a03..309f2419c6d8 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v8.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v8.c
> @@ -155,7 +155,6 @@ static const struct kfd2kgd_calls kfd2kgd = {
>  struct kfd2kgd_calls *amdgpu_amdkfd_gfx_8_0_get_functions(void)
>  {
>  	return (struct kfd2kgd_calls *)&kfd2kgd;
> -	return (struct kfd2kgd_calls *)&kfd2kgd;
>  }
>  
>  static inline struct amdgpu_device *get_amdgpu_device(struct kgd_dev *kgd)

