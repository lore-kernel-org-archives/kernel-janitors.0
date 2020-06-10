From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Wed, 10 Jun 2020 02:41:20 +0000
Subject: Re: [PATCH] scsi: eesox: Fix different dev_id between 'request_irq()' and 'free_irq()'
Message-Id: <159175686975.7062.16533438955437978870.b4-ty@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200530073418.577210-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200530073418.577210-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jejb@linux.ibm.com, linux@armlinux.org.uk, Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-arm-kernel@lists.infradead.org, "Martin K . Petersen" <martin.petersen@oracle.com>, linux-kernel@vger.kernel.org

On Sat, 30 May 2020 09:34:18 +0200, Christophe JAILLET wrote:

> The dev_id used in 'request_irq()' and 'free_irq()' should match.
> So use 'host' in both cases.

Applied to 5.8/scsi-queue, thanks!

[1/1] scsi: eesox: Fix different dev_id between request_irq() and free_irq()
      https://git.kernel.org/mkp/scsi/c/3bab76807d95

-- 
Martin K. Petersen	Oracle Linux Engineering
