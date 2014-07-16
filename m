From: Greg KH <gregkh@linuxfoundation.org>
Date: Wed, 16 Jul 2014 04:54:33 +0000
Subject: Re: [PATCH V5 6/6] staging: vt6556: Replace printk by dev_warn
Message-Id: <20140716045433.GA32044@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1405457209-6584-1-git-send-email-peter.senna@gmail.com>
 <1405457209-6584-2-git-send-email-peter.senna@gmail.com>
In-Reply-To: <1405457209-6584-2-git-send-email-peter.senna@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Senna Tschudin <peter.senna@gmail.com>
Cc: forest@alittletooquiet.net, tvboxspy@gmail.com, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Jul 15, 2014 at 10:46:49PM +0200, Peter Senna Tschudin wrote:
> This patch fixes a checkpatch warning by replacing printk
> by dev_warn. Tested by compilation only.
> 
> Signed-off-by: Peter Senna Tschudin <peter.senna@gmail.com>
> ---
> Changes from V4:
>  - use dev_warn instead of pr_warn
> 
>  drivers/staging/vt6656/main_usb.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/vt6656/main_usb.c b/drivers/staging/vt6656/main_usb.c
> index 7567646..6708e98 100644
> --- a/drivers/staging/vt6656/main_usb.c
> +++ b/drivers/staging/vt6656/main_usb.c
> @@ -527,7 +527,8 @@ static void usb_device_reset(struct vnt_private *pDevice)
>  
>  	status = usb_reset_device(pDevice->usb);
>  	if (status)
> -            printk("usb_device_reset fail status=%d\n",status);
> +		dev_warn(&pDevice->usb->dev,
> +			 "usb_device_reset fail status=%d\n", status);
>  }
>  
>  static void device_free_int_bufs(struct vnt_private *priv)

This doesn't apply to my latest tree, can you please refresh it and
resend?

thanks,

greg k-h
