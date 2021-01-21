From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Thu, 21 Jan 2021 02:40:54 +0000
Subject: Re: [PATCH] scsi: pm80xx: switch from 'pci_' to 'dma_' API
Message-Id: <yq1sg6vgggm.fsf@ca-mkp.ca.oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210117132445.562552-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20210117132445.562552-1-christophe.jaillet@wanadoo.fr>
        (Christophe JAILLET's message of "Sun, 17 Jan 2021 14:24:45 +0100")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: jinpu.wang@cloud.ionos.com, jejb@linux.ibm.com, martin.petersen@oracle.com, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org


Christophe,

> The wrappers in include/linux/pci-dma-compat.h should go away.
>
> The patch has been generated with the coccinelle script below and has
> been hand modified to replace GFP_ with a correct flag.  It has been
> compile tested.

Applied to 5.12/scsi-staging, thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering
