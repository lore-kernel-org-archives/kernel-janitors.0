From: Hans Verkuil <hverkuil@xs4all.nl>
Date: Sun, 20 Jan 2013 16:03:53 +0000
Subject: Re: [PATCH V2 05/24] radio/si470x/radio-si470x.h: use IS_ENABLED() macro
Message-Id: <201301201703.53668.hverkuil@xs4all.nl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1358638891-4775-1-git-send-email-peter.senna@gmail.com> <1358638891-4775-6-git-send-email-peter.senna@gmail.com>
In-Reply-To: <1358638891-4775-6-git-send-email-peter.senna@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Senna Tschudin <peter.senna@gmail.com>
Cc: mchehab@redhat.com, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sun January 20 2013 00:41:12 Peter Senna Tschudin wrote:
> replace:
>  #if defined(CONFIG_USB_SI470X) || \
>      defined(CONFIG_USB_SI470X_MODULE)
> with:
>  #if IS_ENABLED(CONFIG_USB_SI470X)
> 
> This change was made for: CONFIG_USB_SI470X,
> CONFIG_I2C_SI470X
> 
> Reported-by: Mauro Carvalho Chehab <mchehab@redhat.com>
> Signed-off-by: Peter Senna Tschudin <peter.senna@gmail.com>

Acked-by: Hans Verkuil <hans.verkuil@cisco.com>

Regards,

	Hans

> ---
> Changes from V1:
>    Updated subject
> 
>  drivers/media/radio/si470x/radio-si470x.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/radio/si470x/radio-si470x.h b/drivers/media/radio/si470x/radio-si470x.h
> index 2f089b4..467e955 100644
> --- a/drivers/media/radio/si470x/radio-si470x.h
> +++ b/drivers/media/radio/si470x/radio-si470x.h
> @@ -163,7 +163,7 @@ struct si470x_device {
>  	struct completion completion;
>  	bool status_rssi_auto_update;	/* Does RSSI get updated automatic? */
>  
> -#if defined(CONFIG_USB_SI470X) || defined(CONFIG_USB_SI470X_MODULE)
> +#if IS_ENABLED(CONFIG_USB_SI470X)
>  	/* reference to USB and video device */
>  	struct usb_device *usbdev;
>  	struct usb_interface *intf;
> @@ -179,7 +179,7 @@ struct si470x_device {
>  	unsigned char hardware_version;
>  #endif
>  
> -#if defined(CONFIG_I2C_SI470X) || defined(CONFIG_I2C_SI470X_MODULE)
> +#if IS_ENABLED(CONFIG_I2C_SI470X)
>  	struct i2c_client *client;
>  #endif
>  };
> 
