From: Harry Wentland <harry.wentland@amd.com>
Date: Wed, 20 Jun 2018 14:12:05 +0000
Subject: Re: [PATCH] drm/amd/display: Fix a loop timeout in wait_for_fbc_state_changed()
Message-Id: <846bb208-d6cf-0941-2140-34141c7b211d@amd.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180620120507.qztby4wtgehc65f2@kili.mountain>
In-Reply-To: <20180620120507.qztby4wtgehc65f2-vMlZ3nK25oGAIHFoDFOv9A@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, Alex Deucher <alexander.deucher-5C7GfCeVMHo@public.gmane.org>, Roman Li <Roman.Li-5C7GfCeVMHo@public.gmane.org>
Cc: "David (ChunMing) Zhou" <David1.Zhou-5C7GfCeVMHo@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Bhawanpreet Lakha <Bhawanpreet.Lakha-5C7GfCeVMHo@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Shirish S <shirish.s-5C7GfCeVMHo@public.gmane.org>, Dave Airlie <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Tony Cheng <Tony.Cheng-5C7GfCeVMHo@public.gmane.org>, =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig-5C7GfCeVMHo@public.gmane.org>

On 2018-06-20 08:05 AM, Dan Carpenter wrote:
> We changed this loop so now it loops 1000 times instead of 10.  We need
> to make the counter larger because a uint8_t can't go up to 1000 and
> we need to update the test at the end to test for 1000 instead of 10.
> 
> Fixes: 2b6199a1d1b7 ("drm/amd/display: replace msleep with udelay in fbc path")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks for the patch. An equivalent one is already on-route to be merged: https://patchwork.freedesktop.org/patch/230412/

Harry

> 
> diff --git a/drivers/gpu/drm/amd/display/dc/dce110/dce110_compressor.c b/drivers/gpu/drm/amd/display/dc/dce110/dce110_compressor.c
> index e2994d337044..8e83ec66fd22 100644
> --- a/drivers/gpu/drm/amd/display/dc/dce110/dce110_compressor.c
> +++ b/drivers/gpu/drm/amd/display/dc/dce110/dce110_compressor.c
> @@ -143,7 +143,7 @@ static void wait_for_fbc_state_changed(
>  	struct dce110_compressor *cp110,
>  	bool enabled)
>  {
> -	uint8_t counter = 0;
> +	int counter = 0;
>  	uint32_t addr = mmFBC_STATUS;
>  	uint32_t value;
>  
> @@ -158,7 +158,7 @@ static void wait_for_fbc_state_changed(
>  		counter++;
>  	}
>  
> -	if (counter = 10) {
> +	if (counter = 1000) {
>  		DC_LOG_WARNING("%s: wait counter exceeded, changes to HW not applied",
>  			__func__);
>  	} else {
> 
