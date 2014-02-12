From: Thomas Hellstrom <thellstrom@vmware.com>
Date: Wed, 12 Feb 2014 11:26:22 +0000
Subject: Re: [patch] drm/vmwgfx: add error checking for kmalloc()
Message-Id: <52FB5A5E.2040309@vmware.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140211160416.GB9406@elgon.mountain>
In-Reply-To: <20140211160416.GB9406@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: David Airlie <airlied@linux.ie>, Jakob Bornecrantz <jakob@vmware.com>, Zack Rusin <zackr@vmware.com>, Brian Paul <brianp@vmware.com>, dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org

On 02/11/2014 05:04 PM, Dan Carpenter wrote:
> Return -ENOMEM if kmalloc() fails.
>
> Fixes: d5bde956630b ('drm/vmwgfx: Emulate legacy shaders on guest-backed devices v2')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_shader.c b/drivers/gpu/drm/vmwgfx/vmwgfx_shader.c
> index 217d941b8176..23a32fd59a57 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_shader.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_shader.c
> @@ -779,6 +779,8 @@ vmw_compat_shader_man_create(struct vmw_private *dev_priv)
>  	int ret;
>  
>  	man = kzalloc(sizeof(*man), GFP_KERNEL);
> +	if (!man)
> +		return ERR_PTR(-ENOMEM);
>  
>  	man->dev_priv = dev_priv;
>  	INIT_LIST_HEAD(&man->list);

Thanks, Dan.
A patch fixing the same problem has already been queued for the next
vmwgfx-fixes!

/Thomas
