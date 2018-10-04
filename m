From: Sinclair Yeh <syeh@vmware.com>
Date: Thu, 04 Oct 2018 20:17:14 +0000
Subject: Re: [PATCH][drm-next] drm/vmwgfx: remove redundant return ret statement
Message-Id: <20181004201309.GA9246@vmware.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181004174953.28107-1-colin.king@canonical.com>
In-Reply-To: <20181004174953.28107-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Thomas Hellstrom <thellstrom@vmware.com>, David Airlie <airlied@linux.ie>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, linux-graphics-maintainer <linux-graphics-maintainer@vmware.com>

Good catch.

Reviewed-by: Sinclair Yeh <syeh@vmware.com>

On Thu, Oct 04, 2018 at 06:49:53PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The return statement is redundant as there is a return statement
> immediately before it so we have dead code that can be removed.
> Also remove the unused declaration of ret.
> 
> Detected by CoverityScan, CID#1473793 ("Structurally dead code")
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
> index 5a6b70ba137a..260650bb5560 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
> @@ -1738,7 +1738,6 @@ static int vmw_cmd_check_define_gmrfb(struct vmw_private *dev_priv,
>  				      void *buf)
>  {
>  	struct vmw_buffer_object *vmw_bo;
> -	int ret;
>  
>  	struct {
>  		uint32_t header;
> @@ -1748,7 +1747,6 @@ static int vmw_cmd_check_define_gmrfb(struct vmw_private *dev_priv,
>  	return vmw_translate_guest_ptr(dev_priv, sw_context,
>  				       &cmd->body.ptr,
>  				       &vmw_bo);
> -	return ret;
>  }
>  
>  
> -- 
> 2.17.1
> 
