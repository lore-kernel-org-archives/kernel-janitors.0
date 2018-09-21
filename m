From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 21 Sep 2018 08:50:31 +0000
Subject: Re: [PATCH -next] drm/vkms: Fix possible memory leak in _vkms_get_crc()
Message-Id: <20180921085031.GV11082@phenom.ffwll.local>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1536976399-1295-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1536976399-1295-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>, kernel-janitors@vger.kernel.org, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>, Mahesh Kumar <mahesh1.kumar@intel.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Sean Paul <seanpaul@chromium.org>

On Sat, Sep 15, 2018 at 01:53:19AM +0000, Wei Yongjun wrote:
> 'vaddr_out' is malloced in _vkms_get_crc() and should be freed before
> leaving from the error handling cases, otherwise it will cause memory
> leak.
> 
> Fixes: db7f419c06d7 ("drm/vkms: Compute CRC with Cursor Plane")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Applied, thanks for your patch.
-Daniel

> ---
>  drivers/gpu/drm/vkms/vkms_crc.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_crc.c b/drivers/gpu/drm/vkms/vkms_crc.c
> index 0a27456..9d9e814 100644
> --- a/drivers/gpu/drm/vkms/vkms_crc.c
> +++ b/drivers/gpu/drm/vkms/vkms_crc.c
> @@ -125,6 +125,7 @@ static uint32_t _vkms_get_crc(struct vkms_crc_data *primary_crc,
>  	mutex_lock(&vkms_obj->pages_lock);
>  	if (WARN_ON(!vkms_obj->vaddr)) {
>  		mutex_unlock(&vkms_obj->pages_lock);
> +		kfree(vaddr_out);
>  		return crc;
>  	}
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
