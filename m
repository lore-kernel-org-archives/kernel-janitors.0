From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Tue, 10 Apr 2018 02:06:05 +0000
Subject: Re: [PATCH] scsi: dpt_i2o: Use after free in I2ORESETCMD ioctl
Message-Id: <yq11sfn3jea.fsf@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


Dan,

> Here is another use after free if we reset the card.  The adpt_hba_reset()
> function frees "pHba" on error.

Applied to 4.17/scsi-fixes. Thank you!

-- 
Martin K. Petersen	Oracle Linux Engineering
