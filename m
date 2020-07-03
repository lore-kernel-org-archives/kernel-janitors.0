From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Fri, 03 Jul 2020 04:03:53 +0000
Subject: Re: [PATCH V2] scsi: powertec: Fix different dev_id between 'request_irq()' and 'free_irq()'
Message-Id: <159374899165.14731.13358873635382558544.b4-ty@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <08f63617-03df-71cf-70c4-00f08a9f51d8@wanadoo.fr>
 <20200626035948.944148-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200626035948.944148-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux@armlinux.org.uk, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, jejb@linux.ibm.com
Cc: linux-arm-kernel@lists.infradead.org, kernel-janitors@vger.kernel.org, linux-scsi@vger.kernel.org, "Martin K . Petersen" <martin.petersen@oracle.com>, linux-kernel@vger.kernel.org

On Fri, 26 Jun 2020 05:59:48 +0200, Christophe JAILLET wrote:

> The dev_id used in 'request_irq()' and 'free_irq()' should match.
> So use 'info' in both cases.

Applied to 5.9/scsi-queue, thanks!

[1/1] scsi: powertec: Fix different dev_id between request_irq() and free_irq()
      https://git.kernel.org/mkp/scsi/c/d179f7c76324

-- 
Martin K. Petersen	Oracle Linux Engineering
