From: Roland Scheidegger <rscheidegger.oss@gmail.com>
Date: Thu, 26 Mar 2020 16:03:15 +0000
Subject: Re: [PATCH][next] drm/vmwgfx: fix spelling mistake "Cound" -> "Could"
Message-Id: <d9ee5ec4-7341-decd-a382-3004fd367beb@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200326101911.241233-1-colin.king@canonical.com>
In-Reply-To: <20200326101911.241233-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, VMware Graphics <linux-graphics-maintainer@vmware.com>, Thomas Hellstrom <thellstrom@vmware.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


Am 26.03.20 um 11:19 schrieb Colin King:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a spelling mistake in a DRM_ERROR error message. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
> index 367d5b87ee6a..2e61a4ecd8ef 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
> @@ -3037,7 +3037,7 @@ static int vmw_cmd_dx_bind_streamoutput(struct vmw_private *dev_priv,
>  	res = vmw_dx_streamoutput_lookup(vmw_context_res_man(ctx_node->ctx),
>  					 cmd->body.soid);
>  	if (IS_ERR(res)) {
> -		DRM_ERROR("Cound not find streamoutput to bind.\n");
> +		DRM_ERROR("Could not find streamoutput to bind.\n");
>  		return PTR_ERR(res);
>  	}
>  
> 

Reviewed-by: Roland Scheidegger <sroland@vmware.com>
