From: Thomas Hellstrom <thellstrom@vmware.com>
Date: Tue, 18 Oct 2011 06:38:22 +0000
Subject: Re: [patch] vmwgfx: information leak in vmw_execbuf_copy_fence_user()
Message-Id: <4E9D1EDE.9090207@vmware.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20111018061012.GE27732@elgon.mountain>
In-Reply-To: <20111018061012.GE27732@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: kernel-janitors@vger.kernel.org, Vasiliy Kulikov <segooon@gmail.com>, dri-devel@lists.freedesktop.org, Jerome Glisse <jglisse@redhat.com>, Dave Airlie <airlied@redhat.com>

On 10/18/2011 08:10 AM, Dan Carpenter wrote:
> If ret is non-zero then we don't initialize the struct which leaks
> stack information to user space.
>
> Signed-off-by: Dan Carpenter<dan.carpenter@oracle.com>
>    

Reviewed-by: Thomas Hellstrom <thellstrom@vmware.com>

> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
> index d4a1d8b..28e1c35 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
> @@ -1070,6 +1070,8 @@ vmw_execbuf_copy_fence_user(struct vmw_private *dev_priv,
>   	if (user_fence_rep = NULL)
>   		return;
>
> +	memset(&fence_rep, 0, sizeof(fence_rep));
> +
>   	fence_rep.error = ret;
>   	if (ret = 0) {
>   		BUG_ON(fence = NULL);
>    

