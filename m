From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Wed, 10 Jun 2020 02:41:19 +0000
Subject: Re: [PATCH] scsi: acornscsi: Fix an error handling path in 'acornscsi_probe()'
Message-Id: <159175686975.7062.3916571088976504463.b4-ty@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200530081622.577888-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200530081622.577888-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jejb@linux.ibm.com, linux@armlinux.org.uk, Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-arm-kernel@lists.infradead.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, "Martin K . Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org

On Sat, 30 May 2020 10:16:22 +0200, Christophe JAILLET wrote:

> 'ret' is known to be 0 at this point.
> So, explicitly return -ENOMEM if one of the 'ecardm_iomap()' calls fail.

Applied to 5.8/scsi-queue, thanks!

[1/1] scsi: acornscsi: Fix an error handling path in acornscsi_probe()
      https://git.kernel.org/mkp/scsi/c/7960c0b29626

-- 
Martin K. Petersen	Oracle Linux Engineering
