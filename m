From: Dan Carpenter <error27@gmail.com>
Date: Tue, 03 Aug 2010 21:51:38 +0000
Subject: Re: [PATCH 8/9] arch/powerpc/kernel: Drop unnecessary null test
Message-Id: <20100803215137.GU26313@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.1008032334420.20393@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.1008032334420.20393@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: devicetree-discuss@lists.ozlabs.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linuxppc-dev@ozlabs.org, Paul Mackerras <paulus@samba.org>

On Tue, Aug 03, 2010 at 11:35:17PM +0200, Julia Lawall wrote:
> diff --git a/arch/powerpc/kernel/pci_of_scan.c b/arch/powerpc/kernel/pci_of_scan.c
> index 6ddb795..62dd363 100644
> --- a/arch/powerpc/kernel/pci_of_scan.c
> +++ b/arch/powerpc/kernel/pci_of_scan.c
> @@ -336,8 +336,7 @@ static void __devinit __of_scan_bus(struct device_node *node,
>  		if (dev->hdr_type = PCI_HEADER_TYPE_BRIDGE ||
>  		    dev->hdr_type = PCI_HEADER_TYPE_CARDBUS) {
>  			struct device_node *child = pci_device_to_OF_node(dev);
> -			if (dev)
> -				of_scan_pci_bridge(child, dev);
> +			of_scan_pci_bridge(child, dev);

The intention was probably to check "child" instead of "dev".
pci_device_to_OF_node() can return NULL.  On the other hand the code
has been this way for a year and no one has complained...

regards,
dan carpenter

>  		}
>  	}
>  }
