From: Vasiliy Kulikov <segoon@openwall.com>
Date: Tue, 18 Oct 2011 09:30:38 +0000
Subject: Re: [patch] vmwgfx: information leak in
Message-Id: <20111018093038.GA23020@albatros>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20111018061012.GE27732@elgon.mountain>
In-Reply-To: <20111018061012.GE27732@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Thomas Hellstrom <thellstrom@vmware.com>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, Jerome Glisse <jglisse@redhat.com>, Dave Airlie <airlied@redhat.com>

On Tue, Oct 18, 2011 at 09:10 +0300, Dan Carpenter wrote:
> If ret is non-zero then we don't initialize the struct which leaks
> stack information to user space.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Vasiliy Kulikov <segoon@openwall.com>

> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
> index d4a1d8b..28e1c35 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
> @@ -1070,6 +1070,8 @@ vmw_execbuf_copy_fence_user(struct vmw_private *dev_priv,
>  	if (user_fence_rep = NULL)
>  		return;
>  
> +	memset(&fence_rep, 0, sizeof(fence_rep));
> +
>  	fence_rep.error = ret;
>  	if (ret = 0) {
>  		BUG_ON(fence = NULL);

-- 
Vasiliy
