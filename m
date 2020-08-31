From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Mon, 31 Aug 2020 17:41:04 +0000
Subject: Re: [PATCH] scsi: qla4xxx: Fix an error handling path in 'qla4xxx_get_host_stats()'
Message-Id: <159889566023.22322.13450314707743765419.b4-ty@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200802101527.676054-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200802101527.676054-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: QLogic-Storage-Upstream@qlogic.com, jejb@linux.ibm.com, lalit.chandivade@qlogic.com, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, michaelc@cs.wisc.edu, JBottomley@Parallels.com, vikas.chaudhary@qlogic.com
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>, kernel-janitors@vger.kernel.org, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org

On Sun, 2 Aug 2020 12:15:27 +0200, Christophe JAILLET wrote:

> Update the size used in 'dma_free_coherent()' in order to match the one
> used in the corresponding 'dma_alloc_coherent()'.

Applied to 5.10/scsi-queue, thanks!

[1/1] scsi: qla4xxx: Fix an error handling path in 'qla4xxx_get_host_stats()'
      https://git.kernel.org/mkp/scsi/c/574918e69720

-- 
Martin K. Petersen	Oracle Linux Engineering
