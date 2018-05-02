From: Harry Wentland <harry.wentland@amd.com>
Date: Wed, 02 May 2018 15:04:29 +0000
Subject: Re: [PATCH] drm/amd/display: clean up assignment of amdgpu_crtc
Message-Id: <fe695f10-eb1b-f6f4-ae02-c2f12225992c@amd.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180502144316.32056-1-colin.king@canonical.com>
In-Reply-To: <20180502144316.32056-1-colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, Alex Deucher <alexander.deucher-5C7GfCeVMHo@public.gmane.org>, =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig-5C7GfCeVMHo@public.gmane.org>, David Zhou <David1.Zhou-5C7GfCeVMHo@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On 2018-05-02 10:43 AM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The declaration of pointer amdgpu_crtc has a redundant assignment to
> amdgpu_crtc. Clean this up by removing it.
> 
> Detected by CoverityScan, CID#1460299 ("Evaluation order violation")
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Looks like i goofed. Thanks for fixing this.

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 1dd1142246c2..2beb8821e19e 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -3773,7 +3773,7 @@ static void remove_stream(struct amdgpu_device *adev,
>  static int get_cursor_position(struct drm_plane *plane, struct drm_crtc *crtc,
>  			       struct dc_cursor_position *position)
>  {
> -	struct amdgpu_crtc *amdgpu_crtc = amdgpu_crtc = to_amdgpu_crtc(crtc);
> +	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
>  	int x, y;
>  	int xorigin = 0, yorigin = 0;
>  
> 
