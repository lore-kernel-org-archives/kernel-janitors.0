From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Sat, 27 Jun 2020 03:09:22 +0000
Subject: Re: [PATCH] scsi: cumana_2: Fix different dev_id between 'request_irq()' and 'free_irq()'
Message-Id: <159322718419.11145.4815572344428827274.b4-ty@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200530073555.577414-1-christophe.jaillet@wanadoo.fr>
 <20200625204730.943520-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200625204730.943520-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jejb@linux.ibm.com, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, linux@armlinux.org.uk
Cc: linux-arm-kernel@lists.infradead.org, kernel-janitors@vger.kernel.org, linux-scsi@vger.kernel.org, "Martin K . Petersen" <martin.petersen@oracle.com>, linux-kernel@vger.kernel.org

On Thu, 25 Jun 2020 22:47:30 +0200, Christophe JAILLET wrote:

> The dev_id used in 'request_irq()' and 'free_irq()' should match.
> Use 'info' in both cases.

Applied to 5.9/scsi-queue, thanks!

[1/1] scsi: cumana_2: Fix different dev_id between request_irq() and free_irq()
      https://git.kernel.org/mkp/scsi/c/040ab9c4fd00

-- 
Martin K. Petersen	Oracle Linux Engineering
