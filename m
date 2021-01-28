From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 28 Jan 2021 14:01:40 +0000
Subject: Re: [PATCH][V2][next] media: uvcvideo: Fix memory leak when gpiod_to_irq fails
Message-Id: <CANiDSCuBc1iSLUZzP1=h912EVCyzP0XGzmemw7q5hXYdYZszTw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210128135923.638480-1-colin.king@canonical.com>
In-Reply-To: <20210128135923.638480-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Linux Media Mailing List <linux-media@vger.kernel.org>, kernel-janitors@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Thanks for the fix!

On Thu, Jan 28, 2021 at 2:59 PM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> Currently when the call to gpiod_to_irq fails the error return
> path does not kfree the recently allocated object 'unit'. Fix this
> swapping the order of the irq call and the allocation of unit.
>
> Thanks to Ricardo Ribalda for suggesting this fix.
>
> Addresses-Coverity: ("Resource leak")
> Fixes: 2886477ff987 ("media: uvcvideo: Implement UVC_EXT_GPIO_UNIT")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>

> ---
>
> V2: swap order of gpiod_to_irq call and allocation of unit to simplify
>     error cleanup.
>
> ---
>  drivers/media/usb/uvc/uvc_driver.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index 1abc122a0977..f62e6cb66daf 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -1534,10 +1534,6 @@ static int uvc_gpio_parse(struct uvc_device *dev)
>         if (IS_ERR_OR_NULL(gpio_privacy))
>                 return PTR_ERR_OR_ZERO(gpio_privacy);
>
> -       unit = uvc_alloc_entity(UVC_EXT_GPIO_UNIT, UVC_EXT_GPIO_UNIT_ID, 0, 1);
> -       if (!unit)
> -               return -ENOMEM;
> -
>         irq = gpiod_to_irq(gpio_privacy);
>         if (irq < 0) {
>                 if (irq != EPROBE_DEFER)
> @@ -1546,6 +1542,10 @@ static int uvc_gpio_parse(struct uvc_device *dev)
>                 return irq;
>         }
>
> +       unit = uvc_alloc_entity(UVC_EXT_GPIO_UNIT, UVC_EXT_GPIO_UNIT_ID, 0, 1);
> +       if (!unit)
> +               return -ENOMEM;
> +
>         unit->gpio.gpio_privacy = gpio_privacy;
>         unit->gpio.irq = irq;
>         unit->gpio.bControlSize = 1;
> --
> 2.29.2
>


-- 
Ricardo Ribalda
