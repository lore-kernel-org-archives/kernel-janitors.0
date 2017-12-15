From: Harry Wentland <harry.wentland@amd.com>
Date: Fri, 15 Dec 2017 15:05:39 +0000
Subject: Re: [PATCH] drm/amd/display: remove redundant null check of array 'data'
Message-Id: <299963e5-5847-a2ca-0282-40ab3cd0f590@amd.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171215105343.11372-1-colin.king@canonical.com>
In-Reply-To: <20171215105343.11372-1-colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, "Koenig, Christian" <Christian.Koenig-5C7GfCeVMHo@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, "amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Cc: "kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

On 2017-12-15 05:53 AM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The null check on aconnector->base.edid_blob_ptr->data is redundant
> since data is an array and can never be null.  Remove it.
> 
> Detected by CoverityScan, CID#1460369 ("Array compared against 0")
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index ccbf10e3bbb6..c388778dbba3 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -2725,8 +2725,7 @@ static void create_eml_sink(struct amdgpu_dm_connector *aconnector)
>  	};
>  	struct edid *edid;
>  
> -	if (!aconnector->base.edid_blob_ptr ||
> -		!aconnector->base.edid_blob_ptr->data) {
> +	if (!aconnector->base.edid_blob_ptr) {
>  		DRM_ERROR("No EDID firmware found on connector: %s ,forcing to OFF!\n",
>  				aconnector->base.name);
>  
> 
