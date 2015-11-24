From: "Sinclair Yeh" <syeh@vmware.com>
Date: Tue, 24 Nov 2015 19:55:49 +0000
Subject: Re: [patch] drm/vmwgfx: fix a warning message
Message-Id: <20151124195528.GA32328@syeh-linux>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20151121102939.GB7002@mwanda>
In-Reply-To: <20151121102939.GB7002@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: David Airlie <airlied@linux.ie>, Thomas Hellstrom <thellstrom@vmware.com>, Charmaine Lee <charmainel@vmware.com>, Brian Paul <brianp@vmware.com>, dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org

Thanks!

Reviewed-by: Sinclair Yeh <syeh@vmware.com>

On Sat, Nov 21, 2015 at 01:29:39PM +0300, Dan Carpenter wrote:
> The WARN_ON() macro only takes a condition argument, it doesn't take
> a message.  I have converted this to WARN() instead.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c b/drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c
> index a8baf5f..b6a0806 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c
> @@ -390,7 +390,7 @@ void *vmw_fifo_reserve_dx(struct vmw_private *dev_priv, uint32_t bytes,
>  	else if (ctx_id = SVGA3D_INVALID_ID)
>  		ret = vmw_local_fifo_reserve(dev_priv, bytes);
>  	else {
> -		WARN_ON("Command buffer has not been allocated.\n");
> +		WARN(1, "Command buffer has not been allocated.\n");
>  		ret = NULL;
>  	}
>  	if (IS_ERR_OR_NULL(ret)) {
