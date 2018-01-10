From: Thomas Hellstrom <thomas@shipmail.org>
Date: Wed, 10 Jan 2018 14:21:06 +0000
Subject: Re: [PATCH] drm/vmwgfx: Potential off by one in vmw_view_add()
Message-Id: <0df13429-2d83-7d6e-b720-cc1a00f394a0@shipmail.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180110094004.wg5i2bzcejupvqz4@mwanda>
In-Reply-To: <20180110094004.wg5i2bzcejupvqz4@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, VMware Graphics <linux-graphics-maintainer@vmware.com>, Thomas Hellstrom <thellstrom@vmware.com>
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

Hi!

On 01/10/2018 10:40 AM, Dan Carpenter wrote:
> The vmw_view_cmd_to_type() function returns vmw_view_max (3) on error.
> It's one element beyond the end of the vmw_view_cotables[] table.
>
> My read on this is that it's possible to hit this failure.  header->id
> comes from vmw_cmd_check() and it's a user controlled number between
> 1040 and 1225 so we can hit that error.  But I don't have the hardware
> to test this code.
>
> Fixes: d80efd5cb3de ("drm/vmwgfx: Initial DX support")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
> index b700667f6f0b..c9d5cc237124 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
> @@ -2731,6 +2731,8 @@ static int vmw_cmd_dx_view_define(struct vmw_private *dev_priv,
>   	}
>   
>   	view_type = vmw_view_cmd_to_type(header->id);
> +	if (view_type = vmw_view_max)
> +		return -EINVAL;
>   	cmd = container_of(header, typeof(*cmd), header);
>   	ret = vmw_cmd_res_check(dev_priv, sw_context, vmw_res_surface,
>   				user_surface_converter,
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

This looks correct to me. I'll queue this for a -fixes pull. Thanks.

Reviewed-by: Thomas Hellstrom <thellstrom@vmware.com>

