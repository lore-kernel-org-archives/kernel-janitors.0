From: Harry Wentland <harry.wentland@amd.com>
Date: Tue, 21 Aug 2018 18:51:19 +0000
Subject: Re: [PATCH] drm/amd/display: indent an if statement
Message-Id: <3d491f32-245c-30ac-4f13-39da721c3dbc@amd.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180814090944.qjm4vxyrjdqxu4d7@kili.mountain>
In-Reply-To: <20180814090944.qjm4vxyrjdqxu4d7-vMlZ3nK25oGAIHFoDFOv9A@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, Alex Deucher <alexander.deucher-5C7GfCeVMHo@public.gmane.org>
Cc: "David (ChunMing) Zhou" <David1.Zhou-5C7GfCeVMHo@public.gmane.org>, Charlene Liu <charlene.liu-5C7GfCeVMHo@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Dmytro Laktyushkin <Dmytro.Laktyushkin-5C7GfCeVMHo@public.gmane.org>, Yongqiang Sun <yongqiang.sun-5C7GfCeVMHo@public.gmane.org>, Tony Cheng <tony.cheng-5C7GfCeVMHo@public.gmane.org>, =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig-5C7GfCeVMHo@public.gmane.org>

On 2018-08-14 05:09 AM, Dan Carpenter wrote:
> The if statement isn't indented and it makes static checkers complain.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> 
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
> index 4ca41d6e3bcf..d82ba58c720f 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
> @@ -349,7 +349,7 @@ static bool is_dp_and_hdmi_sharable(
>  
>  	if (stream1->clamping.c_depth != COLOR_DEPTH_888 ||
>  	    stream2->clamping.c_depth != COLOR_DEPTH_888)
> -	return false;
> +		return false;
>  
>  	return true;
>  
> 
