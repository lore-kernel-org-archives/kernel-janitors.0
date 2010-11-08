From: Thomas Hellstrom <thellstrom@vmware.com>
Date: Mon, 08 Nov 2010 15:40:59 +0000
Subject: Re: [PATCH] gpu: drm: vmwgfx: fix information leak to userland
Message-Id: <4CD81A0B.30209@vmware.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1289054477-18100-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1289054477-18100-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vasiliy Kulikov <segooon@gmail.com>
Cc: Dan Carpenter <error27@gmail.com>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Jerome Glisse <jglisse@redhat.com>, Dave Airlie <airlied@redhat.com>

On 11/06/2010 03:41 PM, Vasiliy Kulikov wrote:
> Structure drm_vmw_fence_rep is copied to userland with field "pad64"
> uninitialized.  It leads to leaking of contents of kernel stack memory.
>
> Signed-off-by: Vasiliy Kulikov<segooon@gmail.com>
> ---
>   Compile tested.
>
>   drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c |    1 +
>   1 files changed, 1 insertions(+), 0 deletions(-)
>
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
> index 51d9f9f..76954e3 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
> @@ -691,6 +691,7 @@ int vmw_execbuf_ioctl(struct drm_device *dev, void *data,
>
>   	fence_rep.error = ret;
>   	fence_rep.fence_seq = (uint64_t) sequence;
> +	fence_rep.pad64 = 0;
>
>   	user_fence_rep = (struct drm_vmw_fence_rep __user *)
>   	    (unsigned long)arg->fence_rep;
>    
Reviewed-by: Thomas Hellstrom <thellstrom@vmware.com>

