From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Sat, 23 Jan 2021 04:22:04 +0000
Subject: Re: [PATCH] scsi: pm80xx: switch from 'pci_' to 'dma_' API
Message-Id: <161136635065.28733.5978048378954329099.b4-ty@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210117132445.562552-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20210117132445.562552-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jejb@linux.ibm.com, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, jinpu.wang@cloud.ionos.com
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sun, 17 Jan 2021 14:24:45 +0100, Christophe JAILLET wrote:

> The wrappers in include/linux/pci-dma-compat.h should go away.
> 
> The patch has been generated with the coccinelle script below and has been
> hand modified to replace GFP_ with a correct flag.
> It has been compile tested.
> 
> When memory is allocated in 'pm8001_init_ccb_tag()' GFP_KERNEL can be used
> because this function already uses this flag a few lines above.
> 
> [...]

Applied to 5.12/scsi-queue, thanks!

[1/1] scsi: pm80xx: switch from 'pci_' to 'dma_' API
      https://git.kernel.org/mkp/scsi/c/8e60a7deca3d

-- 
Martin K. Petersen	Oracle Linux Engineering
