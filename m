From: Jiri Slaby <jirislaby@gmail.com>
Date: Mon, 09 Aug 2010 20:19:06 +0000
Subject: Re: [PATCH 02/18 v2] char: mxser: call disable_pci_device() if pci_probe()
Message-Id: <4C6062BA.4070009@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1281383369-13613-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1281383369-13613-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kulikov Vasiliy <segooon@gmail.com>
Cc: kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@suse.de>, Alan Cox <alan@linux.intel.com>, Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org

On 08/09/2010 09:49 PM, Kulikov Vasiliy wrote:
> --- a/drivers/char/mxser.c
> +++ b/drivers/char/mxser.c
> @@ -2564,8 +2564,11 @@ static int __devinit mxser_probe(struct pci_dev *pdev,
>  	/* vector */
>  	ioaddress = pci_resource_start(pdev, 3);
>  	retval = pci_request_region(pdev, 3, "mxser(vector)");
> -	if (retval)
> -		goto err_relio;
> +	if (retval) {
> +		pci_release_region(pdev, 2);
> +		brd->info = NULL;
> +		goto err_release;
> +	}

Hi, I'm still not happy with this patch. First, it omits mxser_remove,
where pci_disable_device is not called too. Second, the fail-paths tail
should be reorganized so that we can jump there appropriately. I'll
reply with my version of the patch, if you don't mind.

thanks,
-- 
js
