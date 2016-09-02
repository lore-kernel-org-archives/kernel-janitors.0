From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Fri, 02 Sep 2016 11:02:55 +0000
Subject: Re: [PATCH] scsi: constify sr_pm_ops structure
Message-Id: <yq14m5ytvhc.fsf@sermon.lab.mkp.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1472415458-430-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1472415458-430-1-git-send-email-Julia.Lawall@lip6.fr> (Julia
        Lawall's message of "Sun, 28 Aug 2016 22:17:38 +0200")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: Jens Axboe <axboe@kernel.dk>, kernel-janitors@vger.kernel.org, "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org

>>>>> "Julia" = Julia Lawall <Julia.Lawall@lip6.fr> writes:

Julia> sr_pm_ops, of type struct dev_pm_ops, is never modified, so
Julia> declare it as const.

Applied to 4.9/scsi-queue.

-- 
Martin K. Petersen	Oracle Linux Engineering
