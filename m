From: Alan Stern <stern@rowland.harvard.edu>
Date: Sun, 04 Jul 2010 13:18:34 +0000
Subject: Re: [PATCH 19/19] drivers/usb/core: use for_each_pci_dev()
Message-Id: <Pine.LNX.4.44L0.1007040918000.16841-100000@netrider.rowland.org>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <1278173088-12051-1-git-send-email-segooon@gmail.com>
References: <1278173088-12051-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1278173088-12051-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kulikov Vasiliy <segooon@gmail.com>
Cc: Kernel Janitors <kernel-janitors@vger.kernel.org>, Greg Kroah-Hartman <gregkh@suse.de>, Andrew Morton <akpm@linux-foundation.org>, Alexey Dobriyan <adobriyan@gmail.com>, "Rafael J. Wysocki" <rjw@sisk.pl>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, 3 Jul 2010, Kulikov Vasiliy wrote:

> Use for_each_pci_dev() to simplify the code.
> 
> Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
> ---
>  drivers/usb/core/hcd-pci.c |    5 +----
>  1 files changed, 1 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/core/hcd-pci.c b/drivers/usb/core/hcd-pci.c
> index 7e2d527..c1f0bba 100644
> --- a/drivers/usb/core/hcd-pci.c
> +++ b/drivers/usb/core/hcd-pci.c
> @@ -66,10 +66,7 @@ static void companion_common(struct pci_dev *pdev, struct usb_hcd *hcd,
>  	 * vice versa.
>  	 */
>  	companion = NULL;
> -	for (;;) {
> -		companion = pci_get_device(PCI_ANY_ID, PCI_ANY_ID, companion);
> -		if (!companion)
> -			break;
> +	for_each_pci_dev(companion) {
>  		if (companion->bus != pdev->bus ||
>  				PCI_SLOT(companion->devfn) != slot)
>  			continue;

Acked-by: Alan Stern <stern@rowland.harvard.edu>

