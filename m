From: Greg Dietsche <gregory.dietsche@cuw.edu>
Date: Wed, 20 Jul 2011 02:03:21 +0000
Subject: Re: [PATCH] ata: remove unnecessary code
Message-Id: <4E263769.9040500@cuw.edu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1308242361-28859-1-git-send-email-Gregory.Dietsche@cuw.edu>
In-Reply-To: <1308242361-28859-1-git-send-email-Gregory.Dietsche@cuw.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Dietsche <Gregory.Dietsche@cuw.edu>
Cc: jgarzik@pobox.com, linux-ide@vger.kernel.org, kernel-janitors@vger.kernel.org, tj@kernel.org



On 06/16/2011 11:39 AM, Greg Dietsche wrote:
> Compile tested.
> remove unnecessary code that matches this coccinelle pattern
> 	if (...)
> 		return ret;
> 	return ret;
>
> Signed-off-by: Greg Dietsche<Gregory.Dietsche@cuw.edu>
>    

Acked-by: Tejun Heo<tj@kernel.org>


> ---
>   drivers/ata/pata_acpi.c |    8 +-------
>   1 files changed, 1 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/ata/pata_acpi.c b/drivers/ata/pata_acpi.c
> index 91949d9..54145ed 100644
> --- a/drivers/ata/pata_acpi.c
> +++ b/drivers/ata/pata_acpi.c
> @@ -195,8 +195,6 @@ static int pacpi_port_start(struct ata_port *ap)
>   	struct pci_dev *pdev = to_pci_dev(ap->host->dev);
>   	struct pata_acpi *acpi;
>
> -	int ret;
> -
>   	if (ap->acpi_handle = NULL)
>   		return -ENODEV;
>
> @@ -205,11 +203,7 @@ static int pacpi_port_start(struct ata_port *ap)
>   		return -ENOMEM;
>   	acpi->mask[0] = pacpi_discover_modes(ap,&ap->link.device[0]);
>   	acpi->mask[1] = pacpi_discover_modes(ap,&ap->link.device[1]);
> -	ret = ata_bmdma_port_start(ap);
> -	if (ret<  0)
> -		return ret;
> -
> -	return ret;
> +	return ata_bmdma_port_start(ap);
>   }
>
>   static struct scsi_host_template pacpi_sht = {
>    
This was acked by TJ, but seems to be lost in the shuffle thus far. I'm 
adding trivial@kernel.org to the cc list since this is trivial and no 
one has picked up this patch to date.

Greg


