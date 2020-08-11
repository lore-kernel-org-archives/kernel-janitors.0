From: Roland Scheidegger <sroland@vmware.com>
Date: Tue, 11 Aug 2020 01:21:08 +0000
Subject: Re: [PATCH] drm/vmwgfx: fix spelling mistake "Cant" -> "Can't"
Message-Id: <d4859590-75fb-2d5b-a76c-58c4f6e799c3@vmware.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200810100401.61209-1-colin.king@canonical.com>
In-Reply-To: <20200810100401.61209-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, VMware Graphics <linux-graphics-maintainer@vmware.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Thanks, I've put the fix in the vmwgfx-next branch.

Roland

Am 10.08.20 um 12:04 schrieb Colin King:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a spelling mistake in a DRM_ERROR message. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_kms.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> index bbce45d142aa..471836672312 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> @@ -186,7 +186,7 @@ void vmw_kms_cursor_snoop(struct vmw_surface *srf,
>  		/* TODO handle none page aligned offsets */
>  		/* TODO handle more dst & src != 0 */
>  		/* TODO handle more then one copy */
> -		DRM_ERROR("Cant snoop dma request for cursor!\n");
> +		DRM_ERROR("Can't snoop dma request for cursor!\n");
>  		DRM_ERROR("(%u, %u, %u) (%u, %u, %u) (%ux%ux%u) %u %u\n",
>  			  box->srcx, box->srcy, box->srcz,
>  			  box->x, box->y, box->z,
> 
