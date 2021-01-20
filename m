From: Harry Wentland <harry.wentland@amd.com>
Date: Wed, 20 Jan 2021 14:46:45 +0000
Subject: Re: [PATCH][next] drm/amd/display: Fix spelling mistake of function name
Message-Id: <a06aeb18-b02d-41cd-f717-6ff30ea48bb4@amd.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210120092624.13061-1-colin.king@canonical.com>
In-Reply-To: <20210120092624.13061-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Leo Li <sunpeng.li@amd.com>, Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 2021-01-20 4:26 a.m., Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> There are two spelling mistakes of the function name, fix this
> by using __func__ instead of a hard coded name string.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>   drivers/gpu/drm/amd/display/dc/core/dc_link.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link.c b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
> index c16af3983fdb..91d4130cd2cb 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc_link.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
> @@ -1602,7 +1602,7 @@ static bool dc_link_construct(struct dc_link *link,
>   
>   	link->psr_settings.psr_version = DC_PSR_VERSION_UNSUPPORTED;
>   
> -	DC_LOG_DC("BIOS object table - dc_link_contruct finished successfully.\n");
> +	DC_LOG_DC("BIOS object table - %s finished successfully.\n", __func__);
>   	return true;
>   device_tag_fail:
>   	link->link_enc->funcs->destroy(&link->link_enc);
> @@ -1619,7 +1619,7 @@ static bool dc_link_construct(struct dc_link *link,
>   		link->hpd_gpio = NULL;
>   	}
>   
> -	DC_LOG_DC("BIOS object table - dc_link_contruct failed.\n");
> +	DC_LOG_DC("BIOS object table - %s failed.\n", __func__);
>   	kfree(info);
>   
>   	return false;
> 
