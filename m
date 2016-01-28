From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 28 Jan 2016 09:28:38 +0000
Subject: Re: [patch] drm/vmwgfx: fix a NULL dereference
Message-Id: <20160128092838.GT11240@phenom.ffwll.local>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160128090646.GA5824@mwanda>
In-Reply-To: <20160128090646.GA5824@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Thomas Hellstrom <thellstrom@vmware.com>, Daniel Stone <daniels@collabora.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>

On Thu, Jan 28, 2016 at 12:06:46PM +0300, Dan Carpenter wrote:
> We dereference "eaction->event" inside the call to drm_send_event_locked()
> so should hold off on setting it to NULL until afterward.
> 
> Fixes: fb740cf2492c ("drm: Create drm_send_event helpers")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Oh dear that's embarassing. Thanks for the patch, applied.
-Daniel

> 
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c b/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c
> index e0edf14..37c305b 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c
> @@ -880,8 +880,8 @@ static void vmw_event_fence_action_seq_passed(struct vmw_fence_action *action)
>  	}
>  
>  	list_del_init(&eaction->fpriv_head);
> -	eaction->event = NULL;
>  	drm_send_event_locked(dev, eaction->event);
> +	eaction->event = NULL;
>  	spin_unlock_irqrestore(&dev->event_lock, irq_flags);
>  }
>  

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
