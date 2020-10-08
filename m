From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Thu, 08 Oct 2020 20:50:56 +0000
Subject: Re: [PATCH] scsi: qla2xxx: fix return of uninitialized value in rval
Message-Id: <yq1o8lc1lxz.fsf@ca-mkp.ca.oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201008183239.200358-1-colin.king@canonical.com>
In-Reply-To: <20201008183239.200358-1-colin.king@canonical.com> (Colin King's
        message of "Thu, 8 Oct 2020 19:32:39 +0100")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Nilesh Javali <njavali@marvell.com>, GR-QLogic-Storage-Upstream@marvell.com, "James E . J . Bottomley" <jejb@linux.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, Himanshu Madhani <himanshu.madhani@oracle.com>, Pavel Machek <pavel@denx.de>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


Colin,

> A previous change removed the initialization of rval and there is now
> an error where an uninitialized rval is being returned on an error
> return path. Fix this by returning -ENODEV.

Applied to 5.10/scsi-staging, thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering
