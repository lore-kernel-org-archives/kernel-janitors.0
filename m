From: Evgeniy Polyakov <zbr@ioremap.net>
Date: Tue, 05 Sep 2017 13:25:21 +0000
Subject: Re: [PATCH] w1: ds2490: constify usb_device_id and fix space before '[' error
Message-Id: <188621504617921@web52g.yandex.ru>
List-Id: <kernel-janitors.vger.kernel.org>
References: <22fa8ca67a6d4a59997f463bf241ed56596fbcfa.1502526524.git.arvind.yadav.cs@gmail.com> <d0cbdcb29a280665736ccc4f9441feeebe22f337.1502526524.git.arvind.yadav.cs@gmail.com>
In-Reply-To: <d0cbdcb29a280665736ccc4f9441feeebe22f337.1502526524.git.arvind.yadav.cs@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Arvind Yadav <arvind.yadav.cs@gmail.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, kernel-janitors <kernel-janitors@vger.kernel.org>

Hi Arvind

12.08.2017, 11:38, "Arvind Yadav" <arvind.yadav.cs@gmail.com>:
> usb_device_id are not supposed to change at runtime. All functions
> working with usb_device_id provided by <linux/usb.h> work with
> const usb_device_id. So mark the non-const structs as const.
>
> Fix checkpatch.pl error:
> ERROR: space prohibited before open square bracket '['.
>
> Signed-off-by: Arvind Yadav <arvind.yadav.cs@gmail.com>

Looks good to me, thank you
kernel-janitors@ please queue this up

Acked-by: Evgeniy Polyakov <zbr@ioremap.net>

> ---
>  drivers/w1/masters/ds2490.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/w1/masters/ds2490.c b/drivers/w1/masters/ds2490.c
> index 46ccb2f..a02da9a 100644
> --- a/drivers/w1/masters/ds2490.c
> +++ b/drivers/w1/masters/ds2490.c
> @@ -1088,7 +1088,7 @@ static void ds_disconnect(struct usb_interface *intf)
>          kfree(dev);
>  }
>
> -static struct usb_device_id ds_id_table [] = {
> +static const struct usb_device_id ds_id_table[] = {
>          { USB_DEVICE(0x04fa, 0x2490) },
>          { },
>  };
> --
> 2.7.4
