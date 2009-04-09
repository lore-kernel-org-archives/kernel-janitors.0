From: Jack Stone <jwjstone@fastmail.fm>
Date: Thu, 09 Apr 2009 09:57:04 +0000
Subject: Re: [PATCH 15/56] ide: Remove void casts
Message-Id: <49DDC670.4080904@fastmail.fm>
List-Id: <kernel-janitors.vger.kernel.org>
References: <> <1239189748-11703-1-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-2-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-3-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-4-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-5-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-6-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-7-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-8-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-9-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-10-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-11-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-12-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-13-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-14-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-15-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-16-git-send-email-jwjstone@fastmail.fm>
In-Reply-To: <1239189748-11703-16-git-send-email-jwjstone@fastmail.fm>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: jeff@garzik.org, kernel-janitors@vger.kernel.org, bzolnier@gmail.com

[Added maintainer CC]
Jack Stone wrote:
> Remove uneeded void casts
>
> Signed-Off-By: Jack Stone <jwjstone@fastmail.fm>
> ---
>  drivers/ide/pmac.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/drivers/ide/pmac.c b/drivers/ide/pmac.c
> index 052b9bf..f76e4e6 100644
> --- a/drivers/ide/pmac.c
> +++ b/drivers/ide/pmac.c
> @@ -1682,7 +1682,7 @@ static int __devinit pmac_ide_init_dma(ide_hwif_t *hwif,
>  	 * The +2 is +1 for the stop command and +1 to allow for
>  	 * aligning the start address to a multiple of 16 bytes.
>  	 */
> -	pmif->dma_table_cpu = (struct dbdma_cmd*)pci_alloc_consistent(
> +	pmif->dma_table_cpu = pci_alloc_consistent(
>  		dev,
>  		(MAX_DCMDS + 2) * sizeof(struct dbdma_cmd),
>  		&hwif->dmatable_dma);
>   

