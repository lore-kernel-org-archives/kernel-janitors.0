From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Tue, 24 Apr 2012 05:28:32 +0000
Subject: Re: [PATCH] drivers/input/tablet/aiptek.c: adjust error-handling code label
Message-Id: <20120424052832.GA28787@core.coreip.homeip.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1334609092-15338-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1334609092-15338-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: kernel-janitors@vger.kernel.org, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Apr 16, 2012 at 10:44:52PM +0200, Julia Lawall wrote:
> From: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> At the point of this error-handling code, aiptek->urb has been allocated,
> and it does not appear to be less necessary to free it here than in the
> error-handling code just below.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Applied, thank you Julia.

> 
> ---
>  drivers/input/tablet/aiptek.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/input/tablet/aiptek.c b/drivers/input/tablet/aiptek.c
> index 205d16a..a33d347 100644
> --- a/drivers/input/tablet/aiptek.c
> +++ b/drivers/input/tablet/aiptek.c
> @@ -1856,7 +1856,7 @@ aiptek_probe(struct usb_interface *intf, const struct usb_device_id *id)
>  	if (i = ARRAY_SIZE(speeds)) {
>  		dev_info(&intf->dev,
>  			 "Aiptek tried all speeds, no sane response\n");
> -		goto fail2;
> +		goto fail3;
>  	}
>  
>  	/* Associate this driver's struct with the usb interface.
> 

-- 
Dmitry
