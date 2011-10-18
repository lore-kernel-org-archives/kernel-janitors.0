From: Thomas Hellstrom <thellstrom@vmware.com>
Date: Tue, 18 Oct 2011 06:37:06 +0000
Subject: Re: [patch] vmwgfx: return -EFAULT instead of number of bytes remaining
Message-Id: <4E9D1E92.5010001@vmware.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20111018060919.GC27732@elgon.mountain>
In-Reply-To: <20111018060919.GC27732@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Dave Airlie <airlied@redhat.com>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

On 10/18/2011 08:09 AM, Dan Carpenter wrote:
> The intent here was to return an error code, but instead the code
> returns the number of bytes remaining (that weren't copied).
>
> Signed-off-by: Dan Carpenter<dan.carpenter@oracle.com>
>    

Reviewed-by: Thomas Hellstrom <thellstrom@vmware.com>


> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ioctl.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ioctl.c
> index 97f23ab..3f63435 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_ioctl.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ioctl.c
> @@ -150,6 +150,7 @@ int vmw_present_ioctl(struct drm_device *dev, void *data,
>   	ret = copy_from_user(clips, clips_ptr, num_clips * sizeof(*clips));
>   	if (ret) {
>   		DRM_ERROR("Failed to copy clip rects from userspace.\n");
> +		ret = -EFAULT;
>   		goto out_no_copy;
>   	}
>
> @@ -241,6 +242,7 @@ int vmw_present_readback_ioctl(struct drm_device *dev, void *data,
>   	ret = copy_from_user(clips, clips_ptr, num_clips * sizeof(*clips));
>   	if (ret) {
>   		DRM_ERROR("Failed to copy clip rects from userspace.\n");
> +		ret = -EFAULT;
>   		goto out_no_copy;
>   	}
>
>    

