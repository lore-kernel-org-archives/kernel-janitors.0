From: Hans de Goede <hdegoede@redhat.com>
Date: Thu, 11 Oct 2018 08:53:19 +0000
Subject: Re: [PATCH] staging: vboxvideo: unlock on error in vbox_cursor_atomic_update()
Message-Id: <c19e1f6e-ff03-d312-be5f-3c743cbc1731@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181011075941.GA11658@mwanda>
In-Reply-To: <20181011075941.GA11658@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi,

On 11-10-18 09:59, Dan Carpenter wrote:
> We need to unlock before returning on this error path.
> 
> Fixes: 35f3288c453e ("staging: vboxvideo: Atomic phase 1: convert cursor to universal plane")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks, the kbuild test robot had already notified me about this
but I did not get around to fixing it yet.

Fix looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans

> 
> diff --git a/drivers/staging/vboxvideo/vbox_mode.c b/drivers/staging/vboxvideo/vbox_mode.c
> index 042e4f384df9..78a9c9b13ff6 100644
> --- a/drivers/staging/vboxvideo/vbox_mode.c
> +++ b/drivers/staging/vboxvideo/vbox_mode.c
> @@ -424,6 +424,7 @@ static void vbox_cursor_atomic_update(struct drm_plane *plane,
>   	/* pinning is done in prepare/cleanup framebuffer */
>   	src = vbox_bo_kmap(bo);
>   	if (IS_ERR(src)) {
> +		mutex_unlock(&vbox->hw_mutex);
>   		DRM_WARN("Could not kmap cursor bo, skipping update\n");
>   		return;
>   	}
> 
