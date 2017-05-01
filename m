From: Sinclair Yeh <syeh@vmware.com>
Date: Mon, 01 May 2017 17:51:01 +0000
Subject: Re: [PATCH] drm/vmwgfx: Handle vmalloc() failure in vmw_local_fifo_reserve()
Message-Id: <20170501175047.GA18889@promb-2n-dhcp86.eng.vmware.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170427091208.mpdh2ldnolyusrpx@mwanda>
In-Reply-To: <20170427091208.mpdh2ldnolyusrpx@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: VMware Graphics <linux-graphics-maintainer@vmware.com>, Jakob Bornecrantz <jakob@vmware.com>, Thomas Hellstrom <thellstrom@vmware.com>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org

Thanks Dan!

Reviewed-by: Sinclair Yeh <syeh@vmware.com>

On Thu, Apr 27, 2017 at 12:12:08PM +0300, Dan Carpenter wrote:
> If vmalloc() fails then we need to a bit of cleanup before returning.
> 
> Fixes: fb1d9738ca05 ("drm/vmwgfx: Add DRM driver for VMware Virtual GPU")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c b/drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c
> index b6a0806b06bf..a1c68e6a689e 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c
> @@ -368,6 +368,8 @@ static void *vmw_local_fifo_reserve(struct vmw_private *dev_priv,
>  				return fifo_state->static_buffer;
>  			else {
>  				fifo_state->dynamic_buffer = vmalloc(bytes);
> +				if (!fifo_state->dynamic_buffer)
> +					goto out_err;
>  				return fifo_state->dynamic_buffer;
>  			}
>  		}
