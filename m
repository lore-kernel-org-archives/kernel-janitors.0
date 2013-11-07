From: Guenter Roeck <linux@roeck-us.net>
Date: Thu, 07 Nov 2013 14:27:29 +0000
Subject: Re: [patch] watchdog: pcwd_usb: overflow in usb_pcwd_send_command()
Message-Id: <527BA351.10705@roeck-us.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20131107074028.GA21844@elgon.mountain>
In-Reply-To: <20131107074028.GA21844@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Wim Van Sebroeck <wim@iguana.be>
Cc: linux-watchdog@vger.kernel.org, kernel-janitors@vger.kernel.org

On 11/06/2013 11:40 PM, Dan Carpenter wrote:
> We changed "buf" from being an array of 6 chars to being a pointer this
> sizeof(buf) needs to be updated as well.
>
oops ...

> Fixes: 2ddb8089a7e5 ('watchdog: pcwd_usb: Use allocated buffer for usb_control_msg')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> diff --git a/drivers/watchdog/pcwd_usb.c b/drivers/watchdog/pcwd_usb.c
> index 53598e8..7031b9b 100644
> --- a/drivers/watchdog/pcwd_usb.c
> +++ b/drivers/watchdog/pcwd_usb.c
> @@ -258,7 +258,7 @@ static int usb_pcwd_send_command(struct usb_pcwd_private *usb_pcwd,
>
>   	if (usb_control_msg(usb_pcwd->udev, usb_sndctrlpipe(usb_pcwd->udev, 0),
>   			HID_REQ_SET_REPORT, HID_DT_REPORT,
> -			0x0200, usb_pcwd->interface_number, buf, sizeof(buf),
> +			0x0200, usb_pcwd->interface_number, buf, 6,
>   			USB_COMMAND_TIMEOUT) != sizeof(buf)) {

Doesn't it have to be fixed here as well ?

Thanks,
Guenter

>   		dbg("usb_pcwd_send_command: error in usb_control_msg for "
>   				"cmd 0x%x 0x%x 0x%x\n", cmd, *msb, *lsb);
> --
> To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>

