From: Greg KH <gregkh@linuxfoundation.org>
Date: Tue, 15 Jul 2014 15:06:40 +0000
Subject: Re: [PATCH V4 6/6] staging: vt6556: Replace printk by pr_warn
Message-Id: <20140715150640.GA19185@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1405365333-17170-1-git-send-email-peter.senna@gmail.com>
 <1405365333-17170-6-git-send-email-peter.senna@gmail.com>
In-Reply-To: <1405365333-17170-6-git-send-email-peter.senna@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Senna Tschudin <peter.senna@gmail.com>
Cc: forest@alittletooquiet.net, tvboxspy@gmail.com, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, Jul 14, 2014 at 09:15:33PM +0200, Peter Senna Tschudin wrote:
> This patch fixes a checkpatch warning by replacing printk by pr_warn.
> 
> Tested by compilation only.
> 
> Signed-off-by: Peter Senna Tschudin <peter.senna@gmail.com>
> ---
> Cahnges from V3:
>  - Splitted the patches by change type
> 
>  drivers/staging/vt6656/main_usb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/vt6656/main_usb.c b/drivers/staging/vt6656/main_usb.c
> index cc0281a..64c25e2 100644
> --- a/drivers/staging/vt6656/main_usb.c
> +++ b/drivers/staging/vt6656/main_usb.c
> @@ -527,7 +527,7 @@ static void usb_device_reset(struct vnt_private *pDevice)
>  
>  	status = usb_reset_device(pDevice->usb);
>  	if (status)
> -            printk("usb_device_reset fail status=%d\n",status);
> +		pr_warn("usb_device_reset fail status=%d\n", status);

Please use dev_warn() instead.

thanks,

greg k-h
