From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 10 May 2019 11:16:23 +0000
Subject: Re: [PATCH][next] drm/amdgpu: fix return of an uninitialized value in variable ret
Message-Id: <20190510111623.GC18105@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190510100842.30458-1-colin.king@canonical.com>
In-Reply-To: <20190510100842.30458-1-colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Cc: David Zhou <David1.Zhou-5C7GfCeVMHo@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Alex Deucher <alexander.deucher-5C7GfCeVMHo@public.gmane.org>, Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig-5C7GfCeVMHo@public.gmane.org>

On Fri, May 10, 2019 at 11:08:42AM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> In the case where is_enable is false and lo_base_addr is non-zero the
> variable ret has not been initialized and is being checked for non-zero
> and potentially garbage is being returned. Fix this by not returning
> ret but instead returning -EINVAL on the zero lo_base_addr case.
> 
> Addresses-Coverity: ("Uninitialized scalar variable")
> Fixes: a6ac0b44bab9 ("drm/amdgpu: add df perfmon regs and funcs for xgmi")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/df_v3_6.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/df_v3_6.c b/drivers/gpu/drm/amd/amdgpu/df_v3_6.c
> index a5c3558869fb..8c09bf994acd 100644
> --- a/drivers/gpu/drm/amd/amdgpu/df_v3_6.c
> +++ b/drivers/gpu/drm/amd/amdgpu/df_v3_6.c
> @@ -398,10 +398,7 @@ static int df_v3_6_start_xgmi_link_cntr(struct amdgpu_device *adev,
>  				NULL);
>  
>  		if (lo_base_addr = 0)
> -			ret = -EINVAL;
> -
> -		if (ret)
> -			return ret;
> +			return -EINVAL;

From a naive reading of the code without knowing the hardware spec then
you would probably think that lo_base_addr can also be uninitialized.

<sad face emoji>

regards,
dan carpenter
