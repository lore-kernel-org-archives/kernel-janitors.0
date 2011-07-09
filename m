From: Greg Dietsche <greg@gregd.org>
Date: Sat, 09 Jul 2011 15:21:11 +0000
Subject: Re: [PATCH] ata: remove unnecessary code
Message-Id: <20110709152111.GA12581@farmergreg.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1308242361-28859-1-git-send-email-Gregory.Dietsche@cuw.edu>
In-Reply-To: <1308242361-28859-1-git-send-email-Gregory.Dietsche@cuw.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jgarzik@pobox.com
Cc: linux-ide@vger.kernel.org, kernel-janitors@vger.kernel.org, Gregory.Dietsche@cuw.edu

On Thu, Jun 16, 2011 at 11:39:21AM -0500, Greg Dietsche wrote:
> Compile tested.
> remove unnecessary code that matches this coccinelle pattern
> 	if (...)
> 		return ret;
> 	return ret;
> 
> Signed-off-by: Greg Dietsche <Gregory.Dietsche@cuw.edu>
> ---
>  drivers/ata/pata_acpi.c |    8 +-------
>  1 files changed, 1 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/ata/pata_acpi.c b/drivers/ata/pata_acpi.c
> index 91949d9..54145ed 100644
> --- a/drivers/ata/pata_acpi.c
> +++ b/drivers/ata/pata_acpi.c
> @@ -195,8 +195,6 @@ static int pacpi_port_start(struct ata_port *ap)
>  	struct pci_dev *pdev = to_pci_dev(ap->host->dev);
>  	struct pata_acpi *acpi;
>  
> -	int ret;
> -
>  	if (ap->acpi_handle = NULL)
>  		return -ENODEV;
>  
> @@ -205,11 +203,7 @@ static int pacpi_port_start(struct ata_port *ap)
>  		return -ENOMEM;
>  	acpi->mask[0] = pacpi_discover_modes(ap, &ap->link.device[0]);
>  	acpi->mask[1] = pacpi_discover_modes(ap, &ap->link.device[1]);
> -	ret = ata_bmdma_port_start(ap);
> -	if (ret < 0)
> -		return ret;
> -
> -	return ret;
> +	return ata_bmdma_port_start(ap);
>  }
>  
>  static struct scsi_host_template pacpi_sht = {
> -- 
> 1.7.2.5
> 
any feedback on this patch?

thanks!
Greg

