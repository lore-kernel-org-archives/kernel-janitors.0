From: Alan Stern <stern@rowland.harvard.edu>
Date: Wed, 15 Aug 2012 14:37:15 +0000
Subject: Re: [PATCH 5/5] drivers/usb/host/ehci-platform.c: fix error return code
Message-Id: <Pine.LNX.4.44L0.1208151036500.1674-100000@iolanthe.rowland.org>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <1344926858-1162-6-git-send-email-Julia.Lawall@lip6.fr>
References: <1344926858-1162-6-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1344926858-1162-6-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, 14 Aug 2012, Julia Lawall wrote:

> From: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> Convert a possibly 0 error return code to a negative one, as returned
> elsewhere in the function.

...

> diff --git a/drivers/usb/host/ehci-platform.c b/drivers/usb/host/ehci-platform.c
> index 91acdde..764e010 100644
> --- a/drivers/usb/host/ehci-platform.c
> +++ b/drivers/usb/host/ehci-platform.c
> @@ -128,8 +128,10 @@ static int __devinit ehci_platform_probe(struct platform_device *dev)
>  	}
>  
>  	hcd->regs = ioremap_nocache(hcd->rsrc_start, hcd->rsrc_len);
> -	if (!hcd->regs)
> +	if (!hcd->regs) {
> +		err = -ENOMEM;
>  		goto err_release_region;
> +	}
>  	err = usb_add_hcd(hcd, irq, IRQF_SHARED);
>  	if (err)
>  		goto err_iounmap;

Acked-by: Alan Stern <stern@rowland.harvard.edu>

