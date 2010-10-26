From: Thomas Dahlmann <dahlmann.thomas@arcor.de>
Date: Tue, 26 Oct 2010 13:43:05 +0000
Subject: Re: [PATCH 2/14] drivers/usb/gadget/amd5536udc.c: delete double assignment
Message-Id: <4CC6DAE9.1070402@arcor.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1288088743-3725-1-git-send-email-julia@diku.dk> <1288088743-3725-3-git-send-email-julia@diku.dk>
In-Reply-To: <1288088743-3725-3-git-send-email-julia@diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: kernel-janitors@vger.kernel.org, David Brownell <dbrownell@users.sourceforge.net>, Greg Kroah-Hartman <gregkh@suse.de>, linux-geode@lists.infradead.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org

ACK

Thanks!
Thomas

On 10/26/2010 12:25 PM, Julia Lawall wrote:
> From: Julia Lawall<julia@diku.dk>
>
> Delete successive assignments to the same location.
>
> A simplified version of the semantic match that finds this problem is as
> follows: (http://coccinelle.lip6.fr/)
>
> //<smpl>
> @@
> expression i;
> @@
>
> *i = ...;
>   i = ...;
> //</smpl>
>
> Signed-off-by: Julia Lawall<julia@diku.dk>
>
> ---
>   drivers/usb/gadget/amd5536udc.c |    1 -
>   1 file changed, 1 deletion(-)
>
> diff --git a/drivers/usb/gadget/amd5536udc.c b/drivers/usb/gadget/amd5536udc.c
> index 9034e03..f8dd726 100644
> --- a/drivers/usb/gadget/amd5536udc.c
> +++ b/drivers/usb/gadget/amd5536udc.c
> @@ -3359,7 +3359,6 @@ static int udc_probe(struct udc *dev)
>   	dev_set_name(&dev->gadget.dev, "gadget");
>   	dev->gadget.dev.release = gadget_release;
>   	dev->gadget.name = name;
> -	dev->gadget.name = name;
>   	dev->gadget.is_dualspeed = 1;
>
>   	/* init registers, interrupts, ... */
>
>    

