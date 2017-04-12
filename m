From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Wed, 12 Apr 2017 00:44:08 +0000
Subject: Re: [PATCH] scsi: qla2xxx: remove some redundant pointer assignments
Message-Id: <yq137dewj3b.fsf@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170406111957.17250-1-colin.king@canonical.com>
In-Reply-To: <20170406111957.17250-1-colin.king@canonical.com> (Colin King's
        message of "Thu, 6 Apr 2017 12:19:57 +0100")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: qla2xxx-upstream@qlogic.com, "James E . J . Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Colin King <colin.king@canonical.com> writes:

> There are several local or function parameter pointers that are
> being assigned NULL after a kfree where and these have no effect
> and hence can be removed.

Applied to 4.12/scsi-queue.

-- 
Martin K. Petersen	Oracle Linux Engineering
