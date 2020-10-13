From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Tue, 13 Oct 2020 22:42:45 +0000
Subject: Re: [PATCH] scsi: qla2xxx: fix return of uninitialized value in rval
Message-Id: <160262862435.3018.1712796250437801581.b4-ty@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201008183239.200358-1-colin.king@canonical.com>
In-Reply-To: <20201008183239.200358-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nilesh Javali <njavali@marvell.com>, Colin King <colin.king@canonical.com>, Pavel Machek <pavel@denx.de>, "James E . J . Bottomley" <jejb@linux.ibm.com>, linux-scsi@vger.kernel.org, Himanshu Madhani <himanshu.madhani@oracle.com>, GR-QLogic-Storage-Upstream@marvell.com
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, 8 Oct 2020 19:32:39 +0100, Colin King wrote:

> A previous change removed the initialization of rval and there is
> now an error where an uninitialized rval is being returned on an
> error return path. Fix this by returning -ENODEV.

Applied to 5.10/scsi-queue, thanks!

[1/1] scsi: qla2xxx: Fix return of uninitialized value in rval
      https://git.kernel.org/mkp/scsi/c/1ef16a407f54

-- 
Martin K. Petersen	Oracle Linux Engineering
