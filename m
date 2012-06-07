From: Sergei Shtylyov <sshtylyov@mvista.com>
Date: Thu, 07 Jun 2012 13:00:41 +0000
Subject: Re: [PATCH 3/7] drivers/usb/gadget/pch_udc.c: adjust suspicious bit operation
Message-Id: <4FD0A5F9.9050405@mvista.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1339018901-28439-1-git-send-email-Julia.Lawall@lip6.fr> <1339018901-28439-4-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1339018901-28439-4-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: Felipe Balbi <balbi@ti.com>, kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, joe@perches.com, Julia Lawall <julia@diku.dk>

Hello.

On 07-06-2012 1:41, Julia Lawall wrote:

> From: Julia Lawall <Julia.Lawall@lip6.fr>

> PCH_UDC_DMA_LAST is 0x08000000 so a bit-or with this value always gives a
> nonzero result.  The test is rewritten as done elsewhere in the same file.

> This problem was found using Coccinelle (http://coccinelle.lip6.fr/).

> Signed-off-by: Julia Lawall<julia@diku.dk>

> ---
>   drivers/usb/gadget/pch_udc.c |    3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/usb/gadget/pch_udc.c b/drivers/usb/gadget/pch_udc.c
> index 1cfcc9e..79f7a53 100644
> --- a/drivers/usb/gadget/pch_udc.c
> +++ b/drivers/usb/gadget/pch_udc.c
> @@ -2208,7 +2208,8 @@ static void pch_udc_complete_receiver(struct pch_udc_ep *ep)
>   			return;
>   		}
>   		if ((td->status&  PCH_UDC_BUFF_STS) = PCH_UDC_BS_DMA_DONE)
> -			if (td->status | PCH_UDC_DMA_LAST) {
> +			if ((td_data->status&  PCH_UDC_DMA_LAST)
> +			    = PCH_UDC_DMA_LAST) {

    But why not simply:

			if (td_data->status & PCH_UDC_DMA_LAST)

if the constant is single bit anyway? And are you sure about s/td/td_data/?

WBR, Sergei
