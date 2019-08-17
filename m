From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 17 Aug 2019 06:51:46 +0000
Subject: Re: [PATCH][drm-next] drm/amd/display: fix a potential null pointer dereference
Message-Id: <20190817065146.GA4451@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190816221011.10750-1-colin.king@canonical.com>
In-Reply-To: <20190816221011.10750-1-colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Cc: David Zhou <David1.Zhou-5C7GfCeVMHo@public.gmane.org>, Leo Li <sunpeng.li-5C7GfCeVMHo@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Alex Deucher <alexander.deucher-5C7GfCeVMHo@public.gmane.org>, Harry Wentland <harry.wentland-5C7GfCeVMHo@public.gmane.org>, Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig-5C7GfCeVMHo@public.gmane.org>

On Fri, Aug 16, 2019 at 11:10:11PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently the pointer init_data is dereferenced on the assignment
> of fw_info before init_data is sanity checked to see if it is null.
> Fix te potential null pointer dereference on init_data by only
> performing dereference after it is null checked.
> 
> Addresses-Coverity: ("Dereference before null check")
> Fixes: 9adc8050bf3c ("drm/amd/display: make firmware info only load once during dc_bios create")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/gpu/drm/amd/display/dc/dce/dce_clock_source.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/dce/dce_clock_source.c b/drivers/gpu/drm/amd/display/dc/dce/dce_clock_source.c
> index bee81bf288be..926954c804a6 100644
> --- a/drivers/gpu/drm/amd/display/dc/dce/dce_clock_source.c
> +++ b/drivers/gpu/drm/amd/display/dc/dce/dce_clock_source.c
> @@ -1235,7 +1235,7 @@ static bool calc_pll_max_vco_construct(
>  			struct calc_pll_clock_source_init_data *init_data)
>  {
>  	uint32_t i;
> -	struct dc_firmware_info *fw_info = &init_data->bp->fw_info;
> +	struct dc_firmware_info *fw_info;
>  	if (calc_pll_cs = NULL ||
>  			init_data = NULL ||
>  			init_data->bp = NULL)

init_data can't be NULL.  I'm mostly pointing this out because that NULL
check is written so higgledy-piggledy.  At first I thought this was
staging code so I was planning to ignore the patch.  :P

regards,
dan carpenter
