From: Jiri Slaby <jirislaby@gmail.com>
Date: Sun, 08 Aug 2010 20:29:04 +0000
Subject: Re: [PATCH 02/18] char: mxser: call disable_pci_device() if pci_probe()
Message-Id: <4C5F1390.3040509@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1281124159-12671-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1281124159-12671-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kulikov Vasiliy <segooon@gmail.com>
Cc: kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@suse.de>, Alan Cox <alan@linux.intel.com>, Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org

On 08/06/2010 09:49 PM, Kulikov Vasiliy wrote:
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
> +		goto err;
> +	}
>  	brd->vector = ioaddress;
>  
>  	/* irq */
> @@ -2616,10 +2619,11 @@ static int __devinit mxser_probe(struct pci_dev *pdev,
>  	pci_set_drvdata(pdev, brd);
>  
>  	return 0;
> -err_relio:
> -	pci_release_region(pdev, 2);
>  err_null:
>  	brd->info = NULL;
> +	pci_release_region(pdev, 2);
> +	pci_release_region(pdev, 3);
> +	pci_disable_device(pdev);

Why did you reorder this so that you cannot jump here from the fail path
above?

thanks,
-- 
js
