From: Guenter Roeck <linux@roeck-us.net>
Date: Sun, 09 Aug 2020 13:38:40 +0000
Subject: Re: [PATCH] watchdog: pcwd_usb: Avoid GFP_ATOMIC where it is not needed
Message-Id: <42ad4fb9-e16a-147f-1732-950e657c0a79@roeck-us.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200809071912.742836-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200809071912.742836-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, wim@linux-watchdog.org
Cc: linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 8/9/20 12:19 AM, Christophe JAILLET wrote:
> There is no need to use GFP_ATOMIC here. It is a probe function, no
> spinlock is taken and GFP_KERNEL is used just before and just after this
> 'usb_alloc_coherent()' call.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/pcwd_usb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/pcwd_usb.c b/drivers/watchdog/pcwd_usb.c
> index 2f44af1831d0..ea67b98ed35d 100644
> --- a/drivers/watchdog/pcwd_usb.c
> +++ b/drivers/watchdog/pcwd_usb.c
> @@ -657,7 +657,7 @@ static int usb_pcwd_probe(struct usb_interface *interface,
>  
>  	/* set up the memory buffer's */
>  	usb_pcwd->intr_buffer = usb_alloc_coherent(udev, usb_pcwd->intr_size,
> -					GFP_ATOMIC, &usb_pcwd->intr_dma);
> +					GFP_KERNEL, &usb_pcwd->intr_dma);
>  	if (!usb_pcwd->intr_buffer) {
>  		pr_err("Out of memory\n");
>  		goto error;
> 
