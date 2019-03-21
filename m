From: "Huang, Ray" <Ray.Huang@amd.com>
Date: Thu, 21 Mar 2019 06:42:44 +0000
Subject: RE: [PATCH] drm/amd/powerplay: delete some dead code
Message-Id: <MN2PR12MB33093EB678B90AE8B2970D26EC420@MN2PR12MB3309.namprd12.prod.outlook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190321062707.GB21489@kadam>
In-Reply-To: <20190321062707.GB21489@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, "Deucher, Alexander" <Alexander.Deucher-5C7GfCeVMHo@public.gmane.org>
Cc: "Zhou, David(ChunMing)" <David1.Zhou-5C7GfCeVMHo@public.gmane.org>, "Gui,
 Jack" <Jack.Gui-5C7GfCeVMHo@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, "Wang,
 Kevin(Yang)" <Kevin1.Wang-5C7GfCeVMHo@public.gmane.org>, "kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, "Gao, Likun" <Likun.Gao-5C7GfCeVMHo@public.gmane.org>, "Koenig,
 Christian" <Christian.Koenig-5C7GfCeVMHo@public.gmane.org>

> -----Original Message-----
> From: Dan Carpenter [mailto:dan.carpenter@oracle.com]
> Sent: Thursday, March 21, 2019 2:27 PM
> To: Deucher, Alexander <Alexander.Deucher@amd.com>
> Cc: Koenig, Christian <Christian.Koenig@amd.com>; Zhou, David(ChunMing)
> <David1.Zhou@amd.com>; David Airlie <airlied@linux.ie>; Daniel Vetter
> <daniel@ffwll.ch>; Huang, Ray <Ray.Huang@amd.com>; Wang, Kevin(Yang)
> <Kevin1.Wang@amd.com>; Gao, Likun <Likun.Gao@amd.com>; Gui, Jack
> <Jack.Gui@amd.com>; amd-gfx@lists.freedesktop.org; kernel-
> janitors@vger.kernel.org
> Subject: [PATCH] drm/amd/powerplay: delete some dead code
> 
> The "size" variable is unsigned.  We never pass invalid sizes to this function
> and we already used it as an array offset earlier so it's too late to check here.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks, will apply it.
Reviewed-by: Huang Rui <ray.huang@amd.com>

> ---
>  drivers/gpu/drm/amd/powerplay/smu_v11_0.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/powerplay/smu_v11_0.c
> b/drivers/gpu/drm/amd/powerplay/smu_v11_0.c
> index 17143888e37e..b602975563fc 100644
> --- a/drivers/gpu/drm/amd/powerplay/smu_v11_0.c
> +++ b/drivers/gpu/drm/amd/powerplay/smu_v11_0.c
> @@ -1668,9 +1668,6 @@ static int
> smu_v11_0_set_power_profile_mode(struct smu_context *smu, long
> *input
>  	}
> 
>  	if (smu->power_profile_mode ==
> PP_SMC_POWER_PROFILE_CUSTOM) {
> -		if (size < 0)
> -			return -EINVAL;
> -
>  		ret = smu_v11_0_get_activity_monitor_coeff(smu,
>  							   (uint8_t
> *)(&activity_monitor),
> 
> WORKLOAD_PPLIB_CUSTOM_BIT);
> --
> 2.17.1
