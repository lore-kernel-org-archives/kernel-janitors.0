From: Jeff Garzik <jgarzik@pobox.com>
Date: Wed, 20 Jul 2011 02:10:03 +0000
Subject: Re: [PATCH] ata: remove unnecessary code
Message-Id: <4E2638FB.4080103@pobox.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1308242361-28859-1-git-send-email-Gregory.Dietsche@cuw.edu> <4E263769.9040500@cuw.edu>
In-Reply-To: <4E263769.9040500@cuw.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Dietsche <gregory.dietsche@cuw.edu>
Cc: linux-ide@vger.kernel.org, kernel-janitors@vger.kernel.org, tj@kernel.org

On 07/19/2011 10:03 PM, Greg Dietsche wrote:
>
>
> On 06/16/2011 11:39 AM, Greg Dietsche wrote:
>> Compile tested.
>> remove unnecessary code that matches this coccinelle pattern
>> if (...)
>> return ret;
>> return ret;
>>
>> Signed-off-by: Greg Dietsche<Gregory.Dietsche@cuw.edu>
>
> Acked-by: Tejun Heo<tj@kernel.org>
>
>
>> ---
>> drivers/ata/pata_acpi.c | 8 +-------
>> 1 files changed, 1 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/ata/pata_acpi.c b/drivers/ata/pata_acpi.c
>> index 91949d9..54145ed 100644
>> --- a/drivers/ata/pata_acpi.c
>> +++ b/drivers/ata/pata_acpi.c
>> @@ -195,8 +195,6 @@ static int pacpi_port_start(struct ata_port *ap)
>> struct pci_dev *pdev = to_pci_dev(ap->host->dev);
>> struct pata_acpi *acpi;
>>
>> - int ret;
>> -
>> if (ap->acpi_handle = NULL)
>> return -ENODEV;
>>
>> @@ -205,11 +203,7 @@ static int pacpi_port_start(struct ata_port *ap)
>> return -ENOMEM;
>> acpi->mask[0] = pacpi_discover_modes(ap,&ap->link.device[0]);
>> acpi->mask[1] = pacpi_discover_modes(ap,&ap->link.device[1]);
>> - ret = ata_bmdma_port_start(ap);
>> - if (ret< 0)
>> - return ret;
>> -
>> - return ret;
>> + return ata_bmdma_port_start(ap);
>> }
>>
>> static struct scsi_host_template pacpi_sht = {
> This was acked by TJ, but seems to be lost in the shuffle thus far. I'm
> adding trivial@kernel.org to the cc list since this is trivial and no
> one has picked up this patch to date.

It's in libata-dev, so it's been picked up...

We are in -rc, so it won't show up in a kernel until 3.0 is released, 
and the merge window opens again.

	Jeff



