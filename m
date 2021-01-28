From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 28 Jan 2021 13:15:31 +0000
Subject: Re: [PATCH][next] media: uvcvideo: Fix memory leak when gpiod_to_irq fails
Message-Id: <CANiDSCs2WrwSHdiazPhvGtnXOvtRMsaZvMUFrpE5T5cOufnPWA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210128131054.637715-1-colin.king@canonical.com>
In-Reply-To: <20210128131054.637715-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Linux Media Mailing List <linux-media@vger.kernel.org>, kernel-janitors@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Colin

Thanks a lot for the patch. It is definitely a bug.

On Thu, Jan 28, 2021 at 2:10 PM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> Currently when the call to gpiod_to_irq fails the error return
> path does not kfree the recently allocated object 'unit'. Fix this
> by kfree'ing it before returning.
>
> Addresses-Coverity: ("Resource leak")
> Fixes: 2886477ff987 ("media: uvcvideo: Implement UVC_EXT_GPIO_UNIT")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/media/usb/uvc/uvc_driver.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index 1abc122a0977..56f867790ef1 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -1543,6 +1543,7 @@ static int uvc_gpio_parse(struct uvc_device *dev)
>                 if (irq != EPROBE_DEFER)
>                         dev_err(&dev->udev->dev,
>                                 "No IRQ for privacy GPIO (%d)\n", irq);
> +               kfree(unit);

Wouldn't it be better to swap the order of the resource handling?

1st: gpiod_to_irq
2nd: uvc_alloc_entity

Thanks

>                 return irq;
>         }
>
> --
> 2.29.2
>


-- 
Ricardo Ribalda
