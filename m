From: Mukesh Ojha <mojha@codeaurora.org>
Date: Tue, 16 Apr 2019 13:33:16 +0000
Subject: Re: [PATCH] drm/amdgpu: fix spelling mistake "gateing" -> "gating"
Message-Id: <2849eabb-6f89-08b9-4537-b75971b205bd@codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190416115926.32669-1-colin.king@canonical.com>
In-Reply-To: <20190416115926.32669-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>, David Zhou <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


On 4/16/2019 5:29 PM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> There is a spelling mistake in a DRM_INFO message. Fix it.
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
Reviewed-by: Mukesh Ojha <mojha@codeaurora.org>

Cheers,
-Mukesh
> ---
>   drivers/gpu/drm/amd/amdgpu/vce_v2_0.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/vce_v2_0.c b/drivers/gpu/drm/amd/amdgpu/vce_v2_0.c
> index bed78a778e3f..40363ca6c5f1 100644
> --- a/drivers/gpu/drm/amd/amdgpu/vce_v2_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/vce_v2_0.c
> @@ -283,7 +283,7 @@ static int vce_v2_0_stop(struct amdgpu_device *adev)
>   	}
>   
>   	if (vce_v2_0_wait_for_idle(adev)) {
> -		DRM_INFO("VCE is busy, Can't set clock gateing");
> +		DRM_INFO("VCE is busy, Can't set clock gating");
>   		return 0;
>   	}
>   
