From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Wed, 10 Jun 2020 02:41:21 +0000
Subject: Re: [PATCH] scsi: powertec: Fix different dev_id between 'request_irq()' and 'free_irq()'
Message-Id: <159175686974.7062.8526082970785072740.b4-ty@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200530072933.576851-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200530072933.576851-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jejb@linux.ibm.com, linux@armlinux.org.uk, Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-arm-kernel@lists.infradead.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, "Martin K . Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org

On Sat, 30 May 2020 09:29:33 +0200, Christophe JAILLET wrote:

> The dev_id used in 'request_irq()' and 'free_irq()' should match.
> So use 'host' in both cases.

Applied to 5.8/scsi-queue, thanks!

[1/1] scsi: powertec: Fix different dev_id between request_irq() and free_irq()
      https://git.kernel.org/mkp/scsi/c/af7b415a1ebf

-- 
Martin K. Petersen	Oracle Linux Engineering
