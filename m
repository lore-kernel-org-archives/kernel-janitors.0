From: Dan Carpenter <error27@gmail.com>
Date: Mon, 09 Aug 2010 20:27:28 +0000
Subject: Re: [PATCH 02/18 v2] char: mxser: call disable_pci_device() if
Message-Id: <20100809202634.GL9031@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1281383369-13613-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1281383369-13613-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kulikov Vasiliy <segooon@gmail.com>
Cc: kernel-janitors@vger.kernel.org, Jiri Slaby <jirislaby@gmail.com>, Greg Kroah-Hartman <gregkh@suse.de>, Alan Cox <alan@linux.intel.com>, Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org

On Mon, Aug 09, 2010 at 11:49:27PM +0400, Kulikov Vasiliy wrote:
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

This should just be goto err_null.  The original err_null had a bug that
it didn't call pci_release_region(pdev, 2); but you already fixed that.

regards,
dan carpenter

> +	}
>  	brd->vector = ioaddress;
>  
>  	/* irq */
> @@ -2616,10 +2619,13 @@ static int __devinit mxser_probe(struct pci_dev *pdev,
>  	pci_set_drvdata(pdev, brd);
>  
>  	return 0;
> -err_relio:
> -	pci_release_region(pdev, 2);
>  err_null:
>  	brd->info = NULL;
> +	pci_release_region(pdev, 2);
> +err_release:
> +	pci_release_region(pdev, 3);
> +err_disable:
> +	pci_disable_device(pdev);
>  err:
>  	return retval;
>  #else

