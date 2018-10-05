From: Sinclair Yeh <syeh@vmware.com>
Date: Fri, 05 Oct 2018 22:01:00 +0000
Subject: Re: [PATCH -next] drm/vmwgfx: Remove set but not used variable 'file_priv'
Message-Id: <20181005215658.GA616@vmware.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1538739418-151469-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1538739418-151469-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>
Cc: Thomas Hellstrom <thellstrom@vmware.com>, David Airlie <airlied@linux.ie>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, linux-graphics-maintainer <linux-graphics-maintainer@vmware.com>


Reviewed-by: Sinclair Yeh <syeh@vmware.com>

On Fri, Oct 05, 2018 at 11:36:58AM +0000, YueHaibing wrote:
> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/gpu/drm/vmwgfx/vmwgfx_fence.c: In function 'vmw_event_fence_action_seq_passed':
> drivers/gpu/drm/vmwgfx/vmwgfx_fence.c:909:19: warning:
>  variable 'file_priv' set but not used [-Wunused-but-set-variable]
>   struct drm_file *file_priv;
>   
> It not used any more since 
> commit fb740cf2492c ("drm: Create drm_send_event helpers")
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_fence.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c b/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c
> index f872615..301260e 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c
> @@ -906,13 +906,10 @@ static void vmw_event_fence_action_seq_passed(struct vmw_fence_action *action)
>  		container_of(action, struct vmw_event_fence_action, action);
>  	struct drm_device *dev = eaction->dev;
>  	struct drm_pending_event *event = eaction->event;
> -	struct drm_file *file_priv;
> -
>  
>  	if (unlikely(event == NULL))
>  		return;
>  
> -	file_priv = event->file_priv;
>  	spin_lock_irq(&dev->event_lock);
>  
>  	if (likely(eaction->tv_sec != NULL)) {
> 
> 
> 
