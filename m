From: Thomas Hellstrom <thellstrom@vmware.com>
Date: Wed, 12 Feb 2014 11:24:10 +0000
Subject: Re: [patch] drm/vmwgfx: unlock on error path in vmw_execbuf_process()
Message-Id: <52FB59DA.5020700@vmware.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140211160346.GA9406@elgon.mountain>
In-Reply-To: <20140211160346.GA9406@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Maarten Lankhorst <m.b.lankhorst@gmail.com>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, Jerome Glisse <jglisse@redhat.com>, Brian Paul <brianp@vmware.com>

On 02/11/2014 05:03 PM, Dan Carpenter wrote:
> There is a missing unlock on error here.
>
> Fixes: 30f82d816d2d ('drm/vmwgfx: Reemit context bindings when necessary v2')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
> index 269b85cc875a..9fbbaaa9e541 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
> @@ -2469,7 +2469,7 @@ int vmw_execbuf_process(struct drm_file *file_priv,
>  	if (dev_priv->has_mob) {
>  		ret = vmw_rebind_contexts(sw_context);
>  		if (unlikely(ret != 0))
> -			goto out_err;
> +			goto out_unlock_binding;
>  	}
>  
>  	cmd = vmw_fifo_reserve(dev_priv, command_size);

Dan, thanks,
Reviewed-by: Thomas Hellstrom <thellstrom@vmware.com>

Queued for next vmwgfx-fixes pull.

/Thomas
