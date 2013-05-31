From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Date: Fri, 31 May 2013 20:27:30 +0000
Subject: Re: [PATCH] usb: musb: Fix format specifier warning
Message-Id: <51A907B2.1070400@cogentembedded.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1370031778-25965-1-git-send-email-emilgoode@gmail.com>
In-Reply-To: <1370031778-25965-1-git-send-email-emilgoode@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Emil Goode <emilgoode@gmail.com>
Cc: balbi@ti.com, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Hello.

On 06/01/2013 12:22 AM, Emil Goode wrote:

> This patch fixes a format specifier warning. dma_addr_t can be either
> u32 or u64 so we should cast to the largest type and change the format
> specifier to %llx.
> The addition of urb->transfer_dma and urb->actual_length is also done a
> few lines below. I have moved this code up and pass the variable buf to
> dev_dbg.
>
> Sparse output:
> drivers/usb/musb/musb_host.c:1761:4: warning:
> 	format ‘%x’ expects argument of type ‘unsigned int’,
> 	but argument 6 has type ‘dma_addr_t’ [-Wformat]
>
> Signed-off-by: Emil Goode <emilgoode@gmail.com>
> ---
>   drivers/usb/musb/musb_host.c |   11 ++++-------
>   1 file changed, 4 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/usb/musb/musb_host.c b/drivers/usb/musb/musb_host.c
> index 094cf80..d647ccb 100644
> --- a/drivers/usb/musb/musb_host.c
> +++ b/drivers/usb/musb/musb_host.c
[...]
> @@ -1789,11 +1789,8 @@ void musb_host_rx(struct musb *musb, u8 epnum)
>   					length = rx_count;
>   				d->status = d_status;
>   				buf = urb->transfer_dma + d->offset;
> -			} else {
> +			} else

    You should keep {} on the *else* branch since *if* branch has {},
according to Documentation/CodingStyle.

>   				length = rx_count;
> -				buf = urb->transfer_dma +
> -						urb->actual_length;
> -			}

WBR, Sergei


