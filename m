From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 02 Aug 2013 10:33:19 +0000
Subject: Re: [PATCH] Staging: winbond: wb35reg: fixed some line over 80 characters
Message-Id: <20130802103319.GC5051@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1375386221-3726-1-git-send-email-ikerpedrosam@gmail.com>
In-Reply-To: <1375386221-3726-1-git-send-email-ikerpedrosam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Looks ok.  Send it to the ./scripts/get_maintainer.pl people.

On Thu, Aug 01, 2013 at 09:43:41PM +0200, Iker Pedrosa wrote:
> @@ -139,9 +141,10 @@ unsigned char Wb35Reg_WriteSync(struct hw_data *pHwData, u16 RegisterNo, u32 Reg
>  	/* Sync IoCallDriver */
>  	reg->EP0vm_state = VM_RUNNING;
>  	ret = usb_control_msg(pHwData->udev,
> -			       usb_sndctrlpipe(pHwData->udev, 0),
> -			       0x03, USB_TYPE_VENDOR | USB_RECIP_DEVICE | USB_DIR_OUT,
> -			       0x0, RegisterNo, &RegisterValue, 4, HZ * 100);
> +			      usb_sndctrlpipe(pHwData->udev, 0),
> +			      0x03,

The "0x03," will fit on the line before:

+                           usb_sndctrlpipe(pHwData->udev, 0), 0x03,

> +			      USB_TYPE_VENDOR | USB_RECIP_DEVICE | USB_DIR_OUT,
> +			      0x0, RegisterNo, &RegisterValue, 4, HZ * 100);
>  	reg->EP0vm_state = VM_STOP;
>  	reg->SyncIoPause = 0;

There is a similar thing below as well.

regards,
dan carpenter

