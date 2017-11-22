From: Harry Wentland <harry.wentland@amd.com>
Date: Wed, 22 Nov 2017 17:13:35 +0000
Subject: Re: [PATCH] drm/amd/display: fix memory leaks on error exit return
Message-Id: <7f0ece54-283a-aab6-da42-9102565e8e7e@amd.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171122164735.1497-1-colin.king@canonical.com>
In-Reply-To: <20171122164735.1497-1-colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, Alex Deucher <alexander.deucher-5C7GfCeVMHo@public.gmane.org>, =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig-5C7GfCeVMHo@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Tony Cheng <tony.cheng-5C7GfCeVMHo@public.gmane.org>, amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On 2017-11-22 11:47 AM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently in the case where some of the allocations fail for dce110_tgv,
> dce110_xfmv, dce110_miv or dce110_oppv then the exit return path ends
> up leaking allocated objects. Fix this by kfree'ing them before returning.
> Also re-work the comparison of the null pointers to use the !ptr idiom.
> 
> Detected by CoverityScan, CID#1460246, 1460325, 1460324, 1460392
> ("Resource Leak")
> 
> Fixes: c4562236b3bc ("drm/amd/dc: Add dc display driver (v2)")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Thanks. I got the same patch but was too slow to post.

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
>  drivers/gpu/drm/amd/display/dc/dce110/dce110_resource.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/dce110/dce110_resource.c b/drivers/gpu/drm/amd/display/dc/dce110/dce110_resource.c
> index db96d2b47ff1..61adb8174ce0 100644
> --- a/drivers/gpu/drm/amd/display/dc/dce110/dce110_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/dce110/dce110_resource.c
> @@ -1037,11 +1037,13 @@ static bool underlay_create(struct dc_context *ctx, struct resource_pool *pool)
>  	struct dce110_opp *dce110_oppv = kzalloc(sizeof(*dce110_oppv),
>  						 GFP_KERNEL);
>  
> -	if ((dce110_tgv = NULL) ||
> -		(dce110_xfmv = NULL) ||
> -		(dce110_miv = NULL) ||
> -		(dce110_oppv = NULL))
> -			return false;
> +	if (!dce110_tgv || !dce110_xfmv || !dce110_miv || !dce110_oppv) {
> +		kfree(dce110_tgv);
> +		kfree(dce110_xfmv);
> +		kfree(dce110_miv);
> +		kfree(dce110_oppv);
> +		return false;
> +	}
>  
>  	dce110_opp_v_construct(dce110_oppv, ctx);
>  
> 
