From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Mon, 31 Aug 2020 17:41:03 +0000
Subject: Re: [PATCH] scsi: qla2xxx: Fix the size used in a 'dma_free_coherent()' call
Message-Id: <159889566023.22322.17846122781525526855.b4-ty@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200802110721.677707-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200802110721.677707-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: QLogic-Storage-Upstream@qlogic.com, jejb@linux.ibm.com, lalit.chandivade@qlogic.com, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, michaelc@cs.wisc.edu, vikas.chaudhary@qlogic.com, JBottomley@Parallels.com
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>, kernel-janitors@vger.kernel.org, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org

On Sun, 2 Aug 2020 13:07:21 +0200, Christophe JAILLET wrote:

> Update the size used in 'dma_free_coherent()' in order to match the one
> used in the corresponding 'dma_alloc_coherent()'.
> 
> While at it, remove a memset after a call to 'dma_alloc_coherent()'.
> This is useless since
> commit 518a2f1925c3 ("dma-mapping: zero memory returned from dma_alloc_*")

Applied to 5.10/scsi-queue, thanks!

[1/1] scsi: qla2xxx: Fix the size used in a 'dma_free_coherent()' call
      https://git.kernel.org/mkp/scsi/c/650b323c8e7c

-- 
Martin K. Petersen	Oracle Linux Engineering
