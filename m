From: Dave Hansen <dave@sr71.net>
Date: Wed, 14 Oct 2009 15:58:05 +0000
Subject: Re: [PATCH] leds-ss4200: Check pci_enable_device return
Message-Id: <1255535885.8166.6361.camel@nimitz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1255493810.28264.6.camel@laptop>
In-Reply-To: <1255493810.28264.6.camel@laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, 2009-10-14 at 00:16 -0400, Javier Martinez Canillas wrote:
> pci_enable_result is defined using the __must_check macro but leds-ss4200 is not checking the return value.
> 
> This patch solves the issue

Thanks for the patch.  By the way, what tree is this against, or did you
just see my patch on a mailing list?

> diff --git a/drivers/leds/leds-ss4200.c b/drivers/leds/leds-ss4200.c
> index 0ec4ec3..1e72383 100644
> --- a/drivers/leds/leds-ss4200.c
> +++ b/drivers/leds/leds-ss4200.c
> @@ -347,7 +347,10 @@ static int __devinit ich7_lpc_probe(struct pci_dev *dev,
>  	int status = 0;
>  	u32 gc = 0;
>  
> -	pci_enable_device(dev);
> +	if ((status = pci_enable_device(dev))) {
> +		dev_err(&dev->dev, "pci_enable_device failed\n");
> +		goto out;
> +	}

Unfortunately, this patch has some issues.  It's a bit nasty to do real
work inside of if() conditions, especially when you already have a nice,
local variable to store the condition for you.

Your patch is also buggy because the out: label tries to disable the
device and clean up the 'struct device'.  Neither of those things has
been done if the pci_enable_device() fails in the first place.  It will
probably oops.  

I'll cc you on what I think is the correct patch.

-- Dave

