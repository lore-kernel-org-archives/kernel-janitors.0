From: Jeff Garzik <jgarzik@pobox.com>
Date: Fri, 14 May 2010 21:32:05 +0000
Subject: Re: [PATCH 13/13] drivers/ata: removing redundant ifdef
Message-Id: <4BEDC155.8040204@pobox.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1273167377-14270-1-git-send-email-jolsa@redhat.com> <1273167377-14270-14-git-send-email-jolsa@redhat.com>
In-Reply-To: <1273167377-14270-14-git-send-email-jolsa@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jiri Olsa <jolsa@redhat.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux@arm.linux.org.uk, ysato@users.sourceforge.jp, tony.luck@intel.com, dhowells@redhat.com, kyle@mcmartin.ca, benh@kernel.crashing.org, schwidefsky@de.ibm.com, hare@suse.de, felipe.balbi@nokia.com

On 05/06/2010 01:36 PM, Jiri Olsa wrote:
> wbr,
> jirka
>
>
> Signed-off-by: Jiri Olsa<jolsa@redhat.com>
> ---
>   drivers/ata/ahci.c |    2 --
>   1 files changed, 0 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/ata/ahci.c b/drivers/ata/ahci.c
> index 8b502f4..5326af2 100644
> --- a/drivers/ata/ahci.c
> +++ b/drivers/ata/ahci.c
> @@ -3179,7 +3179,6 @@ static bool ahci_broken_online(struct pci_dev *pdev)
>   #ifdef CONFIG_ATA_ACPI
>   static void ahci_gtf_filter_workaround(struct ata_host *host)
>   {
> -#ifdef CONFIG_ATA_ACPI
>   	static const struct dmi_system_id sysids[] = {
>   		/*
>   		 * Aspire 3810T issues a bunch of SATA enable commands
> @@ -3220,7 +3219,6 @@ static void ahci_gtf_filter_workaround(struct ata_host *host)
>   			ata_for_each_dev(dev, link, ALL)
>   				dev->gtf_filter |= filter;
>   	}
> -#endif
>   }

I don't see this in the linux-next version of ahci.c, so I'm dropping 
this patch.


