From: Greg KH <greg@kroah.com>
Date: Mon, 29 May 2006 21:32:15 +0000
Subject: Re: [KJ] [PATCH] drivers/char/mxser.c : replace pci_find_device by
Message-Id: <20060529213215.GB10621@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4478AF44.3040701@yahoo.fr>
In-Reply-To: <4478AF44.3040701@yahoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, May 27, 2006 at 10:33:30PM +0200, trem wrote:
> diff --git a/drivers/char/mxser.c b/drivers/char/mxser.c
> index 0fb2fb9..28298dc 100644
> --- a/drivers/char/mxser.c
> +++ b/drivers/char/mxser.c
> @@ -817,7 +817,7 @@ static int mxser_init(void)
>  	index = 0;
>  	b = 0;
>  	while (b < n) {
> -		pdev = pci_find_device(mxser_pcibrds[b].vendor, mxser_pcibrds[b].device, pdev);
> +		pdev = pci_get_device(mxser_pcibrds[b].vendor, mxser_pcibrds[b].device, pdev);
>  			if (pdev = NULL) {
>  			b++;
>  			continue;
> @@ -854,6 +854,7 @@ static int mxser_init(void)
>  			m++;
>  		}
>  	}
> +	pci_dev_put(pdev);
>  #endif

No, this is not correct as you are saving off that pdev somewhere else
and then referencing it later.  Which could be a stale pointer.

Please just convert the driver to the proper pci_register_driver() api
instead.

thanks,

greg k-h
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
