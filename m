From: Bjorn Helgaas <helgaas@kernel.org>
Date: Mon, 10 Feb 2020 22:39:22 +0000
Subject: Re: [PATCH] PCI/ACPI: make array pcie_to_hpx3_type static const, makes object smaller
Message-Id: <20200210223922.GA76091@google.com>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20200210085256.319424-1-colin.king@canonical.com>
References: <20200210085256.319424-1-colin.king@canonical.com>
In-Reply-To: <20200210085256.319424-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: "Rafael J . Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org, linux-pci@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Wilczynski <kw@linux.com>

[+cc Krzysztof]

On Mon, Feb 10, 2020 at 08:52:56AM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Don't populate the array pcie_to_hpx3_type on the stack but instead
> make it static const. Makes the object code smaller by 6 bytes:
> 
> Before:
>    text	   data	    bss	    dec	    hex	filename
>   19247	   3048	     64	  22359	   5757	drivers/pci/pci-acpi.o
> 
> After:
>    text	   data	    bss	    dec	    hex	filename
>   19177	   3112	     64	  22353	   5751	drivers/pci/pci-acpi.o
> 
> (gcc version 9.2.1, amd64)
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Nice cleanup, thanks!  Applied to pci/misc for v5.7.

> ---
>  drivers/pci/pci-acpi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/pci-acpi.c b/drivers/pci/pci-acpi.c
> index 0c02d500158f..d914f8bc31ea 100644
> --- a/drivers/pci/pci-acpi.c
> +++ b/drivers/pci/pci-acpi.c
> @@ -439,7 +439,7 @@ enum hpx_type3_dev_type {
>  static u16 hpx3_device_type(struct pci_dev *dev)
>  {
>  	u16 pcie_type = pci_pcie_type(dev);
> -	const int pcie_to_hpx3_type[] = {
> +	static const int pcie_to_hpx3_type[] = {
>  		[PCI_EXP_TYPE_ENDPOINT]    = HPX_TYPE_ENDPOINT,
>  		[PCI_EXP_TYPE_LEG_END]     = HPX_TYPE_LEG_END,
>  		[PCI_EXP_TYPE_RC_END]      = HPX_TYPE_RC_END,
> -- 
> 2.25.0
> 
