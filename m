From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Mon, 27 Apr 2020 22:49:49 +0000
Subject: Re: [PATCH] scsi: aacraid: Fix some error handling paths in 'aac_probe_one()'
Message-Id: <158802757520.27023.14035276109176874290.b4-ty@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200412094039.8822-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200412094039.8822-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jejb@linux.ibm.com, aacraid@microsemi.com, Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Sun, 12 Apr 2020 11:40:39 +0200, Christophe JAILLET wrote:

> If 'scsi_host_alloc()' or 'kcalloc()' fail, 'error' is known to be 0. Set
> it explicitly to -ENOMEM instead before branching to the error handling
> path.
> 
> While at it, axe 2 useless assignments to 'error'. These values are
> overwridden a few lines later.

Applied to 5.8/scsi-queue, thanks!

[1/1] scsi: aacraid: Fix error handling paths in aac_probe_one()
      https://git.kernel.org/mkp/scsi/c/f7854c382240

-- 
Martin K. Petersen	Oracle Linux Engineering
