From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Date: Thu, 16 Oct 2014 08:09:08 +0000
Subject: Re: [patch] [media] usbvision-video: two use after frees
Message-Id: <1494643.LQNyJpdPt6@avalon>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20141016075721.GC29096@mwanda>
In-Reply-To: <20141016075721.GC29096@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, Mauro Carvalho Chehab <m.chehab@samsung.com>, "Lad, Prabhakar" <prabhakar.csengg@gmail.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thursday 16 October 2014 10:57:21 Dan Carpenter wrote:
> The lock has been freed in usbvision_release() so there is no need to
> call mutex_unlock() here.

Yuck :-/

The driver should really be converted to use video_device::release. That might 
be out of scope for this fix though. Is usbvision maintained ?

> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/media/usb/usbvision/usbvision-video.c
> b/drivers/media/usb/usbvision/usbvision-video.c index 68bc961..9bfa041
> 100644
> --- a/drivers/media/usb/usbvision/usbvision-video.c
> +++ b/drivers/media/usb/usbvision/usbvision-video.c
> @@ -446,6 +446,7 @@ static int usbvision_v4l2_close(struct file *file)
>  	if (usbvision->remove_pending) {
>  		printk(KERN_INFO "%s: Final disconnect\n", __func__);
>  		usbvision_release(usbvision);
> +		return 0;
>  	}
>  	mutex_unlock(&usbvision->v4l2_lock);
> 
> @@ -1221,6 +1222,7 @@ static int usbvision_radio_close(struct file *file)
>  	if (usbvision->remove_pending) {
>  		printk(KERN_INFO "%s: Final disconnect\n", __func__);
>  		usbvision_release(usbvision);
> +		return err_code;
>  	}
> 
>  	mutex_unlock(&usbvision->v4l2_lock);

-- 
Regards,

Laurent Pinchart

