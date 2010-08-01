From: Jeff Garzik <jgarzik@pobox.com>
Date: Sun, 01 Aug 2010 23:48:24 +0000
Subject: Re: [PATCH 04/25] ata: Convert pci_table entries to PCI_VDEVICE (if
Message-Id: <4C5607C8.4090708@pobox.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <201007152039.44324.PeterHuewe@gmx.de>
In-Reply-To: <201007152039.44324.PeterHuewe@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Huewe <PeterHuewe@gmx.de>
Cc: Kernel Janitors <kernel-janitors@vger.kernel.org>, Tejun Heo <tj@kernel.org>, Sergei Shtylyov <sshtylyov@ru.mvista.com>, linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org

On 07/15/2010 02:39 PM, Peter Huewe wrote:
> From: Peter Huewe<peterhuewe@gmx.de>
>
> This patch converts pci_table entries, where .subvendor=PCI_ANY_ID and
> .subdevice=PCI_ANY_ID, .class=0 and .class_mask=0, to use the
> PCI_VDEVICE macro, and thus improves readability.
>
> Signed-off-by: Peter Huewe<peterhuewe@gmx.de>
> ---
>   drivers/ata/pata_scc.c |    3 +--
>   1 files changed, 1 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/ata/pata_scc.c b/drivers/ata/pata_scc.c
> index d9db3f8..fe36966 100644
> --- a/drivers/ata/pata_scc.c
> +++ b/drivers/ata/pata_scc.c
> @@ -168,8 +168,7 @@ static const unsigned long JCACTSELtbl[2][7] = {
>   };
>
>   static const struct pci_device_id scc_pci_tbl[] = {
> -	{PCI_VENDOR_ID_TOSHIBA_2, PCI_DEVICE_ID_TOSHIBA_SCC_ATA,
> -	 PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0},
> +	{ PCI_VDEVICE(TOSHIBA_2, PCI_DEVICE_ID_TOSHIBA_SCC_ATA), 0},
>   	{ }	/* terminate list */

applied

I would prefer to leave ata_piix as it is, though.  It's nice and 
manageable :)


